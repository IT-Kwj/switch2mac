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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_52 [[user(locn6)]];
    float4 m_60 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
    float4 m_48 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _527 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_35.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_97);
        out.gl_Position.z = _1606;
    }
    if (!_85)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_35.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1676 = as_type<float>(_135);
        out.gl_Position.z = _1676;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_39.w;
    float _139 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_37.x;
    float _153 = in.m_37.y;
    float _155 = in.m_37.z;
    float _157 = in.m_32.x;
    float _159 = in.m_32.y;
    float _161 = in.m_32.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _277;
    if (!_259)
    {
        float _261 = in.m_41.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_81);
        float _283 = 1.0 / _281;
        float _285 = _115 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _287 + _293;
    bool _297 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _299 = isnan(_287);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = -_307;
    float _327 = _325 + 1.0;
    float _329 = 1.0 / _311;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _333 = 1.0 / _315;
    float _335 = 1.0 / _319;
    float _337 = _291 * _329;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _287 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _345 = _287 + _343;
    float _347 = 1.0 / _323;
    float _349 = _295 * _333;
    bool _351 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _353 = isnan(_287);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = _361 * _327;
    float _365 = _341 * _335;
    bool _367 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_287);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _385 = isnan(_287);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_381, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = _345 * _347;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = -_377;
    float _417 = _415 + 1.0;
    float _419 = _377 * _405;
    float _421 = fma(_409, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _423 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_287);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _393 * _417;
    float _437 = -_393;
    float _439 = _437 + 1.0;
    float _441 = fma(_399, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_413, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _433 * _439;
    float _447 = -_433;
    float _449 = _447 + 1.0;
    float _451 = in.m_39.x;
    float _453 = in.m_39.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = _395 * _445;
    float _461 = _421 * _445;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _475 = fma(_465, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _477 = fma(_457, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _479 = fma(_441, _435, _471);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _485 = fma(_443, _435, _473);
    float _487 = fma(_469, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _489 = fma(_475, _419, _479);
    float _491 = fma(_483, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = fma(_477, _419, _485);
    float _495 = fma(_487, _363, _489);
    float _497 = fma(_491, _363, _493);
    float _499 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[147].x, _495);
    float _501 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[147].y, _497);
    float _503 = _499 * _451;
    float _505 = _501 * _453;
    bool _507 = !_331;
    float _525;
    if (!_507)
    {
        float _509 = in.m_41.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_81);
        float _531 = 1.0 / _529;
        float _533 = _115 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = in.m_41.z;
    float _539 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _541 = log2(_539);
    float _543 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _545 = as_type<float>(int(gl_VertexIndex));
    float _547 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _549 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _543);
    float _551 = in.m_41.x;
    float _553 = in.m_41.y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = 1.0 / _557;
    float _561 = _541 * _115;
    float _563 = exp2(_561);
    float _565 = _537 * 2.0;
    int _567 = as_type<int>(_545) & 1;
    bool _569 = _567 != 0;
    int _571 = as_type<int>(_545) & 2;
    bool _573 = _571 != 0;
    float _575 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = floor(_565);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _591 = 1.0 + _589;
    float _593 = _551 * 2.0;
    float _595 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _597 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _605 = _601 || _603;
    float _607 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _609 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
    float _611 = 1.0 / _591;
    float _613 = -_563;
    float _615 = _613 + 1.0;
    float _617 = _605 ? _615 : 0.0;
    float _619 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _607);
    float _621 = floor(_593);
    bool _623 = _587 >= 0.0;
    bool _625 = isnan(_587);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _609);
    bool _635 = _587 > 0.0;
    float _637 = _553 + _537;
    int _639 = _631 ? 0 : 1;
    float _641 = _619 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _645 = _643 != 0;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _649 = _647 != 0;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _653 = _651 != 0;
    float _655 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _549);
    float _657 = _553 * 2.0;
    if (_585)
    {
        float _659 = _617 * _611;
        _117 = _659;
    }
    float _661 = _117;
    int _663 = ~_639;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = _553 + _551;
    float _671 = floor(_657);
    float _673 = _637 + (-1.0);
    float _675 = _537 + _551;
    int _677 = _667;
    if (!_635)
    {
        int _679 = ~_639;
        int _681 = _679 + 1;
        _677 = _681;
    }
    int _683 = _677;
    float _685 = _669 + (-1.0);
    bool _687 = _621 > 0.0;
    float _689 = _675 + (-1.0);
    bool _691 = _621 >= 0.0;
    bool _693 = isnan(_621);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _703 = _655 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _705 = !_645;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _711 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _713 = _699 ? 0 : 1;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _717 = _703 + _715;
    bool _719 = _671 > 0.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _721;
    int _725 = ~_713;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = _633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _733 = _671 >= 0.0;
    bool _735 = isnan(_671);
    bool _737 = _733 || _735;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    float _743 = _717 * _717;
    int _745 = abs(_707);
    float _747 = _723 * _559;
    int _749 = _729;
    if (!_687)
    {
        int _751 = ~_713;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _759 = _731 + _757;
    float _761 = in.m_46.x;
    float _763 = in.m_46.y;
    float _765 = in.m_46.z;
    float _767 = float(_683);
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _771 = _641 + _769;
    bool _773 = !_649;
    int _775 = _773 ? 0 : 1;
    float _777 = _537 + (-0.5);
    float _779 = float(_745);
    float _781 = fma(_771, _771, _743);
    int _783 = abs(_775);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _789 = float(_755);
    float _791 = fma(_759, _759, _781);
    float _793 = _779 * _767;
    float _795 = sqrt(_791);
    bool _797 = !_653;
    int _799 = _797 ? 0 : 1;
    float _801 = _793 * (-2.0);
    float _803 = float(_783);
    int _805 = _741 ? 0 : 1;
    float _807 = fma(_701, _801, _701);
    int _809 = abs(_799);
    float _811 = _803 * _789;
    int _813 = ~_805;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    float _819 = fma(_801, _761, _761);
    int _821 = _817;
    if (!_719)
    {
        int _823 = ~_805;
        int _825 = _823 + 1;
        _821 = _825;
    }
    int _827 = _821;
    float _829 = rsqrt(_791);
    float _831 = _551 + (-0.5);
    float _833 = float(_827);
    float _835 = _795 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _837 = float(_809);
    float _839 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].x, _819);
    float _841 = _547 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _843 = _811 * (-2.0);
    float _845 = _837 * _833;
    float _847 = fma(_807, _661, _839);
    float _849 = precise::min(_841, _835);
    float _851 = _553 + (-0.5);
    float _853 = fma(_843, _763, _763);
    float _855 = _845 * (-2.0);
    float _857 = fma(_711, _843, _711);
    float _859 = _829 * _849;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _853);
    float _863 = fma(_709, _855, _709);
    float _865 = fma(_855, _765, _765);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _871 = fma(_857, _661, _861);
    float _873 = _717 * _859;
    float _875 = _771 * _859;
    float _877 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _865);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _881 = _535 + _879;
    float _883 = -_873;
    float _885 = _717 + _883;
    float _887 = -_875;
    float _889 = _771 + _887;
    float _891 = 1.0 / _869;
    float _893 = _759 * _859;
    float _895 = _885 * _885;
    float _897 = fma(_863, _661, _877);
    bool _899 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _901 = isnan(_535);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_893;
    float _913 = _759 + _911;
    float _915 = fma(_889, _889, _895);
    bool _917 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _919 = isnan(_535);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = fma(_747, _881, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _931 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _933 = isnan(_535);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = fma(_913, _913, _915);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _947 = _535 + _945;
    float _949 = -_927;
    float _951 = _949 + 1.0;
    float _953 = _847 * 0.15915493667125701904296875;
    float _955 = _871 * 0.15915493667125701904296875;
    float _957 = _909 * _951;
    float _959 = sqrt(_943);
    float _961 = _787 * _891;
    float _963 = -_941;
    float _965 = _963 + 1.0;
    float _967 = _929 * _957;
    float _969 = -_909;
    float _971 = _969 + 1.0;
    float _973 = fma(_961, _947, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _975 = _897 * 0.15915493667125701904296875;
    float _977 = _927 * _965;
    float _979 = _953 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[115].x, _967);
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _987 = _985 != 0;
    out.m_48.w = _849;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _991 = _989 != 0;
    float _993 = fma(_973, _977, _983);
    float _995 = _953 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[117].x, _993);
    bool _1001 = !_573;
    float _1003 = _1001 ? (-0.5) : 0.5;
    float _1005 = _829 * _959;
    bool _1007 = _553 > 0.5;
    float _1009 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1011 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1003);
    float _1013 = _955 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    bool _1017 = _551 > 0.5;
    float _1019 = _1009 * _1005;
    float _1021 = -_1003;
    int _1023 = _1007 ? as_type<int>(_1021) : as_type<int>(_1003);
    bool _1025 = !_569;
    float _1027 = _1025 ? (-0.5) : 0.5;
    bool _1029 = !_991;
    float _1031 = _1029 ? _1003 : as_type<float>(_1023);
    float _1033 = _955 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = -_1027;
    int _1039 = _1017 ? as_type<int>(_1037) : as_type<int>(_1027);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1049 = _1045 || _1047;
    float _1051 = _1019 * _1011;
    bool _1053 = !_987;
    float _1055 = _1053 ? _1027 : as_type<float>(_1039);
    float _1057 = -_1031;
    float _1059 = _1057 + 0.5;
    float _1061 = _975 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _981 * _1015;
    float _1067 = _1055 + 0.5;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1071 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1073 = _975 * 6.283185482025146484375;
    float _1075 = cos(_1073);
    float _1077 = _997 * _1035;
    float _1079 = _981 * _1035;
    float _1081 = fma(_1063, _1077, _1065);
    float _1083 = fma(_1063, _1065, _1077);
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1027);
    float _1089 = _547 * _1005;
    float _1091 = _997 * _1015;
    float _1093 = _1075 * _1051;
    float _1095 = _1089 * _1087;
    float _1097 = _1015 * _1075;
    float _1099 = -_1091;
    float _1101 = fma(_1063, _1079, _1099);
    float _1103 = _997 * _1093;
    float _1105 = -_1079;
    float _1107 = fma(_1063, _1091, _1105);
    float _1109 = _1035 * _1075;
    float _1111 = -_1051;
    float _1113 = _1063 * _1111;
    float _1115 = fma(_1081, _1095, _1103);
    float _1117 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1119 = _1117 * 0.5;
    float _1121 = _981 * _1093;
    float _1123 = fma(_1109, _1095, _1113);
    float _1125 = _1071 * _1085;
    float _1127 = fma(_1107, _1119, _1115);
    float _1129 = fma(_1101, _1095, _1121);
    float _1131 = fma(_1097, _1119, _1123);
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1135 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1137 = fma(_1083, _1119, _1129);
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1141 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1135);
    float _1143 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1145 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1143);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1161 = _1069 * _1133;
    float _1163 = _731 + _1155;
    float _1165 = _641 + _1159;
    float _1167 = -_875;
    float _1169 = _641 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1163 + _1171;
    float _1175 = -_893;
    float _1177 = _731 + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1181 = _1165 + _1179;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1185 = _1173 * _1173;
    float _1187 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1125;
    out.m_50.y = _1161;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = fma(_1181, _1181, _1185);
    float _1193 = -_873;
    float _1195 = _703 + _1193;
    float _1197 = sqrt(_1191);
    float _1199 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_52.x = _1169;
    out.m_52.y = _1195;
    out.m_52.z = _1177;
    float _1201 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1199);
    float _1205 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_54.x = _1157;
    out.m_54.y = _1187;
    out.m_54.z = _1189;
    float _1207 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1203);
    float _1209 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1205);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1217 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1209);
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1221 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1223 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1211);
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1227 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1229 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = 1.0 / _1227;
    float _1237 = _703 + _1225;
    float _1239 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_56.x = _1229;
    out.m_56.y = _1231;
    out.m_56.z = _1233;
    out.m_56.w = _1145;
    float _1241 = _1239 + _1227;
    float _1243 = _1233;
    float _1245 = _1229;
    float _1247 = _1231;
    float _1249 = _1169;
    if (!_1221)
    {
        _1243 = _1165;
    }
    float _1251 = _1243;
    float _1253 = _1251;
    if (!_1221)
    {
        _1245 = _1163;
    }
    float _1255 = _1245;
    float _1257 = _1255;
    if (!_1221)
    {
        _1247 = _1237;
    }
    float _1259 = _1247;
    bool _1261 = !_1221;
    float _1263 = _1259;
    if (!_1261)
    {
        float _1265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1269 = _1197 + _1267;
        float _1271 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = rsqrt(_1191);
        float _1275 = _1269 * _1265;
        float _1277 = _1275 * 0.15915493667125701904296875;
        float _1279 = _1277 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        float _1283 = _1277 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = fma(_1281, _1271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = _1273 * _1287;
        float _1291 = _1285 + (-1.0);
        float _1293 = fma(_1181, _1289, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = fma(_1173, _1289, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1297 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1237, _1285, _1297);
        _1257 = _1295;
        _1253 = _1293;
        _1263 = _1299;
    }
    float _1301 = _1257;
    float _1303 = _1253;
    float _1305 = _1263;
    float _1307 = -_893;
    float _1309 = _1307 + _1301;
    bool _1311 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1313 = isnan(0.5);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1319 = _1315 || _1317;
    float _1321 = -_875;
    float _1323 = _1321 + _1303;
    float _1325 = -_873;
    float _1327 = _1325 + _1305;
    float _1329 = _1241 * _1235;
    float _1331 = _1329 * 0.5;
    float _1333 = _1327;
    float _1335 = _1323;
    float _1337 = _1309;
    if (!_1049)
    {
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1341 = _1195 + _1339;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1345 = _1169 + _1343;
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = -_731;
        float _1351 = _1349 + _1301;
        float _1353 = _1341 * _1341;
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1357 = _1177 + _1355;
        float _1359 = fma(_1345, _1345, _1353);
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1363 = fma(_1357, _1357, _1359);
        float _1365 = sqrt(_1363);
        float _1367 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1371 = _1369 * _1361;
        float _1373 = -_641;
        float _1375 = _1373 + _1303;
        float _1377 = -_703;
        float _1379 = _1377 + _1305;
        float _1381 = _1367 * _1371;
        float _1383 = fma(_1375, _1381, _1169);
        float _1385 = fma(_1379, _1381, _1195);
        float _1387 = fma(_1351, _1381, _1177);
        _1333 = _1385;
        _1335 = _1383;
        _1337 = _1387;
    }
    float _1389 = _1333;
    float _1391 = _1335;
    float _1393 = _1337;
    float _1395 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1319)
    {
        _1249 = 1.0;
    }
    float _1397 = _1249;
    float _1399 = _1397;
    if (!_1319)
    {
        float _1401 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1405 = _1401 * 0.15915493667125701904296875;
        float _1407 = _1403 * 0.15915493667125701904296875;
        float _1409 = _1405 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1415 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
        float _1417 = _1405 * 6.283185482025146484375;
        float _1419 = sin(_1417);
        float _1421 = 1.0 / _1411;
        float _1423 = _1407 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = _1407 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = 1.0 / _1415;
        float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1439 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1437;
        float _1441 = 1.0 / _1433;
        float _1443 = 1.0 / _1439;
        float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1447 = _1435 * _1445;
        float _1449 = _1431 * _1441;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1453 = fma(_1449, _1447, _1451);
        float _1455 = _1453 * _1443;
        float _1457 = precise::clamp(_1455, 0.0, 1.0);
        _1399 = _1457;
    }
    float _1459 = _1399;
    float _1461 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1463 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    float _1465 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1467 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1469 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1461);
    float _1471 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1463);
    float _1473 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1465);
    float _1475 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1467);
    float _1477 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1469);
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1481 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1473);
    float _1483 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1475);
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1491 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1495 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1499 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1489);
    float _1501 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    float _1503 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1493);
    float _1505 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1497);
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1499);
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    bool _1513 = _1459 > 0.0;
    bool _1515 = isnan(_1459);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.0);
    bool _1521 = _1517 || _1519;
    float _1523 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1525 = _1459 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1527 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1507);
    float _1529 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1511);
    float _1531 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1533 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1523);
    float _1535 = _1525 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1537 = _1527 + _1529;
    float _1539 = _1531 + _1529;
    float _1541 = _1529 * 0.5;
    float _1543 = _1537 * 0.5;
    float _1545 = _1539 * 0.5;
    float _1547 = fma(_1533, -0.5, _1541);
    out.m_58.x = _1089;
    out.m_60.x = _1391;
    out.m_60.y = _1389;
    out.m_60.z = _1393;
    out.m_35.x = _1535;
    out.gl_Position.x = _1527;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _1531;
    out.gl_Position.w = _1529;
    out.m_62.x = _1543;
    out.m_62.y = _1547;
    out.m_62.z = _1545;
    out.m_62.w = _1529;
    if (_1521)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1549;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _527 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_35.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_97);
        out.gl_Position.z = _1606;
    }
    if (!_85)
    {
        return out;
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_35.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1676 = as_type<float>(_135);
        out.gl_Position.z = _1676;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_39.w;
    float _139 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_37.x;
    float _153 = in.m_37.y;
    float _155 = in.m_37.z;
    float _157 = in.m_32.x;
    float _159 = in.m_32.y;
    float _161 = in.m_32.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _277;
    if (!_259)
    {
        float _261 = in.m_41.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_81);
        float _283 = 1.0 / _281;
        float _285 = _115 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _287 + _293;
    bool _297 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _299 = isnan(_287);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = -_307;
    float _327 = _325 + 1.0;
    float _329 = 1.0 / _311;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _333 = 1.0 / _315;
    float _335 = 1.0 / _319;
    float _337 = _291 * _329;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _287 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _345 = _287 + _343;
    float _347 = 1.0 / _323;
    float _349 = _295 * _333;
    bool _351 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _353 = isnan(_287);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = _361 * _327;
    float _365 = _341 * _335;
    bool _367 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_287);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _385 = isnan(_287);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_381, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = _345 * _347;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = -_377;
    float _417 = _415 + 1.0;
    float _419 = _377 * _405;
    float _421 = fma(_409, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _423 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_287);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _393 * _417;
    float _437 = -_393;
    float _439 = _437 + 1.0;
    float _441 = fma(_399, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_413, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _433 * _439;
    float _447 = -_433;
    float _449 = _447 + 1.0;
    float _451 = in.m_39.x;
    float _453 = in.m_39.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = _395 * _445;
    float _461 = _421 * _445;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _475 = fma(_465, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _477 = fma(_457, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _479 = fma(_441, _435, _471);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _485 = fma(_443, _435, _473);
    float _487 = fma(_469, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _489 = fma(_475, _419, _479);
    float _491 = fma(_483, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = fma(_477, _419, _485);
    float _495 = fma(_487, _363, _489);
    float _497 = fma(_491, _363, _493);
    float _499 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[147].x, _495);
    float _501 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[147].y, _497);
    float _503 = _499 * _451;
    float _505 = _501 * _453;
    bool _507 = !_331;
    float _525;
    if (!_507)
    {
        float _509 = in.m_41.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_81);
        float _531 = 1.0 / _529;
        float _533 = _115 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = in.m_41.z;
    float _539 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _541 = log2(_539);
    float _543 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _545 = as_type<float>(int(gl_VertexIndex));
    float _547 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _549 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _543);
    float _551 = in.m_41.x;
    float _553 = in.m_41.y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = 1.0 / _557;
    float _561 = _541 * _115;
    float _563 = exp2(_561);
    float _565 = _537 * 2.0;
    int _567 = as_type<int>(_545) & 1;
    bool _569 = _567 != 0;
    int _571 = as_type<int>(_545) & 2;
    bool _573 = _571 != 0;
    float _575 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = floor(_565);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _591 = 1.0 + _589;
    float _593 = _551 * 2.0;
    float _595 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _597 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _605 = _601 || _603;
    float _607 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _609 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
    float _611 = 1.0 / _591;
    float _613 = -_563;
    float _615 = _613 + 1.0;
    float _617 = _605 ? _615 : 0.0;
    float _619 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _607);
    float _621 = floor(_593);
    bool _623 = _587 >= 0.0;
    bool _625 = isnan(_587);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _609);
    bool _635 = _587 > 0.0;
    float _637 = _553 + _537;
    int _639 = _631 ? 0 : 1;
    float _641 = _619 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _645 = _643 != 0;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _649 = _647 != 0;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _653 = _651 != 0;
    float _655 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _549);
    float _657 = _553 * 2.0;
    if (_585)
    {
        float _659 = _617 * _611;
        _117 = _659;
    }
    float _661 = _117;
    int _663 = ~_639;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = _553 + _551;
    float _671 = floor(_657);
    float _673 = _637 + (-1.0);
    float _675 = _537 + _551;
    int _677 = _667;
    if (!_635)
    {
        int _679 = ~_639;
        int _681 = _679 + 1;
        _677 = _681;
    }
    int _683 = _677;
    float _685 = _669 + (-1.0);
    bool _687 = _621 > 0.0;
    float _689 = _675 + (-1.0);
    bool _691 = _621 >= 0.0;
    bool _693 = isnan(_621);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _703 = _655 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _705 = !_645;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _711 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _713 = _699 ? 0 : 1;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _717 = _703 + _715;
    bool _719 = _671 > 0.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _721;
    int _725 = ~_713;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = _633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _733 = _671 >= 0.0;
    bool _735 = isnan(_671);
    bool _737 = _733 || _735;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    float _743 = _717 * _717;
    int _745 = abs(_707);
    float _747 = _723 * _559;
    int _749 = _729;
    if (!_687)
    {
        int _751 = ~_713;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _759 = _731 + _757;
    float _761 = in.m_46.x;
    float _763 = in.m_46.y;
    float _765 = in.m_46.z;
    float _767 = float(_683);
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _771 = _641 + _769;
    bool _773 = !_649;
    int _775 = _773 ? 0 : 1;
    float _777 = _537 + (-0.5);
    float _779 = float(_745);
    float _781 = fma(_771, _771, _743);
    int _783 = abs(_775);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _789 = float(_755);
    float _791 = fma(_759, _759, _781);
    float _793 = _779 * _767;
    float _795 = sqrt(_791);
    bool _797 = !_653;
    int _799 = _797 ? 0 : 1;
    float _801 = _793 * (-2.0);
    float _803 = float(_783);
    int _805 = _741 ? 0 : 1;
    float _807 = fma(_701, _801, _701);
    int _809 = abs(_799);
    float _811 = _803 * _789;
    int _813 = ~_805;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    float _819 = fma(_801, _761, _761);
    int _821 = _817;
    if (!_719)
    {
        int _823 = ~_805;
        int _825 = _823 + 1;
        _821 = _825;
    }
    int _827 = _821;
    float _829 = rsqrt(_791);
    float _831 = _551 + (-0.5);
    float _833 = float(_827);
    float _835 = _795 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _837 = float(_809);
    float _839 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].x, _819);
    float _841 = _547 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _843 = _811 * (-2.0);
    float _845 = _837 * _833;
    float _847 = fma(_807, _661, _839);
    float _849 = precise::min(_841, _835);
    float _851 = _553 + (-0.5);
    float _853 = fma(_843, _763, _763);
    float _855 = _845 * (-2.0);
    float _857 = fma(_711, _843, _711);
    float _859 = _829 * _849;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _853);
    float _863 = fma(_709, _855, _709);
    float _865 = fma(_855, _765, _765);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _871 = fma(_857, _661, _861);
    float _873 = _717 * _859;
    float _875 = _771 * _859;
    float _877 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _865);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _881 = _535 + _879;
    float _883 = -_873;
    float _885 = _717 + _883;
    float _887 = -_875;
    float _889 = _771 + _887;
    float _891 = 1.0 / _869;
    float _893 = _759 * _859;
    float _895 = _885 * _885;
    float _897 = fma(_863, _661, _877);
    bool _899 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _901 = isnan(_535);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_893;
    float _913 = _759 + _911;
    float _915 = fma(_889, _889, _895);
    bool _917 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _919 = isnan(_535);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = fma(_747, _881, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _931 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _933 = isnan(_535);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = fma(_913, _913, _915);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _947 = _535 + _945;
    float _949 = -_927;
    float _951 = _949 + 1.0;
    float _953 = _847 * 0.15915493667125701904296875;
    float _955 = _871 * 0.15915493667125701904296875;
    float _957 = _909 * _951;
    float _959 = sqrt(_943);
    float _961 = _787 * _891;
    float _963 = -_941;
    float _965 = _963 + 1.0;
    float _967 = _929 * _957;
    float _969 = -_909;
    float _971 = _969 + 1.0;
    float _973 = fma(_961, _947, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _975 = _897 * 0.15915493667125701904296875;
    float _977 = _927 * _965;
    float _979 = _953 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[115].x, _967);
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _987 = _985 != 0;
    out.m_48.w = _849;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _991 = _989 != 0;
    float _993 = fma(_973, _977, _983);
    float _995 = _953 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[117].x, _993);
    bool _1001 = !_573;
    float _1003 = _1001 ? (-0.5) : 0.5;
    float _1005 = _829 * _959;
    bool _1007 = _553 > 0.5;
    float _1009 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1011 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1003);
    float _1013 = _955 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    bool _1017 = _551 > 0.5;
    float _1019 = _1009 * _1005;
    float _1021 = -_1003;
    int _1023 = _1007 ? as_type<int>(_1021) : as_type<int>(_1003);
    bool _1025 = !_569;
    float _1027 = _1025 ? (-0.5) : 0.5;
    bool _1029 = !_991;
    float _1031 = _1029 ? _1003 : as_type<float>(_1023);
    float _1033 = _955 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = -_1027;
    int _1039 = _1017 ? as_type<int>(_1037) : as_type<int>(_1027);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1049 = _1045 || _1047;
    float _1051 = _1019 * _1011;
    bool _1053 = !_987;
    float _1055 = _1053 ? _1027 : as_type<float>(_1039);
    float _1057 = -_1031;
    float _1059 = _1057 + 0.5;
    float _1061 = _975 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _981 * _1015;
    float _1067 = _1055 + 0.5;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1071 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1073 = _975 * 6.283185482025146484375;
    float _1075 = cos(_1073);
    float _1077 = _997 * _1035;
    float _1079 = _981 * _1035;
    float _1081 = fma(_1063, _1077, _1065);
    float _1083 = fma(_1063, _1065, _1077);
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1027);
    float _1089 = _547 * _1005;
    float _1091 = _997 * _1015;
    float _1093 = _1075 * _1051;
    float _1095 = _1089 * _1087;
    float _1097 = _1015 * _1075;
    float _1099 = -_1091;
    float _1101 = fma(_1063, _1079, _1099);
    float _1103 = _997 * _1093;
    float _1105 = -_1079;
    float _1107 = fma(_1063, _1091, _1105);
    float _1109 = _1035 * _1075;
    float _1111 = -_1051;
    float _1113 = _1063 * _1111;
    float _1115 = fma(_1081, _1095, _1103);
    float _1117 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1119 = _1117 * 0.5;
    float _1121 = _981 * _1093;
    float _1123 = fma(_1109, _1095, _1113);
    float _1125 = _1071 * _1085;
    float _1127 = fma(_1107, _1119, _1115);
    float _1129 = fma(_1101, _1095, _1121);
    float _1131 = fma(_1097, _1119, _1123);
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1135 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1137 = fma(_1083, _1119, _1129);
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1141 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1135);
    float _1143 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1145 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1143);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1161 = _1069 * _1133;
    float _1163 = _731 + _1155;
    float _1165 = _641 + _1159;
    float _1167 = -_875;
    float _1169 = _641 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1163 + _1171;
    float _1175 = -_893;
    float _1177 = _731 + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1181 = _1165 + _1179;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1185 = _1173 * _1173;
    float _1187 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1125;
    out.m_50.y = _1161;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = fma(_1181, _1181, _1185);
    float _1193 = -_873;
    float _1195 = _703 + _1193;
    float _1197 = sqrt(_1191);
    float _1199 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_52.x = _1169;
    out.m_52.y = _1195;
    out.m_52.z = _1177;
    float _1201 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1199);
    float _1205 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_54.x = _1157;
    out.m_54.y = _1187;
    out.m_54.z = _1189;
    float _1207 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1203);
    float _1209 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1205);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1217 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1209);
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1221 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1223 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1211);
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1227 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1229 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = 1.0 / _1227;
    float _1237 = _703 + _1225;
    float _1239 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_56.x = _1229;
    out.m_56.y = _1231;
    out.m_56.z = _1233;
    out.m_56.w = _1145;
    float _1241 = _1239 + _1227;
    float _1243 = _1233;
    float _1245 = _1229;
    float _1247 = _1231;
    float _1249 = _1169;
    if (!_1221)
    {
        _1243 = _1165;
    }
    float _1251 = _1243;
    float _1253 = _1251;
    if (!_1221)
    {
        _1245 = _1163;
    }
    float _1255 = _1245;
    float _1257 = _1255;
    if (!_1221)
    {
        _1247 = _1237;
    }
    float _1259 = _1247;
    bool _1261 = !_1221;
    float _1263 = _1259;
    if (!_1261)
    {
        float _1265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1269 = _1197 + _1267;
        float _1271 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = rsqrt(_1191);
        float _1275 = _1269 * _1265;
        float _1277 = _1275 * 0.15915493667125701904296875;
        float _1279 = _1277 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        float _1283 = _1277 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = fma(_1281, _1271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = _1273 * _1287;
        float _1291 = _1285 + (-1.0);
        float _1293 = fma(_1181, _1289, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = fma(_1173, _1289, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1297 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1237, _1285, _1297);
        _1257 = _1295;
        _1253 = _1293;
        _1263 = _1299;
    }
    float _1301 = _1257;
    float _1303 = _1253;
    float _1305 = _1263;
    float _1307 = -_893;
    float _1309 = _1307 + _1301;
    bool _1311 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1313 = isnan(0.5);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1319 = _1315 || _1317;
    float _1321 = -_875;
    float _1323 = _1321 + _1303;
    float _1325 = -_873;
    float _1327 = _1325 + _1305;
    float _1329 = _1241 * _1235;
    float _1331 = _1329 * 0.5;
    float _1333 = _1327;
    float _1335 = _1323;
    float _1337 = _1309;
    if (!_1049)
    {
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1341 = _1195 + _1339;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1345 = _1169 + _1343;
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = -_731;
        float _1351 = _1349 + _1301;
        float _1353 = _1341 * _1341;
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1357 = _1177 + _1355;
        float _1359 = fma(_1345, _1345, _1353);
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1363 = fma(_1357, _1357, _1359);
        float _1365 = sqrt(_1363);
        float _1367 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1371 = _1369 * _1361;
        float _1373 = -_641;
        float _1375 = _1373 + _1303;
        float _1377 = -_703;
        float _1379 = _1377 + _1305;
        float _1381 = _1367 * _1371;
        float _1383 = fma(_1375, _1381, _1169);
        float _1385 = fma(_1379, _1381, _1195);
        float _1387 = fma(_1351, _1381, _1177);
        _1333 = _1385;
        _1335 = _1383;
        _1337 = _1387;
    }
    float _1389 = _1333;
    float _1391 = _1335;
    float _1393 = _1337;
    float _1395 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1319)
    {
        _1249 = 1.0;
    }
    float _1397 = _1249;
    float _1399 = _1397;
    if (!_1319)
    {
        float _1401 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1405 = _1401 * 0.15915493667125701904296875;
        float _1407 = _1403 * 0.15915493667125701904296875;
        float _1409 = _1405 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1415 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
        float _1417 = _1405 * 6.283185482025146484375;
        float _1419 = sin(_1417);
        float _1421 = 1.0 / _1411;
        float _1423 = _1407 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = _1407 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = 1.0 / _1415;
        float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1439 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1437;
        float _1441 = 1.0 / _1433;
        float _1443 = 1.0 / _1439;
        float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1447 = _1435 * _1445;
        float _1449 = _1431 * _1441;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1453 = fma(_1449, _1447, _1451);
        float _1455 = _1453 * _1443;
        float _1457 = precise::clamp(_1455, 0.0, 1.0);
        _1399 = _1457;
    }
    float _1459 = _1399;
    float _1461 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1463 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    float _1465 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1467 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1469 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1461);
    float _1471 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1463);
    float _1473 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1465);
    float _1475 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1467);
    float _1477 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1469);
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1481 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1473);
    float _1483 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1475);
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1491 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1495 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1499 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1489);
    float _1501 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    float _1503 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1493);
    float _1505 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1497);
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1499);
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    bool _1513 = _1459 > 0.0;
    bool _1515 = isnan(_1459);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.0);
    bool _1521 = _1517 || _1519;
    float _1523 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1525 = _1459 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1527 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1507);
    float _1529 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1511);
    float _1531 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1533 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1523);
    float _1535 = _1525 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1537 = _1527 + _1529;
    float _1539 = _1531 + _1529;
    float _1541 = _1529 * 0.5;
    float _1543 = _1537 * 0.5;
    float _1545 = _1539 * 0.5;
    float _1547 = fma(_1533, -0.5, _1541);
    out.m_58.x = _1089;
    out.m_60.x = _1391;
    out.m_60.y = _1389;
    out.m_60.z = _1393;
    out.m_35.x = _1535;
    out.gl_Position.x = _1527;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _1531;
    out.gl_Position.w = _1529;
    out.m_62.x = _1543;
    out.m_62.y = _1547;
    out.m_62.z = _1545;
    out.m_62.w = _1529;
    if (_1521)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1549;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _527 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_35.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_97);
        out.gl_Position.z = _1606;
    }
    if (!_85)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_35.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1676 = as_type<float>(_135);
        out.gl_Position.z = _1676;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_39.w;
    float _139 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_37.x;
    float _153 = in.m_37.y;
    float _155 = in.m_37.z;
    float _157 = in.m_32.x;
    float _159 = in.m_32.y;
    float _161 = in.m_32.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _277;
    if (!_259)
    {
        float _261 = in.m_41.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_81);
        float _283 = 1.0 / _281;
        float _285 = _115 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _287 + _293;
    bool _297 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _299 = isnan(_287);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = -_307;
    float _327 = _325 + 1.0;
    float _329 = 1.0 / _311;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _333 = 1.0 / _315;
    float _335 = 1.0 / _319;
    float _337 = _291 * _329;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _287 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _345 = _287 + _343;
    float _347 = 1.0 / _323;
    float _349 = _295 * _333;
    bool _351 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _353 = isnan(_287);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = _361 * _327;
    float _365 = _341 * _335;
    bool _367 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_287);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _385 = isnan(_287);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_381, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = _345 * _347;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = -_377;
    float _417 = _415 + 1.0;
    float _419 = _377 * _405;
    float _421 = fma(_409, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _423 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_287);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _393 * _417;
    float _437 = -_393;
    float _439 = _437 + 1.0;
    float _441 = fma(_399, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_413, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _433 * _439;
    float _447 = -_433;
    float _449 = _447 + 1.0;
    float _451 = in.m_39.x;
    float _453 = in.m_39.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = _395 * _445;
    float _461 = _421 * _445;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _475 = fma(_465, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _477 = fma(_457, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _479 = fma(_441, _435, _471);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _485 = fma(_443, _435, _473);
    float _487 = fma(_469, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _489 = fma(_475, _419, _479);
    float _491 = fma(_483, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = fma(_477, _419, _485);
    float _495 = fma(_487, _363, _489);
    float _497 = fma(_491, _363, _493);
    float _499 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[147].x, _495);
    float _501 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[147].y, _497);
    float _503 = _499 * _451;
    float _505 = _501 * _453;
    bool _507 = !_331;
    float _525;
    if (!_507)
    {
        float _509 = in.m_41.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_81);
        float _531 = 1.0 / _529;
        float _533 = _115 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = in.m_41.z;
    float _539 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _541 = log2(_539);
    float _543 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _545 = as_type<float>(int(gl_VertexIndex));
    float _547 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _549 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _543);
    float _551 = in.m_41.x;
    float _553 = in.m_41.y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = 1.0 / _557;
    float _561 = _541 * _115;
    float _563 = exp2(_561);
    float _565 = _537 * 2.0;
    int _567 = as_type<int>(_545) & 1;
    bool _569 = _567 != 0;
    int _571 = as_type<int>(_545) & 2;
    bool _573 = _571 != 0;
    float _575 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = floor(_565);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _591 = 1.0 + _589;
    float _593 = _551 * 2.0;
    float _595 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _597 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _605 = _601 || _603;
    float _607 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _609 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
    float _611 = 1.0 / _591;
    float _613 = -_563;
    float _615 = _613 + 1.0;
    float _617 = _605 ? _615 : 0.0;
    float _619 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _607);
    float _621 = floor(_593);
    bool _623 = _587 >= 0.0;
    bool _625 = isnan(_587);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _609);
    bool _635 = _587 > 0.0;
    float _637 = _553 + _537;
    int _639 = _631 ? 0 : 1;
    float _641 = _619 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _645 = _643 != 0;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _649 = _647 != 0;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _653 = _651 != 0;
    float _655 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _549);
    float _657 = _553 * 2.0;
    if (_585)
    {
        float _659 = _617 * _611;
        _117 = _659;
    }
    float _661 = _117;
    int _663 = ~_639;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = _553 + _551;
    float _671 = floor(_657);
    float _673 = _637 + (-1.0);
    float _675 = _537 + _551;
    int _677 = _667;
    if (!_635)
    {
        int _679 = ~_639;
        int _681 = _679 + 1;
        _677 = _681;
    }
    int _683 = _677;
    float _685 = _669 + (-1.0);
    bool _687 = _621 > 0.0;
    float _689 = _675 + (-1.0);
    bool _691 = _621 >= 0.0;
    bool _693 = isnan(_621);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _703 = _655 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _705 = !_645;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _711 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _713 = _699 ? 0 : 1;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _717 = _703 + _715;
    bool _719 = _671 > 0.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _721;
    int _725 = ~_713;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = _633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _733 = _671 >= 0.0;
    bool _735 = isnan(_671);
    bool _737 = _733 || _735;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    float _743 = _717 * _717;
    int _745 = abs(_707);
    float _747 = _723 * _559;
    int _749 = _729;
    if (!_687)
    {
        int _751 = ~_713;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _759 = _731 + _757;
    float _761 = in.m_46.x;
    float _763 = in.m_46.y;
    float _765 = in.m_46.z;
    float _767 = float(_683);
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _771 = _641 + _769;
    bool _773 = !_649;
    int _775 = _773 ? 0 : 1;
    float _777 = _537 + (-0.5);
    float _779 = float(_745);
    float _781 = fma(_771, _771, _743);
    int _783 = abs(_775);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _789 = float(_755);
    float _791 = fma(_759, _759, _781);
    float _793 = _779 * _767;
    float _795 = sqrt(_791);
    bool _797 = !_653;
    int _799 = _797 ? 0 : 1;
    float _801 = _793 * (-2.0);
    float _803 = float(_783);
    int _805 = _741 ? 0 : 1;
    float _807 = fma(_701, _801, _701);
    int _809 = abs(_799);
    float _811 = _803 * _789;
    int _813 = ~_805;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    float _819 = fma(_801, _761, _761);
    int _821 = _817;
    if (!_719)
    {
        int _823 = ~_805;
        int _825 = _823 + 1;
        _821 = _825;
    }
    int _827 = _821;
    float _829 = rsqrt(_791);
    float _831 = _551 + (-0.5);
    float _833 = float(_827);
    float _835 = _795 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _837 = float(_809);
    float _839 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].x, _819);
    float _841 = _547 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _843 = _811 * (-2.0);
    float _845 = _837 * _833;
    float _847 = fma(_807, _661, _839);
    float _849 = precise::min(_841, _835);
    float _851 = _553 + (-0.5);
    float _853 = fma(_843, _763, _763);
    float _855 = _845 * (-2.0);
    float _857 = fma(_711, _843, _711);
    float _859 = _829 * _849;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _853);
    float _863 = fma(_709, _855, _709);
    float _865 = fma(_855, _765, _765);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _871 = fma(_857, _661, _861);
    float _873 = _717 * _859;
    float _875 = _771 * _859;
    float _877 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _865);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _881 = _535 + _879;
    float _883 = -_873;
    float _885 = _717 + _883;
    float _887 = -_875;
    float _889 = _771 + _887;
    float _891 = 1.0 / _869;
    float _893 = _759 * _859;
    float _895 = _885 * _885;
    float _897 = fma(_863, _661, _877);
    bool _899 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _901 = isnan(_535);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_893;
    float _913 = _759 + _911;
    float _915 = fma(_889, _889, _895);
    bool _917 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _919 = isnan(_535);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = fma(_747, _881, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _931 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _933 = isnan(_535);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = fma(_913, _913, _915);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _947 = _535 + _945;
    float _949 = -_927;
    float _951 = _949 + 1.0;
    float _953 = _847 * 0.15915493667125701904296875;
    float _955 = _871 * 0.15915493667125701904296875;
    float _957 = _909 * _951;
    float _959 = sqrt(_943);
    float _961 = _787 * _891;
    float _963 = -_941;
    float _965 = _963 + 1.0;
    float _967 = _929 * _957;
    float _969 = -_909;
    float _971 = _969 + 1.0;
    float _973 = fma(_961, _947, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _975 = _897 * 0.15915493667125701904296875;
    float _977 = _927 * _965;
    float _979 = _953 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[115].x, _967);
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _987 = _985 != 0;
    out.m_48.w = _849;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _991 = _989 != 0;
    float _993 = fma(_973, _977, _983);
    float _995 = _953 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[117].x, _993);
    bool _1001 = !_573;
    float _1003 = _1001 ? (-0.5) : 0.5;
    float _1005 = _829 * _959;
    bool _1007 = _553 > 0.5;
    float _1009 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1011 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1003);
    float _1013 = _955 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    bool _1017 = _551 > 0.5;
    float _1019 = _1009 * _1005;
    float _1021 = -_1003;
    int _1023 = _1007 ? as_type<int>(_1021) : as_type<int>(_1003);
    bool _1025 = !_569;
    float _1027 = _1025 ? (-0.5) : 0.5;
    bool _1029 = !_991;
    float _1031 = _1029 ? _1003 : as_type<float>(_1023);
    float _1033 = _955 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = -_1027;
    int _1039 = _1017 ? as_type<int>(_1037) : as_type<int>(_1027);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1049 = _1045 || _1047;
    float _1051 = _1019 * _1011;
    bool _1053 = !_987;
    float _1055 = _1053 ? _1027 : as_type<float>(_1039);
    float _1057 = -_1031;
    float _1059 = _1057 + 0.5;
    float _1061 = _975 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _981 * _1015;
    float _1067 = _1055 + 0.5;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1071 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1073 = _975 * 6.283185482025146484375;
    float _1075 = cos(_1073);
    float _1077 = _997 * _1035;
    float _1079 = _981 * _1035;
    float _1081 = fma(_1063, _1077, _1065);
    float _1083 = fma(_1063, _1065, _1077);
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1027);
    float _1089 = _547 * _1005;
    float _1091 = _997 * _1015;
    float _1093 = _1075 * _1051;
    float _1095 = _1089 * _1087;
    float _1097 = _1015 * _1075;
    float _1099 = -_1091;
    float _1101 = fma(_1063, _1079, _1099);
    float _1103 = _997 * _1093;
    float _1105 = -_1079;
    float _1107 = fma(_1063, _1091, _1105);
    float _1109 = _1035 * _1075;
    float _1111 = -_1051;
    float _1113 = _1063 * _1111;
    float _1115 = fma(_1081, _1095, _1103);
    float _1117 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1119 = _1117 * 0.5;
    float _1121 = _981 * _1093;
    float _1123 = fma(_1109, _1095, _1113);
    float _1125 = _1071 * _1085;
    float _1127 = fma(_1107, _1119, _1115);
    float _1129 = fma(_1101, _1095, _1121);
    float _1131 = fma(_1097, _1119, _1123);
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1135 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1137 = fma(_1083, _1119, _1129);
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1141 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1135);
    float _1143 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1145 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1143);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1161 = _1069 * _1133;
    float _1163 = _731 + _1155;
    float _1165 = _641 + _1159;
    float _1167 = -_875;
    float _1169 = _641 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1163 + _1171;
    float _1175 = -_893;
    float _1177 = _731 + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1181 = _1165 + _1179;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1185 = _1173 * _1173;
    float _1187 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1125;
    out.m_50.y = _1161;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = fma(_1181, _1181, _1185);
    float _1193 = -_873;
    float _1195 = _703 + _1193;
    float _1197 = sqrt(_1191);
    float _1199 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_52.x = _1169;
    out.m_52.y = _1195;
    out.m_52.z = _1177;
    float _1201 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1199);
    float _1205 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_54.x = _1157;
    out.m_54.y = _1187;
    out.m_54.z = _1189;
    float _1207 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1203);
    float _1209 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1205);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1217 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1209);
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1221 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1223 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1211);
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1227 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1229 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = 1.0 / _1227;
    float _1237 = _703 + _1225;
    float _1239 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_56.x = _1229;
    out.m_56.y = _1231;
    out.m_56.z = _1233;
    out.m_56.w = _1145;
    float _1241 = _1239 + _1227;
    float _1243 = _1233;
    float _1245 = _1229;
    float _1247 = _1231;
    float _1249 = _1169;
    if (!_1221)
    {
        _1243 = _1165;
    }
    float _1251 = _1243;
    float _1253 = _1251;
    if (!_1221)
    {
        _1245 = _1163;
    }
    float _1255 = _1245;
    float _1257 = _1255;
    if (!_1221)
    {
        _1247 = _1237;
    }
    float _1259 = _1247;
    bool _1261 = !_1221;
    float _1263 = _1259;
    if (!_1261)
    {
        float _1265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1269 = _1197 + _1267;
        float _1271 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = rsqrt(_1191);
        float _1275 = _1269 * _1265;
        float _1277 = _1275 * 0.15915493667125701904296875;
        float _1279 = _1277 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        float _1283 = _1277 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = fma(_1281, _1271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = _1273 * _1287;
        float _1291 = _1285 + (-1.0);
        float _1293 = fma(_1181, _1289, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = fma(_1173, _1289, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1297 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1237, _1285, _1297);
        _1257 = _1295;
        _1253 = _1293;
        _1263 = _1299;
    }
    float _1301 = _1257;
    float _1303 = _1253;
    float _1305 = _1263;
    float _1307 = -_893;
    float _1309 = _1307 + _1301;
    bool _1311 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1313 = isnan(0.5);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1319 = _1315 || _1317;
    float _1321 = -_875;
    float _1323 = _1321 + _1303;
    float _1325 = -_873;
    float _1327 = _1325 + _1305;
    float _1329 = _1241 * _1235;
    float _1331 = _1329 * 0.5;
    float _1333 = _1327;
    float _1335 = _1323;
    float _1337 = _1309;
    if (!_1049)
    {
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1341 = _1195 + _1339;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1345 = _1169 + _1343;
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = -_731;
        float _1351 = _1349 + _1301;
        float _1353 = _1341 * _1341;
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1357 = _1177 + _1355;
        float _1359 = fma(_1345, _1345, _1353);
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1363 = fma(_1357, _1357, _1359);
        float _1365 = sqrt(_1363);
        float _1367 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1371 = _1369 * _1361;
        float _1373 = -_641;
        float _1375 = _1373 + _1303;
        float _1377 = -_703;
        float _1379 = _1377 + _1305;
        float _1381 = _1367 * _1371;
        float _1383 = fma(_1375, _1381, _1169);
        float _1385 = fma(_1379, _1381, _1195);
        float _1387 = fma(_1351, _1381, _1177);
        _1333 = _1385;
        _1335 = _1383;
        _1337 = _1387;
    }
    float _1389 = _1333;
    float _1391 = _1335;
    float _1393 = _1337;
    float _1395 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1319)
    {
        _1249 = 1.0;
    }
    float _1397 = _1249;
    float _1399 = _1397;
    if (!_1319)
    {
        float _1401 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1405 = _1401 * 0.15915493667125701904296875;
        float _1407 = _1403 * 0.15915493667125701904296875;
        float _1409 = _1405 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1415 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
        float _1417 = _1405 * 6.283185482025146484375;
        float _1419 = sin(_1417);
        float _1421 = 1.0 / _1411;
        float _1423 = _1407 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = _1407 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = 1.0 / _1415;
        float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1439 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1437;
        float _1441 = 1.0 / _1433;
        float _1443 = 1.0 / _1439;
        float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1447 = _1435 * _1445;
        float _1449 = _1431 * _1441;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1453 = fma(_1449, _1447, _1451);
        float _1455 = _1453 * _1443;
        float _1457 = precise::clamp(_1455, 0.0, 1.0);
        _1399 = _1457;
    }
    float _1459 = _1399;
    float _1461 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1463 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    float _1465 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1467 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1469 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1461);
    float _1471 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1463);
    float _1473 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1465);
    float _1475 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1467);
    float _1477 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1469);
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1481 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1473);
    float _1483 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1475);
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1491 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1495 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1499 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1489);
    float _1501 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    float _1503 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1493);
    float _1505 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1497);
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1499);
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    bool _1513 = _1459 > 0.0;
    bool _1515 = isnan(_1459);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.0);
    bool _1521 = _1517 || _1519;
    float _1523 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1525 = _1459 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1527 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1507);
    float _1529 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1511);
    float _1531 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1533 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1523);
    float _1535 = _1525 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1537 = _1527 + _1529;
    float _1539 = _1531 + _1529;
    float _1541 = _1529 * 0.5;
    float _1543 = _1537 * 0.5;
    float _1545 = _1539 * 0.5;
    float _1547 = fma(_1533, -0.5, _1541);
    out.m_58.x = _1089;
    out.m_60.x = _1391;
    out.m_60.y = _1389;
    out.m_60.z = _1393;
    out.m_35.x = _1535;
    out.gl_Position.x = _1527;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _1531;
    out.gl_Position.w = _1529;
    out.m_62.x = _1543;
    out.m_62.y = _1547;
    out.m_62.z = _1545;
    out.m_62.w = _1529;
    if (_1521)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1549;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

