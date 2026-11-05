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
    float4 m_44 [[user(locn0)]];
    float4 m_33 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _547 = false;
    bool _373 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1082 = as_type<float>(_81);
        out.gl_Position.z = _1082;
    }
    if (!_69)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _85 = in.m_35.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _101 = 0.0;
    if (_95)
    {
        float _103 = float(_65);
        _101 = _103;
    }
    float _105 = _101;
    bool _107 = _99 >= _105;
    bool _109 = !_95;
    bool _111 = _107 || _109;
    if (_111)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _75;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1150 = as_type<float>(_117);
        out.gl_Position.z = _1150;
    }
    if (_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_37.x;
    float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _123 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _127 = _125 != 0;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _131 = _129 != 0;
    int _133 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _135 = _133 != 0;
    float _137 = _123 * _121;
    float _139 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _141 = floor(_139);
    float _143 = _139 * 6.283185482025146484375;
    float _145 = _143 * 0.15915493667125701904296875;
    bool _147 = !_127;
    int _149 = _147 ? 0 : 1;
    int _151 = abs(_149);
    float _153 = _145 * 6.283185482025146484375;
    float _155 = cos(_153);
    float _157 = -_141;
    float _159 = _139 + _157;
    bool _161 = !_135;
    int _163 = _161 ? 0 : 1;
    bool _165 = !_131;
    int _167 = _165 ? 0 : 1;
    int _169 = abs(_163);
    int _171 = abs(_167);
    float _173 = -_159;
    float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _177 = float(_151);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = fma(_155, 0.5, 0.5);
    float _183 = abs(_175);
    float _185 = _177 * _183;
    bool _187 = _159 < 0.5;
    float _189 = float(_187);
    float _191 = -_181;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_169);
    float _197 = -_189;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = float(_171);
    float _203 = fma(_195, _193, _185);
    float _205 = abs(_199);
    float _207 = fma(_201, _205, _203);
    bool _209 = !_179;
    float _225;
    if (!_209)
    {
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_65);
        float _231 = 1.0 / _229;
        float _233 = _99 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    bool _253 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_235);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_251;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_235);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _263 * _275;
    float _293 = -_263;
    float _295 = _293 + 1.0;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _299 = _289 * _295;
    float _301 = 1.0 / _271;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _239 * _277;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _235 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_315, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _311 * _301;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _321 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _323 * _299;
    float _339 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _343 = fma(_335, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _347 = fma(_339, _291, _341);
    float _349 = fma(_343, _291, _345);
    float _351 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _347);
    float _353 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _349);
    bool _355 = !_297;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_65);
        float _377 = 1.0 / _375;
        float _379 = _99 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = in.m_39.x;
    float _385 = in.m_39.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _389 = _381 + _387;
    bool _391 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _393 = isnan(_381);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _411 = -_401;
    float _413 = _411 + 1.0;
    float _415 = 1.0 / _409;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _419 = 1.0 / _405;
    float _421 = _353 * _385;
    bool _423 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_381);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _435;
    float _439 = _351 * _383;
    float _441 = _389 * _419;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _445 = _381 + _443;
    bool _447 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _449 = isnan(_381);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _459;
    float _463 = fma(_437, _441, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _465 = _445 * _415;
    float _467 = _457 * _413;
    float _469 = -_457;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = fma(_461, _441, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = _433 * _471;
    float _481 = fma(_475, _441, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _483 = -_433;
    float _485 = _483 + 1.0;
    float _487 = _463 * _479;
    float _489 = _481 * _479;
    float _491 = _477 * _479;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _505 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].x, _489);
    float _507 = fma(_495, _465, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _509 = fma(_499, _465, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _511 = fma(_503, _465, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _513 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _515 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _517 = fma(_507, _467, _505);
    float _519 = fma(_509, _467, _513);
    float _521 = fma(_511, _467, _515);
    float _523 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].x, _517);
    float _525 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].y, _519);
    float _527 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].z, _521);
    bool _529 = !_417;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _533 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        float _549 = float(_65);
        float _551 = 1.0 / _549;
        float _553 = _99 * _551;
        _545 = _553;
    }
    _547 = false;
    float _555 = _545;
    float _557 = as_type<float>(int(gl_VertexIndex));
    float _559 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _561 = in.m_30.x;
    float _563 = in.m_30.y;
    float _565 = in.m_30.z;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _577 = 1.0 / _569;
    float _579 = 1.0 / _575;
    int _581 = as_type<int>(_557) & 1;
    bool _583 = _581 != 0;
    int _585 = as_type<int>(_557) & 2;
    bool _587 = _585 != 0;
    float _589 = _563 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _591 = !_587;
    float _593 = _591 ? (-0.5) : 0.5;
    float _595 = _563 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _597 = _563 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _599 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].x, _589);
    bool _601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _603 = isnan(0.5);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _609 = _605 || _607;
    float _611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _593);
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].x, _597);
    float _615 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _617 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].x, _595);
    float _619 = _559 * _611;
    bool _621 = !_583;
    float _623 = _621 ? (-0.5) : 0.5;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _625;
    float _629 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _613);
    float _631 = _619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _623);
    float _637 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _639 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _617);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _555 + _641;
    float _645 = _571 * _635;
    float _647 = _627 * _577;
    float _649 = _619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _657 = _633 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _659 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[24].x, _649);
    float _661 = _639 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _663 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _655);
    bool _665 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _667 = isnan(_555);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _659);
    float _679 = _661 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _681 = _663 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _653 * _579;
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _687 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[11].x, _679);
    float _689 = _637 + _681;
    bool _691 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_555);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _657 + _685;
    float _705 = -_675;
    float _707 = _705 + 1.0;
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _689 + _709;
    float _713 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _687);
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _717 = _703 + _715;
    float _719 = _701 * _707;
    float _721 = _711 * _711;
    float _723 = -_701;
    float _725 = _723 + 1.0;
    float _727 = fma(_647, _643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _729 = _619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _731 = fma(_717, _717, _721);
    bool _733 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _735 = isnan(_555);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _661 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _747 = _713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = sqrt(_731);
    float _751 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[25].x, _729);
    float _753 = _743 * _725;
    float _755 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[10].x, _745);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _759 = _555 + _757;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = _727 * _753;
    float _767 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _769 = 1.0 / _747;
    float _771 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _755);
    float _773 = fma(_683, _759, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _775 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[115].x, _765);
    float _777 = _767 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _779 = _771 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _781 = fma(_773, _719, _775);
    bool _783 = _749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _661 + _777;
    float _787 = _779 + _747;
    float _789 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[117].x, _781);
    float _791 = _787 * _769;
    float _793 = _791 * 0.5;
    float _795 = _781;
    float _797 = _773;
    float _799 = _615;
    float _801 = _711;
    if (!_783)
    {
        _795 = _703;
    }
    float _803 = _795;
    float _805 = _803;
    if (!_783)
    {
        _797 = _689;
    }
    float _807 = _797;
    float _809 = _807;
    if (!_783)
    {
        _799 = _785;
    }
    float _811 = _799;
    bool _813 = !_783;
    float _815 = _811;
    if (!_813)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _821 = _749 + _819;
        float _823 = rsqrt(_731);
        float _825 = _821 * _817;
        float _827 = _785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _829 = _825 * 0.15915493667125701904296875;
        float _831 = _829 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _829 * 6.283185482025146484375;
        float _837 = sin(_835);
        float _839 = _833 + (-1.0);
        float _841 = fma(_837, _827, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _843 = _839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = _823 * _841;
        float _847 = fma(_785, _833, _843);
        float _849 = fma(_717, _845, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _851 = fma(_711, _845, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _815 = _847;
        _805 = _849;
        _809 = _851;
    }
    float _853 = _815;
    float _855 = _805;
    float _857 = _809;
    float _859 = _853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_609)
    {
        _801 = 1.0;
    }
    float _861 = _801;
    float _863 = _861;
    if (!_609)
    {
        float _865 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _869 = _865 * 0.15915493667125701904296875;
        float _871 = _867 * 0.15915493667125701904296875;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _875 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _873);
        float _877 = _869 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = _869 * 6.283185482025146484375;
        float _883 = sin(_881);
        float _885 = 1.0 / _879;
        float _887 = _871 * 6.283185482025146484375;
        float _889 = cos(_887);
        float _891 = _883 * _885;
        float _893 = _871 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _899 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _897;
        float _901 = _889 * _891;
        float _903 = 1.0 / _875;
        float _905 = 1.0 / _901;
        float _907 = 1.0 / _899;
        float _909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _911 = _903 * _909;
        float _913 = _895 * _905;
        float _915 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _917 = fma(_913, _911, _915);
        float _919 = _917 * _907;
        float _921 = precise::clamp(_919, 0.0, 1.0);
        float _923 = -_921;
        float _925 = _923 + 1.0;
        _863 = _925;
    }
    float _927 = _863;
    float _929 = _853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _931 = _853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _933 = _853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _935 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _859);
    float _937 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _929);
    float _939 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _931);
    float _941 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _933);
    float _943 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _945 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _937);
    float _947 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _935);
    float _949 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _939);
    float _951 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _941);
    float _953 = _945 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _955 = _207 * _943;
    float _957 = _947 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _959 = _949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _961 = _953 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _963 = _953 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _965 = _953 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _967 = _953 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _969 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[4].x, _961);
    float _971 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[5].x, _963);
    float _973 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[6].x, _965);
    float _975 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[7].x, _967);
    bool _977 = _927 > 0.0;
    bool _979 = isnan(_927);
    bool _981 = _977 || _979;
    bool _983 = isnan(0.0);
    bool _985 = _981 || _983;
    float _987 = _951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _989 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _969);
    float _991 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _971);
    float _993 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _973);
    float _995 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _975);
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _989);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _991);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _993);
    float _1003 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _995);
    float _1005 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1007 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1009 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1011 = _1001 + _1003;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1019 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1021 = _955 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1023 = _1011 * 0.5;
    out.m_44.x = _1013;
    out.m_44.y = _1015;
    out.m_44.z = _1017;
    out.m_44.w = _1019;
    out.m_33.x = _1021;
    out.gl_Position.x = _997;
    out.gl_Position.y = _999;
    out.gl_Position.z = _1001;
    out.gl_Position.w = _1003;
    out.m_46.z = _1023;
    out.m_46.w = _1003;
    if (_985)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1025 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1025;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _547 = false;
    bool _373 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1082 = as_type<float>(_81);
        out.gl_Position.z = _1082;
    }
    if (!_69)
    {
        return out;
    }
    float _85 = in.m_35.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _101 = 0.0;
    if (_95)
    {
        float _103 = float(_65);
        _101 = _103;
    }
    float _105 = _101;
    bool _107 = _99 >= _105;
    bool _109 = !_95;
    bool _111 = _107 || _109;
    if (_111)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _75;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1150 = as_type<float>(_117);
        out.gl_Position.z = _1150;
    }
    if (_111)
    {
        return out;
    }
    float _119 = in.m_37.x;
    float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _123 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _127 = _125 != 0;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _131 = _129 != 0;
    int _133 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _135 = _133 != 0;
    float _137 = _123 * _121;
    float _139 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _141 = floor(_139);
    float _143 = _139 * 6.283185482025146484375;
    float _145 = _143 * 0.15915493667125701904296875;
    bool _147 = !_127;
    int _149 = _147 ? 0 : 1;
    int _151 = abs(_149);
    float _153 = _145 * 6.283185482025146484375;
    float _155 = cos(_153);
    float _157 = -_141;
    float _159 = _139 + _157;
    bool _161 = !_135;
    int _163 = _161 ? 0 : 1;
    bool _165 = !_131;
    int _167 = _165 ? 0 : 1;
    int _169 = abs(_163);
    int _171 = abs(_167);
    float _173 = -_159;
    float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _177 = float(_151);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = fma(_155, 0.5, 0.5);
    float _183 = abs(_175);
    float _185 = _177 * _183;
    bool _187 = _159 < 0.5;
    float _189 = float(_187);
    float _191 = -_181;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_169);
    float _197 = -_189;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = float(_171);
    float _203 = fma(_195, _193, _185);
    float _205 = abs(_199);
    float _207 = fma(_201, _205, _203);
    bool _209 = !_179;
    float _225;
    if (!_209)
    {
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_65);
        float _231 = 1.0 / _229;
        float _233 = _99 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    bool _253 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_235);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_251;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_235);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _263 * _275;
    float _293 = -_263;
    float _295 = _293 + 1.0;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _299 = _289 * _295;
    float _301 = 1.0 / _271;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _239 * _277;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _235 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_315, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _311 * _301;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _321 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _323 * _299;
    float _339 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _343 = fma(_335, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _347 = fma(_339, _291, _341);
    float _349 = fma(_343, _291, _345);
    float _351 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _347);
    float _353 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _349);
    bool _355 = !_297;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_65);
        float _377 = 1.0 / _375;
        float _379 = _99 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = in.m_39.x;
    float _385 = in.m_39.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _389 = _381 + _387;
    bool _391 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _393 = isnan(_381);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _411 = -_401;
    float _413 = _411 + 1.0;
    float _415 = 1.0 / _409;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _419 = 1.0 / _405;
    float _421 = _353 * _385;
    bool _423 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_381);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _435;
    float _439 = _351 * _383;
    float _441 = _389 * _419;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _445 = _381 + _443;
    bool _447 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _449 = isnan(_381);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _459;
    float _463 = fma(_437, _441, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _465 = _445 * _415;
    float _467 = _457 * _413;
    float _469 = -_457;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = fma(_461, _441, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = _433 * _471;
    float _481 = fma(_475, _441, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _483 = -_433;
    float _485 = _483 + 1.0;
    float _487 = _463 * _479;
    float _489 = _481 * _479;
    float _491 = _477 * _479;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _505 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].x, _489);
    float _507 = fma(_495, _465, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _509 = fma(_499, _465, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _511 = fma(_503, _465, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _513 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _515 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _517 = fma(_507, _467, _505);
    float _519 = fma(_509, _467, _513);
    float _521 = fma(_511, _467, _515);
    float _523 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].x, _517);
    float _525 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].y, _519);
    float _527 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].z, _521);
    bool _529 = !_417;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _533 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        float _549 = float(_65);
        float _551 = 1.0 / _549;
        float _553 = _99 * _551;
        _545 = _553;
    }
    _547 = false;
    float _555 = _545;
    float _557 = as_type<float>(int(gl_VertexIndex));
    float _559 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _561 = in.m_30.x;
    float _563 = in.m_30.y;
    float _565 = in.m_30.z;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _577 = 1.0 / _569;
    float _579 = 1.0 / _575;
    int _581 = as_type<int>(_557) & 1;
    bool _583 = _581 != 0;
    int _585 = as_type<int>(_557) & 2;
    bool _587 = _585 != 0;
    float _589 = _563 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _591 = !_587;
    float _593 = _591 ? (-0.5) : 0.5;
    float _595 = _563 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _597 = _563 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _599 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].x, _589);
    bool _601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _603 = isnan(0.5);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _609 = _605 || _607;
    float _611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _593);
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].x, _597);
    float _615 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _617 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].x, _595);
    float _619 = _559 * _611;
    bool _621 = !_583;
    float _623 = _621 ? (-0.5) : 0.5;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _625;
    float _629 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _613);
    float _631 = _619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _623);
    float _637 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _639 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _617);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _555 + _641;
    float _645 = _571 * _635;
    float _647 = _627 * _577;
    float _649 = _619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _657 = _633 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _659 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[24].x, _649);
    float _661 = _639 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _663 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _655);
    bool _665 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _667 = isnan(_555);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _659);
    float _679 = _661 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _681 = _663 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _653 * _579;
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _687 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[11].x, _679);
    float _689 = _637 + _681;
    bool _691 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_555);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _657 + _685;
    float _705 = -_675;
    float _707 = _705 + 1.0;
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _689 + _709;
    float _713 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _687);
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _717 = _703 + _715;
    float _719 = _701 * _707;
    float _721 = _711 * _711;
    float _723 = -_701;
    float _725 = _723 + 1.0;
    float _727 = fma(_647, _643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _729 = _619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _731 = fma(_717, _717, _721);
    bool _733 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _735 = isnan(_555);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _661 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _747 = _713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = sqrt(_731);
    float _751 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[25].x, _729);
    float _753 = _743 * _725;
    float _755 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[10].x, _745);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _759 = _555 + _757;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = _727 * _753;
    float _767 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _769 = 1.0 / _747;
    float _771 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _755);
    float _773 = fma(_683, _759, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _775 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[115].x, _765);
    float _777 = _767 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _779 = _771 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _781 = fma(_773, _719, _775);
    bool _783 = _749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _661 + _777;
    float _787 = _779 + _747;
    float _789 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[117].x, _781);
    float _791 = _787 * _769;
    float _793 = _791 * 0.5;
    float _795 = _781;
    float _797 = _773;
    float _799 = _615;
    float _801 = _711;
    if (!_783)
    {
        _795 = _703;
    }
    float _803 = _795;
    float _805 = _803;
    if (!_783)
    {
        _797 = _689;
    }
    float _807 = _797;
    float _809 = _807;
    if (!_783)
    {
        _799 = _785;
    }
    float _811 = _799;
    bool _813 = !_783;
    float _815 = _811;
    if (!_813)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _821 = _749 + _819;
        float _823 = rsqrt(_731);
        float _825 = _821 * _817;
        float _827 = _785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _829 = _825 * 0.15915493667125701904296875;
        float _831 = _829 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _829 * 6.283185482025146484375;
        float _837 = sin(_835);
        float _839 = _833 + (-1.0);
        float _841 = fma(_837, _827, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _843 = _839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = _823 * _841;
        float _847 = fma(_785, _833, _843);
        float _849 = fma(_717, _845, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _851 = fma(_711, _845, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _815 = _847;
        _805 = _849;
        _809 = _851;
    }
    float _853 = _815;
    float _855 = _805;
    float _857 = _809;
    float _859 = _853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_609)
    {
        _801 = 1.0;
    }
    float _861 = _801;
    float _863 = _861;
    if (!_609)
    {
        float _865 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _869 = _865 * 0.15915493667125701904296875;
        float _871 = _867 * 0.15915493667125701904296875;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _875 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _873);
        float _877 = _869 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = _869 * 6.283185482025146484375;
        float _883 = sin(_881);
        float _885 = 1.0 / _879;
        float _887 = _871 * 6.283185482025146484375;
        float _889 = cos(_887);
        float _891 = _883 * _885;
        float _893 = _871 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _899 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _897;
        float _901 = _889 * _891;
        float _903 = 1.0 / _875;
        float _905 = 1.0 / _901;
        float _907 = 1.0 / _899;
        float _909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _911 = _903 * _909;
        float _913 = _895 * _905;
        float _915 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _917 = fma(_913, _911, _915);
        float _919 = _917 * _907;
        float _921 = precise::clamp(_919, 0.0, 1.0);
        float _923 = -_921;
        float _925 = _923 + 1.0;
        _863 = _925;
    }
    float _927 = _863;
    float _929 = _853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _931 = _853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _933 = _853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _935 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _859);
    float _937 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _929);
    float _939 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _931);
    float _941 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _933);
    float _943 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _945 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _937);
    float _947 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _935);
    float _949 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _939);
    float _951 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _941);
    float _953 = _945 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _955 = _207 * _943;
    float _957 = _947 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _959 = _949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _961 = _953 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _963 = _953 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _965 = _953 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _967 = _953 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _969 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[4].x, _961);
    float _971 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[5].x, _963);
    float _973 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[6].x, _965);
    float _975 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[7].x, _967);
    bool _977 = _927 > 0.0;
    bool _979 = isnan(_927);
    bool _981 = _977 || _979;
    bool _983 = isnan(0.0);
    bool _985 = _981 || _983;
    float _987 = _951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _989 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _969);
    float _991 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _971);
    float _993 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _973);
    float _995 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _975);
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _989);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _991);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _993);
    float _1003 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _995);
    float _1005 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1007 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1009 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1011 = _1001 + _1003;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1019 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1021 = _955 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1023 = _1011 * 0.5;
    out.m_44.x = _1013;
    out.m_44.y = _1015;
    out.m_44.z = _1017;
    out.m_44.w = _1019;
    out.m_33.x = _1021;
    out.gl_Position.x = _997;
    out.gl_Position.y = _999;
    out.gl_Position.z = _1001;
    out.gl_Position.w = _1003;
    out.m_46.z = _1023;
    out.m_46.w = _1003;
    if (_985)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1025 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1025;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _547 = false;
    bool _373 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1082 = as_type<float>(_81);
        out.gl_Position.z = _1082;
    }
    if (!_69)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _85 = in.m_35.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _101 = 0.0;
    if (_95)
    {
        float _103 = float(_65);
        _101 = _103;
    }
    float _105 = _101;
    bool _107 = _99 >= _105;
    bool _109 = !_95;
    bool _111 = _107 || _109;
    if (_111)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _75;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1150 = as_type<float>(_117);
        out.gl_Position.z = _1150;
    }
    if (_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_37.x;
    float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _123 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _127 = _125 != 0;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _131 = _129 != 0;
    int _133 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _135 = _133 != 0;
    float _137 = _123 * _121;
    float _139 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _141 = floor(_139);
    float _143 = _139 * 6.283185482025146484375;
    float _145 = _143 * 0.15915493667125701904296875;
    bool _147 = !_127;
    int _149 = _147 ? 0 : 1;
    int _151 = abs(_149);
    float _153 = _145 * 6.283185482025146484375;
    float _155 = cos(_153);
    float _157 = -_141;
    float _159 = _139 + _157;
    bool _161 = !_135;
    int _163 = _161 ? 0 : 1;
    bool _165 = !_131;
    int _167 = _165 ? 0 : 1;
    int _169 = abs(_163);
    int _171 = abs(_167);
    float _173 = -_159;
    float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _177 = float(_151);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = fma(_155, 0.5, 0.5);
    float _183 = abs(_175);
    float _185 = _177 * _183;
    bool _187 = _159 < 0.5;
    float _189 = float(_187);
    float _191 = -_181;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_169);
    float _197 = -_189;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = float(_171);
    float _203 = fma(_195, _193, _185);
    float _205 = abs(_199);
    float _207 = fma(_201, _205, _203);
    bool _209 = !_179;
    float _225;
    if (!_209)
    {
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_65);
        float _231 = 1.0 / _229;
        float _233 = _99 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    bool _253 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_235);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_251;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_235);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _263 * _275;
    float _293 = -_263;
    float _295 = _293 + 1.0;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _299 = _289 * _295;
    float _301 = 1.0 / _271;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _239 * _277;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _235 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_315, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _311 * _301;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _321 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _323 * _299;
    float _339 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _343 = fma(_335, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _347 = fma(_339, _291, _341);
    float _349 = fma(_343, _291, _345);
    float _351 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _347);
    float _353 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _349);
    bool _355 = !_297;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_65);
        float _377 = 1.0 / _375;
        float _379 = _99 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = in.m_39.x;
    float _385 = in.m_39.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _389 = _381 + _387;
    bool _391 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _393 = isnan(_381);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _411 = -_401;
    float _413 = _411 + 1.0;
    float _415 = 1.0 / _409;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _419 = 1.0 / _405;
    float _421 = _353 * _385;
    bool _423 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_381);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _435;
    float _439 = _351 * _383;
    float _441 = _389 * _419;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _445 = _381 + _443;
    bool _447 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _449 = isnan(_381);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _459;
    float _463 = fma(_437, _441, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _465 = _445 * _415;
    float _467 = _457 * _413;
    float _469 = -_457;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = fma(_461, _441, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = _433 * _471;
    float _481 = fma(_475, _441, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _483 = -_433;
    float _485 = _483 + 1.0;
    float _487 = _463 * _479;
    float _489 = _481 * _479;
    float _491 = _477 * _479;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _505 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].x, _489);
    float _507 = fma(_495, _465, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _509 = fma(_499, _465, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _511 = fma(_503, _465, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _513 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _515 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _517 = fma(_507, _467, _505);
    float _519 = fma(_509, _467, _513);
    float _521 = fma(_511, _467, _515);
    float _523 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].x, _517);
    float _525 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].y, _519);
    float _527 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[109].z, _521);
    bool _529 = !_417;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _533 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        float _549 = float(_65);
        float _551 = 1.0 / _549;
        float _553 = _99 * _551;
        _545 = _553;
    }
    _547 = false;
    float _555 = _545;
    float _557 = as_type<float>(int(gl_VertexIndex));
    float _559 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _561 = in.m_30.x;
    float _563 = in.m_30.y;
    float _565 = in.m_30.z;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _577 = 1.0 / _569;
    float _579 = 1.0 / _575;
    int _581 = as_type<int>(_557) & 1;
    bool _583 = _581 != 0;
    int _585 = as_type<int>(_557) & 2;
    bool _587 = _585 != 0;
    float _589 = _563 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _591 = !_587;
    float _593 = _591 ? (-0.5) : 0.5;
    float _595 = _563 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _597 = _563 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _599 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].x, _589);
    bool _601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _603 = isnan(0.5);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _609 = _605 || _607;
    float _611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _593);
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].x, _597);
    float _615 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _617 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].x, _595);
    float _619 = _559 * _611;
    bool _621 = !_583;
    float _623 = _621 ? (-0.5) : 0.5;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _625;
    float _629 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _613);
    float _631 = _619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _623);
    float _637 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _639 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _617);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _555 + _641;
    float _645 = _571 * _635;
    float _647 = _627 * _577;
    float _649 = _619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _657 = _633 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _659 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[24].x, _649);
    float _661 = _639 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _663 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _655);
    bool _665 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _667 = isnan(_555);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _659);
    float _679 = _661 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _681 = _663 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _653 * _579;
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _687 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[11].x, _679);
    float _689 = _637 + _681;
    bool _691 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_555);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _657 + _685;
    float _705 = -_675;
    float _707 = _705 + 1.0;
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _689 + _709;
    float _713 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _687);
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _717 = _703 + _715;
    float _719 = _701 * _707;
    float _721 = _711 * _711;
    float _723 = -_701;
    float _725 = _723 + 1.0;
    float _727 = fma(_647, _643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _729 = _619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _731 = fma(_717, _717, _721);
    bool _733 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _735 = isnan(_555);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _661 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _747 = _713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = sqrt(_731);
    float _751 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[25].x, _729);
    float _753 = _743 * _725;
    float _755 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[10].x, _745);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _759 = _555 + _757;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = _727 * _753;
    float _767 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _769 = 1.0 / _747;
    float _771 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _755);
    float _773 = fma(_683, _759, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _775 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[115].x, _765);
    float _777 = _767 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _779 = _771 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _781 = fma(_773, _719, _775);
    bool _783 = _749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _661 + _777;
    float _787 = _779 + _747;
    float _789 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[117].x, _781);
    float _791 = _787 * _769;
    float _793 = _791 * 0.5;
    float _795 = _781;
    float _797 = _773;
    float _799 = _615;
    float _801 = _711;
    if (!_783)
    {
        _795 = _703;
    }
    float _803 = _795;
    float _805 = _803;
    if (!_783)
    {
        _797 = _689;
    }
    float _807 = _797;
    float _809 = _807;
    if (!_783)
    {
        _799 = _785;
    }
    float _811 = _799;
    bool _813 = !_783;
    float _815 = _811;
    if (!_813)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _821 = _749 + _819;
        float _823 = rsqrt(_731);
        float _825 = _821 * _817;
        float _827 = _785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _829 = _825 * 0.15915493667125701904296875;
        float _831 = _829 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _829 * 6.283185482025146484375;
        float _837 = sin(_835);
        float _839 = _833 + (-1.0);
        float _841 = fma(_837, _827, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _843 = _839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = _823 * _841;
        float _847 = fma(_785, _833, _843);
        float _849 = fma(_717, _845, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _851 = fma(_711, _845, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _815 = _847;
        _805 = _849;
        _809 = _851;
    }
    float _853 = _815;
    float _855 = _805;
    float _857 = _809;
    float _859 = _853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_609)
    {
        _801 = 1.0;
    }
    float _861 = _801;
    float _863 = _861;
    if (!_609)
    {
        float _865 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _869 = _865 * 0.15915493667125701904296875;
        float _871 = _867 * 0.15915493667125701904296875;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _875 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _873);
        float _877 = _869 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = _869 * 6.283185482025146484375;
        float _883 = sin(_881);
        float _885 = 1.0 / _879;
        float _887 = _871 * 6.283185482025146484375;
        float _889 = cos(_887);
        float _891 = _883 * _885;
        float _893 = _871 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _899 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _897;
        float _901 = _889 * _891;
        float _903 = 1.0 / _875;
        float _905 = 1.0 / _901;
        float _907 = 1.0 / _899;
        float _909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _911 = _903 * _909;
        float _913 = _895 * _905;
        float _915 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _917 = fma(_913, _911, _915);
        float _919 = _917 * _907;
        float _921 = precise::clamp(_919, 0.0, 1.0);
        float _923 = -_921;
        float _925 = _923 + 1.0;
        _863 = _925;
    }
    float _927 = _863;
    float _929 = _853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _931 = _853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _933 = _853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _935 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _859);
    float _937 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _929);
    float _939 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _931);
    float _941 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _933);
    float _943 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _945 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _937);
    float _947 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _935);
    float _949 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _939);
    float _951 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _941);
    float _953 = _945 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _955 = _207 * _943;
    float _957 = _947 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _959 = _949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _961 = _953 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _963 = _953 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _965 = _953 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _967 = _953 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _969 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[4].x, _961);
    float _971 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[5].x, _963);
    float _973 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[6].x, _965);
    float _975 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[7].x, _967);
    bool _977 = _927 > 0.0;
    bool _979 = isnan(_927);
    bool _981 = _977 || _979;
    bool _983 = isnan(0.0);
    bool _985 = _981 || _983;
    float _987 = _951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _989 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _969);
    float _991 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _971);
    float _993 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _973);
    float _995 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _975);
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _989);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _991);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _993);
    float _1003 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _995);
    float _1005 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1007 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1009 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1011 = _1001 + _1003;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1019 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1021 = _955 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1023 = _1011 * 0.5;
    out.m_44.x = _1013;
    out.m_44.y = _1015;
    out.m_44.z = _1017;
    out.m_44.w = _1019;
    out.m_33.x = _1021;
    out.gl_Position.x = _997;
    out.gl_Position.y = _999;
    out.gl_Position.z = _1001;
    out.gl_Position.w = _1003;
    out.m_46.z = _1023;
    out.m_46.w = _1003;
    if (_985)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1025 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1025;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

