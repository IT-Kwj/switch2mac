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
    float4 m_52 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_60 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
    float4 m_56 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _517 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_30.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_33.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    float _97 = as_type<float>(_95);
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1913 = as_type<float>(_95);
        out.gl_Position.z = _1913;
    }
    if (!_83)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _99 = in.m_35.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _115 = 0.0;
    float _117 = _113;
    if (_109)
    {
        float _119 = float(_79);
        _115 = _119;
    }
    float _121 = _115;
    bool _123 = _113 >= _121;
    bool _125 = !_109;
    bool _127 = _123 || _125;
    if (_127)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _89;
    if (_127)
    {
        out.m_33.x = 0.0;
    }
    int _131 = 0;
    if (_127)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1982 = as_type<float>(_135);
        out.gl_Position.z = _1982;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_37.w;
    float _139 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    float _163 = _139;
    if (!_149)
    {
        float _165 = _139 * _139;
        float _167 = _165 * 0.5;
        _97 = _167;
    }
    float _169 = _97;
    float _171 = _169;
    if (!_149)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    bool _177 = !_149;
    float _179 = _175;
    if (!_177)
    {
        float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = log2(_181);
        float _185 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _187 = _185 + 1.0;
        float _189 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = _139 * _183;
        float _193 = 1.0 / _187;
        float _195 = _189 * 0.693147182464599609375;
        float _197 = exp2(_191);
        float _199 = 1.0 / _195;
        float _201 = _197 + (-1.0);
        float _203 = -_201;
        float _205 = fma(_203, _199, _139);
        float _207 = _205 * _193;
        float _209 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _209;
    }
    float _211 = _179;
    bool _213 = !_149;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _139 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _163 = _233;
    }
    float _235 = _163;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = fma(_235, _153, _239);
    float _247 = fma(_235, _151, _241);
    float _249 = fma(_235, _155, _243);
    float _251 = fma(_245, _137, _159);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _161);
    bool _257 = !_237;
    float _275;
    if (!_257)
    {
        float _259 = in.m_39.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_79);
        float _281 = 1.0 / _279;
        float _283 = _113 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _285 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _285 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = 1.0 / _301;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _313;
    float _321 = 1.0 / _309;
    float _323 = _289 * _315;
    bool _325 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_285);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    bool _337 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_285);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _305;
    float _355 = _293 * _319;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _367 * _351;
    float _383 = _297 * _321;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _285 + _385;
    float _389 = -_379;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = fma(_395, _383, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = _387 * _353;
    float _401 = -_367;
    float _403 = _401 + 1.0;
    bool _405 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_285);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = _347 * _391;
    float _427 = -_347;
    float _429 = _427 + 1.0;
    float _431 = fma(_419, _383, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _433 = _379 * _403;
    float _435 = -_415;
    float _437 = _435 + 1.0;
    float _439 = _415 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = fma(_423, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = _431 * _439;
    float _453 = _397 * _439;
    float _455 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = fma(_449, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_459, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_445, _425, _461);
    float _479 = fma(_455, _425, _463);
    float _481 = fma(_471, _399, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _483 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_465, _433, _477);
    float _487 = fma(_467, _433, _479);
    float _489 = fma(_481, _381, _485);
    float _491 = fma(_483, _381, _487);
    float _493 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _489);
    float _495 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _491);
    bool _497 = !_317;
    float _515;
    if (!_497)
    {
        float _499 = in.m_39.x;
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _503 = _499 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _507 = _505 * _501;
        float _509 = floor(_507);
        float _511 = -_509;
        float _513 = _507 + _511;
        _515 = _513;
        _517 = true;
    }
    else
    {
        float _519 = float(_79);
        float _521 = 1.0 / _519;
        float _523 = _113 * _521;
        _515 = _523;
    }
    _517 = false;
    float _525 = _515;
    float _527 = in.m_39.x;
    float _529 = in.m_39.y;
    float _531 = in.m_39.z;
    float _533 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _535 = log2(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _539 = _525 + _537;
    float _541 = as_type<float>(int(gl_VertexIndex));
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    bool _553 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _555 = isnan(1.0);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _561 = _557 || _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _565 = 1.0 + _563;
    float _567 = 1.0 / _565;
    float _569 = _535 * _113;
    bool _571 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _573 = isnan(_525);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = exp2(_569);
    float _585 = _531 * 2.0;
    float _587 = _527 * 2.0;
    float _589 = _529 * 2.0;
    float _591 = _529 + _531;
    float _593 = _531 + _527;
    float _595 = _529 + _527;
    float _597 = _527 + (-0.5);
    float _599 = floor(_585);
    float _601 = _529 + (-0.5);
    float _603 = _591 + (-1.0);
    float _605 = _595 + (-1.0);
    bool _607 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _609 = isnan(_525);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = floor(_587);
    float _621 = -_583;
    float _623 = _621 + 1.0;
    float _625 = _551 ? _623 : 0.0;
    float _627 = floor(_589);
    bool _629 = _599 > 0.0;
    bool _631 = _599 >= 0.0;
    bool _633 = isnan(_599);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    if (_561)
    {
        float _641 = _625 * _567;
        _117 = _641;
    }
    float _643 = _117;
    int _645 = _639 ? 0 : 1;
    bool _647 = _619 > 0.0;
    bool _649 = _619 >= 0.0;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    int _659 = ~_645;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = as_type<int>(_541) & 1;
    bool _667 = _665 != 0;
    int _669 = as_type<int>(_541) & 2;
    bool _671 = _669 != 0;
    int _673 = _657 ? 0 : 1;
    bool _675 = _627 > 0.0;
    bool _677 = _627 >= 0.0;
    bool _679 = isnan(_627);
    bool _681 = _677 || _679;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    float _687 = in.m_37.x;
    float _689 = in.m_37.y;
    int _691 = ~_673;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    int _699 = _663;
    if (!_647)
    {
        int _701 = ~_673;
        int _703 = _701 + 1;
        _697 = _703;
    }
    int _705 = _697;
    float _707 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _709 = _685 ? 0 : 1;
    if (!_629)
    {
        int _711 = ~_645;
        int _713 = _711 + 1;
        _699 = _713;
    }
    int _715 = _699;
    float _717 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _721 = _719 != 0;
    float _723 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _727 = _725 != 0;
    float _729 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _731 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    int _733 = ~_709;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    float _739 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _729);
    int _741 = _737;
    if (!_675)
    {
        int _743 = ~_709;
        int _745 = _743 + 1;
        _741 = _745;
    }
    int _747 = _741;
    float _749 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _717);
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = float(_747);
    float _765 = _493 * _687;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _767;
    float _771 = _495 * _689;
    bool _773 = !_667;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _781 = 1.0 / _769;
    float _783 = _531 + (-0.5);
    bool _785 = _531 > 0.5;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _787;
    bool _791 = !_671;
    float _793 = _791 ? (-0.5) : 0.5;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _799 = !_753;
    int _801 = _799 ? 0 : 1;
    float _803 = 1.0 / _779;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _807 = _527 > 0.5;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _811 = _529 > 0.5;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _817 = _525 + _815;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = 1.0 / _789;
    float _823 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _739);
    float _827 = _817 * _781;
    float _829 = _593 + (-1.0);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _833 = _525 + _831;
    float _835 = 1.0 / _797;
    float _837 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _731);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _843 = _525 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _845;
    out.m_44.x = _819;
    out.m_44.y = _823;
    out.m_44.z = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _849;
    float _853 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = _843 * _803;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _873 = _749 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _875 = _833 * _821;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _881;
    float _885 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _887 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _889 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _891 = isnan(_525);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = fma(_863, _855, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _903 = fma(_871, _855, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _905;
    float _909 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _911 = -_899;
    float _913 = _911 + 1.0;
    float _915 = fma(_847, _827, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _917 = fma(_851, _827, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _919 = fma(_867, _827, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _921 = _839 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _925 = _873 + _923;
    bool _927 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _929 = isnan(_525);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = fma(_879, _875, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _941 = fma(_883, _875, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _943 = fma(_907, _875, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _945 = _581 * _913;
    float _947 = -_581;
    float _949 = _947 + 1.0;
    float _951 = _825 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _955 = _921 + _953;
    float _957 = _925 * _925;
    float _959 = _539 * _835;
    float _961 = -_937;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _967 = _951 + _965;
    float _969 = fma(_955, _955, _957);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _975 = _899 * _963;
    bool _977 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _979 = isnan(_525);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = fma(_967, _967, _969);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    int _999 = abs(_801);
    float _1001 = _987 * _949;
    float _1003 = -_987;
    float _1005 = _1003 + 1.0;
    float _1007 = rsqrt(_989);
    float _1009 = fma(_973, _959, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1011 = fma(_993, _959, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1013 = _617 * _1005;
    float _1015 = fma(_997, _959, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    bool _1017 = !_757;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = in.m_46.x;
    float _1023 = in.m_46.y;
    float _1025 = in.m_46.z;
    float _1027 = _917 * _1013;
    float _1029 = _919 * _1013;
    float _1031 = -_617;
    float _1033 = _1031 + 1.0;
    int _1035 = abs(_1019);
    float _1037 = _915 * _1013;
    float _1039 = float(_715);
    float _1041 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1027);
    float _1043 = float(_999);
    float _1045 = _925 * _1007;
    float _1047 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1037);
    float _1049 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1029);
    float _1051 = -_1045;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _925);
    float _1055 = _1043 * _1039;
    float _1057 = _955 * _1007;
    float _1059 = float(_1035);
    float _1061 = _1053 * _1053;
    float _1063 = _1055 * (-2.0);
    float _1065 = -_1057;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1069 = float(_705);
    float _1071 = _967 * _1007;
    bool _1073 = !_761;
    int _1075 = _1073 ? 0 : 1;
    float _1077 = fma(_1063, _1021, _1021);
    float _1079 = fma(_909, _1063, _909);
    float _1081 = _1059 * _1069;
    float _1083 = -_793;
    int _1085 = _811 ? as_type<int>(_1083) : as_type<int>(_793);
    float _1087 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1077);
    int _1089 = abs(_1075);
    float _1091 = _1081 * (-2.0);
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1095 = _1093 != 0;
    float _1097 = fma(_1079, _643, _1087);
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = fma(_853, _1091, _853);
    float _1105 = fma(_1091, _1023, _1023);
    float _1107 = _1097 * 0.15915493667125701904296875;
    float _1109 = float(_1089);
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1113 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1105);
    float _1115 = fma(_885, _1001, _1047);
    float _1117 = fma(_901, _1001, _1041);
    float _1119 = _1109 * _763;
    float _1121 = -_775;
    int _1123 = _807 ? as_type<int>(_1121) : as_type<int>(_775);
    float _1125 = fma(_903, _1001, _1049);
    float _1127 = fma(_1103, _643, _1113);
    float _1129 = _1119 * (-2.0);
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1133 = fma(_1067, _1067, _1061);
    float _1135 = -_1071;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1139 = fma(_887, _1129, _887);
    float _1141 = fma(_1129, _1025, _1025);
    bool _1143 = !_1095;
    float _1145 = _1143 ? _775 : as_type<float>(_1123);
    float _1147 = fma(_939, _945, _1115);
    bool _1149 = !_1101;
    float _1151 = _1149 ? _793 : as_type<float>(_1085);
    float _1153 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1141);
    float _1155 = fma(_941, _945, _1117);
    float _1157 = fma(_943, _945, _1125);
    float _1159 = _1127 * 0.15915493667125701904296875;
    float _1161 = fma(_1139, _643, _1153);
    float _1163 = fma(_1137, _1137, _1133);
    float _1165 = _1145 + 0.5;
    float _1167 = -_1151;
    float _1169 = _1167 + 0.5;
    float _1171 = _1161 * 0.15915493667125701904296875;
    float _1173 = fma(_1009, _975, _1147);
    float _1175 = fma(_1011, _975, _1155);
    float _1177 = fma(_1015, _975, _1157);
    float _1179 = _1107 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1187 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1173);
    float _1189 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1175);
    float _1191 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1177);
    float _1193 = _1183 * _1111;
    float _1195 = _1185 * _1131;
    float _1197 = _1107 * 6.283185482025146484375;
    float _1199 = cos(_1197);
    float _1201 = -_1045;
    float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1205 = -_1057;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1209 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_48.x = _1193;
    out.m_48.y = _1195;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1213 = -_1071;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    bool _1217 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1225 = _1221 || _1223;
    float _1227 = _1159 * 6.283185482025146484375;
    float _1229 = sin(_1227);
    bool _1231 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1239 = _1235 || _1237;
    float _1241 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_50.x = _1207;
    out.m_50.y = _1203;
    out.m_50.z = _1215;
    float _1243 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1245 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1247 = _1159 * 6.283185482025146484375;
    float _1249 = cos(_1247);
    float _1251 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1243);
    float _1253 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    float _1257 = sqrt(_1163);
    float _1259 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1211);
    float _1261 = _1181 * _1229;
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1265 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1259);
    float _1267 = _1171 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _1199 * _1249;
    float _1273 = _1181 * _1249;
    float _1275 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1277 = _1275 + _1263;
    float _1279 = _1171 * 6.283185482025146484375;
    float _1281 = sin(_1279);
    float _1283 = _1007 * _1257;
    float _1285 = _1209 * _1283;
    float _1287 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1289 = _1287 * 0.5;
    float _1291 = _1181 * _1269;
    float _1293 = _1199 * _1229;
    float _1295 = _1249 * _1269;
    float _1297 = _1199 * _1269;
    float _1299 = _1229 * _1269;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _793);
    float _1303 = 1.0 / _1263;
    float _1305 = fma(_1281, _1271, _1261);
    float _1307 = fma(_1281, _1261, _1271);
    float _1309 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _1313 = _1285 * _1301;
    float _1315 = -_1293;
    float _1317 = fma(_1281, _1273, _1315);
    float _1319 = _1309 * _1283;
    float _1321 = -_1273;
    float _1323 = fma(_1281, _1293, _1321);
    float _1325 = _1297 * _1313;
    float _1327 = -_1313;
    float _1329 = _1281 * _1327;
    float _1331 = _1319 * _1311;
    float _1333 = _1291 * _1313;
    float _1335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1337 = fma(_1305, _1331, _1325);
    float _1339 = fma(_1295, _1331, _1329);
    float _1341 = fma(_1317, _1331, _1333);
    float _1343 = _1277 * _1303;
    float _1345 = _1343 * 0.5;
    float _1347 = fma(_1323, _1289, _1337);
    float _1349 = fma(_1299, _1289, _1339);
    float _1351 = fma(_1307, _1289, _1341);
    float _1353 = -_793;
    int _1355 = _785 ? as_type<int>(_1353) : as_type<int>(_793);
    float _1357 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1359 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1363 = !_727;
    float _1365 = _1363 ? _793 : as_type<float>(_1355);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1357);
    float _1369 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1359);
    float _1371 = -_775;
    int _1373 = _811 ? as_type<int>(_1371) : as_type<int>(_775);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1377 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1375);
    float _1379 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1367);
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1369);
    bool _1383 = !_721;
    float _1385 = _1383 ? _775 : as_type<float>(_1373);
    float _1387 = 1.0 / _1377;
    float _1389 = _951 + _1379;
    float _1391 = _921 + _1381;
    float _1393 = -_1365;
    float _1395 = _1393 + 0.5;
    float _1397 = _1385 + 0.5;
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1401 = _1389 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1405 = _1391 + _1403;
    float _1407 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1409 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1411 = _1401 * _1401;
    float _1413 = _1337;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1417 = _1303;
    float _1419 = _1241;
    float _1421 = _1253;
    float _1423 = _1391;
    float _1425 = _1389;
    if (!_1239)
    {
        _1413 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1427 = _1413;
    float _1429 = _1407 * _1361;
    float _1431 = _1409 * _1335;
    float _1433 = fma(_1405, _1405, _1411);
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1437 = _1429;
    if (!_1239)
    {
        _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1439 = _1415;
    float _1441 = _793 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1443 = sqrt(_1433);
    float _1445 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1439;
    if (!_1239)
    {
        float _1449 = -_1427;
        float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1417 = _1451;
    }
    float _1453 = _1417;
    float _1455 = _1453;
    if (!_1239)
    {
        float _1457 = -_1439;
        float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1419 = _1459;
    }
    float _1461 = _1419;
    float _1463 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1465 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1467 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1469 = _1291 * _1441;
    float _1471 = _1467;
    if (!_1239)
    {
        float _1473 = 1.0 / _1453;
        _1455 = _1473;
    }
    float _1475 = _1455;
    float _1477 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1463);
    float _1479 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1481 = -_1441;
    float _1483 = _1281 * _1481;
    float _1485 = _1297 * _1441;
    float _1487 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1489 = fma(_1317, _1467, _1469);
    out.m_52.x = _1253;
    out.m_52.y = _1445;
    out.m_52.z = _1479;
    out.m_52.w = _1435;
    float _1491 = _1461;
    if (!_1239)
    {
        float _1493 = 1.0 / _1461;
        _1491 = _1493;
    }
    float _1495 = _1491;
    bool _1497 = _1443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1499 = _873 + _1487;
    float _1501 = fma(_1295, _1467, _1483);
    float _1503 = fma(_1305, _1467, _1485);
    if (!_1239)
    {
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1507 = -_1439;
        float _1509 = fma(_1387, _1505, _1507);
        _1447 = _1509;
    }
    float _1511 = _1447;
    out.m_54.x = _1431;
    out.m_54.y = _1429;
    float _1513 = _1511;
    if (_1239)
    {
        _1471 = 1.0;
    }
    float _1515 = _1471;
    float _1517 = _1299 + _1501;
    float _1519 = _1323 + _1503;
    float _1521 = _1307 + _1489;
    float _1523 = _1515;
    if (!_1239)
    {
        float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1527 = -_1427;
        float _1529 = fma(_1387, _1525, _1527);
        _1421 = _1529;
    }
    float _1531 = _1421;
    float _1533 = _1495;
    if (!_1239)
    {
        float _1535 = _1511 * _1495;
        float _1537 = precise::clamp(_1535, 0.0, 1.0);
        _1513 = _1537;
    }
    float _1539 = _1513;
    if (!_1239)
    {
        float _1541 = _1531 * _1475;
        float _1543 = precise::clamp(_1541, 0.0, 1.0);
        _1523 = _1543;
    }
    float _1545 = _1523;
    if (!_1497)
    {
        _1437 = _1499;
    }
    float _1547 = _1437;
    bool _1549 = !_1497;
    float _1551 = _1547;
    if (!_1549)
    {
        float _1553 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1557 = _1443 + _1555;
        float _1559 = rsqrt(_1433);
        float _1561 = _1557 * _1553;
        float _1563 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = _1561 * 0.15915493667125701904296875;
        float _1567 = _1565 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1565 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = fma(_1569, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1577 = _1559 * _1575;
        float _1579 = _1573 + (-1.0);
        float _1581 = fma(_1405, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1583 = fma(_1401, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1585 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1587 = fma(_1499, _1573, _1585);
        _1423 = _1581;
        _1551 = _1587;
        _1425 = _1583;
    }
    float _1589 = _1423;
    float _1591 = _1551;
    float _1593 = _1425;
    float _1595 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1597 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1599 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1239)
    {
        _1533 = 1.0;
    }
    float _1601 = _1533;
    float _1603 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1595);
    float _1605 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1597);
    float _1607 = -_1057;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _1611 = -_1045;
    float _1613 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1591);
    float _1615 = -_1071;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1593);
    float _1619 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1599);
    float _1621 = _1601;
    float _1623 = _1613;
    float _1625 = _1609;
    float _1627 = _1617;
    if (!_1239)
    {
        float _1629 = -_1539;
        float _1631 = _1629 + 1.0;
        _1621 = _1631;
    }
    float _1633 = _1621;
    if (!_1225)
    {
        float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1637 = _1203 + _1635;
        float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1641 = _1207 + _1639;
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1645 = -_921;
        float _1647 = _1645 + _1589;
        float _1649 = _1637 * _1637;
        float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1653 = _1215 + _1651;
        float _1655 = -_873;
        float _1657 = _1655 + _1591;
        float _1659 = -_951;
        float _1661 = _1659 + _1593;
        float _1663 = fma(_1641, _1641, _1649);
        float _1665 = 1.0 / _1283;
        float _1667 = fma(_1653, _1653, _1663);
        float _1669 = sqrt(_1667);
        float _1671 = _1647 * _1665;
        float _1673 = _1657 * _1665;
        float _1675 = _1661 * _1665;
        bool _1677 = _1669 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1679 = isnan(_1669);
        bool _1681 = _1677 || _1679;
        bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1685 = _1681 || _1683;
        float _1687 = precise::min(_1669, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1689 = _1687 * _1643;
        float _1691 = fma(_1673, _1689, _1203);
        float _1693 = fma(_1675, _1689, _1215);
        float _1695 = _1295;
        float _1697 = _1653;
        float _1699 = _1689;
        float _1701 = _1657;
        if (_1685)
        {
            float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1695 = _1703;
        }
        float _1705 = _1695;
        if (_1685)
        {
            float _1707 = precise::max(_1669, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1697 = _1707;
        }
        float _1709 = _1697;
        float _1711 = fma(_1671, _1689, _1207);
        float _1713 = _1711;
        float _1715 = _1709;
        if (!_1685)
        {
            _1699 = _1711;
        }
        float _1717 = _1699;
        float _1719 = _1717;
        if (!_1685)
        {
            _1713 = _1691;
        }
        float _1721 = _1713;
        float _1723 = _1721;
        if (_1685)
        {
            float _1725 = _1709 * _1705;
            _1701 = _1725;
        }
        float _1727 = _1701;
        if (!_1685)
        {
            _1715 = _1693;
        }
        float _1729 = _1715;
        _1627 = _1729;
        if (_1685)
        {
            float _1731 = fma(_1671, _1727, _1207);
            _1719 = _1731;
        }
        float _1733 = _1719;
        _1625 = _1733;
        if (_1685)
        {
            float _1735 = fma(_1673, _1727, _1203);
            _1723 = _1735;
        }
        float _1737 = _1723;
        _1623 = _1737;
        if (_1685)
        {
            float _1739 = fma(_1675, _1727, _1215);
            _1627 = _1739;
        }
    }
    float _1741 = _1623;
    float _1743 = _1625;
    float _1745 = _1627;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1749 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1751 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1747);
    float _1757 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1749);
    float _1759 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1751);
    float _1761 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1763 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1755);
    float _1765 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1757);
    float _1767 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1759);
    float _1769 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1773 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1777 = _1545 > 0.0;
    bool _1779 = isnan(_1545);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(0.0);
    bool _1785 = _1781 || _1783;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1789 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1791 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1793 = _1545 * _1633;
    float _1795 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1787);
    float _1797 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1789);
    float _1799 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1801 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1791);
    float _1803 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    float _1805 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1807 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1809 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1799);
    bool _1811 = _1633 <= 0.0;
    bool _1813 = !_1785;
    bool _1815 = _1811 || _1813;
    float _1817 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1819 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1821 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1823 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1809);
    float _1825 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1619);
    float _1827 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1817);
    float _1829 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1831 = _1819 + _1821;
    float _1833 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1605);
    float _1835 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1603);
    float _1837 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1823);
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1743 + _1839;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1847 = _1741 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1745 + _1849;
    float _1853 = _1831 * 0.5;
    out.m_56.x = _1835;
    out.m_56.y = _1833;
    out.m_56.z = _1825;
    out.m_33.x = _1843;
    out.m_58.x = _1841;
    out.m_58.y = _1847;
    out.m_58.z = _1851;
    out.gl_Position.x = _1827;
    out.gl_Position.y = _1837;
    out.gl_Position.z = _1819;
    out.gl_Position.w = _1821;
    out.m_60.z = _1853;
    out.m_60.w = _1821;
    if (!_1815)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1855 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1855;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _517 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_30.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_33.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    float _97 = as_type<float>(_95);
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1913 = as_type<float>(_95);
        out.gl_Position.z = _1913;
    }
    if (!_83)
    {
        return out;
    }
    float _99 = in.m_35.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _115 = 0.0;
    float _117 = _113;
    if (_109)
    {
        float _119 = float(_79);
        _115 = _119;
    }
    float _121 = _115;
    bool _123 = _113 >= _121;
    bool _125 = !_109;
    bool _127 = _123 || _125;
    if (_127)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _89;
    if (_127)
    {
        out.m_33.x = 0.0;
    }
    int _131 = 0;
    if (_127)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1982 = as_type<float>(_135);
        out.gl_Position.z = _1982;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_37.w;
    float _139 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    float _163 = _139;
    if (!_149)
    {
        float _165 = _139 * _139;
        float _167 = _165 * 0.5;
        _97 = _167;
    }
    float _169 = _97;
    float _171 = _169;
    if (!_149)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    bool _177 = !_149;
    float _179 = _175;
    if (!_177)
    {
        float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = log2(_181);
        float _185 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _187 = _185 + 1.0;
        float _189 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = _139 * _183;
        float _193 = 1.0 / _187;
        float _195 = _189 * 0.693147182464599609375;
        float _197 = exp2(_191);
        float _199 = 1.0 / _195;
        float _201 = _197 + (-1.0);
        float _203 = -_201;
        float _205 = fma(_203, _199, _139);
        float _207 = _205 * _193;
        float _209 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _209;
    }
    float _211 = _179;
    bool _213 = !_149;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _139 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _163 = _233;
    }
    float _235 = _163;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = fma(_235, _153, _239);
    float _247 = fma(_235, _151, _241);
    float _249 = fma(_235, _155, _243);
    float _251 = fma(_245, _137, _159);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _161);
    bool _257 = !_237;
    float _275;
    if (!_257)
    {
        float _259 = in.m_39.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_79);
        float _281 = 1.0 / _279;
        float _283 = _113 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _285 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _285 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = 1.0 / _301;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _313;
    float _321 = 1.0 / _309;
    float _323 = _289 * _315;
    bool _325 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_285);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    bool _337 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_285);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _305;
    float _355 = _293 * _319;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _367 * _351;
    float _383 = _297 * _321;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _285 + _385;
    float _389 = -_379;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = fma(_395, _383, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = _387 * _353;
    float _401 = -_367;
    float _403 = _401 + 1.0;
    bool _405 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_285);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = _347 * _391;
    float _427 = -_347;
    float _429 = _427 + 1.0;
    float _431 = fma(_419, _383, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _433 = _379 * _403;
    float _435 = -_415;
    float _437 = _435 + 1.0;
    float _439 = _415 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = fma(_423, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = _431 * _439;
    float _453 = _397 * _439;
    float _455 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = fma(_449, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_459, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_445, _425, _461);
    float _479 = fma(_455, _425, _463);
    float _481 = fma(_471, _399, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _483 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_465, _433, _477);
    float _487 = fma(_467, _433, _479);
    float _489 = fma(_481, _381, _485);
    float _491 = fma(_483, _381, _487);
    float _493 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _489);
    float _495 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _491);
    bool _497 = !_317;
    float _515;
    if (!_497)
    {
        float _499 = in.m_39.x;
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _503 = _499 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _507 = _505 * _501;
        float _509 = floor(_507);
        float _511 = -_509;
        float _513 = _507 + _511;
        _515 = _513;
        _517 = true;
    }
    else
    {
        float _519 = float(_79);
        float _521 = 1.0 / _519;
        float _523 = _113 * _521;
        _515 = _523;
    }
    _517 = false;
    float _525 = _515;
    float _527 = in.m_39.x;
    float _529 = in.m_39.y;
    float _531 = in.m_39.z;
    float _533 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _535 = log2(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _539 = _525 + _537;
    float _541 = as_type<float>(int(gl_VertexIndex));
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    bool _553 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _555 = isnan(1.0);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _561 = _557 || _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _565 = 1.0 + _563;
    float _567 = 1.0 / _565;
    float _569 = _535 * _113;
    bool _571 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _573 = isnan(_525);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = exp2(_569);
    float _585 = _531 * 2.0;
    float _587 = _527 * 2.0;
    float _589 = _529 * 2.0;
    float _591 = _529 + _531;
    float _593 = _531 + _527;
    float _595 = _529 + _527;
    float _597 = _527 + (-0.5);
    float _599 = floor(_585);
    float _601 = _529 + (-0.5);
    float _603 = _591 + (-1.0);
    float _605 = _595 + (-1.0);
    bool _607 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _609 = isnan(_525);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = floor(_587);
    float _621 = -_583;
    float _623 = _621 + 1.0;
    float _625 = _551 ? _623 : 0.0;
    float _627 = floor(_589);
    bool _629 = _599 > 0.0;
    bool _631 = _599 >= 0.0;
    bool _633 = isnan(_599);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    if (_561)
    {
        float _641 = _625 * _567;
        _117 = _641;
    }
    float _643 = _117;
    int _645 = _639 ? 0 : 1;
    bool _647 = _619 > 0.0;
    bool _649 = _619 >= 0.0;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    int _659 = ~_645;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = as_type<int>(_541) & 1;
    bool _667 = _665 != 0;
    int _669 = as_type<int>(_541) & 2;
    bool _671 = _669 != 0;
    int _673 = _657 ? 0 : 1;
    bool _675 = _627 > 0.0;
    bool _677 = _627 >= 0.0;
    bool _679 = isnan(_627);
    bool _681 = _677 || _679;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    float _687 = in.m_37.x;
    float _689 = in.m_37.y;
    int _691 = ~_673;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    int _699 = _663;
    if (!_647)
    {
        int _701 = ~_673;
        int _703 = _701 + 1;
        _697 = _703;
    }
    int _705 = _697;
    float _707 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _709 = _685 ? 0 : 1;
    if (!_629)
    {
        int _711 = ~_645;
        int _713 = _711 + 1;
        _699 = _713;
    }
    int _715 = _699;
    float _717 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _721 = _719 != 0;
    float _723 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _727 = _725 != 0;
    float _729 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _731 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    int _733 = ~_709;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    float _739 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _729);
    int _741 = _737;
    if (!_675)
    {
        int _743 = ~_709;
        int _745 = _743 + 1;
        _741 = _745;
    }
    int _747 = _741;
    float _749 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _717);
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = float(_747);
    float _765 = _493 * _687;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _767;
    float _771 = _495 * _689;
    bool _773 = !_667;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _781 = 1.0 / _769;
    float _783 = _531 + (-0.5);
    bool _785 = _531 > 0.5;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _787;
    bool _791 = !_671;
    float _793 = _791 ? (-0.5) : 0.5;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _799 = !_753;
    int _801 = _799 ? 0 : 1;
    float _803 = 1.0 / _779;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _807 = _527 > 0.5;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _811 = _529 > 0.5;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _817 = _525 + _815;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = 1.0 / _789;
    float _823 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _739);
    float _827 = _817 * _781;
    float _829 = _593 + (-1.0);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _833 = _525 + _831;
    float _835 = 1.0 / _797;
    float _837 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _731);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _843 = _525 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _845;
    out.m_44.x = _819;
    out.m_44.y = _823;
    out.m_44.z = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _849;
    float _853 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = _843 * _803;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _873 = _749 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _875 = _833 * _821;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _881;
    float _885 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _887 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _889 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _891 = isnan(_525);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = fma(_863, _855, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _903 = fma(_871, _855, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _905;
    float _909 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _911 = -_899;
    float _913 = _911 + 1.0;
    float _915 = fma(_847, _827, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _917 = fma(_851, _827, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _919 = fma(_867, _827, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _921 = _839 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _925 = _873 + _923;
    bool _927 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _929 = isnan(_525);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = fma(_879, _875, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _941 = fma(_883, _875, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _943 = fma(_907, _875, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _945 = _581 * _913;
    float _947 = -_581;
    float _949 = _947 + 1.0;
    float _951 = _825 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _955 = _921 + _953;
    float _957 = _925 * _925;
    float _959 = _539 * _835;
    float _961 = -_937;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _967 = _951 + _965;
    float _969 = fma(_955, _955, _957);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _975 = _899 * _963;
    bool _977 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _979 = isnan(_525);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = fma(_967, _967, _969);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    int _999 = abs(_801);
    float _1001 = _987 * _949;
    float _1003 = -_987;
    float _1005 = _1003 + 1.0;
    float _1007 = rsqrt(_989);
    float _1009 = fma(_973, _959, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1011 = fma(_993, _959, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1013 = _617 * _1005;
    float _1015 = fma(_997, _959, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    bool _1017 = !_757;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = in.m_46.x;
    float _1023 = in.m_46.y;
    float _1025 = in.m_46.z;
    float _1027 = _917 * _1013;
    float _1029 = _919 * _1013;
    float _1031 = -_617;
    float _1033 = _1031 + 1.0;
    int _1035 = abs(_1019);
    float _1037 = _915 * _1013;
    float _1039 = float(_715);
    float _1041 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1027);
    float _1043 = float(_999);
    float _1045 = _925 * _1007;
    float _1047 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1037);
    float _1049 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1029);
    float _1051 = -_1045;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _925);
    float _1055 = _1043 * _1039;
    float _1057 = _955 * _1007;
    float _1059 = float(_1035);
    float _1061 = _1053 * _1053;
    float _1063 = _1055 * (-2.0);
    float _1065 = -_1057;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1069 = float(_705);
    float _1071 = _967 * _1007;
    bool _1073 = !_761;
    int _1075 = _1073 ? 0 : 1;
    float _1077 = fma(_1063, _1021, _1021);
    float _1079 = fma(_909, _1063, _909);
    float _1081 = _1059 * _1069;
    float _1083 = -_793;
    int _1085 = _811 ? as_type<int>(_1083) : as_type<int>(_793);
    float _1087 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1077);
    int _1089 = abs(_1075);
    float _1091 = _1081 * (-2.0);
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1095 = _1093 != 0;
    float _1097 = fma(_1079, _643, _1087);
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = fma(_853, _1091, _853);
    float _1105 = fma(_1091, _1023, _1023);
    float _1107 = _1097 * 0.15915493667125701904296875;
    float _1109 = float(_1089);
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1113 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1105);
    float _1115 = fma(_885, _1001, _1047);
    float _1117 = fma(_901, _1001, _1041);
    float _1119 = _1109 * _763;
    float _1121 = -_775;
    int _1123 = _807 ? as_type<int>(_1121) : as_type<int>(_775);
    float _1125 = fma(_903, _1001, _1049);
    float _1127 = fma(_1103, _643, _1113);
    float _1129 = _1119 * (-2.0);
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1133 = fma(_1067, _1067, _1061);
    float _1135 = -_1071;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1139 = fma(_887, _1129, _887);
    float _1141 = fma(_1129, _1025, _1025);
    bool _1143 = !_1095;
    float _1145 = _1143 ? _775 : as_type<float>(_1123);
    float _1147 = fma(_939, _945, _1115);
    bool _1149 = !_1101;
    float _1151 = _1149 ? _793 : as_type<float>(_1085);
    float _1153 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1141);
    float _1155 = fma(_941, _945, _1117);
    float _1157 = fma(_943, _945, _1125);
    float _1159 = _1127 * 0.15915493667125701904296875;
    float _1161 = fma(_1139, _643, _1153);
    float _1163 = fma(_1137, _1137, _1133);
    float _1165 = _1145 + 0.5;
    float _1167 = -_1151;
    float _1169 = _1167 + 0.5;
    float _1171 = _1161 * 0.15915493667125701904296875;
    float _1173 = fma(_1009, _975, _1147);
    float _1175 = fma(_1011, _975, _1155);
    float _1177 = fma(_1015, _975, _1157);
    float _1179 = _1107 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1187 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1173);
    float _1189 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1175);
    float _1191 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1177);
    float _1193 = _1183 * _1111;
    float _1195 = _1185 * _1131;
    float _1197 = _1107 * 6.283185482025146484375;
    float _1199 = cos(_1197);
    float _1201 = -_1045;
    float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1205 = -_1057;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1209 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_48.x = _1193;
    out.m_48.y = _1195;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1213 = -_1071;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    bool _1217 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1225 = _1221 || _1223;
    float _1227 = _1159 * 6.283185482025146484375;
    float _1229 = sin(_1227);
    bool _1231 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1239 = _1235 || _1237;
    float _1241 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_50.x = _1207;
    out.m_50.y = _1203;
    out.m_50.z = _1215;
    float _1243 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1245 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1247 = _1159 * 6.283185482025146484375;
    float _1249 = cos(_1247);
    float _1251 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1243);
    float _1253 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    float _1257 = sqrt(_1163);
    float _1259 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1211);
    float _1261 = _1181 * _1229;
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1265 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1259);
    float _1267 = _1171 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _1199 * _1249;
    float _1273 = _1181 * _1249;
    float _1275 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1277 = _1275 + _1263;
    float _1279 = _1171 * 6.283185482025146484375;
    float _1281 = sin(_1279);
    float _1283 = _1007 * _1257;
    float _1285 = _1209 * _1283;
    float _1287 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1289 = _1287 * 0.5;
    float _1291 = _1181 * _1269;
    float _1293 = _1199 * _1229;
    float _1295 = _1249 * _1269;
    float _1297 = _1199 * _1269;
    float _1299 = _1229 * _1269;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _793);
    float _1303 = 1.0 / _1263;
    float _1305 = fma(_1281, _1271, _1261);
    float _1307 = fma(_1281, _1261, _1271);
    float _1309 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _1313 = _1285 * _1301;
    float _1315 = -_1293;
    float _1317 = fma(_1281, _1273, _1315);
    float _1319 = _1309 * _1283;
    float _1321 = -_1273;
    float _1323 = fma(_1281, _1293, _1321);
    float _1325 = _1297 * _1313;
    float _1327 = -_1313;
    float _1329 = _1281 * _1327;
    float _1331 = _1319 * _1311;
    float _1333 = _1291 * _1313;
    float _1335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1337 = fma(_1305, _1331, _1325);
    float _1339 = fma(_1295, _1331, _1329);
    float _1341 = fma(_1317, _1331, _1333);
    float _1343 = _1277 * _1303;
    float _1345 = _1343 * 0.5;
    float _1347 = fma(_1323, _1289, _1337);
    float _1349 = fma(_1299, _1289, _1339);
    float _1351 = fma(_1307, _1289, _1341);
    float _1353 = -_793;
    int _1355 = _785 ? as_type<int>(_1353) : as_type<int>(_793);
    float _1357 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1359 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1363 = !_727;
    float _1365 = _1363 ? _793 : as_type<float>(_1355);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1357);
    float _1369 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1359);
    float _1371 = -_775;
    int _1373 = _811 ? as_type<int>(_1371) : as_type<int>(_775);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1377 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1375);
    float _1379 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1367);
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1369);
    bool _1383 = !_721;
    float _1385 = _1383 ? _775 : as_type<float>(_1373);
    float _1387 = 1.0 / _1377;
    float _1389 = _951 + _1379;
    float _1391 = _921 + _1381;
    float _1393 = -_1365;
    float _1395 = _1393 + 0.5;
    float _1397 = _1385 + 0.5;
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1401 = _1389 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1405 = _1391 + _1403;
    float _1407 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1409 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1411 = _1401 * _1401;
    float _1413 = _1337;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1417 = _1303;
    float _1419 = _1241;
    float _1421 = _1253;
    float _1423 = _1391;
    float _1425 = _1389;
    if (!_1239)
    {
        _1413 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1427 = _1413;
    float _1429 = _1407 * _1361;
    float _1431 = _1409 * _1335;
    float _1433 = fma(_1405, _1405, _1411);
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1437 = _1429;
    if (!_1239)
    {
        _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1439 = _1415;
    float _1441 = _793 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1443 = sqrt(_1433);
    float _1445 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1439;
    if (!_1239)
    {
        float _1449 = -_1427;
        float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1417 = _1451;
    }
    float _1453 = _1417;
    float _1455 = _1453;
    if (!_1239)
    {
        float _1457 = -_1439;
        float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1419 = _1459;
    }
    float _1461 = _1419;
    float _1463 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1465 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1467 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1469 = _1291 * _1441;
    float _1471 = _1467;
    if (!_1239)
    {
        float _1473 = 1.0 / _1453;
        _1455 = _1473;
    }
    float _1475 = _1455;
    float _1477 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1463);
    float _1479 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1481 = -_1441;
    float _1483 = _1281 * _1481;
    float _1485 = _1297 * _1441;
    float _1487 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1489 = fma(_1317, _1467, _1469);
    out.m_52.x = _1253;
    out.m_52.y = _1445;
    out.m_52.z = _1479;
    out.m_52.w = _1435;
    float _1491 = _1461;
    if (!_1239)
    {
        float _1493 = 1.0 / _1461;
        _1491 = _1493;
    }
    float _1495 = _1491;
    bool _1497 = _1443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1499 = _873 + _1487;
    float _1501 = fma(_1295, _1467, _1483);
    float _1503 = fma(_1305, _1467, _1485);
    if (!_1239)
    {
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1507 = -_1439;
        float _1509 = fma(_1387, _1505, _1507);
        _1447 = _1509;
    }
    float _1511 = _1447;
    out.m_54.x = _1431;
    out.m_54.y = _1429;
    float _1513 = _1511;
    if (_1239)
    {
        _1471 = 1.0;
    }
    float _1515 = _1471;
    float _1517 = _1299 + _1501;
    float _1519 = _1323 + _1503;
    float _1521 = _1307 + _1489;
    float _1523 = _1515;
    if (!_1239)
    {
        float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1527 = -_1427;
        float _1529 = fma(_1387, _1525, _1527);
        _1421 = _1529;
    }
    float _1531 = _1421;
    float _1533 = _1495;
    if (!_1239)
    {
        float _1535 = _1511 * _1495;
        float _1537 = precise::clamp(_1535, 0.0, 1.0);
        _1513 = _1537;
    }
    float _1539 = _1513;
    if (!_1239)
    {
        float _1541 = _1531 * _1475;
        float _1543 = precise::clamp(_1541, 0.0, 1.0);
        _1523 = _1543;
    }
    float _1545 = _1523;
    if (!_1497)
    {
        _1437 = _1499;
    }
    float _1547 = _1437;
    bool _1549 = !_1497;
    float _1551 = _1547;
    if (!_1549)
    {
        float _1553 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1557 = _1443 + _1555;
        float _1559 = rsqrt(_1433);
        float _1561 = _1557 * _1553;
        float _1563 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = _1561 * 0.15915493667125701904296875;
        float _1567 = _1565 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1565 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = fma(_1569, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1577 = _1559 * _1575;
        float _1579 = _1573 + (-1.0);
        float _1581 = fma(_1405, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1583 = fma(_1401, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1585 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1587 = fma(_1499, _1573, _1585);
        _1423 = _1581;
        _1551 = _1587;
        _1425 = _1583;
    }
    float _1589 = _1423;
    float _1591 = _1551;
    float _1593 = _1425;
    float _1595 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1597 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1599 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1239)
    {
        _1533 = 1.0;
    }
    float _1601 = _1533;
    float _1603 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1595);
    float _1605 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1597);
    float _1607 = -_1057;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _1611 = -_1045;
    float _1613 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1591);
    float _1615 = -_1071;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1593);
    float _1619 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1599);
    float _1621 = _1601;
    float _1623 = _1613;
    float _1625 = _1609;
    float _1627 = _1617;
    if (!_1239)
    {
        float _1629 = -_1539;
        float _1631 = _1629 + 1.0;
        _1621 = _1631;
    }
    float _1633 = _1621;
    if (!_1225)
    {
        float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1637 = _1203 + _1635;
        float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1641 = _1207 + _1639;
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1645 = -_921;
        float _1647 = _1645 + _1589;
        float _1649 = _1637 * _1637;
        float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1653 = _1215 + _1651;
        float _1655 = -_873;
        float _1657 = _1655 + _1591;
        float _1659 = -_951;
        float _1661 = _1659 + _1593;
        float _1663 = fma(_1641, _1641, _1649);
        float _1665 = 1.0 / _1283;
        float _1667 = fma(_1653, _1653, _1663);
        float _1669 = sqrt(_1667);
        float _1671 = _1647 * _1665;
        float _1673 = _1657 * _1665;
        float _1675 = _1661 * _1665;
        bool _1677 = _1669 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1679 = isnan(_1669);
        bool _1681 = _1677 || _1679;
        bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1685 = _1681 || _1683;
        float _1687 = precise::min(_1669, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1689 = _1687 * _1643;
        float _1691 = fma(_1673, _1689, _1203);
        float _1693 = fma(_1675, _1689, _1215);
        float _1695 = _1295;
        float _1697 = _1653;
        float _1699 = _1689;
        float _1701 = _1657;
        if (_1685)
        {
            float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1695 = _1703;
        }
        float _1705 = _1695;
        if (_1685)
        {
            float _1707 = precise::max(_1669, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1697 = _1707;
        }
        float _1709 = _1697;
        float _1711 = fma(_1671, _1689, _1207);
        float _1713 = _1711;
        float _1715 = _1709;
        if (!_1685)
        {
            _1699 = _1711;
        }
        float _1717 = _1699;
        float _1719 = _1717;
        if (!_1685)
        {
            _1713 = _1691;
        }
        float _1721 = _1713;
        float _1723 = _1721;
        if (_1685)
        {
            float _1725 = _1709 * _1705;
            _1701 = _1725;
        }
        float _1727 = _1701;
        if (!_1685)
        {
            _1715 = _1693;
        }
        float _1729 = _1715;
        _1627 = _1729;
        if (_1685)
        {
            float _1731 = fma(_1671, _1727, _1207);
            _1719 = _1731;
        }
        float _1733 = _1719;
        _1625 = _1733;
        if (_1685)
        {
            float _1735 = fma(_1673, _1727, _1203);
            _1723 = _1735;
        }
        float _1737 = _1723;
        _1623 = _1737;
        if (_1685)
        {
            float _1739 = fma(_1675, _1727, _1215);
            _1627 = _1739;
        }
    }
    float _1741 = _1623;
    float _1743 = _1625;
    float _1745 = _1627;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1749 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1751 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1747);
    float _1757 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1749);
    float _1759 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1751);
    float _1761 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1763 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1755);
    float _1765 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1757);
    float _1767 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1759);
    float _1769 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1773 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1777 = _1545 > 0.0;
    bool _1779 = isnan(_1545);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(0.0);
    bool _1785 = _1781 || _1783;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1789 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1791 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1793 = _1545 * _1633;
    float _1795 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1787);
    float _1797 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1789);
    float _1799 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1801 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1791);
    float _1803 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    float _1805 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1807 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1809 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1799);
    bool _1811 = _1633 <= 0.0;
    bool _1813 = !_1785;
    bool _1815 = _1811 || _1813;
    float _1817 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1819 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1821 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1823 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1809);
    float _1825 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1619);
    float _1827 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1817);
    float _1829 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1831 = _1819 + _1821;
    float _1833 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1605);
    float _1835 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1603);
    float _1837 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1823);
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1743 + _1839;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1847 = _1741 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1745 + _1849;
    float _1853 = _1831 * 0.5;
    out.m_56.x = _1835;
    out.m_56.y = _1833;
    out.m_56.z = _1825;
    out.m_33.x = _1843;
    out.m_58.x = _1841;
    out.m_58.y = _1847;
    out.m_58.z = _1851;
    out.gl_Position.x = _1827;
    out.gl_Position.y = _1837;
    out.gl_Position.z = _1819;
    out.gl_Position.w = _1821;
    out.m_60.z = _1853;
    out.m_60.w = _1821;
    if (!_1815)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1855 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1855;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _517 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_30.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_33.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    float _97 = as_type<float>(_95);
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1913 = as_type<float>(_95);
        out.gl_Position.z = _1913;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _99 = in.m_35.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _115 = 0.0;
    float _117 = _113;
    if (_109)
    {
        float _119 = float(_79);
        _115 = _119;
    }
    float _121 = _115;
    bool _123 = _113 >= _121;
    bool _125 = !_109;
    bool _127 = _123 || _125;
    if (_127)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _89;
    if (_127)
    {
        out.m_33.x = 0.0;
    }
    int _131 = 0;
    if (_127)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1982 = as_type<float>(_135);
        out.gl_Position.z = _1982;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_37.w;
    float _139 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    float _163 = _139;
    if (!_149)
    {
        float _165 = _139 * _139;
        float _167 = _165 * 0.5;
        _97 = _167;
    }
    float _169 = _97;
    float _171 = _169;
    if (!_149)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    bool _177 = !_149;
    float _179 = _175;
    if (!_177)
    {
        float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = log2(_181);
        float _185 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _187 = _185 + 1.0;
        float _189 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = _139 * _183;
        float _193 = 1.0 / _187;
        float _195 = _189 * 0.693147182464599609375;
        float _197 = exp2(_191);
        float _199 = 1.0 / _195;
        float _201 = _197 + (-1.0);
        float _203 = -_201;
        float _205 = fma(_203, _199, _139);
        float _207 = _205 * _193;
        float _209 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _209;
    }
    float _211 = _179;
    bool _213 = !_149;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _139 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _163 = _233;
    }
    float _235 = _163;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = fma(_235, _153, _239);
    float _247 = fma(_235, _151, _241);
    float _249 = fma(_235, _155, _243);
    float _251 = fma(_245, _137, _159);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _161);
    bool _257 = !_237;
    float _275;
    if (!_257)
    {
        float _259 = in.m_39.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_79);
        float _281 = 1.0 / _279;
        float _283 = _113 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _285 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _285 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = 1.0 / _301;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _313;
    float _321 = 1.0 / _309;
    float _323 = _289 * _315;
    bool _325 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_285);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    bool _337 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_285);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _305;
    float _355 = _293 * _319;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _367 * _351;
    float _383 = _297 * _321;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _285 + _385;
    float _389 = -_379;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = fma(_395, _383, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = _387 * _353;
    float _401 = -_367;
    float _403 = _401 + 1.0;
    bool _405 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_285);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = _347 * _391;
    float _427 = -_347;
    float _429 = _427 + 1.0;
    float _431 = fma(_419, _383, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _433 = _379 * _403;
    float _435 = -_415;
    float _437 = _435 + 1.0;
    float _439 = _415 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = fma(_423, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = _431 * _439;
    float _453 = _397 * _439;
    float _455 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = fma(_449, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_459, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_445, _425, _461);
    float _479 = fma(_455, _425, _463);
    float _481 = fma(_471, _399, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _483 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_465, _433, _477);
    float _487 = fma(_467, _433, _479);
    float _489 = fma(_481, _381, _485);
    float _491 = fma(_483, _381, _487);
    float _493 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _489);
    float _495 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _491);
    bool _497 = !_317;
    float _515;
    if (!_497)
    {
        float _499 = in.m_39.x;
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _503 = _499 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _507 = _505 * _501;
        float _509 = floor(_507);
        float _511 = -_509;
        float _513 = _507 + _511;
        _515 = _513;
        _517 = true;
    }
    else
    {
        float _519 = float(_79);
        float _521 = 1.0 / _519;
        float _523 = _113 * _521;
        _515 = _523;
    }
    _517 = false;
    float _525 = _515;
    float _527 = in.m_39.x;
    float _529 = in.m_39.y;
    float _531 = in.m_39.z;
    float _533 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _535 = log2(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _539 = _525 + _537;
    float _541 = as_type<float>(int(gl_VertexIndex));
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    bool _553 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _555 = isnan(1.0);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _561 = _557 || _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _565 = 1.0 + _563;
    float _567 = 1.0 / _565;
    float _569 = _535 * _113;
    bool _571 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _573 = isnan(_525);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = exp2(_569);
    float _585 = _531 * 2.0;
    float _587 = _527 * 2.0;
    float _589 = _529 * 2.0;
    float _591 = _529 + _531;
    float _593 = _531 + _527;
    float _595 = _529 + _527;
    float _597 = _527 + (-0.5);
    float _599 = floor(_585);
    float _601 = _529 + (-0.5);
    float _603 = _591 + (-1.0);
    float _605 = _595 + (-1.0);
    bool _607 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _609 = isnan(_525);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = floor(_587);
    float _621 = -_583;
    float _623 = _621 + 1.0;
    float _625 = _551 ? _623 : 0.0;
    float _627 = floor(_589);
    bool _629 = _599 > 0.0;
    bool _631 = _599 >= 0.0;
    bool _633 = isnan(_599);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    if (_561)
    {
        float _641 = _625 * _567;
        _117 = _641;
    }
    float _643 = _117;
    int _645 = _639 ? 0 : 1;
    bool _647 = _619 > 0.0;
    bool _649 = _619 >= 0.0;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    int _659 = ~_645;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = as_type<int>(_541) & 1;
    bool _667 = _665 != 0;
    int _669 = as_type<int>(_541) & 2;
    bool _671 = _669 != 0;
    int _673 = _657 ? 0 : 1;
    bool _675 = _627 > 0.0;
    bool _677 = _627 >= 0.0;
    bool _679 = isnan(_627);
    bool _681 = _677 || _679;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    float _687 = in.m_37.x;
    float _689 = in.m_37.y;
    int _691 = ~_673;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    int _699 = _663;
    if (!_647)
    {
        int _701 = ~_673;
        int _703 = _701 + 1;
        _697 = _703;
    }
    int _705 = _697;
    float _707 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _709 = _685 ? 0 : 1;
    if (!_629)
    {
        int _711 = ~_645;
        int _713 = _711 + 1;
        _699 = _713;
    }
    int _715 = _699;
    float _717 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _721 = _719 != 0;
    float _723 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _727 = _725 != 0;
    float _729 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _731 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    int _733 = ~_709;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    float _739 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _729);
    int _741 = _737;
    if (!_675)
    {
        int _743 = ~_709;
        int _745 = _743 + 1;
        _741 = _745;
    }
    int _747 = _741;
    float _749 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _717);
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = float(_747);
    float _765 = _493 * _687;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _767;
    float _771 = _495 * _689;
    bool _773 = !_667;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _781 = 1.0 / _769;
    float _783 = _531 + (-0.5);
    bool _785 = _531 > 0.5;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _787;
    bool _791 = !_671;
    float _793 = _791 ? (-0.5) : 0.5;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _799 = !_753;
    int _801 = _799 ? 0 : 1;
    float _803 = 1.0 / _779;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _807 = _527 > 0.5;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _811 = _529 > 0.5;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _817 = _525 + _815;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = 1.0 / _789;
    float _823 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _739);
    float _827 = _817 * _781;
    float _829 = _593 + (-1.0);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _833 = _525 + _831;
    float _835 = 1.0 / _797;
    float _837 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _731);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _843 = _525 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _845;
    out.m_44.x = _819;
    out.m_44.y = _823;
    out.m_44.z = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _849;
    float _853 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = _843 * _803;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _873 = _749 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _875 = _833 * _821;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _881;
    float _885 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _887 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _889 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _891 = isnan(_525);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = fma(_863, _855, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _903 = fma(_871, _855, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _905;
    float _909 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _911 = -_899;
    float _913 = _911 + 1.0;
    float _915 = fma(_847, _827, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _917 = fma(_851, _827, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _919 = fma(_867, _827, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _921 = _839 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _925 = _873 + _923;
    bool _927 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _929 = isnan(_525);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = fma(_879, _875, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _941 = fma(_883, _875, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _943 = fma(_907, _875, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _945 = _581 * _913;
    float _947 = -_581;
    float _949 = _947 + 1.0;
    float _951 = _825 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _955 = _921 + _953;
    float _957 = _925 * _925;
    float _959 = _539 * _835;
    float _961 = -_937;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _967 = _951 + _965;
    float _969 = fma(_955, _955, _957);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _975 = _899 * _963;
    bool _977 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _979 = isnan(_525);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = fma(_967, _967, _969);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    int _999 = abs(_801);
    float _1001 = _987 * _949;
    float _1003 = -_987;
    float _1005 = _1003 + 1.0;
    float _1007 = rsqrt(_989);
    float _1009 = fma(_973, _959, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1011 = fma(_993, _959, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1013 = _617 * _1005;
    float _1015 = fma(_997, _959, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    bool _1017 = !_757;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = in.m_46.x;
    float _1023 = in.m_46.y;
    float _1025 = in.m_46.z;
    float _1027 = _917 * _1013;
    float _1029 = _919 * _1013;
    float _1031 = -_617;
    float _1033 = _1031 + 1.0;
    int _1035 = abs(_1019);
    float _1037 = _915 * _1013;
    float _1039 = float(_715);
    float _1041 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1027);
    float _1043 = float(_999);
    float _1045 = _925 * _1007;
    float _1047 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1037);
    float _1049 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1029);
    float _1051 = -_1045;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _925);
    float _1055 = _1043 * _1039;
    float _1057 = _955 * _1007;
    float _1059 = float(_1035);
    float _1061 = _1053 * _1053;
    float _1063 = _1055 * (-2.0);
    float _1065 = -_1057;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1069 = float(_705);
    float _1071 = _967 * _1007;
    bool _1073 = !_761;
    int _1075 = _1073 ? 0 : 1;
    float _1077 = fma(_1063, _1021, _1021);
    float _1079 = fma(_909, _1063, _909);
    float _1081 = _1059 * _1069;
    float _1083 = -_793;
    int _1085 = _811 ? as_type<int>(_1083) : as_type<int>(_793);
    float _1087 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1077);
    int _1089 = abs(_1075);
    float _1091 = _1081 * (-2.0);
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1095 = _1093 != 0;
    float _1097 = fma(_1079, _643, _1087);
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = fma(_853, _1091, _853);
    float _1105 = fma(_1091, _1023, _1023);
    float _1107 = _1097 * 0.15915493667125701904296875;
    float _1109 = float(_1089);
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1113 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1105);
    float _1115 = fma(_885, _1001, _1047);
    float _1117 = fma(_901, _1001, _1041);
    float _1119 = _1109 * _763;
    float _1121 = -_775;
    int _1123 = _807 ? as_type<int>(_1121) : as_type<int>(_775);
    float _1125 = fma(_903, _1001, _1049);
    float _1127 = fma(_1103, _643, _1113);
    float _1129 = _1119 * (-2.0);
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1133 = fma(_1067, _1067, _1061);
    float _1135 = -_1071;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1139 = fma(_887, _1129, _887);
    float _1141 = fma(_1129, _1025, _1025);
    bool _1143 = !_1095;
    float _1145 = _1143 ? _775 : as_type<float>(_1123);
    float _1147 = fma(_939, _945, _1115);
    bool _1149 = !_1101;
    float _1151 = _1149 ? _793 : as_type<float>(_1085);
    float _1153 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1141);
    float _1155 = fma(_941, _945, _1117);
    float _1157 = fma(_943, _945, _1125);
    float _1159 = _1127 * 0.15915493667125701904296875;
    float _1161 = fma(_1139, _643, _1153);
    float _1163 = fma(_1137, _1137, _1133);
    float _1165 = _1145 + 0.5;
    float _1167 = -_1151;
    float _1169 = _1167 + 0.5;
    float _1171 = _1161 * 0.15915493667125701904296875;
    float _1173 = fma(_1009, _975, _1147);
    float _1175 = fma(_1011, _975, _1155);
    float _1177 = fma(_1015, _975, _1157);
    float _1179 = _1107 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1187 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1173);
    float _1189 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1175);
    float _1191 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1177);
    float _1193 = _1183 * _1111;
    float _1195 = _1185 * _1131;
    float _1197 = _1107 * 6.283185482025146484375;
    float _1199 = cos(_1197);
    float _1201 = -_1045;
    float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1205 = -_1057;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1209 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_48.x = _1193;
    out.m_48.y = _1195;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1213 = -_1071;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    bool _1217 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1225 = _1221 || _1223;
    float _1227 = _1159 * 6.283185482025146484375;
    float _1229 = sin(_1227);
    bool _1231 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1239 = _1235 || _1237;
    float _1241 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_50.x = _1207;
    out.m_50.y = _1203;
    out.m_50.z = _1215;
    float _1243 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1245 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1247 = _1159 * 6.283185482025146484375;
    float _1249 = cos(_1247);
    float _1251 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1243);
    float _1253 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    float _1257 = sqrt(_1163);
    float _1259 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1211);
    float _1261 = _1181 * _1229;
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1265 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1259);
    float _1267 = _1171 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _1199 * _1249;
    float _1273 = _1181 * _1249;
    float _1275 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1277 = _1275 + _1263;
    float _1279 = _1171 * 6.283185482025146484375;
    float _1281 = sin(_1279);
    float _1283 = _1007 * _1257;
    float _1285 = _1209 * _1283;
    float _1287 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1289 = _1287 * 0.5;
    float _1291 = _1181 * _1269;
    float _1293 = _1199 * _1229;
    float _1295 = _1249 * _1269;
    float _1297 = _1199 * _1269;
    float _1299 = _1229 * _1269;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _793);
    float _1303 = 1.0 / _1263;
    float _1305 = fma(_1281, _1271, _1261);
    float _1307 = fma(_1281, _1261, _1271);
    float _1309 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _1313 = _1285 * _1301;
    float _1315 = -_1293;
    float _1317 = fma(_1281, _1273, _1315);
    float _1319 = _1309 * _1283;
    float _1321 = -_1273;
    float _1323 = fma(_1281, _1293, _1321);
    float _1325 = _1297 * _1313;
    float _1327 = -_1313;
    float _1329 = _1281 * _1327;
    float _1331 = _1319 * _1311;
    float _1333 = _1291 * _1313;
    float _1335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1337 = fma(_1305, _1331, _1325);
    float _1339 = fma(_1295, _1331, _1329);
    float _1341 = fma(_1317, _1331, _1333);
    float _1343 = _1277 * _1303;
    float _1345 = _1343 * 0.5;
    float _1347 = fma(_1323, _1289, _1337);
    float _1349 = fma(_1299, _1289, _1339);
    float _1351 = fma(_1307, _1289, _1341);
    float _1353 = -_793;
    int _1355 = _785 ? as_type<int>(_1353) : as_type<int>(_793);
    float _1357 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1359 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1363 = !_727;
    float _1365 = _1363 ? _793 : as_type<float>(_1355);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1357);
    float _1369 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1359);
    float _1371 = -_775;
    int _1373 = _811 ? as_type<int>(_1371) : as_type<int>(_775);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1377 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1375);
    float _1379 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1367);
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1369);
    bool _1383 = !_721;
    float _1385 = _1383 ? _775 : as_type<float>(_1373);
    float _1387 = 1.0 / _1377;
    float _1389 = _951 + _1379;
    float _1391 = _921 + _1381;
    float _1393 = -_1365;
    float _1395 = _1393 + 0.5;
    float _1397 = _1385 + 0.5;
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1401 = _1389 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1405 = _1391 + _1403;
    float _1407 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1409 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1411 = _1401 * _1401;
    float _1413 = _1337;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1417 = _1303;
    float _1419 = _1241;
    float _1421 = _1253;
    float _1423 = _1391;
    float _1425 = _1389;
    if (!_1239)
    {
        _1413 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1427 = _1413;
    float _1429 = _1407 * _1361;
    float _1431 = _1409 * _1335;
    float _1433 = fma(_1405, _1405, _1411);
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1437 = _1429;
    if (!_1239)
    {
        _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1439 = _1415;
    float _1441 = _793 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1443 = sqrt(_1433);
    float _1445 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1439;
    if (!_1239)
    {
        float _1449 = -_1427;
        float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1417 = _1451;
    }
    float _1453 = _1417;
    float _1455 = _1453;
    if (!_1239)
    {
        float _1457 = -_1439;
        float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1419 = _1459;
    }
    float _1461 = _1419;
    float _1463 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1465 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1467 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1469 = _1291 * _1441;
    float _1471 = _1467;
    if (!_1239)
    {
        float _1473 = 1.0 / _1453;
        _1455 = _1473;
    }
    float _1475 = _1455;
    float _1477 = fma(_1349, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1463);
    float _1479 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1481 = -_1441;
    float _1483 = _1281 * _1481;
    float _1485 = _1297 * _1441;
    float _1487 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1489 = fma(_1317, _1467, _1469);
    out.m_52.x = _1253;
    out.m_52.y = _1445;
    out.m_52.z = _1479;
    out.m_52.w = _1435;
    float _1491 = _1461;
    if (!_1239)
    {
        float _1493 = 1.0 / _1461;
        _1491 = _1493;
    }
    float _1495 = _1491;
    bool _1497 = _1443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1499 = _873 + _1487;
    float _1501 = fma(_1295, _1467, _1483);
    float _1503 = fma(_1305, _1467, _1485);
    if (!_1239)
    {
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1507 = -_1439;
        float _1509 = fma(_1387, _1505, _1507);
        _1447 = _1509;
    }
    float _1511 = _1447;
    out.m_54.x = _1431;
    out.m_54.y = _1429;
    float _1513 = _1511;
    if (_1239)
    {
        _1471 = 1.0;
    }
    float _1515 = _1471;
    float _1517 = _1299 + _1501;
    float _1519 = _1323 + _1503;
    float _1521 = _1307 + _1489;
    float _1523 = _1515;
    if (!_1239)
    {
        float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1527 = -_1427;
        float _1529 = fma(_1387, _1525, _1527);
        _1421 = _1529;
    }
    float _1531 = _1421;
    float _1533 = _1495;
    if (!_1239)
    {
        float _1535 = _1511 * _1495;
        float _1537 = precise::clamp(_1535, 0.0, 1.0);
        _1513 = _1537;
    }
    float _1539 = _1513;
    if (!_1239)
    {
        float _1541 = _1531 * _1475;
        float _1543 = precise::clamp(_1541, 0.0, 1.0);
        _1523 = _1543;
    }
    float _1545 = _1523;
    if (!_1497)
    {
        _1437 = _1499;
    }
    float _1547 = _1437;
    bool _1549 = !_1497;
    float _1551 = _1547;
    if (!_1549)
    {
        float _1553 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1557 = _1443 + _1555;
        float _1559 = rsqrt(_1433);
        float _1561 = _1557 * _1553;
        float _1563 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = _1561 * 0.15915493667125701904296875;
        float _1567 = _1565 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1565 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = fma(_1569, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1577 = _1559 * _1575;
        float _1579 = _1573 + (-1.0);
        float _1581 = fma(_1405, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1583 = fma(_1401, _1577, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1585 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1587 = fma(_1499, _1573, _1585);
        _1423 = _1581;
        _1551 = _1587;
        _1425 = _1583;
    }
    float _1589 = _1423;
    float _1591 = _1551;
    float _1593 = _1425;
    float _1595 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1597 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1599 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1239)
    {
        _1533 = 1.0;
    }
    float _1601 = _1533;
    float _1603 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1595);
    float _1605 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1597);
    float _1607 = -_1057;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _1611 = -_1045;
    float _1613 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1591);
    float _1615 = -_1071;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1593);
    float _1619 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1599);
    float _1621 = _1601;
    float _1623 = _1613;
    float _1625 = _1609;
    float _1627 = _1617;
    if (!_1239)
    {
        float _1629 = -_1539;
        float _1631 = _1629 + 1.0;
        _1621 = _1631;
    }
    float _1633 = _1621;
    if (!_1225)
    {
        float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1637 = _1203 + _1635;
        float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1641 = _1207 + _1639;
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1645 = -_921;
        float _1647 = _1645 + _1589;
        float _1649 = _1637 * _1637;
        float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1653 = _1215 + _1651;
        float _1655 = -_873;
        float _1657 = _1655 + _1591;
        float _1659 = -_951;
        float _1661 = _1659 + _1593;
        float _1663 = fma(_1641, _1641, _1649);
        float _1665 = 1.0 / _1283;
        float _1667 = fma(_1653, _1653, _1663);
        float _1669 = sqrt(_1667);
        float _1671 = _1647 * _1665;
        float _1673 = _1657 * _1665;
        float _1675 = _1661 * _1665;
        bool _1677 = _1669 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1679 = isnan(_1669);
        bool _1681 = _1677 || _1679;
        bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1685 = _1681 || _1683;
        float _1687 = precise::min(_1669, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1689 = _1687 * _1643;
        float _1691 = fma(_1673, _1689, _1203);
        float _1693 = fma(_1675, _1689, _1215);
        float _1695 = _1295;
        float _1697 = _1653;
        float _1699 = _1689;
        float _1701 = _1657;
        if (_1685)
        {
            float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1695 = _1703;
        }
        float _1705 = _1695;
        if (_1685)
        {
            float _1707 = precise::max(_1669, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1697 = _1707;
        }
        float _1709 = _1697;
        float _1711 = fma(_1671, _1689, _1207);
        float _1713 = _1711;
        float _1715 = _1709;
        if (!_1685)
        {
            _1699 = _1711;
        }
        float _1717 = _1699;
        float _1719 = _1717;
        if (!_1685)
        {
            _1713 = _1691;
        }
        float _1721 = _1713;
        float _1723 = _1721;
        if (_1685)
        {
            float _1725 = _1709 * _1705;
            _1701 = _1725;
        }
        float _1727 = _1701;
        if (!_1685)
        {
            _1715 = _1693;
        }
        float _1729 = _1715;
        _1627 = _1729;
        if (_1685)
        {
            float _1731 = fma(_1671, _1727, _1207);
            _1719 = _1731;
        }
        float _1733 = _1719;
        _1625 = _1733;
        if (_1685)
        {
            float _1735 = fma(_1673, _1727, _1203);
            _1723 = _1735;
        }
        float _1737 = _1723;
        _1623 = _1737;
        if (_1685)
        {
            float _1739 = fma(_1675, _1727, _1215);
            _1627 = _1739;
        }
    }
    float _1741 = _1623;
    float _1743 = _1625;
    float _1745 = _1627;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1749 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1751 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1747);
    float _1757 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1749);
    float _1759 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1751);
    float _1761 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1763 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1755);
    float _1765 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1757);
    float _1767 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1759);
    float _1769 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1773 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1777 = _1545 > 0.0;
    bool _1779 = isnan(_1545);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(0.0);
    bool _1785 = _1781 || _1783;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1789 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1791 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1793 = _1545 * _1633;
    float _1795 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1787);
    float _1797 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1789);
    float _1799 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1801 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1791);
    float _1803 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    float _1805 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1807 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1809 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1799);
    bool _1811 = _1633 <= 0.0;
    bool _1813 = !_1785;
    bool _1815 = _1811 || _1813;
    float _1817 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1819 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1821 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1823 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1809);
    float _1825 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1619);
    float _1827 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1817);
    float _1829 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1831 = _1819 + _1821;
    float _1833 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1605);
    float _1835 = fma(_1521, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1603);
    float _1837 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1823);
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1841 = _1743 + _1839;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1847 = _1741 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1745 + _1849;
    float _1853 = _1831 * 0.5;
    out.m_56.x = _1835;
    out.m_56.y = _1833;
    out.m_56.z = _1825;
    out.m_33.x = _1843;
    out.m_58.x = _1841;
    out.m_58.y = _1847;
    out.m_58.z = _1851;
    out.gl_Position.x = _1827;
    out.gl_Position.y = _1837;
    out.gl_Position.z = _1819;
    out.gl_Position.w = _1821;
    out.m_60.z = _1853;
    out.m_60.w = _1821;
    if (!_1815)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1855 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1855;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

