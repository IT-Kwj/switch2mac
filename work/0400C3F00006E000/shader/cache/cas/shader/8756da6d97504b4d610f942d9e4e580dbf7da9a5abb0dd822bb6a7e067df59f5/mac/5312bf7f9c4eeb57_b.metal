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
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1380 = as_type<float>(_83);
        out.gl_Position.z = _1380;
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
    float _103 = _101;
    if (_97)
    {
        float _105 = float(_67);
        _77 = _105;
    }
    float _107 = _77;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_29.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1450 = as_type<float>(_121);
        out.gl_Position.z = _1450;
    }
    if (_113)
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
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _183 = log2(_181);
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _187 = _177 + _185;
    float _189 = in.m_35.x;
    float _191 = in.m_35.y;
    float _193 = in.m_35.z;
    float _195 = in.m_35.w;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _177 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _217 = 1.0 / _203;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _221 = _177 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _225 = _177 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _177 + _227;
    float _231 = _183 * _101;
    float _233 = 1.0 / _207;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _239;
    int _243 = as_type<int>(_179) & 1;
    bool _245 = _243 != 0;
    int _247 = as_type<int>(_179) & 2;
    bool _249 = _247 != 0;
    float _251 = 1.0 / _211;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _257 = _199 * _217;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _261 = _177 + _259;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _273 = _271 != 0;
    float _275 = _191 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _277 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _285 = _281 || _283;
    float _287 = 1.0 / _215;
    float _289 = _229 * _233;
    bool _291 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _293 = isnan(_177);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _255;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _305;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _315 = _187 * _251;
    float _317 = fma(_275, -2.0, _311);
    float _319 = 1.0 / _307;
    float _321 = -_309;
    float _323 = fma(_313, 2.0, _321);
    float _325 = _193 * 2.0;
    float _327 = _221 * _287;
    float _329 = _191 + _193;
    float _331 = -_101;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[76].x, _323);
    float _335 = fma(_241, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _337 = exp2(_231);
    float _339 = _225 * _303;
    float _341 = _329 + (-1.0);
    bool _343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _355 = 1.0 + _353;
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _359 = floor(_325);
    float _361 = _261 * _319;
    float _363 = _193 + _189;
    float _365 = _191 + _189;
    bool _367 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_177);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _379;
    float _383 = _363 + (-1.0);
    bool _385 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_177);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = 1.0 / _237;
    float _399 = -_337;
    float _401 = _399 + 1.0;
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _405 = _189 * 2.0;
    float _407 = -_377;
    float _409 = _407 + 1.0;
    float _411 = _285 ? _401 : 0.0;
    bool _413 = _359 >= 0.0;
    bool _415 = isnan(_359);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = _177 + _423;
    float _427 = 1.0 / _355;
    float _429 = _395 * _409;
    float _431 = _425 * _397;
    int _433 = _421 ? 0 : 1;
    float _435 = floor(_405);
    bool _437 = _359 > 0.0;
    float _439 = _365 + (-1.0);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _445 = _191 * 2.0;
    int _447 = ~_433;
    int _449 = _447 + 1;
    int _451 = _449 + 1;
    float _453 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].z, _441);
    float _455 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].w, _443);
    float _457 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _317);
    float _459 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _453);
    float _461 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _455);
    int _463 = _451;
    if (_351)
    {
        float _465 = _411 * _427;
        _103 = _465;
    }
    float _467 = _103;
    float _469 = floor(_445);
    if (!_437)
    {
        int _471 = ~_433;
        int _473 = _471 + 1;
        _463 = _473;
    }
    int _475 = _463;
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _479 = _435 > 0.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _481;
    bool _485 = _435 >= 0.0;
    bool _487 = isnan(_435);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    bool _499 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _501 = isnan(_177);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _515 = !_265;
    int _517 = _515 ? 0 : 1;
    float _519 = fma(_497, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _521 = fma(_483, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _527 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _529 = isnan(_177);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_509;
    float _541 = _539 + 1.0;
    int _543 = _493 ? 0 : 1;
    float _545 = fma(_525, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _547;
    bool _551 = _469 > 0.0;
    float _553 = fma(_513, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _555 = _469 >= 0.0;
    bool _557 = isnan(_469);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = fma(_549, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _567 = _537 * _541;
    float _569 = -_537;
    float _571 = _569 + 1.0;
    bool _573 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _575 = isnan(_177);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _593 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _595 = isnan(_177);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = fma(_381, _431, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _607 = fma(_587, _327, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = _583 * _571;
    float _611 = fma(_591, _327, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = -_583;
    float _615 = _613 + 1.0;
    float _617 = -_301;
    float _619 = _617 + 1.0;
    bool _621 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_177);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _521 * _429;
    float _635 = _301 * _615;
    float _637 = _603 * _619;
    float _639 = -_603;
    float _641 = _639 + 1.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _643;
    float _647 = -_631;
    float _649 = _647 + 1.0;
    int _651 = abs(_517);
    float _653 = _631 * _641;
    float _655 = fma(_645, _431, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _657 = _377 * _649;
    float _659 = in.m_40.x;
    float _661 = in.m_40.y;
    float _663 = in.m_40.z;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _673 = float(_651);
    float _675 = fma(_667, _339, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _677 = fma(_671, _339, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _679 = _519 * _429;
    float _681 = -_395;
    float _683 = _681 + 1.0;
    bool _685 = !_269;
    int _687 = _685 ? 0 : 1;
    float _689 = float(_475);
    float _691 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].x, _679);
    int _693 = abs(_687);
    float _695 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].y, _633);
    int _697 = ~_543;
    int _699 = _697 + 1;
    int _701 = _699 + 1;
    float _703 = _673 * _689;
    int _705 = _701;
    if (!_479)
    {
        int _707 = ~_543;
        int _709 = _707 + 1;
        _705 = _709;
    }
    int _711 = _705;
    float _713 = _189 + (-0.5);
    float _715 = _703 * (-2.0);
    float _717 = float(_711);
    float _719 = fma(_553, _657, _695);
    float _721 = float(_693);
    float _723 = fma(_715, _659, _659);
    int _725 = _563 ? 0 : 1;
    float _727 = fma(_477, _715, _477);
    bool _729 = !_273;
    int _731 = _729 ? 0 : 1;
    float _733 = _721 * _717;
    int _735 = ~_725;
    int _737 = _735 + 1;
    int _739 = _737 + 1;
    float _741 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[196].x, _723);
    int _743 = abs(_731);
    float _745 = _733 * (-2.0);
    int _747 = _739;
    if (!_551)
    {
        int _749 = ~_725;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = fma(_727, _467, _741);
    float _757 = float(_743);
    float _759 = _191 + (-0.5);
    float _761 = float(_753);
    float _763 = fma(_745, _661, _661);
    float _765 = fma(_357, _745, _357);
    float _767 = fma(_545, _657, _691);
    float _769 = fma(_565, _653, _719);
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[196].y, _763);
    float _773 = _757 * _761;
    float _775 = fma(_335, _653, _767);
    float _777 = fma(_611, _637, _769);
    float _779 = fma(_765, _467, _771);
    float _781 = _773 * (-2.0);
    float _783 = _193 + (-0.5);
    float _785 = fma(_605, _635, _777);
    float _787 = _779 * 0.15915493667125701904296875;
    float _789 = fma(_781, _663, _663);
    float _791 = fma(_403, _781, _403);
    float _793 = in.m_42.x;
    float _795 = in.m_42.y;
    float _797 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _789);
    float _799 = fma(_607, _637, _775);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _801;
    float _805 = fma(_677, _609, _785);
    float _807 = fma(_791, _467, _797);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _809;
    float _813 = fma(_803, _361, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _815 = fma(_655, _635, _799);
    float _817 = _755 * 0.15915493667125701904296875;
    float _819 = _807 * 0.15915493667125701904296875;
    float _821 = fma(_813, _567, _805);
    float _823 = fma(_811, _361, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _825 = fma(_675, _609, _815);
    float _827 = _817 * 6.283185482025146484375;
    float _829 = sin(_827);
    float _831 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[150].y, _821);
    bool _833 = _195 > 0.5;
    float _835 = fma(_823, _567, _825);
    float _837 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[150].x, _835);
    float _839 = _817 * 6.283185482025146484375;
    float _841 = cos(_839);
    float _843 = _831 * _795;
    float _845 = _837 * _793;
    float _847 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _849 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _851 = _787 * 6.283185482025146484375;
    float _853 = sin(_851);
    bool _855 = !_249;
    float _857 = _855 ? (-0.5) : 0.5;
    bool _859 = !_245;
    float _861 = _859 ? (-0.5) : 0.5;
    float _863 = _787 * 6.283185482025146484375;
    float _865 = cos(_863);
    bool _867 = _191 > 0.5;
    float _869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _857);
    bool _871 = _189 > 0.5;
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _861);
    float _875 = -_857;
    int _877 = _867 ? as_type<int>(_875) : as_type<int>(_857);
    float _879 = _847 * _869;
    float _881 = _819 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = _829 * _853;
    float _887 = _849 * _873;
    float _889 = _841 * _853;
    float _891 = _819 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = _841 * _865;
    float _897 = _853 * _883;
    float _899 = _883 * _879;
    float _901 = _865 * _883;
    float _903 = _829 * _865;
    float _905 = _841 * _899;
    float _907 = _829 * _899;
    float _909 = fma(_893, _895, _885);
    float _911 = _893 * _879;
    float _913 = fma(_893, _885, _895);
    float _915 = fma(_909, _887, _905);
    float _917 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _919 = -_903;
    float _921 = fma(_893, _889, _919);
    float _923 = -_889;
    float _925 = fma(_893, _903, _923);
    float _927 = -_911;
    float _929 = fma(_901, _887, _927);
    float _931 = fma(_921, _917, _915);
    float _933 = fma(_925, _887, _907);
    float _935 = fma(_897, _917, _929);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _939 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _943 = fma(_913, _917, _933);
    float _945 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _941);
    float _951 = in.m_26.x;
    float _953 = in.m_26.y;
    float _955 = in.m_26.z;
    float _957 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _949);
    float _963 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _957);
    float _965 = _959 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _967 = _961 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _971 = _969 != 0;
    float _973 = _963 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _975 = _965 * _965;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _983 = _981 != 0;
    float _985 = fma(_967, _967, _975);
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _989 = _987 != 0;
    float _991 = fma(_973, _973, _985);
    float _993 = -_857;
    int _995 = _833 ? as_type<int>(_993) : as_type<int>(_857);
    bool _997 = _193 > 0.5;
    float _999 = sqrt(_991);
    float _1001 = _953 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1003 = _953 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1005 = _953 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1001);
    float _1009 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1003);
    float _1011 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1013 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1007);
    float _1015 = -_861;
    int _1017 = _871 ? as_type<int>(_1015) : as_type<int>(_861);
    float _1019 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1009);
    bool _1021 = !_971;
    float _1023 = _1021 ? _857 : as_type<float>(_877);
    float _1025 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1011);
    bool _1027 = !_979;
    float _1029 = _1027 ? _857 : as_type<float>(_995);
    float _1031 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1033 = _999 > 0.0;
    float _1035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1037 = !_983;
    float _1039 = _1037 ? _861 : as_type<float>(_1017);
    float _1041 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1043 = _1025 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1045 = _937 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1047 = -_861;
    float _1049 = _997 ? _1047 : _861;
    float _1051 = _1039 + 0.5;
    float _1053 = _1031 + _967;
    float _1055 = _1041 + _965;
    float _1057 = _1043 + _973;
    bool _1059 = !_989;
    float _1061 = _1059 ? _861 : _1049;
    float _1063 = fma(_1045, _1051, _333);
    float _1065 = _1045;
    float _1067 = _1049;
    float _1069 = _1051;
    float _1071 = _965;
    float _1073 = _1043;
    if (!_1033)
    {
        _1065 = _1053;
    }
    float _1075 = _1065;
    float _1077 = _1075;
    if (!_1033)
    {
        _1067 = _1055;
    }
    float _1079 = _1067;
    float _1081 = _1079;
    if (!_1033)
    {
        _1069 = _1057;
    }
    float _1083 = _1069;
    bool _1085 = !_1033;
    float _1087 = _1083;
    if (!_1085)
    {
        float _1089 = _145 * _145;
        bool _1091 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1093 = rsqrt(_991);
        float _1095 = fma(_143, _143, _1089);
        float _1097 = fma(_147, _147, _1095);
        float _1099 = sqrt(_1097);
        float _1101 = _937;
        if (!_1091)
        {
            float _1103 = in.m_42.w;
            _1101 = _1103;
        }
        float _1105 = _1101;
        float _1107 = _965 * _1093;
        float _1109 = _967 * _1093;
        float _1111 = _1083;
        float _1113 = _1093;
        if (!_1091)
        {
            float _1115 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            _1111 = _1115;
        }
        float _1117 = _1111;
        float _1119 = _973 * _1093;
        float _1121 = _1095;
        if (_1091)
        {
            float _1123 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1121 = _1123;
        }
        float _1125 = _1121;
        bool _1127 = _1099 > 0.0;
        float _1129 = _1105;
        float _1131 = _1099;
        float _1133 = _1117;
        if (!_1091)
        {
            float _1135 = _1117 * _1105;
            _1129 = _1135;
        }
        float _1137 = _1129;
        if (!_1127)
        {
            _1131 = _1053;
        }
        float _1139 = _1131;
        float _1141 = _1125;
        _1077 = _1139;
        if (_1091)
        {
            float _1143 = _143 * _1125;
            _1071 = _1143;
        }
        float _1145 = _1071;
        float _1147 = _1145;
        if (_1091)
        {
            float _1149 = _145 * _1125;
            _1073 = _1149;
        }
        float _1151 = _1073;
        float _1153 = _1151;
        if (_1091)
        {
            float _1155 = _147 * _1125;
            _1141 = _1155;
        }
        float _1157 = _1141;
        float _1159 = _1157;
        if (!_1091)
        {
            float _1161 = _143 * _1137;
            _1147 = _1161;
        }
        float _1163 = _1147;
        if (!_1091)
        {
            float _1165 = _145 * _1137;
            _1153 = _1165;
        }
        float _1167 = _1153;
        if (!_1091)
        {
            float _1169 = _147 * _1137;
            _1159 = _1169;
        }
        float _1171 = _1159;
        if (!_1127)
        {
            _1113 = _1055;
        }
        float _1173 = _1113;
        _1081 = _1173;
        if (!_1127)
        {
            _1133 = _1057;
        }
        float _1175 = _1133;
        bool _1177 = !_1127;
        _1087 = _1175;
        if (!_1177)
        {
            float _1179 = rsqrt(_1097);
            float _1181 = _145 * _1179;
            float _1183 = _143 * _1179;
            float _1185 = _147 * _1179;
            float _1187 = _1107 * _1181;
            float _1189 = fma(_1109, _1183, _1187);
            float _1191 = fma(_1119, _1185, _1189);
            float _1193 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1195 = fma(_1163, _1193, _1053);
            float _1197 = fma(_1167, _1193, _1055);
            float _1199 = fma(_1171, _1193, _1057);
            _1081 = _1197;
            _1077 = _1195;
            _1087 = _1199;
        }
    }
    float _1201 = _1081;
    float _1203 = _1077;
    float _1205 = _1087;
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1213 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1207);
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1209);
    float _1219 = _1023 + (-0.5);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1211);
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1215);
    float _1225 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1217);
    float _1227 = -_1213;
    float _1229 = -_457;
    float _1231 = fma(_1227, _1219, _1229);
    float _1233 = -_461;
    float _1235 = _1233 + 1.0;
    float _1237 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1221);
    float _1241 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1249 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1251 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = fma(_1023, _1235, _1231);
    float _1255 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1257 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1245);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1261 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1263 = -_459;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1247);
    float _1269 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1249);
    float _1271 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1257);
    float _1275 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1261);
    float _1277 = -_1265;
    float _1279 = fma(_1039, _1277, _1063);
    float _1281 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1283 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1285 = _1061 + 0.5;
    float _1287 = -_1029;
    float _1289 = _1287 + 0.5;
    float _1291 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1301 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1271);
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1305 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1307 = _1295 * _1243;
    float _1309 = _1297 * _1259;
    float _1311 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1273);
    float _1319 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1283);
    float _1321 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1281);
    float _1323 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1301);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1311;
    out.m_44.y = _1313;
    out.m_44.z = _1315;
    out.m_46.x = _1279;
    out.m_46.y = _1253;
    out.m_46.z = _1307;
    out.m_46.w = _1309;
    out.m_48.x = _1203;
    out.m_48.y = _1201;
    out.m_48.z = _1205;
    out.gl_Position.x = _1317;
    out.gl_Position.y = _1319;
    out.gl_Position.z = _1321;
    out.gl_Position.w = _1323;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1380 = as_type<float>(_83);
        out.gl_Position.z = _1380;
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
    float _103 = _101;
    if (_97)
    {
        float _105 = float(_67);
        _77 = _105;
    }
    float _107 = _77;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_29.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1450 = as_type<float>(_121);
        out.gl_Position.z = _1450;
    }
    if (_113)
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
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _183 = log2(_181);
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _187 = _177 + _185;
    float _189 = in.m_35.x;
    float _191 = in.m_35.y;
    float _193 = in.m_35.z;
    float _195 = in.m_35.w;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _177 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _217 = 1.0 / _203;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _221 = _177 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _225 = _177 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _177 + _227;
    float _231 = _183 * _101;
    float _233 = 1.0 / _207;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _239;
    int _243 = as_type<int>(_179) & 1;
    bool _245 = _243 != 0;
    int _247 = as_type<int>(_179) & 2;
    bool _249 = _247 != 0;
    float _251 = 1.0 / _211;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _257 = _199 * _217;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _261 = _177 + _259;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _273 = _271 != 0;
    float _275 = _191 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _277 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _285 = _281 || _283;
    float _287 = 1.0 / _215;
    float _289 = _229 * _233;
    bool _291 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _293 = isnan(_177);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _255;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _305;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _315 = _187 * _251;
    float _317 = fma(_275, -2.0, _311);
    float _319 = 1.0 / _307;
    float _321 = -_309;
    float _323 = fma(_313, 2.0, _321);
    float _325 = _193 * 2.0;
    float _327 = _221 * _287;
    float _329 = _191 + _193;
    float _331 = -_101;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[76].x, _323);
    float _335 = fma(_241, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _337 = exp2(_231);
    float _339 = _225 * _303;
    float _341 = _329 + (-1.0);
    bool _343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _355 = 1.0 + _353;
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _359 = floor(_325);
    float _361 = _261 * _319;
    float _363 = _193 + _189;
    float _365 = _191 + _189;
    bool _367 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_177);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _379;
    float _383 = _363 + (-1.0);
    bool _385 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_177);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = 1.0 / _237;
    float _399 = -_337;
    float _401 = _399 + 1.0;
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _405 = _189 * 2.0;
    float _407 = -_377;
    float _409 = _407 + 1.0;
    float _411 = _285 ? _401 : 0.0;
    bool _413 = _359 >= 0.0;
    bool _415 = isnan(_359);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = _177 + _423;
    float _427 = 1.0 / _355;
    float _429 = _395 * _409;
    float _431 = _425 * _397;
    int _433 = _421 ? 0 : 1;
    float _435 = floor(_405);
    bool _437 = _359 > 0.0;
    float _439 = _365 + (-1.0);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _445 = _191 * 2.0;
    int _447 = ~_433;
    int _449 = _447 + 1;
    int _451 = _449 + 1;
    float _453 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].z, _441);
    float _455 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].w, _443);
    float _457 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _317);
    float _459 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _453);
    float _461 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _455);
    int _463 = _451;
    if (_351)
    {
        float _465 = _411 * _427;
        _103 = _465;
    }
    float _467 = _103;
    float _469 = floor(_445);
    if (!_437)
    {
        int _471 = ~_433;
        int _473 = _471 + 1;
        _463 = _473;
    }
    int _475 = _463;
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _479 = _435 > 0.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _481;
    bool _485 = _435 >= 0.0;
    bool _487 = isnan(_435);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    bool _499 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _501 = isnan(_177);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _515 = !_265;
    int _517 = _515 ? 0 : 1;
    float _519 = fma(_497, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _521 = fma(_483, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _527 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _529 = isnan(_177);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_509;
    float _541 = _539 + 1.0;
    int _543 = _493 ? 0 : 1;
    float _545 = fma(_525, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _547;
    bool _551 = _469 > 0.0;
    float _553 = fma(_513, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _555 = _469 >= 0.0;
    bool _557 = isnan(_469);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = fma(_549, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _567 = _537 * _541;
    float _569 = -_537;
    float _571 = _569 + 1.0;
    bool _573 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _575 = isnan(_177);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _593 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _595 = isnan(_177);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = fma(_381, _431, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _607 = fma(_587, _327, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = _583 * _571;
    float _611 = fma(_591, _327, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = -_583;
    float _615 = _613 + 1.0;
    float _617 = -_301;
    float _619 = _617 + 1.0;
    bool _621 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_177);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _521 * _429;
    float _635 = _301 * _615;
    float _637 = _603 * _619;
    float _639 = -_603;
    float _641 = _639 + 1.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _643;
    float _647 = -_631;
    float _649 = _647 + 1.0;
    int _651 = abs(_517);
    float _653 = _631 * _641;
    float _655 = fma(_645, _431, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _657 = _377 * _649;
    float _659 = in.m_40.x;
    float _661 = in.m_40.y;
    float _663 = in.m_40.z;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _673 = float(_651);
    float _675 = fma(_667, _339, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _677 = fma(_671, _339, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _679 = _519 * _429;
    float _681 = -_395;
    float _683 = _681 + 1.0;
    bool _685 = !_269;
    int _687 = _685 ? 0 : 1;
    float _689 = float(_475);
    float _691 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].x, _679);
    int _693 = abs(_687);
    float _695 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].y, _633);
    int _697 = ~_543;
    int _699 = _697 + 1;
    int _701 = _699 + 1;
    float _703 = _673 * _689;
    int _705 = _701;
    if (!_479)
    {
        int _707 = ~_543;
        int _709 = _707 + 1;
        _705 = _709;
    }
    int _711 = _705;
    float _713 = _189 + (-0.5);
    float _715 = _703 * (-2.0);
    float _717 = float(_711);
    float _719 = fma(_553, _657, _695);
    float _721 = float(_693);
    float _723 = fma(_715, _659, _659);
    int _725 = _563 ? 0 : 1;
    float _727 = fma(_477, _715, _477);
    bool _729 = !_273;
    int _731 = _729 ? 0 : 1;
    float _733 = _721 * _717;
    int _735 = ~_725;
    int _737 = _735 + 1;
    int _739 = _737 + 1;
    float _741 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[196].x, _723);
    int _743 = abs(_731);
    float _745 = _733 * (-2.0);
    int _747 = _739;
    if (!_551)
    {
        int _749 = ~_725;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = fma(_727, _467, _741);
    float _757 = float(_743);
    float _759 = _191 + (-0.5);
    float _761 = float(_753);
    float _763 = fma(_745, _661, _661);
    float _765 = fma(_357, _745, _357);
    float _767 = fma(_545, _657, _691);
    float _769 = fma(_565, _653, _719);
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[196].y, _763);
    float _773 = _757 * _761;
    float _775 = fma(_335, _653, _767);
    float _777 = fma(_611, _637, _769);
    float _779 = fma(_765, _467, _771);
    float _781 = _773 * (-2.0);
    float _783 = _193 + (-0.5);
    float _785 = fma(_605, _635, _777);
    float _787 = _779 * 0.15915493667125701904296875;
    float _789 = fma(_781, _663, _663);
    float _791 = fma(_403, _781, _403);
    float _793 = in.m_42.x;
    float _795 = in.m_42.y;
    float _797 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _789);
    float _799 = fma(_607, _637, _775);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _801;
    float _805 = fma(_677, _609, _785);
    float _807 = fma(_791, _467, _797);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _809;
    float _813 = fma(_803, _361, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _815 = fma(_655, _635, _799);
    float _817 = _755 * 0.15915493667125701904296875;
    float _819 = _807 * 0.15915493667125701904296875;
    float _821 = fma(_813, _567, _805);
    float _823 = fma(_811, _361, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _825 = fma(_675, _609, _815);
    float _827 = _817 * 6.283185482025146484375;
    float _829 = sin(_827);
    float _831 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[150].y, _821);
    bool _833 = _195 > 0.5;
    float _835 = fma(_823, _567, _825);
    float _837 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[150].x, _835);
    float _839 = _817 * 6.283185482025146484375;
    float _841 = cos(_839);
    float _843 = _831 * _795;
    float _845 = _837 * _793;
    float _847 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _849 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _851 = _787 * 6.283185482025146484375;
    float _853 = sin(_851);
    bool _855 = !_249;
    float _857 = _855 ? (-0.5) : 0.5;
    bool _859 = !_245;
    float _861 = _859 ? (-0.5) : 0.5;
    float _863 = _787 * 6.283185482025146484375;
    float _865 = cos(_863);
    bool _867 = _191 > 0.5;
    float _869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _857);
    bool _871 = _189 > 0.5;
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _861);
    float _875 = -_857;
    int _877 = _867 ? as_type<int>(_875) : as_type<int>(_857);
    float _879 = _847 * _869;
    float _881 = _819 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = _829 * _853;
    float _887 = _849 * _873;
    float _889 = _841 * _853;
    float _891 = _819 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = _841 * _865;
    float _897 = _853 * _883;
    float _899 = _883 * _879;
    float _901 = _865 * _883;
    float _903 = _829 * _865;
    float _905 = _841 * _899;
    float _907 = _829 * _899;
    float _909 = fma(_893, _895, _885);
    float _911 = _893 * _879;
    float _913 = fma(_893, _885, _895);
    float _915 = fma(_909, _887, _905);
    float _917 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _919 = -_903;
    float _921 = fma(_893, _889, _919);
    float _923 = -_889;
    float _925 = fma(_893, _903, _923);
    float _927 = -_911;
    float _929 = fma(_901, _887, _927);
    float _931 = fma(_921, _917, _915);
    float _933 = fma(_925, _887, _907);
    float _935 = fma(_897, _917, _929);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _939 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _943 = fma(_913, _917, _933);
    float _945 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _941);
    float _951 = in.m_26.x;
    float _953 = in.m_26.y;
    float _955 = in.m_26.z;
    float _957 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _949);
    float _963 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _957);
    float _965 = _959 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _967 = _961 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _971 = _969 != 0;
    float _973 = _963 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _975 = _965 * _965;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _983 = _981 != 0;
    float _985 = fma(_967, _967, _975);
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _989 = _987 != 0;
    float _991 = fma(_973, _973, _985);
    float _993 = -_857;
    int _995 = _833 ? as_type<int>(_993) : as_type<int>(_857);
    bool _997 = _193 > 0.5;
    float _999 = sqrt(_991);
    float _1001 = _953 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1003 = _953 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1005 = _953 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1001);
    float _1009 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1003);
    float _1011 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1013 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1007);
    float _1015 = -_861;
    int _1017 = _871 ? as_type<int>(_1015) : as_type<int>(_861);
    float _1019 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1009);
    bool _1021 = !_971;
    float _1023 = _1021 ? _857 : as_type<float>(_877);
    float _1025 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1011);
    bool _1027 = !_979;
    float _1029 = _1027 ? _857 : as_type<float>(_995);
    float _1031 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1033 = _999 > 0.0;
    float _1035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1037 = !_983;
    float _1039 = _1037 ? _861 : as_type<float>(_1017);
    float _1041 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1043 = _1025 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1045 = _937 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1047 = -_861;
    float _1049 = _997 ? _1047 : _861;
    float _1051 = _1039 + 0.5;
    float _1053 = _1031 + _967;
    float _1055 = _1041 + _965;
    float _1057 = _1043 + _973;
    bool _1059 = !_989;
    float _1061 = _1059 ? _861 : _1049;
    float _1063 = fma(_1045, _1051, _333);
    float _1065 = _1045;
    float _1067 = _1049;
    float _1069 = _1051;
    float _1071 = _965;
    float _1073 = _1043;
    if (!_1033)
    {
        _1065 = _1053;
    }
    float _1075 = _1065;
    float _1077 = _1075;
    if (!_1033)
    {
        _1067 = _1055;
    }
    float _1079 = _1067;
    float _1081 = _1079;
    if (!_1033)
    {
        _1069 = _1057;
    }
    float _1083 = _1069;
    bool _1085 = !_1033;
    float _1087 = _1083;
    if (!_1085)
    {
        float _1089 = _145 * _145;
        bool _1091 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1093 = rsqrt(_991);
        float _1095 = fma(_143, _143, _1089);
        float _1097 = fma(_147, _147, _1095);
        float _1099 = sqrt(_1097);
        float _1101 = _937;
        if (!_1091)
        {
            float _1103 = in.m_42.w;
            _1101 = _1103;
        }
        float _1105 = _1101;
        float _1107 = _965 * _1093;
        float _1109 = _967 * _1093;
        float _1111 = _1083;
        float _1113 = _1093;
        if (!_1091)
        {
            float _1115 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            _1111 = _1115;
        }
        float _1117 = _1111;
        float _1119 = _973 * _1093;
        float _1121 = _1095;
        if (_1091)
        {
            float _1123 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1121 = _1123;
        }
        float _1125 = _1121;
        bool _1127 = _1099 > 0.0;
        float _1129 = _1105;
        float _1131 = _1099;
        float _1133 = _1117;
        if (!_1091)
        {
            float _1135 = _1117 * _1105;
            _1129 = _1135;
        }
        float _1137 = _1129;
        if (!_1127)
        {
            _1131 = _1053;
        }
        float _1139 = _1131;
        float _1141 = _1125;
        _1077 = _1139;
        if (_1091)
        {
            float _1143 = _143 * _1125;
            _1071 = _1143;
        }
        float _1145 = _1071;
        float _1147 = _1145;
        if (_1091)
        {
            float _1149 = _145 * _1125;
            _1073 = _1149;
        }
        float _1151 = _1073;
        float _1153 = _1151;
        if (_1091)
        {
            float _1155 = _147 * _1125;
            _1141 = _1155;
        }
        float _1157 = _1141;
        float _1159 = _1157;
        if (!_1091)
        {
            float _1161 = _143 * _1137;
            _1147 = _1161;
        }
        float _1163 = _1147;
        if (!_1091)
        {
            float _1165 = _145 * _1137;
            _1153 = _1165;
        }
        float _1167 = _1153;
        if (!_1091)
        {
            float _1169 = _147 * _1137;
            _1159 = _1169;
        }
        float _1171 = _1159;
        if (!_1127)
        {
            _1113 = _1055;
        }
        float _1173 = _1113;
        _1081 = _1173;
        if (!_1127)
        {
            _1133 = _1057;
        }
        float _1175 = _1133;
        bool _1177 = !_1127;
        _1087 = _1175;
        if (!_1177)
        {
            float _1179 = rsqrt(_1097);
            float _1181 = _145 * _1179;
            float _1183 = _143 * _1179;
            float _1185 = _147 * _1179;
            float _1187 = _1107 * _1181;
            float _1189 = fma(_1109, _1183, _1187);
            float _1191 = fma(_1119, _1185, _1189);
            float _1193 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1195 = fma(_1163, _1193, _1053);
            float _1197 = fma(_1167, _1193, _1055);
            float _1199 = fma(_1171, _1193, _1057);
            _1081 = _1197;
            _1077 = _1195;
            _1087 = _1199;
        }
    }
    float _1201 = _1081;
    float _1203 = _1077;
    float _1205 = _1087;
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1213 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1207);
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1209);
    float _1219 = _1023 + (-0.5);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1211);
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1215);
    float _1225 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1217);
    float _1227 = -_1213;
    float _1229 = -_457;
    float _1231 = fma(_1227, _1219, _1229);
    float _1233 = -_461;
    float _1235 = _1233 + 1.0;
    float _1237 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1221);
    float _1241 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1249 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1251 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = fma(_1023, _1235, _1231);
    float _1255 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1257 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1245);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1261 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1263 = -_459;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1247);
    float _1269 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1249);
    float _1271 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1257);
    float _1275 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1261);
    float _1277 = -_1265;
    float _1279 = fma(_1039, _1277, _1063);
    float _1281 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1283 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1285 = _1061 + 0.5;
    float _1287 = -_1029;
    float _1289 = _1287 + 0.5;
    float _1291 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1301 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1271);
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1305 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1307 = _1295 * _1243;
    float _1309 = _1297 * _1259;
    float _1311 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1273);
    float _1319 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1283);
    float _1321 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1281);
    float _1323 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1301);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1311;
    out.m_44.y = _1313;
    out.m_44.z = _1315;
    out.m_46.x = _1279;
    out.m_46.y = _1253;
    out.m_46.z = _1307;
    out.m_46.w = _1309;
    out.m_48.x = _1203;
    out.m_48.y = _1201;
    out.m_48.z = _1205;
    out.gl_Position.x = _1317;
    out.gl_Position.y = _1319;
    out.gl_Position.z = _1321;
    out.gl_Position.w = _1323;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1380 = as_type<float>(_83);
        out.gl_Position.z = _1380;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_31.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = _101;
    if (_97)
    {
        float _105 = float(_67);
        _77 = _105;
    }
    float _107 = _77;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_29.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1450 = as_type<float>(_121);
        out.gl_Position.z = _1450;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _183 = log2(_181);
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _187 = _177 + _185;
    float _189 = in.m_35.x;
    float _191 = in.m_35.y;
    float _193 = in.m_35.z;
    float _195 = in.m_35.w;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _177 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _217 = 1.0 / _203;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _221 = _177 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _225 = _177 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _177 + _227;
    float _231 = _183 * _101;
    float _233 = 1.0 / _207;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _239;
    int _243 = as_type<int>(_179) & 1;
    bool _245 = _243 != 0;
    int _247 = as_type<int>(_179) & 2;
    bool _249 = _247 != 0;
    float _251 = 1.0 / _211;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _257 = _199 * _217;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _261 = _177 + _259;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _273 = _271 != 0;
    float _275 = _191 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _277 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _285 = _281 || _283;
    float _287 = 1.0 / _215;
    float _289 = _229 * _233;
    bool _291 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _293 = isnan(_177);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _255;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _305;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _315 = _187 * _251;
    float _317 = fma(_275, -2.0, _311);
    float _319 = 1.0 / _307;
    float _321 = -_309;
    float _323 = fma(_313, 2.0, _321);
    float _325 = _193 * 2.0;
    float _327 = _221 * _287;
    float _329 = _191 + _193;
    float _331 = -_101;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[76].x, _323);
    float _335 = fma(_241, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _337 = exp2(_231);
    float _339 = _225 * _303;
    float _341 = _329 + (-1.0);
    bool _343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _355 = 1.0 + _353;
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _359 = floor(_325);
    float _361 = _261 * _319;
    float _363 = _193 + _189;
    float _365 = _191 + _189;
    bool _367 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_177);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _379;
    float _383 = _363 + (-1.0);
    bool _385 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_177);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = 1.0 / _237;
    float _399 = -_337;
    float _401 = _399 + 1.0;
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _405 = _189 * 2.0;
    float _407 = -_377;
    float _409 = _407 + 1.0;
    float _411 = _285 ? _401 : 0.0;
    bool _413 = _359 >= 0.0;
    bool _415 = isnan(_359);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = _177 + _423;
    float _427 = 1.0 / _355;
    float _429 = _395 * _409;
    float _431 = _425 * _397;
    int _433 = _421 ? 0 : 1;
    float _435 = floor(_405);
    bool _437 = _359 > 0.0;
    float _439 = _365 + (-1.0);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _445 = _191 * 2.0;
    int _447 = ~_433;
    int _449 = _447 + 1;
    int _451 = _449 + 1;
    float _453 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].z, _441);
    float _455 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].w, _443);
    float _457 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _317);
    float _459 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _453);
    float _461 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _455);
    int _463 = _451;
    if (_351)
    {
        float _465 = _411 * _427;
        _103 = _465;
    }
    float _467 = _103;
    float _469 = floor(_445);
    if (!_437)
    {
        int _471 = ~_433;
        int _473 = _471 + 1;
        _463 = _473;
    }
    int _475 = _463;
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _479 = _435 > 0.0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _481;
    bool _485 = _435 >= 0.0;
    bool _487 = isnan(_435);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    bool _499 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _501 = isnan(_177);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _515 = !_265;
    int _517 = _515 ? 0 : 1;
    float _519 = fma(_497, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _521 = fma(_483, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _527 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _529 = isnan(_177);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_509;
    float _541 = _539 + 1.0;
    int _543 = _493 ? 0 : 1;
    float _545 = fma(_525, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _547;
    bool _551 = _469 > 0.0;
    float _553 = fma(_513, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _555 = _469 >= 0.0;
    bool _557 = isnan(_469);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = fma(_549, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _567 = _537 * _541;
    float _569 = -_537;
    float _571 = _569 + 1.0;
    bool _573 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _575 = isnan(_177);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _593 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _595 = isnan(_177);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = fma(_381, _431, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _607 = fma(_587, _327, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = _583 * _571;
    float _611 = fma(_591, _327, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = -_583;
    float _615 = _613 + 1.0;
    float _617 = -_301;
    float _619 = _617 + 1.0;
    bool _621 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_177);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _521 * _429;
    float _635 = _301 * _615;
    float _637 = _603 * _619;
    float _639 = -_603;
    float _641 = _639 + 1.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _643;
    float _647 = -_631;
    float _649 = _647 + 1.0;
    int _651 = abs(_517);
    float _653 = _631 * _641;
    float _655 = fma(_645, _431, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _657 = _377 * _649;
    float _659 = in.m_40.x;
    float _661 = in.m_40.y;
    float _663 = in.m_40.z;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _673 = float(_651);
    float _675 = fma(_667, _339, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _677 = fma(_671, _339, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _679 = _519 * _429;
    float _681 = -_395;
    float _683 = _681 + 1.0;
    bool _685 = !_269;
    int _687 = _685 ? 0 : 1;
    float _689 = float(_475);
    float _691 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].x, _679);
    int _693 = abs(_687);
    float _695 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[143].y, _633);
    int _697 = ~_543;
    int _699 = _697 + 1;
    int _701 = _699 + 1;
    float _703 = _673 * _689;
    int _705 = _701;
    if (!_479)
    {
        int _707 = ~_543;
        int _709 = _707 + 1;
        _705 = _709;
    }
    int _711 = _705;
    float _713 = _189 + (-0.5);
    float _715 = _703 * (-2.0);
    float _717 = float(_711);
    float _719 = fma(_553, _657, _695);
    float _721 = float(_693);
    float _723 = fma(_715, _659, _659);
    int _725 = _563 ? 0 : 1;
    float _727 = fma(_477, _715, _477);
    bool _729 = !_273;
    int _731 = _729 ? 0 : 1;
    float _733 = _721 * _717;
    int _735 = ~_725;
    int _737 = _735 + 1;
    int _739 = _737 + 1;
    float _741 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[196].x, _723);
    int _743 = abs(_731);
    float _745 = _733 * (-2.0);
    int _747 = _739;
    if (!_551)
    {
        int _749 = ~_725;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = fma(_727, _467, _741);
    float _757 = float(_743);
    float _759 = _191 + (-0.5);
    float _761 = float(_753);
    float _763 = fma(_745, _661, _661);
    float _765 = fma(_357, _745, _357);
    float _767 = fma(_545, _657, _691);
    float _769 = fma(_565, _653, _719);
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[196].y, _763);
    float _773 = _757 * _761;
    float _775 = fma(_335, _653, _767);
    float _777 = fma(_611, _637, _769);
    float _779 = fma(_765, _467, _771);
    float _781 = _773 * (-2.0);
    float _783 = _193 + (-0.5);
    float _785 = fma(_605, _635, _777);
    float _787 = _779 * 0.15915493667125701904296875;
    float _789 = fma(_781, _663, _663);
    float _791 = fma(_403, _781, _403);
    float _793 = in.m_42.x;
    float _795 = in.m_42.y;
    float _797 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _789);
    float _799 = fma(_607, _637, _775);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _801;
    float _805 = fma(_677, _609, _785);
    float _807 = fma(_791, _467, _797);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _809;
    float _813 = fma(_803, _361, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _815 = fma(_655, _635, _799);
    float _817 = _755 * 0.15915493667125701904296875;
    float _819 = _807 * 0.15915493667125701904296875;
    float _821 = fma(_813, _567, _805);
    float _823 = fma(_811, _361, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _825 = fma(_675, _609, _815);
    float _827 = _817 * 6.283185482025146484375;
    float _829 = sin(_827);
    float _831 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[150].y, _821);
    bool _833 = _195 > 0.5;
    float _835 = fma(_823, _567, _825);
    float _837 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[150].x, _835);
    float _839 = _817 * 6.283185482025146484375;
    float _841 = cos(_839);
    float _843 = _831 * _795;
    float _845 = _837 * _793;
    float _847 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _849 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _851 = _787 * 6.283185482025146484375;
    float _853 = sin(_851);
    bool _855 = !_249;
    float _857 = _855 ? (-0.5) : 0.5;
    bool _859 = !_245;
    float _861 = _859 ? (-0.5) : 0.5;
    float _863 = _787 * 6.283185482025146484375;
    float _865 = cos(_863);
    bool _867 = _191 > 0.5;
    float _869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _857);
    bool _871 = _189 > 0.5;
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _861);
    float _875 = -_857;
    int _877 = _867 ? as_type<int>(_875) : as_type<int>(_857);
    float _879 = _847 * _869;
    float _881 = _819 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = _829 * _853;
    float _887 = _849 * _873;
    float _889 = _841 * _853;
    float _891 = _819 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = _841 * _865;
    float _897 = _853 * _883;
    float _899 = _883 * _879;
    float _901 = _865 * _883;
    float _903 = _829 * _865;
    float _905 = _841 * _899;
    float _907 = _829 * _899;
    float _909 = fma(_893, _895, _885);
    float _911 = _893 * _879;
    float _913 = fma(_893, _885, _895);
    float _915 = fma(_909, _887, _905);
    float _917 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _919 = -_903;
    float _921 = fma(_893, _889, _919);
    float _923 = -_889;
    float _925 = fma(_893, _903, _923);
    float _927 = -_911;
    float _929 = fma(_901, _887, _927);
    float _931 = fma(_921, _917, _915);
    float _933 = fma(_925, _887, _907);
    float _935 = fma(_897, _917, _929);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _939 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _943 = fma(_913, _917, _933);
    float _945 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _941);
    float _951 = in.m_26.x;
    float _953 = in.m_26.y;
    float _955 = in.m_26.z;
    float _957 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _949);
    float _963 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _957);
    float _965 = _959 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _967 = _961 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _971 = _969 != 0;
    float _973 = _963 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _975 = _965 * _965;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _983 = _981 != 0;
    float _985 = fma(_967, _967, _975);
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _989 = _987 != 0;
    float _991 = fma(_973, _973, _985);
    float _993 = -_857;
    int _995 = _833 ? as_type<int>(_993) : as_type<int>(_857);
    bool _997 = _193 > 0.5;
    float _999 = sqrt(_991);
    float _1001 = _953 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1003 = _953 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1005 = _953 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1001);
    float _1009 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1003);
    float _1011 = fma(_951, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1013 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1007);
    float _1015 = -_861;
    int _1017 = _871 ? as_type<int>(_1015) : as_type<int>(_861);
    float _1019 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1009);
    bool _1021 = !_971;
    float _1023 = _1021 ? _857 : as_type<float>(_877);
    float _1025 = fma(_955, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1011);
    bool _1027 = !_979;
    float _1029 = _1027 ? _857 : as_type<float>(_995);
    float _1031 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1033 = _999 > 0.0;
    float _1035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1037 = !_983;
    float _1039 = _1037 ? _861 : as_type<float>(_1017);
    float _1041 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1043 = _1025 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1045 = _937 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1047 = -_861;
    float _1049 = _997 ? _1047 : _861;
    float _1051 = _1039 + 0.5;
    float _1053 = _1031 + _967;
    float _1055 = _1041 + _965;
    float _1057 = _1043 + _973;
    bool _1059 = !_989;
    float _1061 = _1059 ? _861 : _1049;
    float _1063 = fma(_1045, _1051, _333);
    float _1065 = _1045;
    float _1067 = _1049;
    float _1069 = _1051;
    float _1071 = _965;
    float _1073 = _1043;
    if (!_1033)
    {
        _1065 = _1053;
    }
    float _1075 = _1065;
    float _1077 = _1075;
    if (!_1033)
    {
        _1067 = _1055;
    }
    float _1079 = _1067;
    float _1081 = _1079;
    if (!_1033)
    {
        _1069 = _1057;
    }
    float _1083 = _1069;
    bool _1085 = !_1033;
    float _1087 = _1083;
    if (!_1085)
    {
        float _1089 = _145 * _145;
        bool _1091 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1093 = rsqrt(_991);
        float _1095 = fma(_143, _143, _1089);
        float _1097 = fma(_147, _147, _1095);
        float _1099 = sqrt(_1097);
        float _1101 = _937;
        if (!_1091)
        {
            float _1103 = in.m_42.w;
            _1101 = _1103;
        }
        float _1105 = _1101;
        float _1107 = _965 * _1093;
        float _1109 = _967 * _1093;
        float _1111 = _1083;
        float _1113 = _1093;
        if (!_1091)
        {
            float _1115 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            _1111 = _1115;
        }
        float _1117 = _1111;
        float _1119 = _973 * _1093;
        float _1121 = _1095;
        if (_1091)
        {
            float _1123 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1121 = _1123;
        }
        float _1125 = _1121;
        bool _1127 = _1099 > 0.0;
        float _1129 = _1105;
        float _1131 = _1099;
        float _1133 = _1117;
        if (!_1091)
        {
            float _1135 = _1117 * _1105;
            _1129 = _1135;
        }
        float _1137 = _1129;
        if (!_1127)
        {
            _1131 = _1053;
        }
        float _1139 = _1131;
        float _1141 = _1125;
        _1077 = _1139;
        if (_1091)
        {
            float _1143 = _143 * _1125;
            _1071 = _1143;
        }
        float _1145 = _1071;
        float _1147 = _1145;
        if (_1091)
        {
            float _1149 = _145 * _1125;
            _1073 = _1149;
        }
        float _1151 = _1073;
        float _1153 = _1151;
        if (_1091)
        {
            float _1155 = _147 * _1125;
            _1141 = _1155;
        }
        float _1157 = _1141;
        float _1159 = _1157;
        if (!_1091)
        {
            float _1161 = _143 * _1137;
            _1147 = _1161;
        }
        float _1163 = _1147;
        if (!_1091)
        {
            float _1165 = _145 * _1137;
            _1153 = _1165;
        }
        float _1167 = _1153;
        if (!_1091)
        {
            float _1169 = _147 * _1137;
            _1159 = _1169;
        }
        float _1171 = _1159;
        if (!_1127)
        {
            _1113 = _1055;
        }
        float _1173 = _1113;
        _1081 = _1173;
        if (!_1127)
        {
            _1133 = _1057;
        }
        float _1175 = _1133;
        bool _1177 = !_1127;
        _1087 = _1175;
        if (!_1177)
        {
            float _1179 = rsqrt(_1097);
            float _1181 = _145 * _1179;
            float _1183 = _143 * _1179;
            float _1185 = _147 * _1179;
            float _1187 = _1107 * _1181;
            float _1189 = fma(_1109, _1183, _1187);
            float _1191 = fma(_1119, _1185, _1189);
            float _1193 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1195 = fma(_1163, _1193, _1053);
            float _1197 = fma(_1167, _1193, _1055);
            float _1199 = fma(_1171, _1193, _1057);
            _1081 = _1197;
            _1077 = _1195;
            _1087 = _1199;
        }
    }
    float _1201 = _1081;
    float _1203 = _1077;
    float _1205 = _1087;
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1213 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1207);
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1209);
    float _1219 = _1023 + (-0.5);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1211);
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1215);
    float _1225 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1217);
    float _1227 = -_1213;
    float _1229 = -_457;
    float _1231 = fma(_1227, _1219, _1229);
    float _1233 = -_461;
    float _1235 = _1233 + 1.0;
    float _1237 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1221);
    float _1241 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1249 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1251 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = fma(_1023, _1235, _1231);
    float _1255 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1257 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1245);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1261 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1263 = -_459;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1247);
    float _1269 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1249);
    float _1271 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1257);
    float _1275 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1261);
    float _1277 = -_1265;
    float _1279 = fma(_1039, _1277, _1063);
    float _1281 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1283 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1285 = _1061 + 0.5;
    float _1287 = -_1029;
    float _1289 = _1287 + 0.5;
    float _1291 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1301 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1271);
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1305 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1307 = _1295 * _1243;
    float _1309 = _1297 * _1259;
    float _1311 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1273);
    float _1319 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1283);
    float _1321 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1281);
    float _1323 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1301);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1311;
    out.m_44.y = _1313;
    out.m_44.z = _1315;
    out.m_46.x = _1279;
    out.m_46.y = _1253;
    out.m_46.z = _1307;
    out.m_46.w = _1309;
    out.m_48.x = _1203;
    out.m_48.y = _1201;
    out.m_48.z = _1205;
    out.gl_Position.x = _1317;
    out.gl_Position.y = _1319;
    out.gl_Position.z = _1321;
    out.gl_Position.w = _1323;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

