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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_58 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_50 [[attribute(7)]];
    float4 m_42 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1463 = false;
    bool _553 = false;
    bool _443 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
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
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2140 = as_type<float>(_95);
        out.gl_Position.z = _2140;
    }
    if (!_83)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_109)
    {
        float _115 = float(_79);
        _89 = _115;
    }
    float _117 = _89;
    bool _119 = _113 >= _117;
    bool _121 = !_109;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2209 = as_type<float>(_131);
        out.gl_Position.z = _2209;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = in.m_46.x;
    float _167 = in.m_46.y;
    float _169 = in.m_46.z;
    float _171 = in.m_48.x;
    float _173 = in.m_48.y;
    float _175 = in.m_48.z;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    float _185 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _187 = 0.0;
    float _189 = _185;
    if (!_145)
    {
        float _191 = _185 * _185;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _195;
    if (!_145)
    {
        float _207 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_145;
    float _213 = _209;
    float _215 = 0.0;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _185 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _185);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _215 = _229;
    }
    float _247 = _213;
    float _249 = _215;
    bool _251 = !_145;
    float _253 = _249;
    float _255 = _247;
    if (!_251)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _185 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _189 = _275;
    }
    float _277 = _189;
    float _279 = 0.0;
    if (!_145)
    {
        float _281 = _113 * _113;
        float _283 = _281 * 0.5;
        _279 = _283;
    }
    float _285 = _279;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_145)
    {
        _253 = _113;
    }
    float _293 = _253;
    float _295 = fma(_277, _147, _287);
    float _297 = fma(_277, _149, _289);
    float _299 = _293;
    if (!_145)
    {
        float _301 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _301;
    }
    float _303 = _255;
    bool _305 = !_145;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _113 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _113);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_145;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _113 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_277, _151, _291);
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _373 = fma(_363, _149, _365);
    float _375 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_363, _147, _367);
    float _379 = fma(_297, _135, _155);
    float _381 = -_373;
    float _383 = _297 + _381;
    float _385 = fma(_363, _151, _375);
    float _387 = fma(_295, _135, _153);
    float _389 = -_377;
    float _391 = _295 + _389;
    float _393 = _383 * _161;
    float _395 = _383 * _167;
    float _397 = _383 * _173;
    float _399 = -_385;
    float _401 = _369 + _399;
    float _403 = fma(_391, _159, _393);
    float _405 = fma(_391, _165, _395);
    float _407 = fma(_391, _171, _397);
    float _409 = fma(_369, _135, _157);
    float _411 = fma(_401, _163, _403);
    float _413 = fma(_401, _169, _405);
    float _415 = fma(_401, _175, _407);
    bool _417 = !_371;
    float _419 = _413;
    float _421 = _411;
    float _423 = _415;
    float _441;
    if (!_417)
    {
        float _425 = in.m_50.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_79);
        float _447 = 1.0 / _445;
        float _449 = _113 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = _451 + _453;
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _479 = 1.0 / _475;
    float _481 = -_471;
    float _483 = _481 + 1.0;
    float _485 = _455 * _479;
    bool _487 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _489 = isnan(_451);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _503;
    float _507 = _497 * _483;
    float _509 = fma(_501, _485, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _511 = fma(_505, _485, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _513 = -_497;
    float _515 = _513 + 1.0;
    float _517 = _509 * _507;
    float _519 = _511 * _507;
    float _521 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _523 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].y, _519);
    float _525 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].x, _521);
    float _527 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].y, _523);
    float _529 = _525 * _457;
    float _531 = _527 * _459;
    bool _533 = !_477;
    float _551;
    if (!_533)
    {
        float _535 = in.m_50.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_79);
        float _557 = 1.0 / _555;
        float _559 = _113 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = in.m_50.x;
    float _565 = _379 * _167;
    float _567 = in.m_50.y;
    float _569 = _379 * _173;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _577 = _575 != 0;
    float _579 = fma(_387, _165, _565);
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _583 = _581 != 0;
    float _585 = fma(_387, _171, _569);
    bool _587 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _589 = isnan(_561);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = 1.0 / _573;
    float _601 = fma(_409, _169, _579);
    float _603 = fma(_409, _175, _585);
    float _605 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _607 = _603 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _611 = _605 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _615 = _607 + _613;
    bool _617 = _563 > 0.5;
    float _619 = _611 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _621 = _567 > 0.5;
    float _623 = _379 * _161;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _561 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -_203;
    int _635 = _621 ? as_type<int>(_633) : as_type<int>(_203);
    float _637 = fma(_387, _159, _623);
    float _639 = _631 * _599;
    bool _641 = !_583;
    float _643 = _641 ? _203 : as_type<float>(_635);
    float _645 = fma(_409, _163, _637);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _655 = fma(_639, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _657 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = isnan(_561);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _645 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _671 = 1.0 / _653;
    bool _673 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_561);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -_643;
    float _687 = _685 + 0.5;
    float _689 = -_667;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _695 = _669 + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _561 + _697;
    float _701 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _705 = _597 * _691;
    float _707 = -_597;
    float _709 = _707 + 1.0;
    float _711 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[28].x, _619);
    float _713 = -_199;
    int _715 = _617 ? as_type<int>(_713) : as_type<int>(_199);
    float _717 = _683 * _709;
    float _719 = -_683;
    float _721 = _719 + 1.0;
    float _723 = _649 * _671;
    float _725 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].z, _711);
    float _727 = _655 * _717;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _731 = fma(_723, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _733 = !_577;
    float _735 = _733 ? _199 : as_type<float>(_715);
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    bool _739 = _725 >= 0.0;
    float _741 = _701 * _703;
    float _743 = fma(_731, _705, _737);
    float _745 = _735 + 0.5;
    out.m_52.y = _741;
    float _747 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[117].x, _743);
    float _749 = _611 * _611;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _753 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _755 = fma(_695, _695, _749);
    float _757 = _727;
    int _759 = as_type<int>(_731);
    bool _761 = _621;
    if (_739)
    {
        _757 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _763 = _757;
    float _765 = _751 * _729;
    float _767 = fma(_615, _615, _755);
    if (_739)
    {
        float _769 = _763 * 5.0;
        _759 = as_type<int>(_769);
    }
    int _771 = _759;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _775 = rsqrt(_767);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3195 = as_type<float>(_771);
        out.gl_Position.z = _3195;
    }
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _785 = _773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _765;
    if (_739)
    {
        out.m_35.x = 0.0;
    }
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_54.x = _785;
    out.m_54.y = _787;
    out.m_54.z = _789;
    out.m_54.w = _753;
    float _797 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _611 * _775;
    float _805 = _695 * _775;
    out.m_56.x = _797;
    out.m_56.y = _799;
    out.m_56.z = _801;
    out.m_56.w = _783;
    if (_739)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _807 = -_803;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _811 = _615 * _775;
    float _813 = -_805;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _819 = _809 + _817;
    float _821 = -_811;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _827 = _815 + _825;
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _833 = _823 + _831;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[28].x, _829);
    float _837 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[28].z, _835);
    bool _839 = _837 >= 0.0;
    if (_839)
    {
        _777 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _841 = _777;
    int _843 = as_type<int>(_841);
    if (_839)
    {
        out.m_35.x = 0.0;
    }
    if (_839)
    {
        float _845 = _841 * 5.0;
        _843 = as_type<int>(_845);
    }
    int _847 = _843;
    if (_839)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3369 = as_type<float>(_847);
        out.gl_Position.z = _3369;
    }
    if (_839)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _849 = -_605;
    float _851 = _849 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = -_669;
    float _855 = _853 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _857 = _851 * _851;
    float _859 = -_607;
    float _861 = _859 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _863 = -_803;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _867 = fma(_855, _855, _857);
    float _869 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _871 = -_805;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _695);
    float _875 = _865 * _865;
    float _877 = fma(_861, _861, _867);
    float _879 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _869);
    float _881 = -_811;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    float _885 = fma(_873, _873, _875);
    float _887 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _879);
    float _889 = rsqrt(_877);
    float _891 = fma(_883, _883, _885);
    float _893 = rsqrt(_887);
    float _895 = _855 * _889;
    float _897 = _861 * _889;
    float _899 = _851 * _889;
    float _901 = -_605;
    float _903 = _901 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _905 = sqrt(_891);
    float _907 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _909 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _911 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _913 = _907 * _895;
    float _915 = _909 * _897;
    float _917 = _911 * _899;
    float _919 = -_913;
    float _921 = fma(_909, _899, _919);
    float _923 = -_915;
    float _925 = fma(_911, _895, _923);
    float _927 = -_917;
    float _929 = fma(_907, _897, _927);
    float _931 = -_669;
    float _933 = _931 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _935 = _895 * _921;
    float _937 = _897 * _925;
    float _939 = _899 * _929;
    float _941 = -_935;
    float _943 = fma(_897, _929, _941);
    float _945 = -_937;
    float _947 = fma(_899, _921, _945);
    float _949 = -_939;
    float _951 = fma(_895, _925, _949);
    float _953 = _903 * _943;
    float _955 = _925 * _903;
    float _957 = fma(_933, _947, _953);
    float _959 = -_607;
    float _961 = _959 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _963 = fma(_929, _933, _955);
    float _965 = fma(_961, _951, _957);
    float _967 = fma(_921, _961, _963);
    float _969 = _965 * _965;
    float _971 = fma(_967, _967, _969);
    float _973 = rsqrt(_971);
    float _975 = _967 * _973;
    float _977 = _965 * _973;
    float _979 = abs(_975);
    float _981 = abs(_977);
    float _983 = precise::max(_979, _981);
    bool _985 = _983 >= 16.0;
    float _987 = _899 * _899;
    float _989 = fma(_895, _895, _987);
    float _991 = fma(_897, _897, _989);
    float _993 = _977;
    float _995 = _975;
    int _997 = as_type<int>(_987);
    if (_985)
    {
        float _999 = _977 * 0.0625;
        _993 = _999;
    }
    float _1001 = _993;
    if (_985)
    {
        float _1003 = _975 * 0.0625;
        _995 = _1003;
    }
    float _1005 = _995;
    float _1007 = rsqrt(_991);
    float _1009 = abs(_1001);
    bool _1011 = _1009 != 0.0;
    bool _1013 = isnan(_1009);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan(0.0);
    bool _1019 = _1015 || _1017;
    float _1021 = abs(_1005);
    bool _1023 = _1021 == 0.0;
    float _1025 = abs(_1005);
    bool _1027 = _1025 == 0.0;
    bool _1029 = !_1019;
    bool _1031 = _1027 && _1029;
    if (_1031)
    {
        bool _1033 = as_type<int>(_1005) >= 0;
        _761 = _1033;
    }
    bool _1035 = _761;
    int _1037 = _1035 ? (-1) : 0;
    if (_1031)
    {
        int _1039 = _1035 ? 0 : 1078530011;
        _997 = _1039;
    }
    int _1041 = _997;
    int _1043 = _1041;
    if (_1031)
    {
        int _1045 = int(0x80000000) & as_type<int>(_1001);
        int _1047 = _1041 | _1045;
        _1043 = _1047;
    }
    int _1049 = _1043;
    bool _1051 = !_1019;
    bool _1053 = _1051 && _1023;
    int _1055 = _1049;
    float _1057 = as_type<float>(_1049);
    if (!_1053)
    {
        float _1059 = abs(_1001);
        bool _1061 = _1059 != as_type<float>(0x7f800000u /* inf */);
        bool _1063 = isnan(_1059);
        bool _1065 = _1061 || _1063;
        bool _1067 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1069 = _1065 || _1067;
        float _1071 = abs(_1005);
        bool _1073 = _1071 == as_type<float>(0x7f800000u /* inf */);
        float _1075 = abs(_1005);
        bool _1077 = _1075 == as_type<float>(0x7f800000u /* inf */);
        bool _1079 = !_1069;
        bool _1081 = _1077 && _1079;
        if (_1081)
        {
            bool _1083 = as_type<int>(_1005) >= 0;
            _1037 = _1083 ? (-1) : 0;
        }
        int _1085 = _1037;
        if (_1081)
        {
            _1055 = 1075235812;
        }
        int _1087 = _1055;
        int _1089 = _1087;
        if (_1081)
        {
            int _1091 = ~_1085;
            int _1093 = (_1091 != 0) ? _1087 : 1061752795;
            _1089 = _1093;
        }
        int _1095 = _1089;
        float _1097 = as_type<float>(_1095);
        if (_1081)
        {
            int _1099 = int(0x80000000) & as_type<int>(_1001);
            int _1101 = _1095 | _1099;
            _1097 = as_type<float>(_1101);
        }
        float _1103 = _1097;
        bool _1105 = !_1069;
        bool _1107 = _1105 && _1073;
        _1057 = _1103;
        if (!_1107)
        {
            float _1109 = abs(_1001);
            float _1111 = abs(_1005);
            float _1113 = precise::max(_1109, _1111);
            float _1115 = abs(_1001);
            float _1117 = abs(_1005);
            float _1119 = precise::min(_1115, _1117);
            float _1121 = 1.0 / _1113;
            float _1123 = abs(_1001);
            float _1125 = abs(_1005);
            bool _1127 = _1123 > _1125;
            bool _1129 = as_type<int>(_1005) >= 0;
            float _1131 = abs(_1001);
            float _1133 = abs(_1005);
            float _1135 = _1131 + _1133;
            int _1137 = as_type<int>(_1001) & int(0x80000000);
            bool _1139 = _1135 > as_type<float>(0x7f800000u /* inf */);
            bool _1141 = isnan(_1135);
            bool _1143 = _1139 || _1141;
            bool _1145 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1147 = _1143 || _1145;
            float _1149 = _1119 * _1121;
            float _1151 = _1149 * _1149;
            float _1153 = _1151 + 11.33538818359375;
            float _1155 = fma(_1151, _1153, 28.84246826171875);
            float _1157 = fma(_1151, _1155, 19.6966705322265625);
            float _1159 = fma(_1151, -0.82336294651031494140625, -5.674867153167724609375);
            float _1161 = fma(_1151, _1159, -6.565555095672607421875);
            float _1163 = 1.0 / _1157;
            float _1165 = _1151 * _1161;
            float _1167 = _1149 * _1165;
            float _1169 = fma(_1167, _1163, _1149);
            float _1171 = _1169;
            _1057 = _1135;
            if (_1127)
            {
                float _1173 = -_1169;
                float _1175 = _1173 + 1.57079637050628662109375;
                _1171 = _1175;
            }
            float _1177 = _1171;
            int _1179 = as_type<int>(_1177);
            if (!_1129)
            {
                float _1181 = -_1177;
                float _1183 = _1181 + 3.1415927410125732421875;
                _1179 = as_type<int>(_1183);
            }
            int _1185 = _1179;
            if (!_1147)
            {
                int _1187 = _1137 | _1185;
                _1057 = as_type<float>(_1187);
            }
        }
    }
    float _1189 = _1057;
    float _1191 = _1189 + 1.57079637050628662109375;
    float _1193 = _775 * _905;
    float _1195 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1197 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = _1191 * 0.15915493667125701904296875;
    float _1201 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1203 = _1193 * _1195;
    float _1205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1207 = _1193 * _1197;
    float _1209 = _1199 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1201 * _1203;
    float _1215 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1217 = _1215 * 0.5;
    float _1219 = _1205 * _1207;
    float _1221 = _895 * _1007;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1225 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1229 = _1199 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1223);
    float _1235 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1237 = _897 * _1007;
    float _1239 = _899 * _1007;
    float _1241 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1233);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1227);
    float _1245 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1235);
    float _1247 = -_1211;
    float _1249 = _1247 + 1.0;
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1253 = _1237 * _1237;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1257 = _1221 * _1249;
    float _1259 = _1239 * _1249;
    float _1261 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1263 = _1237 * _1231;
    float _1265 = _1221 * _1231;
    float _1267 = _1239 * _1231;
    float _1269 = fma(_1221, _1257, _1211);
    float _1271 = -_1263;
    float _1273 = fma(_1239, _1257, _1271);
    float _1275 = fma(_1237, _1259, _1265);
    float _1277 = _1255 * _1273;
    float _1279 = fma(_1249, _1253, _1211);
    float _1281 = -_1267;
    float _1283 = fma(_1237, _1257, _1281);
    float _1285 = _1255 * _1275;
    float _1287 = fma(_1251, _1269, _1277);
    float _1289 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1291 = fma(_1237, _1257, _1267);
    float _1293 = fma(_1251, _1283, _1285);
    float _1295 = fma(_1239, _1259, _1211);
    float _1297 = fma(_1239, _1257, _1263);
    float _1299 = fma(_1289, _1291, _1287);
    float _1301 = fma(_1289, _1279, _1293);
    float _1303 = _1255 * _1295;
    float _1305 = -_1265;
    float _1307 = fma(_1237, _1259, _1305);
    float _1309 = _669 + _1299;
    float _1311 = _607 + _1301;
    float _1313 = fma(_1251, _1297, _1303);
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1309 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1321 = _1311 + _1319;
    float _1323 = fma(_1289, _1307, _1313);
    float _1325 = _1317 * _1317;
    float _1327 = _1321 * _1321;
    float _1329 = _605 + _1323;
    float _1331 = _1325 + _1327;
    float _1333 = sqrt(_1331);
    bool _1335 = _1333 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1337 = !_1335;
    float _1339 = _1329;
    float _1341 = _1325;
    float _1343 = _1327;
    float _1345 = _1309;
    float _1347 = _1311;
    if (!_1337)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1353 = _1333 + _1351;
        float _1355 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = rsqrt(_1331);
        float _1359 = _1353 * _1349;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1361 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = fma(_1365, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = _1357 * _1371;
        float _1375 = fma(_1317, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1377 = _1369 + (-1.0);
        float _1379 = fma(_1321, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1383 = _1375 + _1381;
        float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1389 = _1379 + _1387;
        float _1391 = _1383 * _1383;
        float _1393 = fma(_1329, _1369, _1385);
        float _1395 = _1389 * _1389;
        _1339 = _1393;
        _1341 = _1391;
        _1343 = _1395;
        _1345 = _1375;
        _1347 = _1379;
    }
    float _1397 = _1339;
    float _1399 = _1341;
    float _1401 = _1343;
    float _1403 = _1345;
    float _1405 = _1347;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1409 = _1397 + _1407;
    out.m_54.x = _785;
    out.m_54.y = _787;
    out.m_54.z = _789;
    out.m_54.w = _753;
    float _1411 = fma(_1409, _1409, _1399);
    out.m_56.x = _797;
    out.m_56.y = _799;
    out.m_56.z = _801;
    out.m_56.w = _783;
    float _1413 = _1411 + _1401;
    float _1415 = sqrt(_1413);
    bool _1417 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1419 = isnan(_1415);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1425 = _1421 || _1423;
    float _1427 = _1409;
    if (!_1425)
    {
        _1427 = 1.0;
    }
    float _1429 = _1427;
    bool _1431 = !_1425;
    float _1433 = _1429;
    if (!_1431)
    {
        bool _1435 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1437 = isnan(_1415);
        bool _1439 = _1435 || _1437;
        bool _1441 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1443 = _1439 || _1441;
        if (!_1443)
        {
            float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1447 = _1415 + _1445;
            float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1451 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1449;
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1457 = 1.0 / _1451;
            float _1459 = _1447 * _1457;
            float _1461 = fma(_1459, _1455, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1433 = _1461;
            _1463 = true;
        }
        else
        {
            bool _1465 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1467 = isnan(_1415);
            bool _1469 = _1465 || _1467;
            bool _1471 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1473 = _1469 || _1471;
            if (!_1473)
            {
                float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1477 = _1415 + _1475;
                float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1485 = _1483 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1487 = 1.0 / _1481;
                float _1489 = _1477 * _1487;
                float _1491 = fma(_1489, _1485, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1433 = _1491;
                _1463 = true;
            }
            else
            {
                _1433 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1463 = false;
    float _1493 = _1433;
    float _1495 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1497 = _1397 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1501 = _1403 + _1499;
    float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1505 = _1405 + _1503;
    float _1507 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1509 = fma(_1501, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1511 = fma(_1505, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1513 = -_605;
    float _1515 = _1513 + _1507;
    float _1517 = -_669;
    float _1519 = _1517 + _1509;
    float _1521 = -_607;
    float _1523 = _1521 + _1511;
    float _1525 = _1515 * _1515;
    float _1527 = fma(_1519, _1519, _1525);
    float _1529 = fma(_1523, _1523, _1527);
    float _1531 = sqrt(_1529);
    bool _1533 = _1531 > 0.0;
    bool _1535 = !_1533;
    float _1537 = _1493;
    float _1539 = _1531;
    float _1541 = _1507;
    float _1543 = _1511;
    float _1545 = _1509;
    if (!_1535)
    {
        bool _1547 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1549 = _1497;
        if (_1547)
        {
            float _1551 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1549 = _1551;
        }
        float _1553 = _1549;
        float _1555 = _1553;
        if (_1547)
        {
            float _1557 = _411 * _1553;
            _1537 = _1557;
        }
        float _1559 = _1537;
        float _1561 = _1559;
        if (_1547)
        {
            float _1563 = _413 * _1553;
            _1539 = _1563;
        }
        float _1565 = _1539;
        float _1567 = _1565;
        float _1569 = _1565;
        if (_1547)
        {
            float _1571 = _415 * _1553;
            _1555 = _1571;
        }
        float _1573 = _1555;
        float _1575 = _1573;
        if (!_1547)
        {
            float _1577 = _113 + 1.0;
            float _1579 = _1577;
            if (!_145)
            {
                float _1581 = _1577 * _1577;
                float _1583 = _1581 * 0.5;
                _1567 = _1583;
            }
            float _1585 = _1567;
            float _1587 = _1585;
            if (!_145)
            {
                float _1589 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1587 = _1589;
            }
            float _1591 = _1587;
            bool _1593 = !_145;
            float _1595 = _1591;
            if (!_1593)
            {
                float _1597 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1599 = log2(_1597);
                float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1603 = _1601 + 1.0;
                float _1605 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1607 = _1599 * _1577;
                float _1609 = 1.0 / _1603;
                float _1611 = _1605 * 0.693147182464599609375;
                float _1613 = exp2(_1607);
                float _1615 = 1.0 / _1611;
                float _1617 = _1613 + (-1.0);
                float _1619 = -_1617;
                float _1621 = fma(_1619, _1615, _1577);
                float _1623 = _1621 * _1609;
                float _1625 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1595 = _1625;
            }
            float _1627 = _1595;
            float _1629 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1631 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1633 = !_145;
            if (!_1633)
            {
                float _1635 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1637 = log2(_1635);
                float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1641 = _1639 + 1.0;
                float _1643 = 1.0 / _1641;
                float _1645 = _1637 * _1577;
                float _1647 = exp2(_1645);
                float _1649 = -_1647;
                float _1651 = _1649 + 1.0;
                float _1653 = _1651 * _1643;
                _1579 = _1653;
            }
            float _1655 = _1579;
            float _1657 = fma(_1655, _149, _1631);
            float _1659 = fma(_1655, _147, _1629);
            float _1661 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1663 = -_373;
            float _1665 = _1663 + _1657;
            float _1667 = -_377;
            float _1669 = _1667 + _1659;
            float _1671 = fma(_1655, _151, _1661);
            float _1673 = _1665 * _161;
            float _1675 = _1665 * _167;
            float _1677 = _1665 * _173;
            float _1679 = -_385;
            float _1681 = _1679 + _1671;
            float _1683 = fma(_1669, _159, _1673);
            float _1685 = fma(_1669, _165, _1675);
            float _1687 = fma(_1669, _171, _1677);
            float _1689 = fma(_1681, _163, _1683);
            float _1691 = fma(_1681, _169, _1685);
            float _1693 = fma(_1681, _175, _1687);
            _419 = _1691;
            _421 = _1689;
            _423 = _1693;
            _1561 = _1689;
            _1569 = _1691;
            _1575 = _1693;
        }
        float _1695 = _419;
        float _1697 = _421;
        float _1699 = _423;
        float _1701 = _1561;
        float _1703 = _1569;
        float _1705 = _1575;
        float _1707 = _1695 * _1695;
        float _1709 = rsqrt(_1529);
        float _1711 = fma(_1697, _1697, _1707);
        float _1713 = fma(_1699, _1699, _1711);
        float _1715 = sqrt(_1713);
        float _1717 = _1519 * _1709;
        float _1719 = _1515 * _1709;
        float _1721 = _1523 * _1709;
        bool _1723 = _1715 > 0.0;
        bool _1725 = !_1723;
        if (!_1725)
        {
            float _1727 = rsqrt(_1713);
            float _1729 = _1727 * _1695;
            float _1731 = _1727 * _1697;
            float _1733 = _1727 * _1699;
            float _1735 = _1719 * _1729;
            float _1737 = fma(_1717, _1731, _1735);
            float _1739 = fma(_1721, _1733, _1737);
            float _1741 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1743 = fma(_1701, _1741, _1509);
            float _1745 = fma(_1703, _1741, _1507);
            float _1747 = fma(_1705, _1741, _1511);
            _1541 = _1745;
            _1543 = _1747;
            _1545 = _1743;
        }
    }
    float _1749 = _1541;
    float _1751 = _1543;
    float _1753 = _1545;
    float _1755 = _809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1757 = -_803;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1749);
    float _1761 = -_811;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1751);
    float _1765 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1767 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1765);
    bool _1769 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(0.5);
    bool _1777 = _1773 || _1775;
    float _1779 = _809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1781 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1783 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1779);
    float _1785 = -_805;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1789 = 1.0 / _1781;
    float _1791 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1783);
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = _1783;
    float _1797 = _1791;
    float _1799 = _1787;
    if (_1777)
    {
        _1795 = _1759;
    }
    float _1801 = _1795;
    float _1803 = _1801;
    if (_1777)
    {
        _1797 = _1763;
    }
    float _1805 = _1797;
    float _1807 = _1805;
    if (!_1777)
    {
        float _1809 = _819 * _819;
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1813 = -_607;
        float _1815 = _1813 + _1751;
        float _1817 = fma(_827, _827, _1809);
        float _1819 = fma(_833, _833, _1817);
        float _1821 = 1.0 / _1193;
        float _1823 = sqrt(_1819);
        float _1825 = precise::min(_1823, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1827 = _1825 * _1811;
        float _1829 = -_669;
        float _1831 = _1829 + _1753;
        float _1833 = _1827 * _1821;
        float _1835 = -_605;
        float _1837 = _1835 + _1749;
        float _1839 = fma(_1831, _1833, _815);
        float _1841 = fma(_1837, _1833, _809);
        float _1843 = fma(_1815, _1833, _823);
        _1803 = _1841;
        _1799 = _1839;
        _1807 = _1843;
    }
    float _1845 = _1803;
    float _1847 = _1799;
    float _1849 = _1807;
    float _1851 = _1793 + _1781;
    float _1853 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1855 = _1851 * _1789;
    float _1857 = _1855 * 0.5;
    float _1859 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1861 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1853);
    bool _1863 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(0.5);
    bool _1871 = _1867 || _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1875 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1873);
    float _1877 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1859);
    float _1879 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1881 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1885 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1877);
    float _1887 = 1.0 / _1875;
    float _1889 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1895 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1883);
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1905 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1891);
    float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1909 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1899);
    float _1911 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1901);
    float _1913 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1903);
    float _1915 = _1897;
    float _1917 = _1893;
    if (_1871)
    {
        _1915 = 1.0;
    }
    float _1919 = _1915;
    float _1921 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1923 = _1919;
    if (_1871)
    {
        _1917 = 1.0;
    }
    float _1925 = _1917;
    float _1927 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1931 = _1887 * _1929;
    float _1933 = _1925;
    if (!_1871)
    {
        float _1935 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1937 = _1935 * 0.15915493667125701904296875;
        float _1939 = _1937 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1945 = _1943 * 0.15915493667125701904296875;
        float _1947 = _1937 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = 1.0 / _1941;
        float _1953 = _1945 * 6.283185482025146484375;
        float _1955 = cos(_1953);
        float _1957 = _1949 * _1951;
        float _1959 = _1945 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1965 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1963;
        float _1967 = _1955 * _1957;
        float _1969 = 1.0 / _1965;
        float _1971 = 1.0 / _1967;
        float _1973 = _1961 * _1971;
        float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1977 = fma(_1931, _1973, _1975);
        float _1979 = _1977 * _1969;
        float _1981 = precise::clamp(_1979, 0.0, 1.0);
        _1923 = _1981;
    }
    float _1983 = _1923;
    if (!_1871)
    {
        float _1985 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1987 = _1985 * 0.15915493667125701904296875;
        float _1989 = _1987 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        float _1993 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1995 = _1993 * 0.15915493667125701904296875;
        float _1997 = _1987 * 6.283185482025146484375;
        float _1999 = sin(_1997);
        float _2001 = 1.0 / _1991;
        float _2003 = _1995 * 6.283185482025146484375;
        float _2005 = cos(_2003);
        float _2007 = _1999 * _2001;
        float _2009 = _1995 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = 1.0 / _2013;
        float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2017;
        float _2021 = 1.0 / _2019;
        float _2023 = _2011 * _2015;
        float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2027 = fma(_1931, _2023, _2025);
        float _2029 = _2027 * _2021;
        float _2031 = precise::clamp(_2029, 0.0, 1.0);
        float _2033 = -_2031;
        float _2035 = _2033 + 1.0;
        _1933 = _2035;
    }
    float _2037 = _1933;
    float _2039 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2041 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1911);
    float _2043 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1913);
    bool _2045 = _1983 > 0.0;
    bool _2047 = isnan(_1983);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1907);
    float _2057 = _1983 * _2037;
    float _2059 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2041);
    float _2061 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2043);
    bool _2063 = _2037 <= 0.0;
    bool _2065 = !_2053;
    bool _2067 = _2063 || _2065;
    float _2069 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1909);
    float _2071 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2073 = _2059 + _2061;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2077 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2069);
    float _2079 = _2073 * 0.5;
    float _2081 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1847;
    out.m_58.y = _1845;
    out.m_58.z = _1849;
    out.gl_Position.x = _2071;
    out.gl_Position.y = _2077;
    out.gl_Position.z = _2059;
    out.gl_Position.w = _2061;
    out.m_60.z = _2079;
    out.m_60.w = _2061;
    out.m_35.x = _2081;
    if (!_2067)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _2083 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2083;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1463 = false;
    bool _553 = false;
    bool _443 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
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
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2140 = as_type<float>(_95);
        out.gl_Position.z = _2140;
    }
    if (!_83)
    {
        return out;
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_109)
    {
        float _115 = float(_79);
        _89 = _115;
    }
    float _117 = _89;
    bool _119 = _113 >= _117;
    bool _121 = !_109;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2209 = as_type<float>(_131);
        out.gl_Position.z = _2209;
    }
    if (_123)
    {
        return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = in.m_46.x;
    float _167 = in.m_46.y;
    float _169 = in.m_46.z;
    float _171 = in.m_48.x;
    float _173 = in.m_48.y;
    float _175 = in.m_48.z;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    float _185 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _187 = 0.0;
    float _189 = _185;
    if (!_145)
    {
        float _191 = _185 * _185;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _195;
    if (!_145)
    {
        float _207 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_145;
    float _213 = _209;
    float _215 = 0.0;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _185 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _185);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _215 = _229;
    }
    float _247 = _213;
    float _249 = _215;
    bool _251 = !_145;
    float _253 = _249;
    float _255 = _247;
    if (!_251)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _185 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _189 = _275;
    }
    float _277 = _189;
    float _279 = 0.0;
    if (!_145)
    {
        float _281 = _113 * _113;
        float _283 = _281 * 0.5;
        _279 = _283;
    }
    float _285 = _279;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_145)
    {
        _253 = _113;
    }
    float _293 = _253;
    float _295 = fma(_277, _147, _287);
    float _297 = fma(_277, _149, _289);
    float _299 = _293;
    if (!_145)
    {
        float _301 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _301;
    }
    float _303 = _255;
    bool _305 = !_145;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _113 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _113);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_145;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _113 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_277, _151, _291);
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _373 = fma(_363, _149, _365);
    float _375 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_363, _147, _367);
    float _379 = fma(_297, _135, _155);
    float _381 = -_373;
    float _383 = _297 + _381;
    float _385 = fma(_363, _151, _375);
    float _387 = fma(_295, _135, _153);
    float _389 = -_377;
    float _391 = _295 + _389;
    float _393 = _383 * _161;
    float _395 = _383 * _167;
    float _397 = _383 * _173;
    float _399 = -_385;
    float _401 = _369 + _399;
    float _403 = fma(_391, _159, _393);
    float _405 = fma(_391, _165, _395);
    float _407 = fma(_391, _171, _397);
    float _409 = fma(_369, _135, _157);
    float _411 = fma(_401, _163, _403);
    float _413 = fma(_401, _169, _405);
    float _415 = fma(_401, _175, _407);
    bool _417 = !_371;
    float _419 = _413;
    float _421 = _411;
    float _423 = _415;
    float _441;
    if (!_417)
    {
        float _425 = in.m_50.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_79);
        float _447 = 1.0 / _445;
        float _449 = _113 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = _451 + _453;
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _479 = 1.0 / _475;
    float _481 = -_471;
    float _483 = _481 + 1.0;
    float _485 = _455 * _479;
    bool _487 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _489 = isnan(_451);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _503;
    float _507 = _497 * _483;
    float _509 = fma(_501, _485, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _511 = fma(_505, _485, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _513 = -_497;
    float _515 = _513 + 1.0;
    float _517 = _509 * _507;
    float _519 = _511 * _507;
    float _521 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _523 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].y, _519);
    float _525 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].x, _521);
    float _527 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].y, _523);
    float _529 = _525 * _457;
    float _531 = _527 * _459;
    bool _533 = !_477;
    float _551;
    if (!_533)
    {
        float _535 = in.m_50.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_79);
        float _557 = 1.0 / _555;
        float _559 = _113 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = in.m_50.x;
    float _565 = _379 * _167;
    float _567 = in.m_50.y;
    float _569 = _379 * _173;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _577 = _575 != 0;
    float _579 = fma(_387, _165, _565);
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _583 = _581 != 0;
    float _585 = fma(_387, _171, _569);
    bool _587 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _589 = isnan(_561);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = 1.0 / _573;
    float _601 = fma(_409, _169, _579);
    float _603 = fma(_409, _175, _585);
    float _605 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _607 = _603 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _611 = _605 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _615 = _607 + _613;
    bool _617 = _563 > 0.5;
    float _619 = _611 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _621 = _567 > 0.5;
    float _623 = _379 * _161;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _561 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -_203;
    int _635 = _621 ? as_type<int>(_633) : as_type<int>(_203);
    float _637 = fma(_387, _159, _623);
    float _639 = _631 * _599;
    bool _641 = !_583;
    float _643 = _641 ? _203 : as_type<float>(_635);
    float _645 = fma(_409, _163, _637);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _655 = fma(_639, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _657 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = isnan(_561);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _645 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _671 = 1.0 / _653;
    bool _673 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_561);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -_643;
    float _687 = _685 + 0.5;
    float _689 = -_667;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _695 = _669 + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _561 + _697;
    float _701 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _705 = _597 * _691;
    float _707 = -_597;
    float _709 = _707 + 1.0;
    float _711 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[28].x, _619);
    float _713 = -_199;
    int _715 = _617 ? as_type<int>(_713) : as_type<int>(_199);
    float _717 = _683 * _709;
    float _719 = -_683;
    float _721 = _719 + 1.0;
    float _723 = _649 * _671;
    float _725 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].z, _711);
    float _727 = _655 * _717;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _731 = fma(_723, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _733 = !_577;
    float _735 = _733 ? _199 : as_type<float>(_715);
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    bool _739 = _725 >= 0.0;
    float _741 = _701 * _703;
    float _743 = fma(_731, _705, _737);
    float _745 = _735 + 0.5;
    out.m_52.y = _741;
    float _747 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[117].x, _743);
    float _749 = _611 * _611;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _753 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _755 = fma(_695, _695, _749);
    float _757 = _727;
    int _759 = as_type<int>(_731);
    bool _761 = _621;
    if (_739)
    {
        _757 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _763 = _757;
    float _765 = _751 * _729;
    float _767 = fma(_615, _615, _755);
    if (_739)
    {
        float _769 = _763 * 5.0;
        _759 = as_type<int>(_769);
    }
    int _771 = _759;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _775 = rsqrt(_767);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3195 = as_type<float>(_771);
        out.gl_Position.z = _3195;
    }
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _785 = _773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _765;
    if (_739)
    {
        out.m_35.x = 0.0;
    }
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_54.x = _785;
    out.m_54.y = _787;
    out.m_54.z = _789;
    out.m_54.w = _753;
    float _797 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _611 * _775;
    float _805 = _695 * _775;
    out.m_56.x = _797;
    out.m_56.y = _799;
    out.m_56.z = _801;
    out.m_56.w = _783;
    if (_739)
    {
        return out;
    }
    float _807 = -_803;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _811 = _615 * _775;
    float _813 = -_805;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _819 = _809 + _817;
    float _821 = -_811;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _827 = _815 + _825;
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _833 = _823 + _831;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[28].x, _829);
    float _837 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[28].z, _835);
    bool _839 = _837 >= 0.0;
    if (_839)
    {
        _777 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _841 = _777;
    int _843 = as_type<int>(_841);
    if (_839)
    {
        out.m_35.x = 0.0;
    }
    if (_839)
    {
        float _845 = _841 * 5.0;
        _843 = as_type<int>(_845);
    }
    int _847 = _843;
    if (_839)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3369 = as_type<float>(_847);
        out.gl_Position.z = _3369;
    }
    if (_839)
    {
        return out;
    }
    float _849 = -_605;
    float _851 = _849 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = -_669;
    float _855 = _853 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _857 = _851 * _851;
    float _859 = -_607;
    float _861 = _859 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _863 = -_803;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _867 = fma(_855, _855, _857);
    float _869 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _871 = -_805;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _695);
    float _875 = _865 * _865;
    float _877 = fma(_861, _861, _867);
    float _879 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _869);
    float _881 = -_811;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    float _885 = fma(_873, _873, _875);
    float _887 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _879);
    float _889 = rsqrt(_877);
    float _891 = fma(_883, _883, _885);
    float _893 = rsqrt(_887);
    float _895 = _855 * _889;
    float _897 = _861 * _889;
    float _899 = _851 * _889;
    float _901 = -_605;
    float _903 = _901 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _905 = sqrt(_891);
    float _907 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _909 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _911 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _913 = _907 * _895;
    float _915 = _909 * _897;
    float _917 = _911 * _899;
    float _919 = -_913;
    float _921 = fma(_909, _899, _919);
    float _923 = -_915;
    float _925 = fma(_911, _895, _923);
    float _927 = -_917;
    float _929 = fma(_907, _897, _927);
    float _931 = -_669;
    float _933 = _931 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _935 = _895 * _921;
    float _937 = _897 * _925;
    float _939 = _899 * _929;
    float _941 = -_935;
    float _943 = fma(_897, _929, _941);
    float _945 = -_937;
    float _947 = fma(_899, _921, _945);
    float _949 = -_939;
    float _951 = fma(_895, _925, _949);
    float _953 = _903 * _943;
    float _955 = _925 * _903;
    float _957 = fma(_933, _947, _953);
    float _959 = -_607;
    float _961 = _959 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _963 = fma(_929, _933, _955);
    float _965 = fma(_961, _951, _957);
    float _967 = fma(_921, _961, _963);
    float _969 = _965 * _965;
    float _971 = fma(_967, _967, _969);
    float _973 = rsqrt(_971);
    float _975 = _967 * _973;
    float _977 = _965 * _973;
    float _979 = abs(_975);
    float _981 = abs(_977);
    float _983 = precise::max(_979, _981);
    bool _985 = _983 >= 16.0;
    float _987 = _899 * _899;
    float _989 = fma(_895, _895, _987);
    float _991 = fma(_897, _897, _989);
    float _993 = _977;
    float _995 = _975;
    int _997 = as_type<int>(_987);
    if (_985)
    {
        float _999 = _977 * 0.0625;
        _993 = _999;
    }
    float _1001 = _993;
    if (_985)
    {
        float _1003 = _975 * 0.0625;
        _995 = _1003;
    }
    float _1005 = _995;
    float _1007 = rsqrt(_991);
    float _1009 = abs(_1001);
    bool _1011 = _1009 != 0.0;
    bool _1013 = isnan(_1009);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan(0.0);
    bool _1019 = _1015 || _1017;
    float _1021 = abs(_1005);
    bool _1023 = _1021 == 0.0;
    float _1025 = abs(_1005);
    bool _1027 = _1025 == 0.0;
    bool _1029 = !_1019;
    bool _1031 = _1027 && _1029;
    if (_1031)
    {
        bool _1033 = as_type<int>(_1005) >= 0;
        _761 = _1033;
    }
    bool _1035 = _761;
    int _1037 = _1035 ? (-1) : 0;
    if (_1031)
    {
        int _1039 = _1035 ? 0 : 1078530011;
        _997 = _1039;
    }
    int _1041 = _997;
    int _1043 = _1041;
    if (_1031)
    {
        int _1045 = int(0x80000000) & as_type<int>(_1001);
        int _1047 = _1041 | _1045;
        _1043 = _1047;
    }
    int _1049 = _1043;
    bool _1051 = !_1019;
    bool _1053 = _1051 && _1023;
    int _1055 = _1049;
    float _1057 = as_type<float>(_1049);
    if (!_1053)
    {
        float _1059 = abs(_1001);
        bool _1061 = _1059 != as_type<float>(0x7f800000u /* inf */);
        bool _1063 = isnan(_1059);
        bool _1065 = _1061 || _1063;
        bool _1067 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1069 = _1065 || _1067;
        float _1071 = abs(_1005);
        bool _1073 = _1071 == as_type<float>(0x7f800000u /* inf */);
        float _1075 = abs(_1005);
        bool _1077 = _1075 == as_type<float>(0x7f800000u /* inf */);
        bool _1079 = !_1069;
        bool _1081 = _1077 && _1079;
        if (_1081)
        {
            bool _1083 = as_type<int>(_1005) >= 0;
            _1037 = _1083 ? (-1) : 0;
        }
        int _1085 = _1037;
        if (_1081)
        {
            _1055 = 1075235812;
        }
        int _1087 = _1055;
        int _1089 = _1087;
        if (_1081)
        {
            int _1091 = ~_1085;
            int _1093 = (_1091 != 0) ? _1087 : 1061752795;
            _1089 = _1093;
        }
        int _1095 = _1089;
        float _1097 = as_type<float>(_1095);
        if (_1081)
        {
            int _1099 = int(0x80000000) & as_type<int>(_1001);
            int _1101 = _1095 | _1099;
            _1097 = as_type<float>(_1101);
        }
        float _1103 = _1097;
        bool _1105 = !_1069;
        bool _1107 = _1105 && _1073;
        _1057 = _1103;
        if (!_1107)
        {
            float _1109 = abs(_1001);
            float _1111 = abs(_1005);
            float _1113 = precise::max(_1109, _1111);
            float _1115 = abs(_1001);
            float _1117 = abs(_1005);
            float _1119 = precise::min(_1115, _1117);
            float _1121 = 1.0 / _1113;
            float _1123 = abs(_1001);
            float _1125 = abs(_1005);
            bool _1127 = _1123 > _1125;
            bool _1129 = as_type<int>(_1005) >= 0;
            float _1131 = abs(_1001);
            float _1133 = abs(_1005);
            float _1135 = _1131 + _1133;
            int _1137 = as_type<int>(_1001) & int(0x80000000);
            bool _1139 = _1135 > as_type<float>(0x7f800000u /* inf */);
            bool _1141 = isnan(_1135);
            bool _1143 = _1139 || _1141;
            bool _1145 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1147 = _1143 || _1145;
            float _1149 = _1119 * _1121;
            float _1151 = _1149 * _1149;
            float _1153 = _1151 + 11.33538818359375;
            float _1155 = fma(_1151, _1153, 28.84246826171875);
            float _1157 = fma(_1151, _1155, 19.6966705322265625);
            float _1159 = fma(_1151, -0.82336294651031494140625, -5.674867153167724609375);
            float _1161 = fma(_1151, _1159, -6.565555095672607421875);
            float _1163 = 1.0 / _1157;
            float _1165 = _1151 * _1161;
            float _1167 = _1149 * _1165;
            float _1169 = fma(_1167, _1163, _1149);
            float _1171 = _1169;
            _1057 = _1135;
            if (_1127)
            {
                float _1173 = -_1169;
                float _1175 = _1173 + 1.57079637050628662109375;
                _1171 = _1175;
            }
            float _1177 = _1171;
            int _1179 = as_type<int>(_1177);
            if (!_1129)
            {
                float _1181 = -_1177;
                float _1183 = _1181 + 3.1415927410125732421875;
                _1179 = as_type<int>(_1183);
            }
            int _1185 = _1179;
            if (!_1147)
            {
                int _1187 = _1137 | _1185;
                _1057 = as_type<float>(_1187);
            }
        }
    }
    float _1189 = _1057;
    float _1191 = _1189 + 1.57079637050628662109375;
    float _1193 = _775 * _905;
    float _1195 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1197 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = _1191 * 0.15915493667125701904296875;
    float _1201 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1203 = _1193 * _1195;
    float _1205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1207 = _1193 * _1197;
    float _1209 = _1199 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1201 * _1203;
    float _1215 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1217 = _1215 * 0.5;
    float _1219 = _1205 * _1207;
    float _1221 = _895 * _1007;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1225 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1229 = _1199 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1223);
    float _1235 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1237 = _897 * _1007;
    float _1239 = _899 * _1007;
    float _1241 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1233);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1227);
    float _1245 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1235);
    float _1247 = -_1211;
    float _1249 = _1247 + 1.0;
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1253 = _1237 * _1237;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1257 = _1221 * _1249;
    float _1259 = _1239 * _1249;
    float _1261 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1263 = _1237 * _1231;
    float _1265 = _1221 * _1231;
    float _1267 = _1239 * _1231;
    float _1269 = fma(_1221, _1257, _1211);
    float _1271 = -_1263;
    float _1273 = fma(_1239, _1257, _1271);
    float _1275 = fma(_1237, _1259, _1265);
    float _1277 = _1255 * _1273;
    float _1279 = fma(_1249, _1253, _1211);
    float _1281 = -_1267;
    float _1283 = fma(_1237, _1257, _1281);
    float _1285 = _1255 * _1275;
    float _1287 = fma(_1251, _1269, _1277);
    float _1289 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1291 = fma(_1237, _1257, _1267);
    float _1293 = fma(_1251, _1283, _1285);
    float _1295 = fma(_1239, _1259, _1211);
    float _1297 = fma(_1239, _1257, _1263);
    float _1299 = fma(_1289, _1291, _1287);
    float _1301 = fma(_1289, _1279, _1293);
    float _1303 = _1255 * _1295;
    float _1305 = -_1265;
    float _1307 = fma(_1237, _1259, _1305);
    float _1309 = _669 + _1299;
    float _1311 = _607 + _1301;
    float _1313 = fma(_1251, _1297, _1303);
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1309 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1321 = _1311 + _1319;
    float _1323 = fma(_1289, _1307, _1313);
    float _1325 = _1317 * _1317;
    float _1327 = _1321 * _1321;
    float _1329 = _605 + _1323;
    float _1331 = _1325 + _1327;
    float _1333 = sqrt(_1331);
    bool _1335 = _1333 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1337 = !_1335;
    float _1339 = _1329;
    float _1341 = _1325;
    float _1343 = _1327;
    float _1345 = _1309;
    float _1347 = _1311;
    if (!_1337)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1353 = _1333 + _1351;
        float _1355 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = rsqrt(_1331);
        float _1359 = _1353 * _1349;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1361 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = fma(_1365, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = _1357 * _1371;
        float _1375 = fma(_1317, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1377 = _1369 + (-1.0);
        float _1379 = fma(_1321, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1383 = _1375 + _1381;
        float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1389 = _1379 + _1387;
        float _1391 = _1383 * _1383;
        float _1393 = fma(_1329, _1369, _1385);
        float _1395 = _1389 * _1389;
        _1339 = _1393;
        _1341 = _1391;
        _1343 = _1395;
        _1345 = _1375;
        _1347 = _1379;
    }
    float _1397 = _1339;
    float _1399 = _1341;
    float _1401 = _1343;
    float _1403 = _1345;
    float _1405 = _1347;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1409 = _1397 + _1407;
    out.m_54.x = _785;
    out.m_54.y = _787;
    out.m_54.z = _789;
    out.m_54.w = _753;
    float _1411 = fma(_1409, _1409, _1399);
    out.m_56.x = _797;
    out.m_56.y = _799;
    out.m_56.z = _801;
    out.m_56.w = _783;
    float _1413 = _1411 + _1401;
    float _1415 = sqrt(_1413);
    bool _1417 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1419 = isnan(_1415);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1425 = _1421 || _1423;
    float _1427 = _1409;
    if (!_1425)
    {
        _1427 = 1.0;
    }
    float _1429 = _1427;
    bool _1431 = !_1425;
    float _1433 = _1429;
    if (!_1431)
    {
        bool _1435 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1437 = isnan(_1415);
        bool _1439 = _1435 || _1437;
        bool _1441 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1443 = _1439 || _1441;
        if (!_1443)
        {
            float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1447 = _1415 + _1445;
            float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1451 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1449;
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1457 = 1.0 / _1451;
            float _1459 = _1447 * _1457;
            float _1461 = fma(_1459, _1455, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1433 = _1461;
            _1463 = true;
        }
        else
        {
            bool _1465 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1467 = isnan(_1415);
            bool _1469 = _1465 || _1467;
            bool _1471 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1473 = _1469 || _1471;
            if (!_1473)
            {
                float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1477 = _1415 + _1475;
                float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1485 = _1483 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1487 = 1.0 / _1481;
                float _1489 = _1477 * _1487;
                float _1491 = fma(_1489, _1485, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1433 = _1491;
                _1463 = true;
            }
            else
            {
                _1433 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1463 = false;
    float _1493 = _1433;
    float _1495 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1497 = _1397 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1501 = _1403 + _1499;
    float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1505 = _1405 + _1503;
    float _1507 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1509 = fma(_1501, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1511 = fma(_1505, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1513 = -_605;
    float _1515 = _1513 + _1507;
    float _1517 = -_669;
    float _1519 = _1517 + _1509;
    float _1521 = -_607;
    float _1523 = _1521 + _1511;
    float _1525 = _1515 * _1515;
    float _1527 = fma(_1519, _1519, _1525);
    float _1529 = fma(_1523, _1523, _1527);
    float _1531 = sqrt(_1529);
    bool _1533 = _1531 > 0.0;
    bool _1535 = !_1533;
    float _1537 = _1493;
    float _1539 = _1531;
    float _1541 = _1507;
    float _1543 = _1511;
    float _1545 = _1509;
    if (!_1535)
    {
        bool _1547 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1549 = _1497;
        if (_1547)
        {
            float _1551 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1549 = _1551;
        }
        float _1553 = _1549;
        float _1555 = _1553;
        if (_1547)
        {
            float _1557 = _411 * _1553;
            _1537 = _1557;
        }
        float _1559 = _1537;
        float _1561 = _1559;
        if (_1547)
        {
            float _1563 = _413 * _1553;
            _1539 = _1563;
        }
        float _1565 = _1539;
        float _1567 = _1565;
        float _1569 = _1565;
        if (_1547)
        {
            float _1571 = _415 * _1553;
            _1555 = _1571;
        }
        float _1573 = _1555;
        float _1575 = _1573;
        if (!_1547)
        {
            float _1577 = _113 + 1.0;
            float _1579 = _1577;
            if (!_145)
            {
                float _1581 = _1577 * _1577;
                float _1583 = _1581 * 0.5;
                _1567 = _1583;
            }
            float _1585 = _1567;
            float _1587 = _1585;
            if (!_145)
            {
                float _1589 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1587 = _1589;
            }
            float _1591 = _1587;
            bool _1593 = !_145;
            float _1595 = _1591;
            if (!_1593)
            {
                float _1597 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1599 = log2(_1597);
                float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1603 = _1601 + 1.0;
                float _1605 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1607 = _1599 * _1577;
                float _1609 = 1.0 / _1603;
                float _1611 = _1605 * 0.693147182464599609375;
                float _1613 = exp2(_1607);
                float _1615 = 1.0 / _1611;
                float _1617 = _1613 + (-1.0);
                float _1619 = -_1617;
                float _1621 = fma(_1619, _1615, _1577);
                float _1623 = _1621 * _1609;
                float _1625 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1595 = _1625;
            }
            float _1627 = _1595;
            float _1629 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1631 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1633 = !_145;
            if (!_1633)
            {
                float _1635 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1637 = log2(_1635);
                float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1641 = _1639 + 1.0;
                float _1643 = 1.0 / _1641;
                float _1645 = _1637 * _1577;
                float _1647 = exp2(_1645);
                float _1649 = -_1647;
                float _1651 = _1649 + 1.0;
                float _1653 = _1651 * _1643;
                _1579 = _1653;
            }
            float _1655 = _1579;
            float _1657 = fma(_1655, _149, _1631);
            float _1659 = fma(_1655, _147, _1629);
            float _1661 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1663 = -_373;
            float _1665 = _1663 + _1657;
            float _1667 = -_377;
            float _1669 = _1667 + _1659;
            float _1671 = fma(_1655, _151, _1661);
            float _1673 = _1665 * _161;
            float _1675 = _1665 * _167;
            float _1677 = _1665 * _173;
            float _1679 = -_385;
            float _1681 = _1679 + _1671;
            float _1683 = fma(_1669, _159, _1673);
            float _1685 = fma(_1669, _165, _1675);
            float _1687 = fma(_1669, _171, _1677);
            float _1689 = fma(_1681, _163, _1683);
            float _1691 = fma(_1681, _169, _1685);
            float _1693 = fma(_1681, _175, _1687);
            _419 = _1691;
            _421 = _1689;
            _423 = _1693;
            _1561 = _1689;
            _1569 = _1691;
            _1575 = _1693;
        }
        float _1695 = _419;
        float _1697 = _421;
        float _1699 = _423;
        float _1701 = _1561;
        float _1703 = _1569;
        float _1705 = _1575;
        float _1707 = _1695 * _1695;
        float _1709 = rsqrt(_1529);
        float _1711 = fma(_1697, _1697, _1707);
        float _1713 = fma(_1699, _1699, _1711);
        float _1715 = sqrt(_1713);
        float _1717 = _1519 * _1709;
        float _1719 = _1515 * _1709;
        float _1721 = _1523 * _1709;
        bool _1723 = _1715 > 0.0;
        bool _1725 = !_1723;
        if (!_1725)
        {
            float _1727 = rsqrt(_1713);
            float _1729 = _1727 * _1695;
            float _1731 = _1727 * _1697;
            float _1733 = _1727 * _1699;
            float _1735 = _1719 * _1729;
            float _1737 = fma(_1717, _1731, _1735);
            float _1739 = fma(_1721, _1733, _1737);
            float _1741 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1743 = fma(_1701, _1741, _1509);
            float _1745 = fma(_1703, _1741, _1507);
            float _1747 = fma(_1705, _1741, _1511);
            _1541 = _1745;
            _1543 = _1747;
            _1545 = _1743;
        }
    }
    float _1749 = _1541;
    float _1751 = _1543;
    float _1753 = _1545;
    float _1755 = _809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1757 = -_803;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1749);
    float _1761 = -_811;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1751);
    float _1765 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1767 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1765);
    bool _1769 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(0.5);
    bool _1777 = _1773 || _1775;
    float _1779 = _809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1781 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1783 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1779);
    float _1785 = -_805;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1789 = 1.0 / _1781;
    float _1791 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1783);
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = _1783;
    float _1797 = _1791;
    float _1799 = _1787;
    if (_1777)
    {
        _1795 = _1759;
    }
    float _1801 = _1795;
    float _1803 = _1801;
    if (_1777)
    {
        _1797 = _1763;
    }
    float _1805 = _1797;
    float _1807 = _1805;
    if (!_1777)
    {
        float _1809 = _819 * _819;
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1813 = -_607;
        float _1815 = _1813 + _1751;
        float _1817 = fma(_827, _827, _1809);
        float _1819 = fma(_833, _833, _1817);
        float _1821 = 1.0 / _1193;
        float _1823 = sqrt(_1819);
        float _1825 = precise::min(_1823, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1827 = _1825 * _1811;
        float _1829 = -_669;
        float _1831 = _1829 + _1753;
        float _1833 = _1827 * _1821;
        float _1835 = -_605;
        float _1837 = _1835 + _1749;
        float _1839 = fma(_1831, _1833, _815);
        float _1841 = fma(_1837, _1833, _809);
        float _1843 = fma(_1815, _1833, _823);
        _1803 = _1841;
        _1799 = _1839;
        _1807 = _1843;
    }
    float _1845 = _1803;
    float _1847 = _1799;
    float _1849 = _1807;
    float _1851 = _1793 + _1781;
    float _1853 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1855 = _1851 * _1789;
    float _1857 = _1855 * 0.5;
    float _1859 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1861 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1853);
    bool _1863 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(0.5);
    bool _1871 = _1867 || _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1875 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1873);
    float _1877 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1859);
    float _1879 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1881 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1885 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1877);
    float _1887 = 1.0 / _1875;
    float _1889 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1895 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1883);
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1905 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1891);
    float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1909 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1899);
    float _1911 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1901);
    float _1913 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1903);
    float _1915 = _1897;
    float _1917 = _1893;
    if (_1871)
    {
        _1915 = 1.0;
    }
    float _1919 = _1915;
    float _1921 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1923 = _1919;
    if (_1871)
    {
        _1917 = 1.0;
    }
    float _1925 = _1917;
    float _1927 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1931 = _1887 * _1929;
    float _1933 = _1925;
    if (!_1871)
    {
        float _1935 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1937 = _1935 * 0.15915493667125701904296875;
        float _1939 = _1937 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1945 = _1943 * 0.15915493667125701904296875;
        float _1947 = _1937 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = 1.0 / _1941;
        float _1953 = _1945 * 6.283185482025146484375;
        float _1955 = cos(_1953);
        float _1957 = _1949 * _1951;
        float _1959 = _1945 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1965 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1963;
        float _1967 = _1955 * _1957;
        float _1969 = 1.0 / _1965;
        float _1971 = 1.0 / _1967;
        float _1973 = _1961 * _1971;
        float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1977 = fma(_1931, _1973, _1975);
        float _1979 = _1977 * _1969;
        float _1981 = precise::clamp(_1979, 0.0, 1.0);
        _1923 = _1981;
    }
    float _1983 = _1923;
    if (!_1871)
    {
        float _1985 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1987 = _1985 * 0.15915493667125701904296875;
        float _1989 = _1987 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        float _1993 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1995 = _1993 * 0.15915493667125701904296875;
        float _1997 = _1987 * 6.283185482025146484375;
        float _1999 = sin(_1997);
        float _2001 = 1.0 / _1991;
        float _2003 = _1995 * 6.283185482025146484375;
        float _2005 = cos(_2003);
        float _2007 = _1999 * _2001;
        float _2009 = _1995 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = 1.0 / _2013;
        float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2017;
        float _2021 = 1.0 / _2019;
        float _2023 = _2011 * _2015;
        float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2027 = fma(_1931, _2023, _2025);
        float _2029 = _2027 * _2021;
        float _2031 = precise::clamp(_2029, 0.0, 1.0);
        float _2033 = -_2031;
        float _2035 = _2033 + 1.0;
        _1933 = _2035;
    }
    float _2037 = _1933;
    float _2039 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2041 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1911);
    float _2043 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1913);
    bool _2045 = _1983 > 0.0;
    bool _2047 = isnan(_1983);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1907);
    float _2057 = _1983 * _2037;
    float _2059 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2041);
    float _2061 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2043);
    bool _2063 = _2037 <= 0.0;
    bool _2065 = !_2053;
    bool _2067 = _2063 || _2065;
    float _2069 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1909);
    float _2071 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2073 = _2059 + _2061;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2077 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2069);
    float _2079 = _2073 * 0.5;
    float _2081 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1847;
    out.m_58.y = _1845;
    out.m_58.z = _1849;
    out.gl_Position.x = _2071;
    out.gl_Position.y = _2077;
    out.gl_Position.z = _2059;
    out.gl_Position.w = _2061;
    out.m_60.z = _2079;
    out.m_60.w = _2061;
    out.m_35.x = _2081;
    if (!_2067)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _2083 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2083;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1463 = false;
    bool _553 = false;
    bool _443 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
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
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2140 = as_type<float>(_95);
        out.gl_Position.z = _2140;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_109)
    {
        float _115 = float(_79);
        _89 = _115;
    }
    float _117 = _89;
    bool _119 = _113 >= _117;
    bool _121 = !_109;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2209 = as_type<float>(_131);
        out.gl_Position.z = _2209;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = in.m_46.x;
    float _167 = in.m_46.y;
    float _169 = in.m_46.z;
    float _171 = in.m_48.x;
    float _173 = in.m_48.y;
    float _175 = in.m_48.z;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    float _185 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _187 = 0.0;
    float _189 = _185;
    if (!_145)
    {
        float _191 = _185 * _185;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _195;
    if (!_145)
    {
        float _207 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_145;
    float _213 = _209;
    float _215 = 0.0;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _185 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _185);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _215 = _229;
    }
    float _247 = _213;
    float _249 = _215;
    bool _251 = !_145;
    float _253 = _249;
    float _255 = _247;
    if (!_251)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _185 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _189 = _275;
    }
    float _277 = _189;
    float _279 = 0.0;
    if (!_145)
    {
        float _281 = _113 * _113;
        float _283 = _281 * 0.5;
        _279 = _283;
    }
    float _285 = _279;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_145)
    {
        _253 = _113;
    }
    float _293 = _253;
    float _295 = fma(_277, _147, _287);
    float _297 = fma(_277, _149, _289);
    float _299 = _293;
    if (!_145)
    {
        float _301 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _301;
    }
    float _303 = _255;
    bool _305 = !_145;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _113 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _113);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_145;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _113 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_277, _151, _291);
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _373 = fma(_363, _149, _365);
    float _375 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_363, _147, _367);
    float _379 = fma(_297, _135, _155);
    float _381 = -_373;
    float _383 = _297 + _381;
    float _385 = fma(_363, _151, _375);
    float _387 = fma(_295, _135, _153);
    float _389 = -_377;
    float _391 = _295 + _389;
    float _393 = _383 * _161;
    float _395 = _383 * _167;
    float _397 = _383 * _173;
    float _399 = -_385;
    float _401 = _369 + _399;
    float _403 = fma(_391, _159, _393);
    float _405 = fma(_391, _165, _395);
    float _407 = fma(_391, _171, _397);
    float _409 = fma(_369, _135, _157);
    float _411 = fma(_401, _163, _403);
    float _413 = fma(_401, _169, _405);
    float _415 = fma(_401, _175, _407);
    bool _417 = !_371;
    float _419 = _413;
    float _421 = _411;
    float _423 = _415;
    float _441;
    if (!_417)
    {
        float _425 = in.m_50.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_79);
        float _447 = 1.0 / _445;
        float _449 = _113 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = _451 + _453;
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _479 = 1.0 / _475;
    float _481 = -_471;
    float _483 = _481 + 1.0;
    float _485 = _455 * _479;
    bool _487 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _489 = isnan(_451);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _503;
    float _507 = _497 * _483;
    float _509 = fma(_501, _485, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _511 = fma(_505, _485, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _513 = -_497;
    float _515 = _513 + 1.0;
    float _517 = _509 * _507;
    float _519 = _511 * _507;
    float _521 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _523 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].y, _519);
    float _525 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].x, _521);
    float _527 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].y, _523);
    float _529 = _525 * _457;
    float _531 = _527 * _459;
    bool _533 = !_477;
    float _551;
    if (!_533)
    {
        float _535 = in.m_50.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_79);
        float _557 = 1.0 / _555;
        float _559 = _113 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = in.m_50.x;
    float _565 = _379 * _167;
    float _567 = in.m_50.y;
    float _569 = _379 * _173;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _577 = _575 != 0;
    float _579 = fma(_387, _165, _565);
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _583 = _581 != 0;
    float _585 = fma(_387, _171, _569);
    bool _587 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _589 = isnan(_561);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = 1.0 / _573;
    float _601 = fma(_409, _169, _579);
    float _603 = fma(_409, _175, _585);
    float _605 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _607 = _603 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _611 = _605 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _615 = _607 + _613;
    bool _617 = _563 > 0.5;
    float _619 = _611 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _621 = _567 > 0.5;
    float _623 = _379 * _161;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _561 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -_203;
    int _635 = _621 ? as_type<int>(_633) : as_type<int>(_203);
    float _637 = fma(_387, _159, _623);
    float _639 = _631 * _599;
    bool _641 = !_583;
    float _643 = _641 ? _203 : as_type<float>(_635);
    float _645 = fma(_409, _163, _637);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _655 = fma(_639, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _657 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = isnan(_561);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _645 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _671 = 1.0 / _653;
    bool _673 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_561);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -_643;
    float _687 = _685 + 0.5;
    float _689 = -_667;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _695 = _669 + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _561 + _697;
    float _701 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _705 = _597 * _691;
    float _707 = -_597;
    float _709 = _707 + 1.0;
    float _711 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[28].x, _619);
    float _713 = -_199;
    int _715 = _617 ? as_type<int>(_713) : as_type<int>(_199);
    float _717 = _683 * _709;
    float _719 = -_683;
    float _721 = _719 + 1.0;
    float _723 = _649 * _671;
    float _725 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].z, _711);
    float _727 = _655 * _717;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _731 = fma(_723, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _733 = !_577;
    float _735 = _733 ? _199 : as_type<float>(_715);
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    bool _739 = _725 >= 0.0;
    float _741 = _701 * _703;
    float _743 = fma(_731, _705, _737);
    float _745 = _735 + 0.5;
    out.m_52.y = _741;
    float _747 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[117].x, _743);
    float _749 = _611 * _611;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _753 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _755 = fma(_695, _695, _749);
    float _757 = _727;
    int _759 = as_type<int>(_731);
    bool _761 = _621;
    if (_739)
    {
        _757 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _763 = _757;
    float _765 = _751 * _729;
    float _767 = fma(_615, _615, _755);
    if (_739)
    {
        float _769 = _763 * 5.0;
        _759 = as_type<int>(_769);
    }
    int _771 = _759;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _775 = rsqrt(_767);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3195 = as_type<float>(_771);
        out.gl_Position.z = _3195;
    }
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _785 = _773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _765;
    if (_739)
    {
        out.m_35.x = 0.0;
    }
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_54.x = _785;
    out.m_54.y = _787;
    out.m_54.z = _789;
    out.m_54.w = _753;
    float _797 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _611 * _775;
    float _805 = _695 * _775;
    out.m_56.x = _797;
    out.m_56.y = _799;
    out.m_56.z = _801;
    out.m_56.w = _783;
    if (_739)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _807 = -_803;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _811 = _615 * _775;
    float _813 = -_805;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _819 = _809 + _817;
    float _821 = -_811;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _827 = _815 + _825;
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _833 = _823 + _831;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[28].x, _829);
    float _837 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[28].z, _835);
    bool _839 = _837 >= 0.0;
    if (_839)
    {
        _777 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _841 = _777;
    int _843 = as_type<int>(_841);
    if (_839)
    {
        out.m_35.x = 0.0;
    }
    if (_839)
    {
        float _845 = _841 * 5.0;
        _843 = as_type<int>(_845);
    }
    int _847 = _843;
    if (_839)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3369 = as_type<float>(_847);
        out.gl_Position.z = _3369;
    }
    if (_839)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _849 = -_605;
    float _851 = _849 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = -_669;
    float _855 = _853 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _857 = _851 * _851;
    float _859 = -_607;
    float _861 = _859 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _863 = -_803;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _867 = fma(_855, _855, _857);
    float _869 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _871 = -_805;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _695);
    float _875 = _865 * _865;
    float _877 = fma(_861, _861, _867);
    float _879 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _869);
    float _881 = -_811;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    float _885 = fma(_873, _873, _875);
    float _887 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _879);
    float _889 = rsqrt(_877);
    float _891 = fma(_883, _883, _885);
    float _893 = rsqrt(_887);
    float _895 = _855 * _889;
    float _897 = _861 * _889;
    float _899 = _851 * _889;
    float _901 = -_605;
    float _903 = _901 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _905 = sqrt(_891);
    float _907 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _909 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _911 = _893 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _913 = _907 * _895;
    float _915 = _909 * _897;
    float _917 = _911 * _899;
    float _919 = -_913;
    float _921 = fma(_909, _899, _919);
    float _923 = -_915;
    float _925 = fma(_911, _895, _923);
    float _927 = -_917;
    float _929 = fma(_907, _897, _927);
    float _931 = -_669;
    float _933 = _931 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _935 = _895 * _921;
    float _937 = _897 * _925;
    float _939 = _899 * _929;
    float _941 = -_935;
    float _943 = fma(_897, _929, _941);
    float _945 = -_937;
    float _947 = fma(_899, _921, _945);
    float _949 = -_939;
    float _951 = fma(_895, _925, _949);
    float _953 = _903 * _943;
    float _955 = _925 * _903;
    float _957 = fma(_933, _947, _953);
    float _959 = -_607;
    float _961 = _959 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _963 = fma(_929, _933, _955);
    float _965 = fma(_961, _951, _957);
    float _967 = fma(_921, _961, _963);
    float _969 = _965 * _965;
    float _971 = fma(_967, _967, _969);
    float _973 = rsqrt(_971);
    float _975 = _967 * _973;
    float _977 = _965 * _973;
    float _979 = abs(_975);
    float _981 = abs(_977);
    float _983 = precise::max(_979, _981);
    bool _985 = _983 >= 16.0;
    float _987 = _899 * _899;
    float _989 = fma(_895, _895, _987);
    float _991 = fma(_897, _897, _989);
    float _993 = _977;
    float _995 = _975;
    int _997 = as_type<int>(_987);
    if (_985)
    {
        float _999 = _977 * 0.0625;
        _993 = _999;
    }
    float _1001 = _993;
    if (_985)
    {
        float _1003 = _975 * 0.0625;
        _995 = _1003;
    }
    float _1005 = _995;
    float _1007 = rsqrt(_991);
    float _1009 = abs(_1001);
    bool _1011 = _1009 != 0.0;
    bool _1013 = isnan(_1009);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan(0.0);
    bool _1019 = _1015 || _1017;
    float _1021 = abs(_1005);
    bool _1023 = _1021 == 0.0;
    float _1025 = abs(_1005);
    bool _1027 = _1025 == 0.0;
    bool _1029 = !_1019;
    bool _1031 = _1027 && _1029;
    if (_1031)
    {
        bool _1033 = as_type<int>(_1005) >= 0;
        _761 = _1033;
    }
    bool _1035 = _761;
    int _1037 = _1035 ? (-1) : 0;
    if (_1031)
    {
        int _1039 = _1035 ? 0 : 1078530011;
        _997 = _1039;
    }
    int _1041 = _997;
    int _1043 = _1041;
    if (_1031)
    {
        int _1045 = int(0x80000000) & as_type<int>(_1001);
        int _1047 = _1041 | _1045;
        _1043 = _1047;
    }
    int _1049 = _1043;
    bool _1051 = !_1019;
    bool _1053 = _1051 && _1023;
    int _1055 = _1049;
    float _1057 = as_type<float>(_1049);
    if (!_1053)
    {
        float _1059 = abs(_1001);
        bool _1061 = _1059 != as_type<float>(0x7f800000u /* inf */);
        bool _1063 = isnan(_1059);
        bool _1065 = _1061 || _1063;
        bool _1067 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1069 = _1065 || _1067;
        float _1071 = abs(_1005);
        bool _1073 = _1071 == as_type<float>(0x7f800000u /* inf */);
        float _1075 = abs(_1005);
        bool _1077 = _1075 == as_type<float>(0x7f800000u /* inf */);
        bool _1079 = !_1069;
        bool _1081 = _1077 && _1079;
        if (_1081)
        {
            bool _1083 = as_type<int>(_1005) >= 0;
            _1037 = _1083 ? (-1) : 0;
        }
        int _1085 = _1037;
        if (_1081)
        {
            _1055 = 1075235812;
        }
        int _1087 = _1055;
        int _1089 = _1087;
        if (_1081)
        {
            int _1091 = ~_1085;
            int _1093 = (_1091 != 0) ? _1087 : 1061752795;
            _1089 = _1093;
        }
        int _1095 = _1089;
        float _1097 = as_type<float>(_1095);
        if (_1081)
        {
            int _1099 = int(0x80000000) & as_type<int>(_1001);
            int _1101 = _1095 | _1099;
            _1097 = as_type<float>(_1101);
        }
        float _1103 = _1097;
        bool _1105 = !_1069;
        bool _1107 = _1105 && _1073;
        _1057 = _1103;
        if (!_1107)
        {
            float _1109 = abs(_1001);
            float _1111 = abs(_1005);
            float _1113 = precise::max(_1109, _1111);
            float _1115 = abs(_1001);
            float _1117 = abs(_1005);
            float _1119 = precise::min(_1115, _1117);
            float _1121 = 1.0 / _1113;
            float _1123 = abs(_1001);
            float _1125 = abs(_1005);
            bool _1127 = _1123 > _1125;
            bool _1129 = as_type<int>(_1005) >= 0;
            float _1131 = abs(_1001);
            float _1133 = abs(_1005);
            float _1135 = _1131 + _1133;
            int _1137 = as_type<int>(_1001) & int(0x80000000);
            bool _1139 = _1135 > as_type<float>(0x7f800000u /* inf */);
            bool _1141 = isnan(_1135);
            bool _1143 = _1139 || _1141;
            bool _1145 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1147 = _1143 || _1145;
            float _1149 = _1119 * _1121;
            float _1151 = _1149 * _1149;
            float _1153 = _1151 + 11.33538818359375;
            float _1155 = fma(_1151, _1153, 28.84246826171875);
            float _1157 = fma(_1151, _1155, 19.6966705322265625);
            float _1159 = fma(_1151, -0.82336294651031494140625, -5.674867153167724609375);
            float _1161 = fma(_1151, _1159, -6.565555095672607421875);
            float _1163 = 1.0 / _1157;
            float _1165 = _1151 * _1161;
            float _1167 = _1149 * _1165;
            float _1169 = fma(_1167, _1163, _1149);
            float _1171 = _1169;
            _1057 = _1135;
            if (_1127)
            {
                float _1173 = -_1169;
                float _1175 = _1173 + 1.57079637050628662109375;
                _1171 = _1175;
            }
            float _1177 = _1171;
            int _1179 = as_type<int>(_1177);
            if (!_1129)
            {
                float _1181 = -_1177;
                float _1183 = _1181 + 3.1415927410125732421875;
                _1179 = as_type<int>(_1183);
            }
            int _1185 = _1179;
            if (!_1147)
            {
                int _1187 = _1137 | _1185;
                _1057 = as_type<float>(_1187);
            }
        }
    }
    float _1189 = _1057;
    float _1191 = _1189 + 1.57079637050628662109375;
    float _1193 = _775 * _905;
    float _1195 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1197 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = _1191 * 0.15915493667125701904296875;
    float _1201 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1203 = _1193 * _1195;
    float _1205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1207 = _1193 * _1197;
    float _1209 = _1199 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1201 * _1203;
    float _1215 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1217 = _1215 * 0.5;
    float _1219 = _1205 * _1207;
    float _1221 = _895 * _1007;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1225 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1229 = _1199 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1223);
    float _1235 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1237 = _897 * _1007;
    float _1239 = _899 * _1007;
    float _1241 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1233);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1227);
    float _1245 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1235);
    float _1247 = -_1211;
    float _1249 = _1247 + 1.0;
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1253 = _1237 * _1237;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1257 = _1221 * _1249;
    float _1259 = _1239 * _1249;
    float _1261 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1263 = _1237 * _1231;
    float _1265 = _1221 * _1231;
    float _1267 = _1239 * _1231;
    float _1269 = fma(_1221, _1257, _1211);
    float _1271 = -_1263;
    float _1273 = fma(_1239, _1257, _1271);
    float _1275 = fma(_1237, _1259, _1265);
    float _1277 = _1255 * _1273;
    float _1279 = fma(_1249, _1253, _1211);
    float _1281 = -_1267;
    float _1283 = fma(_1237, _1257, _1281);
    float _1285 = _1255 * _1275;
    float _1287 = fma(_1251, _1269, _1277);
    float _1289 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1291 = fma(_1237, _1257, _1267);
    float _1293 = fma(_1251, _1283, _1285);
    float _1295 = fma(_1239, _1259, _1211);
    float _1297 = fma(_1239, _1257, _1263);
    float _1299 = fma(_1289, _1291, _1287);
    float _1301 = fma(_1289, _1279, _1293);
    float _1303 = _1255 * _1295;
    float _1305 = -_1265;
    float _1307 = fma(_1237, _1259, _1305);
    float _1309 = _669 + _1299;
    float _1311 = _607 + _1301;
    float _1313 = fma(_1251, _1297, _1303);
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1309 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1321 = _1311 + _1319;
    float _1323 = fma(_1289, _1307, _1313);
    float _1325 = _1317 * _1317;
    float _1327 = _1321 * _1321;
    float _1329 = _605 + _1323;
    float _1331 = _1325 + _1327;
    float _1333 = sqrt(_1331);
    bool _1335 = _1333 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1337 = !_1335;
    float _1339 = _1329;
    float _1341 = _1325;
    float _1343 = _1327;
    float _1345 = _1309;
    float _1347 = _1311;
    if (!_1337)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1353 = _1333 + _1351;
        float _1355 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = rsqrt(_1331);
        float _1359 = _1353 * _1349;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1361 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = fma(_1365, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = _1357 * _1371;
        float _1375 = fma(_1317, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1377 = _1369 + (-1.0);
        float _1379 = fma(_1321, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1383 = _1375 + _1381;
        float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1389 = _1379 + _1387;
        float _1391 = _1383 * _1383;
        float _1393 = fma(_1329, _1369, _1385);
        float _1395 = _1389 * _1389;
        _1339 = _1393;
        _1341 = _1391;
        _1343 = _1395;
        _1345 = _1375;
        _1347 = _1379;
    }
    float _1397 = _1339;
    float _1399 = _1341;
    float _1401 = _1343;
    float _1403 = _1345;
    float _1405 = _1347;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1409 = _1397 + _1407;
    out.m_54.x = _785;
    out.m_54.y = _787;
    out.m_54.z = _789;
    out.m_54.w = _753;
    float _1411 = fma(_1409, _1409, _1399);
    out.m_56.x = _797;
    out.m_56.y = _799;
    out.m_56.z = _801;
    out.m_56.w = _783;
    float _1413 = _1411 + _1401;
    float _1415 = sqrt(_1413);
    bool _1417 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1419 = isnan(_1415);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1425 = _1421 || _1423;
    float _1427 = _1409;
    if (!_1425)
    {
        _1427 = 1.0;
    }
    float _1429 = _1427;
    bool _1431 = !_1425;
    float _1433 = _1429;
    if (!_1431)
    {
        bool _1435 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1437 = isnan(_1415);
        bool _1439 = _1435 || _1437;
        bool _1441 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1443 = _1439 || _1441;
        if (!_1443)
        {
            float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1447 = _1415 + _1445;
            float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1451 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1449;
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1457 = 1.0 / _1451;
            float _1459 = _1447 * _1457;
            float _1461 = fma(_1459, _1455, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1433 = _1461;
            _1463 = true;
        }
        else
        {
            bool _1465 = _1415 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1467 = isnan(_1415);
            bool _1469 = _1465 || _1467;
            bool _1471 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1473 = _1469 || _1471;
            if (!_1473)
            {
                float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1477 = _1415 + _1475;
                float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1485 = _1483 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1487 = 1.0 / _1481;
                float _1489 = _1477 * _1487;
                float _1491 = fma(_1489, _1485, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1433 = _1491;
                _1463 = true;
            }
            else
            {
                _1433 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1463 = false;
    float _1493 = _1433;
    float _1495 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1497 = _1397 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1501 = _1403 + _1499;
    float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1505 = _1405 + _1503;
    float _1507 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1509 = fma(_1501, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1511 = fma(_1505, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1513 = -_605;
    float _1515 = _1513 + _1507;
    float _1517 = -_669;
    float _1519 = _1517 + _1509;
    float _1521 = -_607;
    float _1523 = _1521 + _1511;
    float _1525 = _1515 * _1515;
    float _1527 = fma(_1519, _1519, _1525);
    float _1529 = fma(_1523, _1523, _1527);
    float _1531 = sqrt(_1529);
    bool _1533 = _1531 > 0.0;
    bool _1535 = !_1533;
    float _1537 = _1493;
    float _1539 = _1531;
    float _1541 = _1507;
    float _1543 = _1511;
    float _1545 = _1509;
    if (!_1535)
    {
        bool _1547 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1549 = _1497;
        if (_1547)
        {
            float _1551 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1549 = _1551;
        }
        float _1553 = _1549;
        float _1555 = _1553;
        if (_1547)
        {
            float _1557 = _411 * _1553;
            _1537 = _1557;
        }
        float _1559 = _1537;
        float _1561 = _1559;
        if (_1547)
        {
            float _1563 = _413 * _1553;
            _1539 = _1563;
        }
        float _1565 = _1539;
        float _1567 = _1565;
        float _1569 = _1565;
        if (_1547)
        {
            float _1571 = _415 * _1553;
            _1555 = _1571;
        }
        float _1573 = _1555;
        float _1575 = _1573;
        if (!_1547)
        {
            float _1577 = _113 + 1.0;
            float _1579 = _1577;
            if (!_145)
            {
                float _1581 = _1577 * _1577;
                float _1583 = _1581 * 0.5;
                _1567 = _1583;
            }
            float _1585 = _1567;
            float _1587 = _1585;
            if (!_145)
            {
                float _1589 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1587 = _1589;
            }
            float _1591 = _1587;
            bool _1593 = !_145;
            float _1595 = _1591;
            if (!_1593)
            {
                float _1597 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1599 = log2(_1597);
                float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1603 = _1601 + 1.0;
                float _1605 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1607 = _1599 * _1577;
                float _1609 = 1.0 / _1603;
                float _1611 = _1605 * 0.693147182464599609375;
                float _1613 = exp2(_1607);
                float _1615 = 1.0 / _1611;
                float _1617 = _1613 + (-1.0);
                float _1619 = -_1617;
                float _1621 = fma(_1619, _1615, _1577);
                float _1623 = _1621 * _1609;
                float _1625 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1595 = _1625;
            }
            float _1627 = _1595;
            float _1629 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1631 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1633 = !_145;
            if (!_1633)
            {
                float _1635 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1637 = log2(_1635);
                float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1641 = _1639 + 1.0;
                float _1643 = 1.0 / _1641;
                float _1645 = _1637 * _1577;
                float _1647 = exp2(_1645);
                float _1649 = -_1647;
                float _1651 = _1649 + 1.0;
                float _1653 = _1651 * _1643;
                _1579 = _1653;
            }
            float _1655 = _1579;
            float _1657 = fma(_1655, _149, _1631);
            float _1659 = fma(_1655, _147, _1629);
            float _1661 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1663 = -_373;
            float _1665 = _1663 + _1657;
            float _1667 = -_377;
            float _1669 = _1667 + _1659;
            float _1671 = fma(_1655, _151, _1661);
            float _1673 = _1665 * _161;
            float _1675 = _1665 * _167;
            float _1677 = _1665 * _173;
            float _1679 = -_385;
            float _1681 = _1679 + _1671;
            float _1683 = fma(_1669, _159, _1673);
            float _1685 = fma(_1669, _165, _1675);
            float _1687 = fma(_1669, _171, _1677);
            float _1689 = fma(_1681, _163, _1683);
            float _1691 = fma(_1681, _169, _1685);
            float _1693 = fma(_1681, _175, _1687);
            _419 = _1691;
            _421 = _1689;
            _423 = _1693;
            _1561 = _1689;
            _1569 = _1691;
            _1575 = _1693;
        }
        float _1695 = _419;
        float _1697 = _421;
        float _1699 = _423;
        float _1701 = _1561;
        float _1703 = _1569;
        float _1705 = _1575;
        float _1707 = _1695 * _1695;
        float _1709 = rsqrt(_1529);
        float _1711 = fma(_1697, _1697, _1707);
        float _1713 = fma(_1699, _1699, _1711);
        float _1715 = sqrt(_1713);
        float _1717 = _1519 * _1709;
        float _1719 = _1515 * _1709;
        float _1721 = _1523 * _1709;
        bool _1723 = _1715 > 0.0;
        bool _1725 = !_1723;
        if (!_1725)
        {
            float _1727 = rsqrt(_1713);
            float _1729 = _1727 * _1695;
            float _1731 = _1727 * _1697;
            float _1733 = _1727 * _1699;
            float _1735 = _1719 * _1729;
            float _1737 = fma(_1717, _1731, _1735);
            float _1739 = fma(_1721, _1733, _1737);
            float _1741 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1743 = fma(_1701, _1741, _1509);
            float _1745 = fma(_1703, _1741, _1507);
            float _1747 = fma(_1705, _1741, _1511);
            _1541 = _1745;
            _1543 = _1747;
            _1545 = _1743;
        }
    }
    float _1749 = _1541;
    float _1751 = _1543;
    float _1753 = _1545;
    float _1755 = _809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1757 = -_803;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1749);
    float _1761 = -_811;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1751);
    float _1765 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1767 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1765);
    bool _1769 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(0.5);
    bool _1777 = _1773 || _1775;
    float _1779 = _809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1781 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1783 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1779);
    float _1785 = -_805;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1789 = 1.0 / _1781;
    float _1791 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1783);
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = _1783;
    float _1797 = _1791;
    float _1799 = _1787;
    if (_1777)
    {
        _1795 = _1759;
    }
    float _1801 = _1795;
    float _1803 = _1801;
    if (_1777)
    {
        _1797 = _1763;
    }
    float _1805 = _1797;
    float _1807 = _1805;
    if (!_1777)
    {
        float _1809 = _819 * _819;
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1813 = -_607;
        float _1815 = _1813 + _1751;
        float _1817 = fma(_827, _827, _1809);
        float _1819 = fma(_833, _833, _1817);
        float _1821 = 1.0 / _1193;
        float _1823 = sqrt(_1819);
        float _1825 = precise::min(_1823, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1827 = _1825 * _1811;
        float _1829 = -_669;
        float _1831 = _1829 + _1753;
        float _1833 = _1827 * _1821;
        float _1835 = -_605;
        float _1837 = _1835 + _1749;
        float _1839 = fma(_1831, _1833, _815);
        float _1841 = fma(_1837, _1833, _809);
        float _1843 = fma(_1815, _1833, _823);
        _1803 = _1841;
        _1799 = _1839;
        _1807 = _1843;
    }
    float _1845 = _1803;
    float _1847 = _1799;
    float _1849 = _1807;
    float _1851 = _1793 + _1781;
    float _1853 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1855 = _1851 * _1789;
    float _1857 = _1855 * 0.5;
    float _1859 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1861 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1853);
    bool _1863 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(0.5);
    bool _1871 = _1867 || _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1875 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1873);
    float _1877 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1859);
    float _1879 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1881 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1885 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1877);
    float _1887 = 1.0 / _1875;
    float _1889 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1895 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1883);
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1905 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1891);
    float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1909 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1899);
    float _1911 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1901);
    float _1913 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1903);
    float _1915 = _1897;
    float _1917 = _1893;
    if (_1871)
    {
        _1915 = 1.0;
    }
    float _1919 = _1915;
    float _1921 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1923 = _1919;
    if (_1871)
    {
        _1917 = 1.0;
    }
    float _1925 = _1917;
    float _1927 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1931 = _1887 * _1929;
    float _1933 = _1925;
    if (!_1871)
    {
        float _1935 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1937 = _1935 * 0.15915493667125701904296875;
        float _1939 = _1937 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1945 = _1943 * 0.15915493667125701904296875;
        float _1947 = _1937 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = 1.0 / _1941;
        float _1953 = _1945 * 6.283185482025146484375;
        float _1955 = cos(_1953);
        float _1957 = _1949 * _1951;
        float _1959 = _1945 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1965 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1963;
        float _1967 = _1955 * _1957;
        float _1969 = 1.0 / _1965;
        float _1971 = 1.0 / _1967;
        float _1973 = _1961 * _1971;
        float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1977 = fma(_1931, _1973, _1975);
        float _1979 = _1977 * _1969;
        float _1981 = precise::clamp(_1979, 0.0, 1.0);
        _1923 = _1981;
    }
    float _1983 = _1923;
    if (!_1871)
    {
        float _1985 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1987 = _1985 * 0.15915493667125701904296875;
        float _1989 = _1987 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        float _1993 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1995 = _1993 * 0.15915493667125701904296875;
        float _1997 = _1987 * 6.283185482025146484375;
        float _1999 = sin(_1997);
        float _2001 = 1.0 / _1991;
        float _2003 = _1995 * 6.283185482025146484375;
        float _2005 = cos(_2003);
        float _2007 = _1999 * _2001;
        float _2009 = _1995 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = 1.0 / _2013;
        float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2017;
        float _2021 = 1.0 / _2019;
        float _2023 = _2011 * _2015;
        float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2027 = fma(_1931, _2023, _2025);
        float _2029 = _2027 * _2021;
        float _2031 = precise::clamp(_2029, 0.0, 1.0);
        float _2033 = -_2031;
        float _2035 = _2033 + 1.0;
        _1933 = _2035;
    }
    float _2037 = _1933;
    float _2039 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2041 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1911);
    float _2043 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1913);
    bool _2045 = _1983 > 0.0;
    bool _2047 = isnan(_1983);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1907);
    float _2057 = _1983 * _2037;
    float _2059 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2041);
    float _2061 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2043);
    bool _2063 = _2037 <= 0.0;
    bool _2065 = !_2053;
    bool _2067 = _2063 || _2065;
    float _2069 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1909);
    float _2071 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2073 = _2059 + _2061;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2077 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2069);
    float _2079 = _2073 * 0.5;
    float _2081 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1847;
    out.m_58.y = _1845;
    out.m_58.z = _1849;
    out.gl_Position.x = _2071;
    out.gl_Position.y = _2077;
    out.gl_Position.z = _2059;
    out.gl_Position.w = _2061;
    out.m_60.z = _2079;
    out.m_60.w = _2061;
    out.m_35.x = _2081;
    if (!_2067)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2083 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2083;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

