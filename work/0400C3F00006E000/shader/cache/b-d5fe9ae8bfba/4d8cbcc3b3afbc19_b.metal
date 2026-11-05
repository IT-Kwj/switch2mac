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
    float4 m_42 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_40 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_33 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _737 = false;
    bool _405 = false;
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
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1812 = as_type<float>(_81);
        out.gl_Position.z = _1812;
    }
    if (!_69)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _85 = in.m_31.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _75 = _101;
    }
    float _103 = _75;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_29.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1881 = as_type<float>(_117);
        out.gl_Position.z = _1881;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_33.w;
    float _121 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _123 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _125 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _127 = _123 || _125;
    bool _129 = isnan(1.0);
    bool _131 = _127 || _129;
    float _133 = in.m_31.x;
    float _135 = in.m_31.y;
    float _137 = in.m_31.z;
    float _139 = in.m_26.x;
    float _141 = in.m_26.y;
    float _143 = in.m_26.z;
    float _145 = 0.0;
    float _147 = _121;
    if (!_131)
    {
        float _149 = _121 * _121;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = _153;
    if (!_131)
    {
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    bool _161 = !_131;
    float _163 = 0.0;
    float _165 = _159;
    float _167 = 0.0;
    if (!_161)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _121 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _121);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _187;
        _165 = _197;
        _167 = _185;
    }
    float _199 = _163;
    float _201 = _165;
    float _203 = _167;
    bool _205 = !_131;
    float _207 = _199;
    float _209 = _203;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = 1.0 / _217;
        float _221 = _121 * _213;
        float _223 = exp2(_221);
        float _225 = -_223;
        float _227 = _225 + 1.0;
        float _229 = _227 * _219;
        _207 = _223;
        _209 = _217;
        _147 = _229;
    }
    float _231 = _207;
    float _233 = _209;
    float _235 = _147;
    float _237 = _231;
    float _239 = _233;
    if (!_131)
    {
        float _241 = _99 * _99;
        float _243 = _241 * 0.5;
        _237 = _243;
    }
    float _245 = _237;
    float _247 = _245;
    if (!_131)
    {
        _239 = _99;
    }
    float _249 = _239;
    float _251 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _249;
    if (!_131)
    {
        float _257 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _257;
    }
    float _259 = _247;
    bool _261 = !_131;
    float _263 = _259;
    if (!_261)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _99 * _267;
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _269 * 0.693147182464599609375;
        float _281 = exp2(_271);
        float _283 = 1.0 / _279;
        float _285 = _281 + (-1.0);
        float _287 = -_285;
        float _289 = fma(_287, _283, _99);
        float _291 = _289 * _277;
        float _293 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _293;
    }
    float _295 = _263;
    bool _297 = !_131;
    if (!_297)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = 1.0 / _305;
        float _309 = _99 * _301;
        float _311 = exp2(_309);
        float _313 = -_311;
        float _315 = _313 + 1.0;
        float _317 = _315 * _307;
        _255 = _317;
    }
    float _319 = _255;
    float _321 = fma(_235, _133, _251);
    float _323 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = fma(_235, _135, _253);
    float _327 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _333 = fma(_319, _135, _323);
    float _335 = fma(_235, _137, _327);
    float _337 = fma(_325, _119, _141);
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_319, _133, _329);
    float _343 = -_333;
    float _345 = _325 + _343;
    float _347 = fma(_319, _137, _331);
    float _349 = fma(_321, _119, _139);
    float _351 = -_341;
    float _353 = _321 + _351;
    float _355 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _361 = -_347;
    float _363 = _335 + _361;
    float _365 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _359);
    float _371 = fma(_335, _119, _143);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    bool _379 = !_339;
    float _381 = _375;
    float _383 = _373;
    float _385 = _377;
    float _403;
    if (!_379)
    {
        float _387 = in.m_35.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_65);
        float _409 = 1.0 / _407;
        float _411 = _99 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _439 = 1.0 / _425;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _449 = 1.0 / _433;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _453 = _413 + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _457 = 1.0 / _429;
    float _459 = _453 * _439;
    bool _461 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _463 = isnan(_413);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = 1.0 / _437;
    float _481 = _417 * _449;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _485 = _413 + _483;
    bool _487 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _489 = isnan(_413);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _501 = _413 + _499;
    float _503 = 1.0 / _447;
    float _505 = _485 * _457;
    bool _507 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _509 = isnan(_413);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    bool _519 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _521 = isnan(_413);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / _443;
    float _533 = -_471;
    float _535 = _533 + 1.0;
    float _537 = _421 * _479;
    bool _539 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _541 = isnan(_413);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _497 * _535;
    float _553 = -_497;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _557;
    float _561 = _501 * _503;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _565 = _413 + _563;
    float _567 = _517 * _555;
    float _569 = -_517;
    float _571 = _569 + 1.0;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    float _577 = fma(_559, _459, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _581 = isnan(_413);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _549 * _571;
    bool _593 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _595 = isnan(_413);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _565 * _531;
    float _607 = _529 * _575;
    float _609 = -_529;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = _603 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = _589 * _619;
    float _633 = -_589;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _637;
    float _641 = fma(_623, _481, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _643 = _577 * _631;
    float _645 = _477 * _631;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _651 = fma(_615, _505, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _653 = fma(_629, _505, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _661 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _663 = fma(_639, _481, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _665 = fma(_651, _625, _659);
    float _667 = fma(_653, _625, _661);
    float _669 = fma(_649, _537, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _671 = fma(_657, _537, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _677;
    float _681 = fma(_663, _607, _665);
    float _683 = fma(_641, _607, _667);
    float _685 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _687 = fma(_679, _605, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _697 = fma(_669, _591, _681);
    float _699 = fma(_671, _591, _683);
    float _701 = fma(_691, _561, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _703 = fma(_695, _561, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _705 = fma(_685, _567, _697);
    float _707 = fma(_687, _567, _699);
    float _709 = fma(_701, _551, _705);
    float _711 = fma(_703, _551, _707);
    float _713 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[149].x, _709);
    float _715 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[149].y, _711);
    bool _717 = !_455;
    float _735;
    if (!_717)
    {
        float _719 = in.m_35.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].z, _99);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_65);
        float _741 = 1.0 / _739;
        float _743 = _99 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _735;
    float _747 = in.m_35.x;
    float _749 = in.m_35.y;
    float _751 = in.m_35.z;
    float _753 = in.m_35.w;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _761 = _745 + _759;
    float _763 = as_type<float>(int(gl_VertexIndex));
    float _765 = _99 * _757;
    float _767 = _751 * 2.0;
    float _769 = _749 * 2.0;
    float _771 = _747 * 2.0;
    float _773 = _749 + _751;
    int _775 = as_type<int>(_763) & 1;
    bool _777 = _775 != 0;
    int _779 = as_type<int>(_763) & 2;
    bool _781 = _779 != 0;
    float _783 = _751 + _747;
    float _785 = floor(_767);
    float _787 = _749 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _789 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _791 = _749 + _747;
    bool _793 = !_777;
    float _795 = _793 ? (-0.5) : 0.5;
    float _797 = _773 + (-1.0);
    float _799 = floor(_769);
    float _801 = _791 + (-1.0);
    float _803 = floor(_771);
    bool _805 = _785 >= 0.0;
    bool _807 = isnan(_785);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = _785 > 0.0;
    int _817 = _813 ? 0 : 1;
    bool _819 = _747 > 0.5;
    bool _821 = _799 > 0.0;
    float _823 = -_795;
    int _825 = _819 ? as_type<int>(_823) : as_type<int>(_795);
    bool _827 = _799 >= 0.0;
    bool _829 = isnan(_799);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    float _837 = in.m_33.x;
    float _839 = in.m_33.y;
    bool _841 = _803 > 0.0;
    bool _843 = _803 >= 0.0;
    bool _845 = isnan(_803);
    bool _847 = _843 || _845;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    float _853 = exp2(_765);
    int _855 = ~_817;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    int _861 = _851 ? 0 : 1;
    int _863 = _859;
    if (!_815)
    {
        int _865 = ~_817;
        int _867 = _865 + 1;
        _863 = _867;
    }
    int _869 = _863;
    int _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _873 = _871 != 0;
    bool _875 = _751 > 0.5;
    int _877 = _835 ? 0 : 1;
    bool _879 = !_873;
    float _881 = _879 ? _795 : as_type<float>(_825);
    float _883 = -_853;
    float _885 = _883 + 1.0;
    float _887 = -_795;
    int _889 = _875 ? as_type<int>(_887) : as_type<int>(_795);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _893 = 1.0 + _891;
    int _895 = ~_877;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _907 = _905 != 0;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _911 = _909 != 0;
    float _913 = 1.0 / _893;
    int _915 = _899;
    if (!_821)
    {
        int _917 = ~_877;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    bool _923 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _925 = isnan(0.0);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _931 = _927 || _929;
    bool _933 = !_903;
    int _935 = _933 ? 0 : 1;
    bool _937 = !_907;
    int _939 = _937 ? 0 : 1;
    float _941 = _931 ? _885 : 0.0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _953 = _951 != 0;
    float _955 = _713 * _837;
    float _957 = _751 + (-0.5);
    int _959 = ~_861;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    float _965 = _941 * _913;
    int _967 = _963;
    if (!_841)
    {
        int _969 = ~_861;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _979 = _753 > 0.5;
    float _981 = _715 * _839;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _983;
    bool _987 = !_911;
    int _989 = _987 ? 0 : 1;
    float _991 = 1.0 / _977;
    bool _993 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _995 = isnan(1.0);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1001 = _997 || _999;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1005 = _747 + (-0.5);
    float _1007 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1003);
    bool _1009 = !_1001;
    float _1011 = _1009 ? _99 : _965;
    float _1013 = 1.0 / _985;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1019 = _745 + _1017;
    bool _1021 = _749 > 0.5;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1025 = fma(_787, -2.0, _1015);
    float _1027 = _955 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1029 = _1019 * _991;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1033 = _749 + (-0.5);
    int _1035 = abs(_935);
    float _1037 = _783 + (-1.0);
    float _1039 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1031);
    float _1041 = -_1023;
    float _1043 = fma(_789, 2.0, _1041);
    float _1045 = in.m_40.x;
    float _1047 = in.m_40.y;
    float _1049 = in.m_40.z;
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1053 = float(_1035);
    float _1055 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1057 = _761 * _1013;
    float _1059 = float(_869);
    float _1061 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1007);
    int _1063 = abs(_939);
    float _1065 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1067 = _1053 * _1059;
    float _1069 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1039);
    float _1071 = float(_973);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1073;
    float _1077 = float(_1063);
    float _1079 = _1067 * (-2.0);
    float _1081 = fma(_1075, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1083 = _1077 * _1071;
    int _1085 = abs(_989);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1087;
    float _1091 = fma(_1079, _1045, _1045);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1093;
    float _1097 = _1083 * (-2.0);
    float _1099 = fma(_1089, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1101 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1091);
    float _1103 = fma(_1095, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1105 = fma(_1065, _1079, _1065);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1115 = float(_1085);
    float _1117 = fma(_1097, _1047, _1047);
    float _1119 = float(_921);
    float _1121 = fma(_1109, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1123 = fma(_1113, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1125 = fma(_1055, _1097, _1055);
    float _1127 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1117);
    float _1129 = _1115 * _1119;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _795);
    float _1135 = fma(_1011, _1125, _1127);
    float _1137 = _1129 * (-2.0);
    bool _1139 = !_781;
    float _1141 = _1139 ? (-0.5) : 0.5;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1147 = _1135 * 0.15915493667125701904296875;
    float _1149 = fma(_1137, _1049, _1049);
    float _1151 = fma(_1051, _1137, _1051);
    float _1153 = -_1141;
    int _1155 = _979 ? as_type<int>(_1153) : as_type<int>(_1141);
    float _1157 = _1027 * _1133;
    bool _1159 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1161 = isnan(_745);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1149);
    float _1173 = -_1141;
    int _1175 = _1021 ? as_type<int>(_1173) : as_type<int>(_1141);
    float _1177 = fma(_1145, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1179 = !_953;
    float _1181 = _1179 ? _1141 : as_type<float>(_1155);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1141);
    bool _1185 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1187 = isnan(_745);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1199 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1201 = isnan(_745);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1207 = _1203 || _1205;
    float _1209 = float(_1207);
    float _1211 = fma(_1011, _1105, _1101);
    bool _1213 = !_945;
    float _1215 = _1213 ? _1141 : as_type<float>(_1175);
    float _1217 = -_1169;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_1011, _1151, _1171);
    float _1223 = -_1195;
    float _1225 = _1223 + 1.0;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1229 = _1209 * _1219;
    float _1231 = _1197 * _1183;
    float _1233 = _1211 * 0.15915493667125701904296875;
    float _1235 = _1221 * 0.15915493667125701904296875;
    float _1237 = -_99;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1043);
    float _1241 = _1169 * _1225;
    float _1243 = _1099 * _1229;
    bool _1245 = !_949;
    float _1247 = _1245 ? _795 : as_type<float>(_889);
    float _1249 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _881 + 0.5;
    float _1253 = _1233 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1081 * _1229;
    float _1259 = -_1209;
    float _1261 = _1259 + 1.0;
    float _1263 = fma(_1249, _1251, _1239);
    float _1265 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1025);
    float _1267 = _1103 * _1229;
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1243);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1257);
    float _1273 = _1233 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    float _1277 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = _1215 + (-0.5);
    float _1281 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1267);
    float _1283 = fma(_1121, _1241, _1269);
    float _1285 = fma(_1177, _1241, _1271);
    float _1287 = -_1277;
    float _1289 = -_1265;
    float _1291 = fma(_1287, _1279, _1289);
    float _1293 = fma(_1123, _1241, _1281);
    float _1295 = _1147 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1301 = -_1069;
    float _1303 = _1301 + 1.0;
    float _1305 = _1247 + 0.5;
    float _1307 = fma(_1215, _1303, _1291);
    float _1309 = _1235 * 6.283185482025146484375;
    float _1311 = cos(_1309);
    float _1313 = _1147 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1275 * _1297;
    float _1319 = _1255 * _1297;
    float _1321 = _1235 * 6.283185482025146484375;
    float _1323 = sin(_1321);
    float _1325 = _1297 * _1311;
    float _1327 = _1311 * _1231;
    float _1329 = _1275 * _1315;
    float _1331 = _1255 * _1315;
    float _1333 = _1275 * _1327;
    float _1335 = _1315 * _1311;
    float _1337 = _1255 * _1327;
    float _1339 = fma(_1323, _1329, _1319);
    float _1341 = -_1317;
    float _1343 = fma(_1323, _1331, _1341);
    float _1345 = -_1331;
    float _1347 = fma(_1323, _1317, _1345);
    float _1349 = _1323 * _1231;
    float _1351 = fma(_1339, _1157, _1333);
    float _1353 = fma(_1343, _1157, _1337);
    float _1355 = fma(_1323, _1319, _1329);
    float _1357 = -_1349;
    float _1359 = fma(_1335, _1157, _1357);
    float _1361 = fma(_1347, _1299, _1351);
    float _1363 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1283);
    float _1365 = fma(_1355, _1299, _1353);
    float _1367 = fma(_1325, _1299, _1359);
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1375 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1285);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1371);
    float _1381 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1373);
    float _1383 = -_1061;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1377);
    float _1389 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1379);
    float _1391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1393 = -_1385;
    float _1395 = fma(_881, _1393, _1263);
    float _1397 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1399 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1401 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1381);
    float _1403 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1293);
    float _1405 = _1397 * _1397;
    float _1407 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1411 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1413 = fma(_1399, _1399, _1405);
    float _1415 = -_1181;
    float _1417 = _1415 + 0.5;
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1429 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1431 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1433 = _1425 * _1391;
    float _1435 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1437 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1439 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1441 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1431);
    float _1443 = sqrt(_1423);
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1437);
    float _1449 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1439);
    float _1451 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1441);
    out.m_42.x = _1419;
    out.m_42.y = _1421;
    out.m_42.z = _1445;
    float _1453 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1447);
    float _1455 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1449);
    float _1457 = _1429 * _1427;
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1461 = _1453 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_44.x = _1395;
    out.m_44.y = _1307;
    out.m_44.z = _1457;
    out.m_44.w = _1433;
    bool _1465 = _1443 > 0.0;
    float _1467 = _1459 + _1399;
    float _1469 = _1461 + _1397;
    float _1471 = _1463 + _1409;
    bool _1473 = !_1465;
    float _1475 = _1459;
    float _1477 = _1463;
    float _1479 = _1433;
    float _1481 = _1469;
    float _1483 = _1467;
    float _1485 = _1471;
    if (!_1473)
    {
        bool _1487 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1489 = _1451;
        if (_1487)
        {
            float _1491 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1489 = _1491;
        }
        float _1493 = _1489;
        if (_1487)
        {
            float _1495 = _373 * _1493;
            _1475 = _1495;
        }
        float _1497 = _1475;
        float _1499 = _1497;
        if (_1487)
        {
            float _1501 = _375 * _1493;
            _1477 = _1501;
        }
        float _1503 = _1477;
        float _1505 = _1503;
        if (_1487)
        {
            float _1507 = _377 * _1493;
            _1479 = _1507;
        }
        float _1509 = _1479;
        float _1511 = _1509;
        float _1513 = _1509;
        if (!_1487)
        {
            float _1515 = _99 + 1.0;
            float _1517 = _1515;
            if (!_131)
            {
                float _1519 = _1515 * _1515;
                float _1521 = _1519 * 0.5;
                _1511 = _1521;
            }
            float _1523 = _1511;
            float _1525 = _1523;
            if (!_131)
            {
                float _1527 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1525 = _1527;
            }
            float _1529 = _1525;
            bool _1531 = !_131;
            float _1533 = _1529;
            if (!_1531)
            {
                float _1535 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1537 = log2(_1535);
                float _1539 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1541 = _1537 * _1515;
                float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1545 = 1.0 + _1543;
                float _1547 = exp2(_1541);
                float _1549 = _1539 * 0.693147182464599609375;
                float _1551 = 1.0 / _1549;
                float _1553 = 1.0 / _1545;
                float _1555 = _1547 + (-1.0);
                float _1557 = -_1555;
                float _1559 = fma(_1557, _1551, _1515);
                float _1561 = _1559 * _1553;
                float _1563 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1533 = _1563;
            }
            float _1565 = _1533;
            float _1567 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1569 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1571 = !_131;
            if (!_1571)
            {
                float _1573 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1575 = log2(_1573);
                float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1579 = 1.0 + _1577;
                float _1581 = 1.0 / _1579;
                float _1583 = _1575 * _1515;
                float _1585 = exp2(_1583);
                float _1587 = -_1585;
                float _1589 = _1587 + 1.0;
                float _1591 = _1589 * _1581;
                _1517 = _1591;
            }
            float _1593 = _1517;
            float _1595 = fma(_1593, _135, _1569);
            float _1597 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1599 = fma(_1593, _133, _1567);
            float _1601 = -_333;
            float _1603 = _1601 + _1595;
            float _1605 = fma(_1593, _137, _1597);
            float _1607 = -_341;
            float _1609 = _1607 + _1599;
            float _1611 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1613 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1615 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1617 = -_347;
            float _1619 = _1617 + _1605;
            float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1611);
            float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1613);
            float _1625 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1615);
            float _1627 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1621);
            float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1623);
            float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1625);
            _381 = _1629;
            _383 = _1627;
            _385 = _1631;
            _1499 = _1627;
            _1505 = _1629;
            _1513 = _1631;
        }
        float _1633 = _381;
        float _1635 = _383;
        float _1637 = _385;
        float _1639 = _1499;
        float _1641 = _1505;
        float _1643 = _1513;
        float _1645 = _1633 * _1633;
        float _1647 = rsqrt(_1423);
        float _1649 = fma(_1635, _1635, _1645);
        float _1651 = fma(_1637, _1637, _1649);
        float _1653 = sqrt(_1651);
        float _1655 = _1399 * _1647;
        float _1657 = _1397 * _1647;
        float _1659 = _1409 * _1647;
        bool _1661 = _1653 > 0.0;
        bool _1663 = !_1661;
        if (!_1663)
        {
            float _1665 = rsqrt(_1651);
            float _1667 = _1665 * _1633;
            float _1669 = _1665 * _1635;
            float _1671 = _1665 * _1637;
            float _1673 = _1657 * _1667;
            float _1675 = fma(_1655, _1669, _1673);
            float _1677 = fma(_1659, _1671, _1675);
            float _1679 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1681 = fma(_1639, _1679, _1467);
            float _1683 = fma(_1641, _1679, _1469);
            float _1685 = fma(_1643, _1679, _1471);
            _1481 = _1683;
            _1483 = _1681;
            _1485 = _1685;
        }
    }
    float _1687 = _1481;
    float _1689 = _1483;
    float _1691 = _1485;
    float _1693 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1695 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1693);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1695);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1697);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1699);
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1701);
    float _1711 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1703);
    float _1713 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1705);
    float _1715 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1707);
    float _1717 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1721 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1723 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1725 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1731 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1733 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1735 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1737 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1729);
    float _1739 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1731);
    float _1741 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1733);
    float _1743 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    float _1745 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1737);
    float _1747 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1739);
    float _1749 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1751 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1743);
    float _1753 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1745);
    float _1755 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1747);
    out.m_46.x = _1689;
    out.m_46.y = _1687;
    out.m_46.z = _1691;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1749;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1755;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _737 = false;
    bool _405 = false;
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
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1812 = as_type<float>(_81);
        out.gl_Position.z = _1812;
    }
    if (!_69)
    {
        return out;
    }
    float _85 = in.m_31.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _75 = _101;
    }
    float _103 = _75;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_29.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1881 = as_type<float>(_117);
        out.gl_Position.z = _1881;
    }
    if (_109)
    {
        return out;
    }
    float _119 = in.m_33.w;
    float _121 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _123 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _125 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _127 = _123 || _125;
    bool _129 = isnan(1.0);
    bool _131 = _127 || _129;
    float _133 = in.m_31.x;
    float _135 = in.m_31.y;
    float _137 = in.m_31.z;
    float _139 = in.m_26.x;
    float _141 = in.m_26.y;
    float _143 = in.m_26.z;
    float _145 = 0.0;
    float _147 = _121;
    if (!_131)
    {
        float _149 = _121 * _121;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = _153;
    if (!_131)
    {
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    bool _161 = !_131;
    float _163 = 0.0;
    float _165 = _159;
    float _167 = 0.0;
    if (!_161)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _121 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _121);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _187;
        _165 = _197;
        _167 = _185;
    }
    float _199 = _163;
    float _201 = _165;
    float _203 = _167;
    bool _205 = !_131;
    float _207 = _199;
    float _209 = _203;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = 1.0 / _217;
        float _221 = _121 * _213;
        float _223 = exp2(_221);
        float _225 = -_223;
        float _227 = _225 + 1.0;
        float _229 = _227 * _219;
        _207 = _223;
        _209 = _217;
        _147 = _229;
    }
    float _231 = _207;
    float _233 = _209;
    float _235 = _147;
    float _237 = _231;
    float _239 = _233;
    if (!_131)
    {
        float _241 = _99 * _99;
        float _243 = _241 * 0.5;
        _237 = _243;
    }
    float _245 = _237;
    float _247 = _245;
    if (!_131)
    {
        _239 = _99;
    }
    float _249 = _239;
    float _251 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _249;
    if (!_131)
    {
        float _257 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _257;
    }
    float _259 = _247;
    bool _261 = !_131;
    float _263 = _259;
    if (!_261)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _99 * _267;
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _269 * 0.693147182464599609375;
        float _281 = exp2(_271);
        float _283 = 1.0 / _279;
        float _285 = _281 + (-1.0);
        float _287 = -_285;
        float _289 = fma(_287, _283, _99);
        float _291 = _289 * _277;
        float _293 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _293;
    }
    float _295 = _263;
    bool _297 = !_131;
    if (!_297)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = 1.0 / _305;
        float _309 = _99 * _301;
        float _311 = exp2(_309);
        float _313 = -_311;
        float _315 = _313 + 1.0;
        float _317 = _315 * _307;
        _255 = _317;
    }
    float _319 = _255;
    float _321 = fma(_235, _133, _251);
    float _323 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = fma(_235, _135, _253);
    float _327 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _333 = fma(_319, _135, _323);
    float _335 = fma(_235, _137, _327);
    float _337 = fma(_325, _119, _141);
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_319, _133, _329);
    float _343 = -_333;
    float _345 = _325 + _343;
    float _347 = fma(_319, _137, _331);
    float _349 = fma(_321, _119, _139);
    float _351 = -_341;
    float _353 = _321 + _351;
    float _355 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _361 = -_347;
    float _363 = _335 + _361;
    float _365 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _359);
    float _371 = fma(_335, _119, _143);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    bool _379 = !_339;
    float _381 = _375;
    float _383 = _373;
    float _385 = _377;
    float _403;
    if (!_379)
    {
        float _387 = in.m_35.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_65);
        float _409 = 1.0 / _407;
        float _411 = _99 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _439 = 1.0 / _425;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _449 = 1.0 / _433;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _453 = _413 + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _457 = 1.0 / _429;
    float _459 = _453 * _439;
    bool _461 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _463 = isnan(_413);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = 1.0 / _437;
    float _481 = _417 * _449;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _485 = _413 + _483;
    bool _487 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _489 = isnan(_413);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _501 = _413 + _499;
    float _503 = 1.0 / _447;
    float _505 = _485 * _457;
    bool _507 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _509 = isnan(_413);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    bool _519 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _521 = isnan(_413);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / _443;
    float _533 = -_471;
    float _535 = _533 + 1.0;
    float _537 = _421 * _479;
    bool _539 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _541 = isnan(_413);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _497 * _535;
    float _553 = -_497;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _557;
    float _561 = _501 * _503;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _565 = _413 + _563;
    float _567 = _517 * _555;
    float _569 = -_517;
    float _571 = _569 + 1.0;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    float _577 = fma(_559, _459, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _581 = isnan(_413);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _549 * _571;
    bool _593 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _595 = isnan(_413);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _565 * _531;
    float _607 = _529 * _575;
    float _609 = -_529;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = _603 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = _589 * _619;
    float _633 = -_589;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _637;
    float _641 = fma(_623, _481, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _643 = _577 * _631;
    float _645 = _477 * _631;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _651 = fma(_615, _505, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _653 = fma(_629, _505, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _661 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _663 = fma(_639, _481, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _665 = fma(_651, _625, _659);
    float _667 = fma(_653, _625, _661);
    float _669 = fma(_649, _537, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _671 = fma(_657, _537, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _677;
    float _681 = fma(_663, _607, _665);
    float _683 = fma(_641, _607, _667);
    float _685 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _687 = fma(_679, _605, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _697 = fma(_669, _591, _681);
    float _699 = fma(_671, _591, _683);
    float _701 = fma(_691, _561, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _703 = fma(_695, _561, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _705 = fma(_685, _567, _697);
    float _707 = fma(_687, _567, _699);
    float _709 = fma(_701, _551, _705);
    float _711 = fma(_703, _551, _707);
    float _713 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[149].x, _709);
    float _715 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[149].y, _711);
    bool _717 = !_455;
    float _735;
    if (!_717)
    {
        float _719 = in.m_35.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].z, _99);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_65);
        float _741 = 1.0 / _739;
        float _743 = _99 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _735;
    float _747 = in.m_35.x;
    float _749 = in.m_35.y;
    float _751 = in.m_35.z;
    float _753 = in.m_35.w;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _761 = _745 + _759;
    float _763 = as_type<float>(int(gl_VertexIndex));
    float _765 = _99 * _757;
    float _767 = _751 * 2.0;
    float _769 = _749 * 2.0;
    float _771 = _747 * 2.0;
    float _773 = _749 + _751;
    int _775 = as_type<int>(_763) & 1;
    bool _777 = _775 != 0;
    int _779 = as_type<int>(_763) & 2;
    bool _781 = _779 != 0;
    float _783 = _751 + _747;
    float _785 = floor(_767);
    float _787 = _749 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _789 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _791 = _749 + _747;
    bool _793 = !_777;
    float _795 = _793 ? (-0.5) : 0.5;
    float _797 = _773 + (-1.0);
    float _799 = floor(_769);
    float _801 = _791 + (-1.0);
    float _803 = floor(_771);
    bool _805 = _785 >= 0.0;
    bool _807 = isnan(_785);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = _785 > 0.0;
    int _817 = _813 ? 0 : 1;
    bool _819 = _747 > 0.5;
    bool _821 = _799 > 0.0;
    float _823 = -_795;
    int _825 = _819 ? as_type<int>(_823) : as_type<int>(_795);
    bool _827 = _799 >= 0.0;
    bool _829 = isnan(_799);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    float _837 = in.m_33.x;
    float _839 = in.m_33.y;
    bool _841 = _803 > 0.0;
    bool _843 = _803 >= 0.0;
    bool _845 = isnan(_803);
    bool _847 = _843 || _845;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    float _853 = exp2(_765);
    int _855 = ~_817;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    int _861 = _851 ? 0 : 1;
    int _863 = _859;
    if (!_815)
    {
        int _865 = ~_817;
        int _867 = _865 + 1;
        _863 = _867;
    }
    int _869 = _863;
    int _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _873 = _871 != 0;
    bool _875 = _751 > 0.5;
    int _877 = _835 ? 0 : 1;
    bool _879 = !_873;
    float _881 = _879 ? _795 : as_type<float>(_825);
    float _883 = -_853;
    float _885 = _883 + 1.0;
    float _887 = -_795;
    int _889 = _875 ? as_type<int>(_887) : as_type<int>(_795);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _893 = 1.0 + _891;
    int _895 = ~_877;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _907 = _905 != 0;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _911 = _909 != 0;
    float _913 = 1.0 / _893;
    int _915 = _899;
    if (!_821)
    {
        int _917 = ~_877;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    bool _923 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _925 = isnan(0.0);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _931 = _927 || _929;
    bool _933 = !_903;
    int _935 = _933 ? 0 : 1;
    bool _937 = !_907;
    int _939 = _937 ? 0 : 1;
    float _941 = _931 ? _885 : 0.0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _953 = _951 != 0;
    float _955 = _713 * _837;
    float _957 = _751 + (-0.5);
    int _959 = ~_861;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    float _965 = _941 * _913;
    int _967 = _963;
    if (!_841)
    {
        int _969 = ~_861;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _979 = _753 > 0.5;
    float _981 = _715 * _839;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _983;
    bool _987 = !_911;
    int _989 = _987 ? 0 : 1;
    float _991 = 1.0 / _977;
    bool _993 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _995 = isnan(1.0);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1001 = _997 || _999;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1005 = _747 + (-0.5);
    float _1007 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1003);
    bool _1009 = !_1001;
    float _1011 = _1009 ? _99 : _965;
    float _1013 = 1.0 / _985;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1019 = _745 + _1017;
    bool _1021 = _749 > 0.5;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1025 = fma(_787, -2.0, _1015);
    float _1027 = _955 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1029 = _1019 * _991;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1033 = _749 + (-0.5);
    int _1035 = abs(_935);
    float _1037 = _783 + (-1.0);
    float _1039 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1031);
    float _1041 = -_1023;
    float _1043 = fma(_789, 2.0, _1041);
    float _1045 = in.m_40.x;
    float _1047 = in.m_40.y;
    float _1049 = in.m_40.z;
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1053 = float(_1035);
    float _1055 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1057 = _761 * _1013;
    float _1059 = float(_869);
    float _1061 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1007);
    int _1063 = abs(_939);
    float _1065 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1067 = _1053 * _1059;
    float _1069 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1039);
    float _1071 = float(_973);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1073;
    float _1077 = float(_1063);
    float _1079 = _1067 * (-2.0);
    float _1081 = fma(_1075, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1083 = _1077 * _1071;
    int _1085 = abs(_989);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1087;
    float _1091 = fma(_1079, _1045, _1045);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1093;
    float _1097 = _1083 * (-2.0);
    float _1099 = fma(_1089, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1101 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1091);
    float _1103 = fma(_1095, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1105 = fma(_1065, _1079, _1065);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1115 = float(_1085);
    float _1117 = fma(_1097, _1047, _1047);
    float _1119 = float(_921);
    float _1121 = fma(_1109, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1123 = fma(_1113, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1125 = fma(_1055, _1097, _1055);
    float _1127 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1117);
    float _1129 = _1115 * _1119;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _795);
    float _1135 = fma(_1011, _1125, _1127);
    float _1137 = _1129 * (-2.0);
    bool _1139 = !_781;
    float _1141 = _1139 ? (-0.5) : 0.5;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1147 = _1135 * 0.15915493667125701904296875;
    float _1149 = fma(_1137, _1049, _1049);
    float _1151 = fma(_1051, _1137, _1051);
    float _1153 = -_1141;
    int _1155 = _979 ? as_type<int>(_1153) : as_type<int>(_1141);
    float _1157 = _1027 * _1133;
    bool _1159 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1161 = isnan(_745);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1149);
    float _1173 = -_1141;
    int _1175 = _1021 ? as_type<int>(_1173) : as_type<int>(_1141);
    float _1177 = fma(_1145, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1179 = !_953;
    float _1181 = _1179 ? _1141 : as_type<float>(_1155);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1141);
    bool _1185 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1187 = isnan(_745);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1199 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1201 = isnan(_745);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1207 = _1203 || _1205;
    float _1209 = float(_1207);
    float _1211 = fma(_1011, _1105, _1101);
    bool _1213 = !_945;
    float _1215 = _1213 ? _1141 : as_type<float>(_1175);
    float _1217 = -_1169;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_1011, _1151, _1171);
    float _1223 = -_1195;
    float _1225 = _1223 + 1.0;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1229 = _1209 * _1219;
    float _1231 = _1197 * _1183;
    float _1233 = _1211 * 0.15915493667125701904296875;
    float _1235 = _1221 * 0.15915493667125701904296875;
    float _1237 = -_99;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1043);
    float _1241 = _1169 * _1225;
    float _1243 = _1099 * _1229;
    bool _1245 = !_949;
    float _1247 = _1245 ? _795 : as_type<float>(_889);
    float _1249 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _881 + 0.5;
    float _1253 = _1233 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1081 * _1229;
    float _1259 = -_1209;
    float _1261 = _1259 + 1.0;
    float _1263 = fma(_1249, _1251, _1239);
    float _1265 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1025);
    float _1267 = _1103 * _1229;
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1243);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1257);
    float _1273 = _1233 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    float _1277 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = _1215 + (-0.5);
    float _1281 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1267);
    float _1283 = fma(_1121, _1241, _1269);
    float _1285 = fma(_1177, _1241, _1271);
    float _1287 = -_1277;
    float _1289 = -_1265;
    float _1291 = fma(_1287, _1279, _1289);
    float _1293 = fma(_1123, _1241, _1281);
    float _1295 = _1147 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1301 = -_1069;
    float _1303 = _1301 + 1.0;
    float _1305 = _1247 + 0.5;
    float _1307 = fma(_1215, _1303, _1291);
    float _1309 = _1235 * 6.283185482025146484375;
    float _1311 = cos(_1309);
    float _1313 = _1147 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1275 * _1297;
    float _1319 = _1255 * _1297;
    float _1321 = _1235 * 6.283185482025146484375;
    float _1323 = sin(_1321);
    float _1325 = _1297 * _1311;
    float _1327 = _1311 * _1231;
    float _1329 = _1275 * _1315;
    float _1331 = _1255 * _1315;
    float _1333 = _1275 * _1327;
    float _1335 = _1315 * _1311;
    float _1337 = _1255 * _1327;
    float _1339 = fma(_1323, _1329, _1319);
    float _1341 = -_1317;
    float _1343 = fma(_1323, _1331, _1341);
    float _1345 = -_1331;
    float _1347 = fma(_1323, _1317, _1345);
    float _1349 = _1323 * _1231;
    float _1351 = fma(_1339, _1157, _1333);
    float _1353 = fma(_1343, _1157, _1337);
    float _1355 = fma(_1323, _1319, _1329);
    float _1357 = -_1349;
    float _1359 = fma(_1335, _1157, _1357);
    float _1361 = fma(_1347, _1299, _1351);
    float _1363 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1283);
    float _1365 = fma(_1355, _1299, _1353);
    float _1367 = fma(_1325, _1299, _1359);
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1375 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1285);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1371);
    float _1381 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1373);
    float _1383 = -_1061;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1377);
    float _1389 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1379);
    float _1391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1393 = -_1385;
    float _1395 = fma(_881, _1393, _1263);
    float _1397 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1399 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1401 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1381);
    float _1403 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1293);
    float _1405 = _1397 * _1397;
    float _1407 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1411 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1413 = fma(_1399, _1399, _1405);
    float _1415 = -_1181;
    float _1417 = _1415 + 0.5;
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1429 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1431 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1433 = _1425 * _1391;
    float _1435 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1437 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1439 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1441 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1431);
    float _1443 = sqrt(_1423);
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1437);
    float _1449 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1439);
    float _1451 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1441);
    out.m_42.x = _1419;
    out.m_42.y = _1421;
    out.m_42.z = _1445;
    float _1453 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1447);
    float _1455 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1449);
    float _1457 = _1429 * _1427;
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1461 = _1453 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_44.x = _1395;
    out.m_44.y = _1307;
    out.m_44.z = _1457;
    out.m_44.w = _1433;
    bool _1465 = _1443 > 0.0;
    float _1467 = _1459 + _1399;
    float _1469 = _1461 + _1397;
    float _1471 = _1463 + _1409;
    bool _1473 = !_1465;
    float _1475 = _1459;
    float _1477 = _1463;
    float _1479 = _1433;
    float _1481 = _1469;
    float _1483 = _1467;
    float _1485 = _1471;
    if (!_1473)
    {
        bool _1487 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1489 = _1451;
        if (_1487)
        {
            float _1491 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1489 = _1491;
        }
        float _1493 = _1489;
        if (_1487)
        {
            float _1495 = _373 * _1493;
            _1475 = _1495;
        }
        float _1497 = _1475;
        float _1499 = _1497;
        if (_1487)
        {
            float _1501 = _375 * _1493;
            _1477 = _1501;
        }
        float _1503 = _1477;
        float _1505 = _1503;
        if (_1487)
        {
            float _1507 = _377 * _1493;
            _1479 = _1507;
        }
        float _1509 = _1479;
        float _1511 = _1509;
        float _1513 = _1509;
        if (!_1487)
        {
            float _1515 = _99 + 1.0;
            float _1517 = _1515;
            if (!_131)
            {
                float _1519 = _1515 * _1515;
                float _1521 = _1519 * 0.5;
                _1511 = _1521;
            }
            float _1523 = _1511;
            float _1525 = _1523;
            if (!_131)
            {
                float _1527 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1525 = _1527;
            }
            float _1529 = _1525;
            bool _1531 = !_131;
            float _1533 = _1529;
            if (!_1531)
            {
                float _1535 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1537 = log2(_1535);
                float _1539 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1541 = _1537 * _1515;
                float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1545 = 1.0 + _1543;
                float _1547 = exp2(_1541);
                float _1549 = _1539 * 0.693147182464599609375;
                float _1551 = 1.0 / _1549;
                float _1553 = 1.0 / _1545;
                float _1555 = _1547 + (-1.0);
                float _1557 = -_1555;
                float _1559 = fma(_1557, _1551, _1515);
                float _1561 = _1559 * _1553;
                float _1563 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1533 = _1563;
            }
            float _1565 = _1533;
            float _1567 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1569 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1571 = !_131;
            if (!_1571)
            {
                float _1573 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1575 = log2(_1573);
                float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1579 = 1.0 + _1577;
                float _1581 = 1.0 / _1579;
                float _1583 = _1575 * _1515;
                float _1585 = exp2(_1583);
                float _1587 = -_1585;
                float _1589 = _1587 + 1.0;
                float _1591 = _1589 * _1581;
                _1517 = _1591;
            }
            float _1593 = _1517;
            float _1595 = fma(_1593, _135, _1569);
            float _1597 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1599 = fma(_1593, _133, _1567);
            float _1601 = -_333;
            float _1603 = _1601 + _1595;
            float _1605 = fma(_1593, _137, _1597);
            float _1607 = -_341;
            float _1609 = _1607 + _1599;
            float _1611 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1613 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1615 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1617 = -_347;
            float _1619 = _1617 + _1605;
            float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1611);
            float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1613);
            float _1625 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1615);
            float _1627 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1621);
            float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1623);
            float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1625);
            _381 = _1629;
            _383 = _1627;
            _385 = _1631;
            _1499 = _1627;
            _1505 = _1629;
            _1513 = _1631;
        }
        float _1633 = _381;
        float _1635 = _383;
        float _1637 = _385;
        float _1639 = _1499;
        float _1641 = _1505;
        float _1643 = _1513;
        float _1645 = _1633 * _1633;
        float _1647 = rsqrt(_1423);
        float _1649 = fma(_1635, _1635, _1645);
        float _1651 = fma(_1637, _1637, _1649);
        float _1653 = sqrt(_1651);
        float _1655 = _1399 * _1647;
        float _1657 = _1397 * _1647;
        float _1659 = _1409 * _1647;
        bool _1661 = _1653 > 0.0;
        bool _1663 = !_1661;
        if (!_1663)
        {
            float _1665 = rsqrt(_1651);
            float _1667 = _1665 * _1633;
            float _1669 = _1665 * _1635;
            float _1671 = _1665 * _1637;
            float _1673 = _1657 * _1667;
            float _1675 = fma(_1655, _1669, _1673);
            float _1677 = fma(_1659, _1671, _1675);
            float _1679 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1681 = fma(_1639, _1679, _1467);
            float _1683 = fma(_1641, _1679, _1469);
            float _1685 = fma(_1643, _1679, _1471);
            _1481 = _1683;
            _1483 = _1681;
            _1485 = _1685;
        }
    }
    float _1687 = _1481;
    float _1689 = _1483;
    float _1691 = _1485;
    float _1693 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1695 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1693);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1695);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1697);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1699);
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1701);
    float _1711 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1703);
    float _1713 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1705);
    float _1715 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1707);
    float _1717 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1721 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1723 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1725 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1731 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1733 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1735 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1737 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1729);
    float _1739 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1731);
    float _1741 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1733);
    float _1743 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    float _1745 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1737);
    float _1747 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1739);
    float _1749 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1751 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1743);
    float _1753 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1745);
    float _1755 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1747);
    out.m_46.x = _1689;
    out.m_46.y = _1687;
    out.m_46.z = _1691;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1749;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1755;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _737 = false;
    bool _405 = false;
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
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1812 = as_type<float>(_81);
        out.gl_Position.z = _1812;
    }
    if (!_69)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _85 = in.m_31.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _75 = _101;
    }
    float _103 = _75;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_29.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1881 = as_type<float>(_117);
        out.gl_Position.z = _1881;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_33.w;
    float _121 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _123 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _125 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _127 = _123 || _125;
    bool _129 = isnan(1.0);
    bool _131 = _127 || _129;
    float _133 = in.m_31.x;
    float _135 = in.m_31.y;
    float _137 = in.m_31.z;
    float _139 = in.m_26.x;
    float _141 = in.m_26.y;
    float _143 = in.m_26.z;
    float _145 = 0.0;
    float _147 = _121;
    if (!_131)
    {
        float _149 = _121 * _121;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = _153;
    if (!_131)
    {
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    bool _161 = !_131;
    float _163 = 0.0;
    float _165 = _159;
    float _167 = 0.0;
    if (!_161)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _121 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _121);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _187;
        _165 = _197;
        _167 = _185;
    }
    float _199 = _163;
    float _201 = _165;
    float _203 = _167;
    bool _205 = !_131;
    float _207 = _199;
    float _209 = _203;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = 1.0 / _217;
        float _221 = _121 * _213;
        float _223 = exp2(_221);
        float _225 = -_223;
        float _227 = _225 + 1.0;
        float _229 = _227 * _219;
        _207 = _223;
        _209 = _217;
        _147 = _229;
    }
    float _231 = _207;
    float _233 = _209;
    float _235 = _147;
    float _237 = _231;
    float _239 = _233;
    if (!_131)
    {
        float _241 = _99 * _99;
        float _243 = _241 * 0.5;
        _237 = _243;
    }
    float _245 = _237;
    float _247 = _245;
    if (!_131)
    {
        _239 = _99;
    }
    float _249 = _239;
    float _251 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _249;
    if (!_131)
    {
        float _257 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _257;
    }
    float _259 = _247;
    bool _261 = !_131;
    float _263 = _259;
    if (!_261)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _99 * _267;
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _269 * 0.693147182464599609375;
        float _281 = exp2(_271);
        float _283 = 1.0 / _279;
        float _285 = _281 + (-1.0);
        float _287 = -_285;
        float _289 = fma(_287, _283, _99);
        float _291 = _289 * _277;
        float _293 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _293;
    }
    float _295 = _263;
    bool _297 = !_131;
    if (!_297)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = 1.0 / _305;
        float _309 = _99 * _301;
        float _311 = exp2(_309);
        float _313 = -_311;
        float _315 = _313 + 1.0;
        float _317 = _315 * _307;
        _255 = _317;
    }
    float _319 = _255;
    float _321 = fma(_235, _133, _251);
    float _323 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = fma(_235, _135, _253);
    float _327 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _333 = fma(_319, _135, _323);
    float _335 = fma(_235, _137, _327);
    float _337 = fma(_325, _119, _141);
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_319, _133, _329);
    float _343 = -_333;
    float _345 = _325 + _343;
    float _347 = fma(_319, _137, _331);
    float _349 = fma(_321, _119, _139);
    float _351 = -_341;
    float _353 = _321 + _351;
    float _355 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _361 = -_347;
    float _363 = _335 + _361;
    float _365 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _369 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _359);
    float _371 = fma(_335, _119, _143);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    bool _379 = !_339;
    float _381 = _375;
    float _383 = _373;
    float _385 = _377;
    float _403;
    if (!_379)
    {
        float _387 = in.m_35.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_65);
        float _409 = 1.0 / _407;
        float _411 = _99 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _439 = 1.0 / _425;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _449 = 1.0 / _433;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _453 = _413 + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _457 = 1.0 / _429;
    float _459 = _453 * _439;
    bool _461 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _463 = isnan(_413);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = 1.0 / _437;
    float _481 = _417 * _449;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _485 = _413 + _483;
    bool _487 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _489 = isnan(_413);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _501 = _413 + _499;
    float _503 = 1.0 / _447;
    float _505 = _485 * _457;
    bool _507 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _509 = isnan(_413);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    bool _519 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _521 = isnan(_413);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / _443;
    float _533 = -_471;
    float _535 = _533 + 1.0;
    float _537 = _421 * _479;
    bool _539 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _541 = isnan(_413);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _497 * _535;
    float _553 = -_497;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _557;
    float _561 = _501 * _503;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _565 = _413 + _563;
    float _567 = _517 * _555;
    float _569 = -_517;
    float _571 = _569 + 1.0;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    float _577 = fma(_559, _459, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _581 = isnan(_413);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _549 * _571;
    bool _593 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _595 = isnan(_413);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _565 * _531;
    float _607 = _529 * _575;
    float _609 = -_529;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = _603 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = _589 * _619;
    float _633 = -_589;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _637;
    float _641 = fma(_623, _481, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _643 = _577 * _631;
    float _645 = _477 * _631;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _651 = fma(_615, _505, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _653 = fma(_629, _505, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _661 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _663 = fma(_639, _481, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _665 = fma(_651, _625, _659);
    float _667 = fma(_653, _625, _661);
    float _669 = fma(_649, _537, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _671 = fma(_657, _537, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _677;
    float _681 = fma(_663, _607, _665);
    float _683 = fma(_641, _607, _667);
    float _685 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _687 = fma(_679, _605, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _697 = fma(_669, _591, _681);
    float _699 = fma(_671, _591, _683);
    float _701 = fma(_691, _561, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _703 = fma(_695, _561, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _705 = fma(_685, _567, _697);
    float _707 = fma(_687, _567, _699);
    float _709 = fma(_701, _551, _705);
    float _711 = fma(_703, _551, _707);
    float _713 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[149].x, _709);
    float _715 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[149].y, _711);
    bool _717 = !_455;
    float _735;
    if (!_717)
    {
        float _719 = in.m_35.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].z, _99);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_65);
        float _741 = 1.0 / _739;
        float _743 = _99 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _735;
    float _747 = in.m_35.x;
    float _749 = in.m_35.y;
    float _751 = in.m_35.z;
    float _753 = in.m_35.w;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _761 = _745 + _759;
    float _763 = as_type<float>(int(gl_VertexIndex));
    float _765 = _99 * _757;
    float _767 = _751 * 2.0;
    float _769 = _749 * 2.0;
    float _771 = _747 * 2.0;
    float _773 = _749 + _751;
    int _775 = as_type<int>(_763) & 1;
    bool _777 = _775 != 0;
    int _779 = as_type<int>(_763) & 2;
    bool _781 = _779 != 0;
    float _783 = _751 + _747;
    float _785 = floor(_767);
    float _787 = _749 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _789 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _791 = _749 + _747;
    bool _793 = !_777;
    float _795 = _793 ? (-0.5) : 0.5;
    float _797 = _773 + (-1.0);
    float _799 = floor(_769);
    float _801 = _791 + (-1.0);
    float _803 = floor(_771);
    bool _805 = _785 >= 0.0;
    bool _807 = isnan(_785);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = _785 > 0.0;
    int _817 = _813 ? 0 : 1;
    bool _819 = _747 > 0.5;
    bool _821 = _799 > 0.0;
    float _823 = -_795;
    int _825 = _819 ? as_type<int>(_823) : as_type<int>(_795);
    bool _827 = _799 >= 0.0;
    bool _829 = isnan(_799);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    float _837 = in.m_33.x;
    float _839 = in.m_33.y;
    bool _841 = _803 > 0.0;
    bool _843 = _803 >= 0.0;
    bool _845 = isnan(_803);
    bool _847 = _843 || _845;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    float _853 = exp2(_765);
    int _855 = ~_817;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    int _861 = _851 ? 0 : 1;
    int _863 = _859;
    if (!_815)
    {
        int _865 = ~_817;
        int _867 = _865 + 1;
        _863 = _867;
    }
    int _869 = _863;
    int _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _873 = _871 != 0;
    bool _875 = _751 > 0.5;
    int _877 = _835 ? 0 : 1;
    bool _879 = !_873;
    float _881 = _879 ? _795 : as_type<float>(_825);
    float _883 = -_853;
    float _885 = _883 + 1.0;
    float _887 = -_795;
    int _889 = _875 ? as_type<int>(_887) : as_type<int>(_795);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _893 = 1.0 + _891;
    int _895 = ~_877;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _907 = _905 != 0;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _911 = _909 != 0;
    float _913 = 1.0 / _893;
    int _915 = _899;
    if (!_821)
    {
        int _917 = ~_877;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    bool _923 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _925 = isnan(0.0);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _931 = _927 || _929;
    bool _933 = !_903;
    int _935 = _933 ? 0 : 1;
    bool _937 = !_907;
    int _939 = _937 ? 0 : 1;
    float _941 = _931 ? _885 : 0.0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _953 = _951 != 0;
    float _955 = _713 * _837;
    float _957 = _751 + (-0.5);
    int _959 = ~_861;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    float _965 = _941 * _913;
    int _967 = _963;
    if (!_841)
    {
        int _969 = ~_861;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _979 = _753 > 0.5;
    float _981 = _715 * _839;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _983;
    bool _987 = !_911;
    int _989 = _987 ? 0 : 1;
    float _991 = 1.0 / _977;
    bool _993 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _995 = isnan(1.0);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1001 = _997 || _999;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1005 = _747 + (-0.5);
    float _1007 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1003);
    bool _1009 = !_1001;
    float _1011 = _1009 ? _99 : _965;
    float _1013 = 1.0 / _985;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1019 = _745 + _1017;
    bool _1021 = _749 > 0.5;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1025 = fma(_787, -2.0, _1015);
    float _1027 = _955 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1029 = _1019 * _991;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1033 = _749 + (-0.5);
    int _1035 = abs(_935);
    float _1037 = _783 + (-1.0);
    float _1039 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1031);
    float _1041 = -_1023;
    float _1043 = fma(_789, 2.0, _1041);
    float _1045 = in.m_40.x;
    float _1047 = in.m_40.y;
    float _1049 = in.m_40.z;
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1053 = float(_1035);
    float _1055 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1057 = _761 * _1013;
    float _1059 = float(_869);
    float _1061 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1007);
    int _1063 = abs(_939);
    float _1065 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1067 = _1053 * _1059;
    float _1069 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1039);
    float _1071 = float(_973);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1073;
    float _1077 = float(_1063);
    float _1079 = _1067 * (-2.0);
    float _1081 = fma(_1075, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1083 = _1077 * _1071;
    int _1085 = abs(_989);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1087;
    float _1091 = fma(_1079, _1045, _1045);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1093;
    float _1097 = _1083 * (-2.0);
    float _1099 = fma(_1089, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1101 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1091);
    float _1103 = fma(_1095, _1057, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1105 = fma(_1065, _1079, _1065);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1115 = float(_1085);
    float _1117 = fma(_1097, _1047, _1047);
    float _1119 = float(_921);
    float _1121 = fma(_1109, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1123 = fma(_1113, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1125 = fma(_1055, _1097, _1055);
    float _1127 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1117);
    float _1129 = _1115 * _1119;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _795);
    float _1135 = fma(_1011, _1125, _1127);
    float _1137 = _1129 * (-2.0);
    bool _1139 = !_781;
    float _1141 = _1139 ? (-0.5) : 0.5;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1147 = _1135 * 0.15915493667125701904296875;
    float _1149 = fma(_1137, _1049, _1049);
    float _1151 = fma(_1051, _1137, _1051);
    float _1153 = -_1141;
    int _1155 = _979 ? as_type<int>(_1153) : as_type<int>(_1141);
    float _1157 = _1027 * _1133;
    bool _1159 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1161 = isnan(_745);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1149);
    float _1173 = -_1141;
    int _1175 = _1021 ? as_type<int>(_1173) : as_type<int>(_1141);
    float _1177 = fma(_1145, _1029, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1179 = !_953;
    float _1181 = _1179 ? _1141 : as_type<float>(_1155);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1141);
    bool _1185 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1187 = isnan(_745);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1199 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1201 = isnan(_745);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1207 = _1203 || _1205;
    float _1209 = float(_1207);
    float _1211 = fma(_1011, _1105, _1101);
    bool _1213 = !_945;
    float _1215 = _1213 ? _1141 : as_type<float>(_1175);
    float _1217 = -_1169;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_1011, _1151, _1171);
    float _1223 = -_1195;
    float _1225 = _1223 + 1.0;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1229 = _1209 * _1219;
    float _1231 = _1197 * _1183;
    float _1233 = _1211 * 0.15915493667125701904296875;
    float _1235 = _1221 * 0.15915493667125701904296875;
    float _1237 = -_99;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1043);
    float _1241 = _1169 * _1225;
    float _1243 = _1099 * _1229;
    bool _1245 = !_949;
    float _1247 = _1245 ? _795 : as_type<float>(_889);
    float _1249 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _881 + 0.5;
    float _1253 = _1233 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1081 * _1229;
    float _1259 = -_1209;
    float _1261 = _1259 + 1.0;
    float _1263 = fma(_1249, _1251, _1239);
    float _1265 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1025);
    float _1267 = _1103 * _1229;
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1243);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1257);
    float _1273 = _1233 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    float _1277 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = _1215 + (-0.5);
    float _1281 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1267);
    float _1283 = fma(_1121, _1241, _1269);
    float _1285 = fma(_1177, _1241, _1271);
    float _1287 = -_1277;
    float _1289 = -_1265;
    float _1291 = fma(_1287, _1279, _1289);
    float _1293 = fma(_1123, _1241, _1281);
    float _1295 = _1147 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1301 = -_1069;
    float _1303 = _1301 + 1.0;
    float _1305 = _1247 + 0.5;
    float _1307 = fma(_1215, _1303, _1291);
    float _1309 = _1235 * 6.283185482025146484375;
    float _1311 = cos(_1309);
    float _1313 = _1147 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1275 * _1297;
    float _1319 = _1255 * _1297;
    float _1321 = _1235 * 6.283185482025146484375;
    float _1323 = sin(_1321);
    float _1325 = _1297 * _1311;
    float _1327 = _1311 * _1231;
    float _1329 = _1275 * _1315;
    float _1331 = _1255 * _1315;
    float _1333 = _1275 * _1327;
    float _1335 = _1315 * _1311;
    float _1337 = _1255 * _1327;
    float _1339 = fma(_1323, _1329, _1319);
    float _1341 = -_1317;
    float _1343 = fma(_1323, _1331, _1341);
    float _1345 = -_1331;
    float _1347 = fma(_1323, _1317, _1345);
    float _1349 = _1323 * _1231;
    float _1351 = fma(_1339, _1157, _1333);
    float _1353 = fma(_1343, _1157, _1337);
    float _1355 = fma(_1323, _1319, _1329);
    float _1357 = -_1349;
    float _1359 = fma(_1335, _1157, _1357);
    float _1361 = fma(_1347, _1299, _1351);
    float _1363 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1283);
    float _1365 = fma(_1355, _1299, _1353);
    float _1367 = fma(_1325, _1299, _1359);
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1375 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1285);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1371);
    float _1381 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1373);
    float _1383 = -_1061;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1377);
    float _1389 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1379);
    float _1391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1393 = -_1385;
    float _1395 = fma(_881, _1393, _1263);
    float _1397 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1399 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1401 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1381);
    float _1403 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1293);
    float _1405 = _1397 * _1397;
    float _1407 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1411 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1413 = fma(_1399, _1399, _1405);
    float _1415 = -_1181;
    float _1417 = _1415 + 0.5;
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1429 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1431 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1433 = _1425 * _1391;
    float _1435 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1437 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1439 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1441 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1431);
    float _1443 = sqrt(_1423);
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1437);
    float _1449 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1439);
    float _1451 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1441);
    out.m_42.x = _1419;
    out.m_42.y = _1421;
    out.m_42.z = _1445;
    float _1453 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1447);
    float _1455 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1449);
    float _1457 = _1429 * _1427;
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1461 = _1453 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_44.x = _1395;
    out.m_44.y = _1307;
    out.m_44.z = _1457;
    out.m_44.w = _1433;
    bool _1465 = _1443 > 0.0;
    float _1467 = _1459 + _1399;
    float _1469 = _1461 + _1397;
    float _1471 = _1463 + _1409;
    bool _1473 = !_1465;
    float _1475 = _1459;
    float _1477 = _1463;
    float _1479 = _1433;
    float _1481 = _1469;
    float _1483 = _1467;
    float _1485 = _1471;
    if (!_1473)
    {
        bool _1487 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1489 = _1451;
        if (_1487)
        {
            float _1491 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1489 = _1491;
        }
        float _1493 = _1489;
        if (_1487)
        {
            float _1495 = _373 * _1493;
            _1475 = _1495;
        }
        float _1497 = _1475;
        float _1499 = _1497;
        if (_1487)
        {
            float _1501 = _375 * _1493;
            _1477 = _1501;
        }
        float _1503 = _1477;
        float _1505 = _1503;
        if (_1487)
        {
            float _1507 = _377 * _1493;
            _1479 = _1507;
        }
        float _1509 = _1479;
        float _1511 = _1509;
        float _1513 = _1509;
        if (!_1487)
        {
            float _1515 = _99 + 1.0;
            float _1517 = _1515;
            if (!_131)
            {
                float _1519 = _1515 * _1515;
                float _1521 = _1519 * 0.5;
                _1511 = _1521;
            }
            float _1523 = _1511;
            float _1525 = _1523;
            if (!_131)
            {
                float _1527 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1525 = _1527;
            }
            float _1529 = _1525;
            bool _1531 = !_131;
            float _1533 = _1529;
            if (!_1531)
            {
                float _1535 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1537 = log2(_1535);
                float _1539 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1541 = _1537 * _1515;
                float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1545 = 1.0 + _1543;
                float _1547 = exp2(_1541);
                float _1549 = _1539 * 0.693147182464599609375;
                float _1551 = 1.0 / _1549;
                float _1553 = 1.0 / _1545;
                float _1555 = _1547 + (-1.0);
                float _1557 = -_1555;
                float _1559 = fma(_1557, _1551, _1515);
                float _1561 = _1559 * _1553;
                float _1563 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1533 = _1563;
            }
            float _1565 = _1533;
            float _1567 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1569 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1571 = !_131;
            if (!_1571)
            {
                float _1573 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1575 = log2(_1573);
                float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1579 = 1.0 + _1577;
                float _1581 = 1.0 / _1579;
                float _1583 = _1575 * _1515;
                float _1585 = exp2(_1583);
                float _1587 = -_1585;
                float _1589 = _1587 + 1.0;
                float _1591 = _1589 * _1581;
                _1517 = _1591;
            }
            float _1593 = _1517;
            float _1595 = fma(_1593, _135, _1569);
            float _1597 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1599 = fma(_1593, _133, _1567);
            float _1601 = -_333;
            float _1603 = _1601 + _1595;
            float _1605 = fma(_1593, _137, _1597);
            float _1607 = -_341;
            float _1609 = _1607 + _1599;
            float _1611 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1613 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1615 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1617 = -_347;
            float _1619 = _1617 + _1605;
            float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1611);
            float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1613);
            float _1625 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1615);
            float _1627 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1621);
            float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1623);
            float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1625);
            _381 = _1629;
            _383 = _1627;
            _385 = _1631;
            _1499 = _1627;
            _1505 = _1629;
            _1513 = _1631;
        }
        float _1633 = _381;
        float _1635 = _383;
        float _1637 = _385;
        float _1639 = _1499;
        float _1641 = _1505;
        float _1643 = _1513;
        float _1645 = _1633 * _1633;
        float _1647 = rsqrt(_1423);
        float _1649 = fma(_1635, _1635, _1645);
        float _1651 = fma(_1637, _1637, _1649);
        float _1653 = sqrt(_1651);
        float _1655 = _1399 * _1647;
        float _1657 = _1397 * _1647;
        float _1659 = _1409 * _1647;
        bool _1661 = _1653 > 0.0;
        bool _1663 = !_1661;
        if (!_1663)
        {
            float _1665 = rsqrt(_1651);
            float _1667 = _1665 * _1633;
            float _1669 = _1665 * _1635;
            float _1671 = _1665 * _1637;
            float _1673 = _1657 * _1667;
            float _1675 = fma(_1655, _1669, _1673);
            float _1677 = fma(_1659, _1671, _1675);
            float _1679 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1681 = fma(_1639, _1679, _1467);
            float _1683 = fma(_1641, _1679, _1469);
            float _1685 = fma(_1643, _1679, _1471);
            _1481 = _1683;
            _1483 = _1681;
            _1485 = _1685;
        }
    }
    float _1687 = _1481;
    float _1689 = _1483;
    float _1691 = _1485;
    float _1693 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1695 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1693);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1695);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1697);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1699);
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1701);
    float _1711 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1703);
    float _1713 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1705);
    float _1715 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1707);
    float _1717 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1721 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1723 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1725 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1731 = _1717 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1733 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1735 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1737 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1729);
    float _1739 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1731);
    float _1741 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1733);
    float _1743 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    float _1745 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1737);
    float _1747 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1739);
    float _1749 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1751 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1743);
    float _1753 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1745);
    float _1755 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1747);
    out.m_46.x = _1689;
    out.m_46.y = _1687;
    out.m_46.z = _1691;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1749;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1755;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

