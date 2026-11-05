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
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1339 = false;
    bool _1009 = false;
    bool _829 = false;
    bool _661 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2922 = as_type<float>(_87);
        out.gl_Position.z = _2922;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2991 = as_type<float>(_123);
        out.gl_Position.z = _2991;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_40.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_35.x;
    float _143 = in.m_35.y;
    float _145 = in.m_35.z;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    int _153 = as_type<int>(_125) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_125) & 2;
    bool _159 = _157 != 0;
    float _161 = _125;
    float _163 = _127;
    if (!_139)
    {
        float _165 = _127 * _127;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    bool _171 = !_155;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _169;
    if (!_139)
    {
        float _177 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _179;
    float _189 = 0.0;
    if (!_185)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _127 * _193;
        float _203 = exp2(_201);
        float _205 = _199 * 0.693147182464599609375;
        float _207 = 1.0 / _205;
        float _209 = 1.0 / _197;
        float _211 = _203 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _207, _127);
        float _217 = _215 * _209;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _219;
        _189 = _197;
    }
    float _221 = _187;
    float _223 = _189;
    float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _227 = !_139;
    float _229 = _223;
    float _231 = _221;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _127 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _241;
        _163 = _251;
    }
    float _253 = _229;
    float _255 = _163;
    float _257 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _259 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _261 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _265 = _253;
    if (!_139)
    {
        float _267 = _105 * _105;
        float _269 = _267 * 0.5;
        _265 = _269;
    }
    float _271 = _265;
    float _273 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].x, _257);
    float _275 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].y, _259);
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].z, _263);
    float _279 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_139)
    {
        float _281 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _281;
    }
    float _283 = _231;
    bool _285 = !_139;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _105 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _105);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].x, _273);
    float _325 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].y, _275);
    float _327 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _329 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _331 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _333 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _335 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].z, _277);
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].x, _329);
    float _339 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].y, _331);
    float _341 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].z, _333);
    float _343 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _141, _323);
    float _347 = fma(_255, _143, _325);
    float _349 = fma(_255, _145, _335);
    float _351 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].x, _337);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].y, _339);
    float _355 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].z, _341);
    float _357 = _343;
    if (!_139)
    {
        _357 = _105;
    }
    float _359 = _357;
    bool _361 = !_139;
    float _363 = _359;
    if (!_361)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = 1.0 / _371;
        float _375 = _105 * _367;
        float _377 = exp2(_375);
        float _379 = -_377;
        float _381 = _379 + 1.0;
        float _383 = _381 * _373;
        _363 = _383;
    }
    float _385 = _363;
    float _387 = fma(_385, _143, _353);
    float _389 = fma(_385, _141, _351);
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _393 = fma(_347, _129, _149);
    float _395 = -_387;
    float _397 = _347 + _395;
    float _399 = fma(_345, _129, _147);
    float _401 = fma(_385, _145, _355);
    float _403 = -_389;
    float _405 = _345 + _403;
    float _407 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _409 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = -_401;
    float _415 = _349 + _413;
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _407);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _423 = fma(_349, _129, _151);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _429 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    bool _431 = !_391;
    float _433 = _429;
    float _435 = _427;
    float _437 = _425;
    float _439 = _429;
    float _457;
    if (!_431)
    {
        float _441 = in.m_42.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_71);
        float _463 = 1.0 / _461;
        float _465 = _105 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _467 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _485;
    bool _489 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _479;
    bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _505 = 1.0 / _483;
    float _507 = 1.0 / _487;
    float _509 = _471 * _501;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _467 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _515;
    float _519 = _513 * _505;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _531 = fma(_523, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _533 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_467);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = _475 * _507;
    bool _547 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _549 = isnan(_467);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_499;
    float _561 = _559 + 1.0;
    float _563 = _557 * _561;
    bool _565 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _567 = isnan(_467);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = -_557;
    float _583 = _581 + 1.0;
    float _585 = -_543;
    float _587 = _585 + 1.0;
    float _589 = fma(_529, _519, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _591 = fma(_579, _519, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _593 = _543 * _583;
    float _595 = _575 * _587;
    float _597 = in.m_40.x;
    float _599 = in.m_40.y;
    float _601 = -_575;
    float _603 = _601 + 1.0;
    float _605 = _525 * _595;
    float _607 = _531 * _595;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _613;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[143].y, _607);
    float _621 = fma(_611, _545, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = fma(_615, _545, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _625 = fma(_591, _593, _617);
    float _627 = fma(_589, _593, _619);
    float _629 = fma(_623, _563, _625);
    float _631 = fma(_621, _563, _627);
    float _633 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[146].x, _629);
    float _635 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[146].y, _631);
    float _637 = _633 * _597;
    float _639 = _635 * _599;
    bool _641 = !_503;
    float _659;
    if (!_641)
    {
        float _643 = in.m_42.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_71);
        float _665 = 1.0 / _663;
        float _667 = _105 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _673 = _669 + _671;
    bool _675 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _677 = isnan(_669);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _689 = _669 + _687;
    bool _691 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _693 = isnan(_669);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _711 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _713 = isnan(_669);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_685;
    float _725 = _723 + 1.0;
    float _727 = 1.0 / _709;
    float _729 = _721 * _725;
    float _731 = -_721;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _735;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _741 = 1.0 / _705;
    float _743 = _701 * _733;
    float _745 = -_701;
    float _747 = _745 + 1.0;
    float _749 = _689 * _727;
    float _751 = _673 * _741;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _757;
    float _761 = fma(_737, _751, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _763 = fma(_755, _751, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _765 = fma(_759, _751, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _767 = _761 * _743;
    float _769 = _763 * _743;
    float _771 = _765 * _743;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _785 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].x, _767);
    float _787 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].y, _769);
    float _789 = fma(_775, _749, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _791 = fma(_779, _749, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _793 = fma(_783, _749, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _795 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].z, _771);
    float _797 = fma(_789, _729, _785);
    float _799 = fma(_791, _729, _787);
    float _801 = fma(_793, _729, _795);
    float _803 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].x, _797);
    float _805 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].y, _799);
    float _807 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].z, _801);
    bool _809 = !_739;
    float _827;
    if (!_809)
    {
        float _811 = in.m_42.x;
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _815 = _811 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        float _831 = float(_71);
        float _833 = 1.0 / _831;
        float _835 = _105 * _833;
        _827 = _835;
    }
    _829 = false;
    float _837 = _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _841 = _837 + _839;
    float _843 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _853 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _855 = isnan(_837);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _869 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _871 = isnan(_837);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = 1.0 / _847;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _883;
    float _887 = -_863;
    float _889 = _887 + 1.0;
    bool _891 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _893 = isnan(_837);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _905 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _907 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = 1.0 / _851;
    float _911 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _915 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _917 = 1.0 / _867;
    float _919 = _885 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _925 = _879 * _889;
    float _927 = -_879;
    float _929 = _927 + 1.0;
    float _931 = fma(_919, _841, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _933;
    float _937 = _901 * _929;
    float _939 = _923 * _909;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _837 + _941;
    bool _945 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _947 = isnan(_837);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = _931 * _937;
    float _959 = -_901;
    float _961 = _959 + 1.0;
    float _963 = fma(_939, _943, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _837 + _965;
    float _969 = _935 * _917;
    float _971 = -_955;
    float _973 = _971 + 1.0;
    float _975 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[115].x, _957);
    float _977 = fma(_969, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _979 = _863 * _973;
    float _981 = fma(_963, _925, _975);
    float _983 = fma(_977, _979, _981);
    float _985 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[118].x, _983);
    float _987 = _985 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _907;
    out.m_44.y = _911;
    out.m_44.z = _913;
    out.m_44.w = _987;
    bool _989 = !_915;
    float _1007;
    if (!_989)
    {
        float _991 = in.m_42.x;
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _995 = _991 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _999 = _997 * _993;
        float _1001 = floor(_999);
        float _1003 = -_1001;
        float _1005 = _999 + _1003;
        _1007 = _1005;
        _1009 = true;
    }
    else
    {
        float _1011 = float(_71);
        float _1013 = 1.0 / _1011;
        float _1015 = _105 * _1013;
        _1007 = _1015;
    }
    _1009 = false;
    float _1017 = _1007;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1021 = _1017 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1039 = 1.0 / _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1041;
    bool _1045 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1047 = isnan(_1017);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = 1.0 / _1029;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1061 = _1017 + _1059;
    bool _1063 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1065 = isnan(_1017);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    bool _1075 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1077 = isnan(_1017);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = 1.0 / _1037;
    float _1089 = _1061 * _1039;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1093 = _1017 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1097 = _1017 + _1095;
    bool _1099 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1101 = isnan(_1017);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1033;
    float _1113 = _1021 * _1057;
    bool _1115 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1117 = isnan(_1017);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1129 = _1017 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1131;
    float _1135 = 1.0 / _1043;
    float _1137 = _1093 * _1087;
    bool _1139 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1141 = isnan(_1017);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    bool _1151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1153 = _1097 * _1111;
    float _1155 = -_1055;
    float _1157 = _1155 + 1.0;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1159;
    float _1163 = _1125 * _1157;
    float _1165 = -_1125;
    float _1167 = _1165 + 1.0;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1169;
    float _1173 = _1129 * _1135;
    float _1175 = -_1149;
    float _1177 = _1175 + 1.0;
    float _1179 = _1149 * _1167;
    float _1181 = fma(_1133, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1183 = fma(_1171, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1185 = fma(_1161, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1187 = _1073 * _1177;
    float _1189 = -_1073;
    float _1191 = _1189 + 1.0;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1197 = -_1085;
    float _1199 = _1197 + 1.0;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1205 = _1085 * _1191;
    float _1207 = fma(_1195, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1209 = _1109 * _1199;
    float _1211 = -_1109;
    float _1213 = _1211 + 1.0;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1219 = fma(_1203, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1221 = _1181 * _1209;
    float _1223 = _1183 * _1209;
    float _1225 = _1185 * _1209;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1227;
    float _1231 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1221);
    float _1233 = fma(_1217, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1223);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1237;
    float _1241 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1225);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1243;
    float _1247 = fma(_1229, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1249 = fma(_1219, _1205, _1231);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1255 = fma(_1239, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1257 = fma(_1207, _1205, _1235);
    float _1259 = fma(_1233, _1205, _1241);
    float _1261 = fma(_1245, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1263 = fma(_1247, _1187, _1249);
    float _1265 = fma(_1253, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1275 = fma(_1255, _1187, _1257);
    float _1277 = fma(_1261, _1187, _1259);
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1279;
    float _1283 = fma(_1269, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1285;
    float _1289 = fma(_1273, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1291;
    float _1295 = fma(_1265, _1179, _1263);
    float _1297 = fma(_1281, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1299 = fma(_1287, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1301 = fma(_1283, _1179, _1275);
    float _1303 = fma(_1293, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1305 = fma(_1289, _1179, _1277);
    float _1307 = fma(_1297, _1163, _1295);
    float _1309 = fma(_1299, _1163, _1301);
    float _1311 = fma(_1303, _1163, _1305);
    float _1313 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1307);
    float _1315 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1309);
    float _1317 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1311);
    bool _1319 = !_1151;
    float _1337;
    if (!_1319)
    {
        float _1321 = in.m_42.x;
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1325 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _1329 = _1327 * _1323;
        float _1331 = floor(_1329);
        float _1333 = -_1331;
        float _1335 = _1329 + _1333;
        _1337 = _1335;
        _1339 = true;
    }
    else
    {
        float _1341 = float(_71);
        float _1343 = 1.0 / _1341;
        float _1345 = _105 * _1343;
        _1337 = _1345;
    }
    _1339 = false;
    float _1347 = _1337;
    float _1349 = in.m_42.x;
    float _1351 = in.m_42.y;
    float _1353 = in.m_42.z;
    float _1355 = in.m_42.w;
    float _1357 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1359 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1361 = log2(_1359);
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1365 = _1363 != 0;
    float _1367 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1357);
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1371 = _1369 != 0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1379 = _1377 != 0;
    float _1381 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1385 = _1383 != 0;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1389 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1395 = 1.0 / _1375;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1401 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1403 = _1353 * 2.0;
    bool _1405 = _1349 > 0.5;
    float _1407 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1409 = _1355 > 0.5;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1413 = floor(_1403);
    float _1415 = -_173;
    int _1417 = _1405 ? as_type<int>(_1415) : as_type<int>(_173);
    float _1419 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1423 = _1421 != 0;
    float _1425 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1427 = !_1365;
    float _1429 = _1427 ? _173 : as_type<float>(_1417);
    float _1431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1433 = _1351 > 0.5;
    float _1435 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1425);
    float _1437 = 1.0 / _1393;
    float _1439 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1431);
    float _1441 = -_183;
    int _1443 = _1433 ? as_type<int>(_1441) : as_type<int>(_183);
    float _1445 = _1349 * 2.0;
    bool _1447 = _1353 > 0.5;
    bool _1449 = !_1371;
    float _1451 = _1449 ? _183 : as_type<float>(_1443);
    float _1453 = floor(_1445);
    float _1455 = -_173;
    int _1457 = _1447 ? as_type<int>(_1455) : as_type<int>(_173);
    bool _1459 = _1413 > 0.0;
    bool _1461 = _1413 >= 0.0;
    bool _1463 = isnan(_1413);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(0.0);
    bool _1469 = _1465 || _1467;
    float _1471 = _1431;
    float _1473 = _1413;
    float _1475 = _1425;
    if (!_1423)
    {
        _1471 = _1351;
    }
    float _1477 = _1471;
    float _1479 = 1.0 / _1399;
    int _1481 = _1469 ? 0 : 1;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1485 = _1477;
    if (!_1423)
    {
        _1473 = _1353;
    }
    float _1487 = _1473;
    float _1489 = _1487;
    if (!_1423)
    {
        _1475 = _1353;
    }
    float _1491 = _1475;
    float _1493 = fma(_1407, -2.0, _1483);
    bool _1495 = !_1379;
    float _1497 = _1495 ? _173 : as_type<float>(_1457);
    float _1499 = _1351 * 2.0;
    float _1501 = _1491;
    if (_1423)
    {
        _1485 = _1349;
    }
    float _1503 = _1485;
    float _1505 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1493);
    if (_1423)
    {
        _1489 = _1351;
    }
    float _1507 = _1489;
    float _1509 = _1451 + (-0.5);
    if (_1423)
    {
        _1501 = _1351;
    }
    float _1511 = _1501;
    float _1513 = floor(_1499);
    int _1515 = ~_1481;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1525 = _1523 != 0;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1529 = _1527 != 0;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1533 = _1531 != 0;
    float _1535 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1537 = _1519;
    if (!_1459)
    {
        int _1539 = ~_1481;
        int _1541 = _1539 + 1;
        _1537 = _1541;
    }
    int _1543 = _1537;
    float _1545 = _105 * _1361;
    bool _1547 = _1453 >= 0.0;
    bool _1549 = isnan(_1453);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(0.0);
    bool _1555 = _1551 || _1553;
    float _1557 = -_1411;
    float _1559 = fma(_1535, 2.0, _1557);
    float _1561 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1435);
    int _1563 = _1555 ? 0 : 1;
    float _1565 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1367);
    bool _1567 = _1453 > 0.0;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1569;
    float _1573 = exp2(_1545);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1579 = _1571 * _1395;
    float _1581 = _1351 + _1353;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1583;
    float _1587 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1439);
    float _1589 = _1581 + (-1.0);
    float _1591 = _1585 * _1437;
    float _1593 = _1577 * _1479;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1597 = _1351 + _1349;
    int _1599 = ~_1563;
    int _1601 = _1599 + 1;
    int _1603 = _1601 + 1;
    float _1605 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1607 = _1603;
    if (!_1567)
    {
        int _1609 = ~_1563;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    float _1615 = _1597 + (-1.0);
    float _1617 = -_1573;
    float _1619 = _1617 + 1.0;
    bool _1621 = _1513 >= 0.0;
    bool _1623 = isnan(_1513);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan(0.0);
    bool _1629 = _1625 || _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1633 = _1347 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1637 = _1347 + _1635;
    float _1639 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1641 = _1629 ? 0 : 1;
    float _1643 = fma(_1579, _1633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1645 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1653 = _1649 || _1651;
    float _1655 = fma(_1593, _1637, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1659 = _1347 + _1657;
    float _1661 = _1653 ? _1619 : 0.0;
    float _1663 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1665 = _1513 > 0.0;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1669 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1671 = isnan(_1347);
    bool _1673 = _1669 || _1671;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1677 = _1673 || _1675;
    float _1679 = float(_1677);
    float _1681 = -_105;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1559);
    float _1685 = _1429 + 0.5;
    float _1687 = fma(_1591, _1659, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1689 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1667);
    bool _1691 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1693 = isnan(_1347);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = fma(_1663, _1685, _1683);
    float _1705 = -_1679;
    float _1707 = _1705 + 1.0;
    bool _1709 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1711 = isnan(_1347);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1723 = -_1701;
    float _1725 = _1723 + 1.0;
    float _1727 = _1701 * _1707;
    float _1729 = -_1419;
    float _1731 = -_1505;
    float _1733 = fma(_1729, _1509, _1731);
    bool _1735 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1737 = isnan(_1347);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = _1565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1751 = 1.0 + _1749;
    float _1753 = _1745 * _1725;
    float _1755 = -_1745;
    float _1757 = _1755 + 1.0;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1765 = _1719 * _1757;
    float _1767 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1759);
    float _1769 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1771 = _1643 * _1765;
    float _1773 = -_1719;
    float _1775 = _1773 + 1.0;
    float _1777 = 1.0 / _1751;
    float _1779 = -_1763;
    float _1781 = fma(_1769, 2.0, _1779);
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1785 = ~_1641;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1771);
    int _1793 = _1789;
    if (!_1665)
    {
        int _1795 = ~_1641;
        int _1797 = _1795 + 1;
        _1793 = _1797;
    }
    int _1799 = _1793;
    float _1801 = fma(_1521, -2.0, _1783);
    float _1803 = fma(_1655, _1753, _1791);
    float _1805 = -_183;
    int _1807 = _1409 ? as_type<int>(_1805) : as_type<int>(_183);
    float _1809 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1811 = _1497 + 0.5;
    float _1813 = -_105;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1781);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1819 = !_1385;
    float _1821 = _1819 ? _183 : as_type<float>(_1807);
    float _1823 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1767);
    float _1825 = _1661 * _1777;
    float _1827 = fma(_1809, _1811, _1815);
    float _1829 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1817);
    float _1831 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1833 = _1821 + (-0.5);
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1837 = _1561 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1839 = -_1823;
    float _1841 = _1839 + 1.0;
    float _1843 = _1587 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1845 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1835);
    float _1847 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1801);
    float _1849 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1829);
    float _1851 = -_1841;
    float _1853 = fma(_1497, _1851, _1827);
    float _1855 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1845);
    float _1857 = -_1831;
    float _1859 = -_1847;
    float _1861 = fma(_1857, _1833, _1859);
    float _1863 = -_1849;
    float _1865 = _1863 + 1.0;
    float _1867 = fma(_1687, _1727, _1803);
    bool _1869 = !_1529;
    int _1871 = _1869 ? 0 : 1;
    float _1873 = -_1855;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1451, _1865, _1733);
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1881 = _1837 + _1879;
    int _1883 = abs(_1871);
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1887 = _1747 + _1885;
    float _1889 = -_1875;
    float _1891 = fma(_1429, _1889, _1703);
    bool _1893 = !_1525;
    int _1895 = _1893 ? 0 : 1;
    float _1897 = in.m_46.x;
    float _1899 = in.m_46.y;
    float _1901 = in.m_46.z;
    float _1903 = _1887 * _1887;
    float _1905 = _1887 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1907 = abs(_1895);
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1911 = _1843 + _1909;
    float _1913 = fma(_1881, _1881, _1903);
    float _1915 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1905);
    float _1917 = fma(_1679, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1867);
    float _1919 = float(_1907);
    float _1921 = fma(_1911, _1911, _1913);
    float _1923 = float(_1543);
    float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1915);
    float _1927 = float(_1883);
    float _1929 = rsqrt(_1921);
    float _1931 = float(_1613);
    float _1933 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1689);
    float _1935 = _1919 * _1923;
    bool _1937 = _1925 >= 0.0;
    float _1939 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1941 = _1927 * _1931;
    float _1943 = -_1933;
    float _1945 = _1943 + 1.0;
    float _1947 = _1935 * (-2.0);
    float _1949 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1941 * (-2.0);
    float _1953 = fma(_1821, _1945, _1861);
    float _1955 = fma(_1639, _1947, _1639);
    float _1957 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1959 = fma(_1947, _1897, _1897);
    float _1961 = _1349 + (-0.5);
    float _1963 = fma(_1951, _1899, _1899);
    float _1965 = _1887 * _1929;
    float _1967 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_48.x = _1891;
    out.m_48.y = _1877;
    out.m_48.z = _1853;
    out.m_48.w = _1953;
    float _1969 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1959);
    float _1971 = _1881 * _1929;
    float _1973 = -_1965;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1887);
    out.m_50.x = _1949;
    out.m_50.y = _1957;
    out.m_50.z = _1401;
    out.m_50.w = _1967;
    bool _1977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1979 = isnan(1.0);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1985 = _1981 || _1983;
    float _1987 = -_1971;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1881);
    float _1991 = _1975 * _1975;
    float _1993 = _1853;
    float _1995 = _1965;
    if (_1937)
    {
        out.m_33.x = 0.0;
    }
    bool _1997 = !_1985;
    float _1999 = _1997 ? _105 : _1825;
    float _2001 = fma(_1605, _1951, _1605);
    float _2003 = fma(_1989, _1989, _1991);
    if (_1937)
    {
        _1993 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2005 = _1993;
    bool _2007 = !_1533;
    int _2009 = _2007 ? 0 : 1;
    float _2011 = fma(_1999, _1955, _1969);
    float _2013 = _1911 * _1929;
    int _2015 = as_type<int>(_2005);
    if (_1937)
    {
        float _2017 = _2005 * 5.0;
        _2015 = as_type<int>(_2017);
    }
    int _2019 = _2015;
    float _2021 = -_2013;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1911);
    if (_1937)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6052 = as_type<float>(_2019);
        out.gl_Position.z = _6052;
    }
    float _2025 = fma(_2023, _2023, _2003);
    int _2027 = abs(_2009);
    if (_1937)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2029 = -_1965;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1747);
    float _2033 = -_1971;
    float _2035 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _2037 = _1351 + (-0.5);
    float _2039 = float(_2027);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2043 = _2031 + _2041;
    float _2045 = float(_1799);
    float _2047 = -_2013;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1843);
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2053 = _2035 + _2051;
    float _2055 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2057 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1963);
    float _2059 = _2039 * _2045;
    float _2061 = _1353 + _1349;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2065 = _2049 + _2063;
    float _2067 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2055);
    float _2069 = fma(_1999, _2001, _2057);
    float _2071 = _2061 + (-1.0);
    float _2073 = _2059 * (-2.0);
    float _2075 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2067);
    float _2077 = _2069 * 0.15915493667125701904296875;
    float _2079 = _1353 + (-0.5);
    float _2081 = fma(_2071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2083 = fma(_2073, _1901, _1901);
    bool _2085 = _2075 >= 0.0;
    float _2087 = sqrt(_2025);
    float _2089 = fma(_2081, _2073, _2081);
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2083);
    float _2093 = _2011 * 0.15915493667125701904296875;
    float _2095 = fma(_1999, _2089, _2091);
    float _2097 = _2093 * 6.283185482025146484375;
    float _2099 = sin(_2097);
    float _2101 = _2095 * 0.15915493667125701904296875;
    float _2103 = _2079;
    float _2105 = _2053;
    float _2107 = _2031;
    if (_2085)
    {
        _2103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2109 = _2103;
    int _2111 = as_type<int>(_2109);
    if (_2085)
    {
        out.m_33.x = 0.0;
    }
    float _2113 = _2093 * 6.283185482025146484375;
    float _2115 = cos(_2113);
    if (_2085)
    {
        float _2117 = _2109 * 5.0;
        _2111 = as_type<int>(_2117);
    }
    int _2119 = _2111;
    float _2121 = _1929 * _2087;
    if (_2085)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6218 = as_type<float>(_2119);
        out.gl_Position.z = _6218;
    }
    float _2123 = _2077 * 6.283185482025146484375;
    float _2125 = sin(_2123);
    float _2127 = _2077 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2101 * 6.283185482025146484375;
    float _2133 = sin(_2131);
    if (_2085)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2135 = _2101 * 6.283185482025146484375;
    float _2137 = cos(_2135);
    float _2139 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2141 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _2143 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2145 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _2147 = _2121 * _2139;
    float _2149 = _2115 * _2129;
    float _2151 = _2121 * _2143;
    float _2153 = _2141 * _2147;
    float _2155 = _2099 * _2125;
    float _2157 = _2145 * _2151;
    float _2159 = _2115 * _2125;
    float _2161 = -_2153;
    float _2163 = _2133 * _2161;
    float _2165 = fma(_2133, _2149, _2155);
    float _2167 = fma(_2133, _2155, _2149);
    float _2169 = _2137 * _2153;
    float _2171 = _2125 * _2137;
    float _2173 = _2129 * _2137;
    float _2175 = _2099 * _2129;
    float _2177 = _2115 * _2169;
    float _2179 = fma(_2173, _2157, _2163);
    float _2181 = -_2175;
    float _2183 = fma(_2133, _2159, _2181);
    float _2185 = fma(_2165, _2157, _2177);
    float _2187 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2189 = _2187 * 0.5;
    float _2191 = -_2159;
    float _2193 = fma(_2133, _2175, _2191);
    float _2195 = _2099 * _2169;
    float _2197 = fma(_2183, _2189, _2185);
    float _2199 = fma(_2171, _2189, _2179);
    float _2201 = fma(_2193, _2157, _2195);
    float _2203 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2207 = fma(_2167, _2189, _2201);
    float _2209 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2203);
    float _2211 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2205);
    float _2213 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2209);
    float _2215 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2211);
    float _2217 = _2213 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2219 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2221 = _1843 + _2217;
    float _2223 = _1837 + _2219;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2227 = _2221 + _2225;
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2231 = _2223 + _2229;
    float _2233 = _2227 * _2227;
    float _2235 = fma(_2231, _2231, _2233);
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2239 = sqrt(_2235);
    float _2241 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2237);
    float _2243 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2241);
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2247 = _1747 + _2245;
    bool _2249 = _2239 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = _2245;
    float _2253 = _2223;
    float _2255 = _2221;
    float _2257 = _2235;
    if (!_2249)
    {
        _2251 = _2247;
    }
    float _2259 = _2251;
    bool _2261 = !_2249;
    float _2263 = _2259;
    if (!_2261)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2269 = _2239 + _2267;
        float _2271 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2273 = rsqrt(_2235);
        float _2275 = _2269 * _2265;
        float _2277 = _2275 * 0.15915493667125701904296875;
        float _2279 = _2277 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = _2277 * 6.283185482025146484375;
        float _2285 = sin(_2283);
        float _2287 = _2281 + (-1.0);
        float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2291 = fma(_2285, _2271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2293 = fma(_2247, _2281, _2289);
        float _2295 = _2273 * _2291;
        float _2297 = fma(_2231, _2295, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2299 = fma(_2227, _2295, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2263 = _2293;
        _2253 = _2297;
        _2255 = _2299;
    }
    float _2301 = _2263;
    float _2303 = _2253;
    float _2305 = _2255;
    float _2307 = -_1747;
    float _2309 = _2307 + _2301;
    float _2311 = -_1837;
    float _2313 = _2311 + _2303;
    float _2315 = -_1843;
    float _2317 = _2315 + _2305;
    float _2319 = _2309 * _2309;
    float _2321 = fma(_2313, _2313, _2319);
    float _2323 = fma(_2317, _2317, _2321);
    float _2325 = sqrt(_2323);
    bool _2327 = _2325 > 0.0;
    bool _2329 = !_2327;
    float _2331 = _2325;
    float _2333 = _2317;
    float _2335 = _2305;
    float _2337 = _2301;
    float _2339 = _2303;
    float _2341 = _2323;
    if (!_2329)
    {
        bool _2343 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2345 = _2227;
        if (_2343)
        {
            float _2347 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2345 = _2347;
        }
        float _2349 = _2345;
        float _2351 = _2349;
        if (_2343)
        {
            float _2353 = _425 * _2349;
            _2257 = _2353;
        }
        float _2355 = _2257;
        float _2357 = _2355;
        if (_2343)
        {
            float _2359 = _427 * _2349;
            _2331 = _2359;
        }
        float _2361 = _2331;
        float _2363 = _2361;
        if (_2343)
        {
            float _2365 = _429 * _2349;
            _2351 = _2365;
        }
        float _2367 = _2351;
        float _2369 = _2367;
        if (!_2343)
        {
            float _2371 = _105 + 1.0;
            float _2373 = _2371;
            if (!_139)
            {
                float _2375 = _2371 * _2371;
                float _2377 = _2375 * 0.5;
                _433 = _2377;
            }
            float _2379 = _433;
            float _2381 = _2379;
            if (!_139)
            {
                float _2383 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2381 = _2383;
            }
            float _2385 = _2381;
            bool _2387 = !_139;
            float _2389 = _2385;
            if (!_2387)
            {
                float _2391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2393 = log2(_2391);
                float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2397 = 1.0 + _2395;
                float _2399 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2401 = _2393 * _2371;
                float _2403 = 1.0 / _2397;
                float _2405 = _2399 * 0.693147182464599609375;
                float _2407 = exp2(_2401);
                float _2409 = 1.0 / _2405;
                float _2411 = _2407 + (-1.0);
                float _2413 = -_2411;
                float _2415 = fma(_2413, _2409, _2371);
                float _2417 = _2415 * _2403;
                float _2419 = _2417 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2389 = _2419;
            }
            float _2421 = _2389;
            float _2423 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2425 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2427 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2429 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2431 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2433 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2435 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2429);
            float _2437 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2431);
            float _2439 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2435);
            bool _2441 = !_139;
            if (!_2441)
            {
                float _2443 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2445 = log2(_2443);
                float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2449 = 1.0 + _2447;
                float _2451 = 1.0 / _2449;
                float _2453 = _2445 * _2371;
                float _2455 = exp2(_2453);
                float _2457 = -_2455;
                float _2459 = _2457 + 1.0;
                float _2461 = _2459 * _2451;
                _2373 = _2461;
            }
            float _2463 = _2373;
            float _2465 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2433);
            float _2467 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2437);
            float _2469 = fma(_2463, _143, _2439);
            float _2471 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2465);
            float _2473 = fma(_2463, _141, _2467);
            float _2475 = -_387;
            float _2477 = _2475 + _2469;
            float _2479 = fma(_2463, _145, _2471);
            float _2481 = -_389;
            float _2483 = _2481 + _2473;
            float _2485 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2487 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2489 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2491 = -_401;
            float _2493 = _2491 + _2479;
            float _2495 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2485);
            float _2497 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2487);
            float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2489);
            float _2501 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2495);
            float _2503 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2497);
            float _2505 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2499);
            _435 = _2503;
            _437 = _2501;
            _439 = _2505;
            _2357 = _2501;
            _2363 = _2503;
            _2369 = _2505;
        }
        float _2507 = _435;
        float _2509 = _437;
        float _2511 = _439;
        float _2513 = _2357;
        float _2515 = _2363;
        float _2517 = _2369;
        float _2519 = _2507 * _2507;
        float _2521 = rsqrt(_2323);
        float _2523 = fma(_2509, _2509, _2519);
        float _2525 = fma(_2511, _2511, _2523);
        float _2527 = sqrt(_2525);
        float _2529 = _2313 * _2521;
        float _2531 = _2309 * _2521;
        float _2533 = _2317 * _2521;
        bool _2535 = _2527 > 0.0;
        bool _2537 = !_2535;
        _2333 = _2533;
        if (!_2537)
        {
            float _2539 = rsqrt(_2525);
            float _2541 = _2539 * _2507;
            float _2543 = _2539 * _2509;
            float _2545 = _2539 * _2511;
            float _2547 = _2531 * _2541;
            float _2549 = fma(_2529, _2543, _2547);
            float _2551 = fma(_2533, _2545, _2549);
            float _2553 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2555 = fma(_2513, _2553, _2303);
            float _2557 = fma(_2515, _2553, _2301);
            float _2559 = fma(_2517, _2553, _2305);
            _2335 = _2559;
            _2337 = _2557;
            _2339 = _2555;
        }
    }
    float _2561 = _2333;
    float _2563 = _2335;
    float _2565 = _2337;
    float _2567 = _2339;
    float _2569 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2571 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2573 = isnan(0.5);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2579 = _2575 || _2577;
    bool _2581 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2583 = isnan(0.5);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2589 = _2585 || _2587;
    float _2591 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2569);
    float _2593 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2595 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2591);
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2599 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2593);
    float _2601 = _2561;
    float _2603 = _2593;
    float _2605 = _2565;
    if (!_2579)
    {
        _2601 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2607 = _2601;
    float _2609 = 1.0 / _2597;
    float _2611 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2599);
    float _2613 = _2607;
    if (!_2579)
    {
        _2341 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2615 = _2341;
    if (!_2579)
    {
        float _2617 = -_2607;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2603 = _2619;
    }
    float _2621 = _2603;
    float _2623 = _2611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2625 = _2623 + _2597;
    float _2627 = _2621;
    if (!_2579)
    {
        float _2629 = 1.0 / _2621;
        _2627 = _2629;
    }
    float _2631 = _2627;
    float _2633 = -_2013;
    float _2635 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2563);
    float _2637 = _2625 * _2609;
    float _2639 = _2637 * 0.5;
    float _2641 = -_1965;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2565);
    float _2645 = _2643;
    float _2647 = _2635;
    if (!_2579)
    {
        float _2649 = -_2615;
        float _2651 = _2649 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1995 = _2651;
    }
    float _2653 = _1995;
    float _2655 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2657 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2655);
    float _2659 = -_1971;
    float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2567);
    float _2663 = 1.0 / _2657;
    float _2665 = _2661;
    float _2667 = _2631;
    if (!_2589)
    {
        float _2669 = _2043 * _2043;
        float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2673 = -_1843;
        float _2675 = _2673 + _2563;
        float _2677 = -_1837;
        float _2679 = _2677 + _2567;
        float _2681 = fma(_2053, _2053, _2669);
        float _2683 = -_1747;
        float _2685 = _2683 + _2565;
        float _2687 = fma(_2065, _2065, _2681);
        float _2689 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2691 = sqrt(_2687);
        float _2693 = 1.0 / _2121;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2697 = precise::min(_2691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2699 = _2697 * _2671;
        float _2701 = _2699 * _2693;
        float _2703 = _2695 * _2701;
        float _2705 = _2675 * _2701;
        float _2707 = fma(_2679, _2703, _2035);
        float _2709 = fma(_2685, _2703, _2031);
        float _2711 = fma(_2695, _2705, _2049);
        _2645 = _2709;
        _2105 = _2691;
        _2665 = _2707;
        _2647 = _2711;
        _2605 = _2685;
    }
    float _2713 = _2645;
    float _2715 = _2105;
    float _2717 = _2665;
    float _2719 = _2647;
    float _2721 = _2605;
    float _2723 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2725 = _2715;
    float _2727 = _2721;
    if (!_2579)
    {
        float _2729 = 1.0 / _2653;
        _2725 = _2729;
    }
    float _2731 = _2725;
    float _2733 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2735 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2737 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2723);
    float _2739 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2741 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2733);
    float _2743 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2735);
    float _2745 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2737);
    float _2747 = _2739;
    if (!_2579)
    {
        float _2749 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2751 = -_2615;
        float _2753 = fma(_2663, _2749, _2751);
        _2727 = _2753;
    }
    float _2755 = _2727;
    float _2757 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2741);
    float _2759 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2739);
    float _2761 = _2745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_2579)
    {
        float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2765 = -_2607;
        float _2767 = fma(_2663, _2763, _2765);
        _2107 = _2767;
    }
    float _2769 = _2107;
    float _2771 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2743);
    float _2773 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2775 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2777 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    if (!_2579)
    {
        float _2779 = _2755 * _2731;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        _2613 = _2781;
    }
    float _2783 = _2613;
    if (_2579)
    {
        _2747 = 1.0;
    }
    float _2785 = _2747;
    float _2787 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2789 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2759);
    float _2791 = _2785;
    if (!_2579)
    {
        float _2793 = _2769 * _2631;
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        _2791 = _2795;
    }
    float _2797 = _2791;
    float _2799 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2801 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2775);
    float _2803 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    if (_2579)
    {
        _2667 = 1.0;
    }
    float _2805 = _2667;
    float _2807 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2809 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2787);
    float _2811 = _2805;
    if (!_2579)
    {
        float _2813 = -_2783;
        float _2815 = _2813 + 1.0;
        _2811 = _2815;
    }
    float _2817 = _2811;
    float _2819 = _2789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2821 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2801);
    float _2823 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2803);
    bool _2825 = _2797 > 0.0;
    bool _2827 = isnan(_2797);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(0.0);
    bool _2833 = _2829 || _2831;
    float _2835 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2807);
    float _2837 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2809);
    float _2839 = _2797 * _2817;
    float _2841 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2821);
    float _2843 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2823);
    bool _2845 = _2817 <= 0.0;
    bool _2847 = !_2833;
    bool _2849 = _2845 || _2847;
    float _2851 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2835);
    float _2853 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2837);
    float _2855 = _2841 + _2843;
    float _2857 = _2839 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2859 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2851);
    float _2861 = _2855 * 0.5;
    float _2863 = _2857 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2853;
    out.gl_Position.y = _2859;
    out.gl_Position.z = _2841;
    out.gl_Position.w = _2843;
    out.m_52.z = _2861;
    out.m_52.w = _2843;
    out.m_33.x = _2863;
    if (!_2849)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2865;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1339 = false;
    bool _1009 = false;
    bool _829 = false;
    bool _661 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2922 = as_type<float>(_87);
        out.gl_Position.z = _2922;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2991 = as_type<float>(_123);
        out.gl_Position.z = _2991;
    }
    if (_115)
    {
        return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_40.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_35.x;
    float _143 = in.m_35.y;
    float _145 = in.m_35.z;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    int _153 = as_type<int>(_125) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_125) & 2;
    bool _159 = _157 != 0;
    float _161 = _125;
    float _163 = _127;
    if (!_139)
    {
        float _165 = _127 * _127;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    bool _171 = !_155;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _169;
    if (!_139)
    {
        float _177 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _179;
    float _189 = 0.0;
    if (!_185)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _127 * _193;
        float _203 = exp2(_201);
        float _205 = _199 * 0.693147182464599609375;
        float _207 = 1.0 / _205;
        float _209 = 1.0 / _197;
        float _211 = _203 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _207, _127);
        float _217 = _215 * _209;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _219;
        _189 = _197;
    }
    float _221 = _187;
    float _223 = _189;
    float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _227 = !_139;
    float _229 = _223;
    float _231 = _221;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _127 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _241;
        _163 = _251;
    }
    float _253 = _229;
    float _255 = _163;
    float _257 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _259 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _261 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _265 = _253;
    if (!_139)
    {
        float _267 = _105 * _105;
        float _269 = _267 * 0.5;
        _265 = _269;
    }
    float _271 = _265;
    float _273 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].x, _257);
    float _275 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].y, _259);
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].z, _263);
    float _279 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_139)
    {
        float _281 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _281;
    }
    float _283 = _231;
    bool _285 = !_139;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _105 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _105);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].x, _273);
    float _325 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].y, _275);
    float _327 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _329 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _331 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _333 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _335 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].z, _277);
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].x, _329);
    float _339 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].y, _331);
    float _341 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].z, _333);
    float _343 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _141, _323);
    float _347 = fma(_255, _143, _325);
    float _349 = fma(_255, _145, _335);
    float _351 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].x, _337);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].y, _339);
    float _355 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].z, _341);
    float _357 = _343;
    if (!_139)
    {
        _357 = _105;
    }
    float _359 = _357;
    bool _361 = !_139;
    float _363 = _359;
    if (!_361)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = 1.0 / _371;
        float _375 = _105 * _367;
        float _377 = exp2(_375);
        float _379 = -_377;
        float _381 = _379 + 1.0;
        float _383 = _381 * _373;
        _363 = _383;
    }
    float _385 = _363;
    float _387 = fma(_385, _143, _353);
    float _389 = fma(_385, _141, _351);
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _393 = fma(_347, _129, _149);
    float _395 = -_387;
    float _397 = _347 + _395;
    float _399 = fma(_345, _129, _147);
    float _401 = fma(_385, _145, _355);
    float _403 = -_389;
    float _405 = _345 + _403;
    float _407 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _409 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = -_401;
    float _415 = _349 + _413;
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _407);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _423 = fma(_349, _129, _151);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _429 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    bool _431 = !_391;
    float _433 = _429;
    float _435 = _427;
    float _437 = _425;
    float _439 = _429;
    float _457;
    if (!_431)
    {
        float _441 = in.m_42.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_71);
        float _463 = 1.0 / _461;
        float _465 = _105 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _467 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _485;
    bool _489 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _479;
    bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _505 = 1.0 / _483;
    float _507 = 1.0 / _487;
    float _509 = _471 * _501;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _467 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _515;
    float _519 = _513 * _505;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _531 = fma(_523, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _533 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_467);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = _475 * _507;
    bool _547 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _549 = isnan(_467);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_499;
    float _561 = _559 + 1.0;
    float _563 = _557 * _561;
    bool _565 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _567 = isnan(_467);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = -_557;
    float _583 = _581 + 1.0;
    float _585 = -_543;
    float _587 = _585 + 1.0;
    float _589 = fma(_529, _519, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _591 = fma(_579, _519, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _593 = _543 * _583;
    float _595 = _575 * _587;
    float _597 = in.m_40.x;
    float _599 = in.m_40.y;
    float _601 = -_575;
    float _603 = _601 + 1.0;
    float _605 = _525 * _595;
    float _607 = _531 * _595;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _613;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[143].y, _607);
    float _621 = fma(_611, _545, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = fma(_615, _545, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _625 = fma(_591, _593, _617);
    float _627 = fma(_589, _593, _619);
    float _629 = fma(_623, _563, _625);
    float _631 = fma(_621, _563, _627);
    float _633 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[146].x, _629);
    float _635 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[146].y, _631);
    float _637 = _633 * _597;
    float _639 = _635 * _599;
    bool _641 = !_503;
    float _659;
    if (!_641)
    {
        float _643 = in.m_42.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_71);
        float _665 = 1.0 / _663;
        float _667 = _105 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _673 = _669 + _671;
    bool _675 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _677 = isnan(_669);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _689 = _669 + _687;
    bool _691 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _693 = isnan(_669);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _711 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _713 = isnan(_669);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_685;
    float _725 = _723 + 1.0;
    float _727 = 1.0 / _709;
    float _729 = _721 * _725;
    float _731 = -_721;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _735;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _741 = 1.0 / _705;
    float _743 = _701 * _733;
    float _745 = -_701;
    float _747 = _745 + 1.0;
    float _749 = _689 * _727;
    float _751 = _673 * _741;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _757;
    float _761 = fma(_737, _751, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _763 = fma(_755, _751, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _765 = fma(_759, _751, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _767 = _761 * _743;
    float _769 = _763 * _743;
    float _771 = _765 * _743;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _785 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].x, _767);
    float _787 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].y, _769);
    float _789 = fma(_775, _749, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _791 = fma(_779, _749, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _793 = fma(_783, _749, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _795 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].z, _771);
    float _797 = fma(_789, _729, _785);
    float _799 = fma(_791, _729, _787);
    float _801 = fma(_793, _729, _795);
    float _803 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].x, _797);
    float _805 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].y, _799);
    float _807 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].z, _801);
    bool _809 = !_739;
    float _827;
    if (!_809)
    {
        float _811 = in.m_42.x;
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _815 = _811 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        float _831 = float(_71);
        float _833 = 1.0 / _831;
        float _835 = _105 * _833;
        _827 = _835;
    }
    _829 = false;
    float _837 = _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _841 = _837 + _839;
    float _843 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _853 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _855 = isnan(_837);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _869 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _871 = isnan(_837);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = 1.0 / _847;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _883;
    float _887 = -_863;
    float _889 = _887 + 1.0;
    bool _891 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _893 = isnan(_837);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _905 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _907 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = 1.0 / _851;
    float _911 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _915 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _917 = 1.0 / _867;
    float _919 = _885 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _925 = _879 * _889;
    float _927 = -_879;
    float _929 = _927 + 1.0;
    float _931 = fma(_919, _841, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _933;
    float _937 = _901 * _929;
    float _939 = _923 * _909;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _837 + _941;
    bool _945 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _947 = isnan(_837);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = _931 * _937;
    float _959 = -_901;
    float _961 = _959 + 1.0;
    float _963 = fma(_939, _943, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _837 + _965;
    float _969 = _935 * _917;
    float _971 = -_955;
    float _973 = _971 + 1.0;
    float _975 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[115].x, _957);
    float _977 = fma(_969, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _979 = _863 * _973;
    float _981 = fma(_963, _925, _975);
    float _983 = fma(_977, _979, _981);
    float _985 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[118].x, _983);
    float _987 = _985 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _907;
    out.m_44.y = _911;
    out.m_44.z = _913;
    out.m_44.w = _987;
    bool _989 = !_915;
    float _1007;
    if (!_989)
    {
        float _991 = in.m_42.x;
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _995 = _991 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _999 = _997 * _993;
        float _1001 = floor(_999);
        float _1003 = -_1001;
        float _1005 = _999 + _1003;
        _1007 = _1005;
        _1009 = true;
    }
    else
    {
        float _1011 = float(_71);
        float _1013 = 1.0 / _1011;
        float _1015 = _105 * _1013;
        _1007 = _1015;
    }
    _1009 = false;
    float _1017 = _1007;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1021 = _1017 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1039 = 1.0 / _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1041;
    bool _1045 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1047 = isnan(_1017);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = 1.0 / _1029;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1061 = _1017 + _1059;
    bool _1063 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1065 = isnan(_1017);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    bool _1075 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1077 = isnan(_1017);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = 1.0 / _1037;
    float _1089 = _1061 * _1039;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1093 = _1017 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1097 = _1017 + _1095;
    bool _1099 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1101 = isnan(_1017);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1033;
    float _1113 = _1021 * _1057;
    bool _1115 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1117 = isnan(_1017);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1129 = _1017 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1131;
    float _1135 = 1.0 / _1043;
    float _1137 = _1093 * _1087;
    bool _1139 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1141 = isnan(_1017);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    bool _1151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1153 = _1097 * _1111;
    float _1155 = -_1055;
    float _1157 = _1155 + 1.0;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1159;
    float _1163 = _1125 * _1157;
    float _1165 = -_1125;
    float _1167 = _1165 + 1.0;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1169;
    float _1173 = _1129 * _1135;
    float _1175 = -_1149;
    float _1177 = _1175 + 1.0;
    float _1179 = _1149 * _1167;
    float _1181 = fma(_1133, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1183 = fma(_1171, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1185 = fma(_1161, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1187 = _1073 * _1177;
    float _1189 = -_1073;
    float _1191 = _1189 + 1.0;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1197 = -_1085;
    float _1199 = _1197 + 1.0;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1205 = _1085 * _1191;
    float _1207 = fma(_1195, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1209 = _1109 * _1199;
    float _1211 = -_1109;
    float _1213 = _1211 + 1.0;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1219 = fma(_1203, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1221 = _1181 * _1209;
    float _1223 = _1183 * _1209;
    float _1225 = _1185 * _1209;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1227;
    float _1231 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1221);
    float _1233 = fma(_1217, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1223);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1237;
    float _1241 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1225);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1243;
    float _1247 = fma(_1229, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1249 = fma(_1219, _1205, _1231);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1255 = fma(_1239, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1257 = fma(_1207, _1205, _1235);
    float _1259 = fma(_1233, _1205, _1241);
    float _1261 = fma(_1245, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1263 = fma(_1247, _1187, _1249);
    float _1265 = fma(_1253, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1275 = fma(_1255, _1187, _1257);
    float _1277 = fma(_1261, _1187, _1259);
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1279;
    float _1283 = fma(_1269, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1285;
    float _1289 = fma(_1273, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1291;
    float _1295 = fma(_1265, _1179, _1263);
    float _1297 = fma(_1281, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1299 = fma(_1287, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1301 = fma(_1283, _1179, _1275);
    float _1303 = fma(_1293, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1305 = fma(_1289, _1179, _1277);
    float _1307 = fma(_1297, _1163, _1295);
    float _1309 = fma(_1299, _1163, _1301);
    float _1311 = fma(_1303, _1163, _1305);
    float _1313 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1307);
    float _1315 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1309);
    float _1317 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1311);
    bool _1319 = !_1151;
    float _1337;
    if (!_1319)
    {
        float _1321 = in.m_42.x;
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1325 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _1329 = _1327 * _1323;
        float _1331 = floor(_1329);
        float _1333 = -_1331;
        float _1335 = _1329 + _1333;
        _1337 = _1335;
        _1339 = true;
    }
    else
    {
        float _1341 = float(_71);
        float _1343 = 1.0 / _1341;
        float _1345 = _105 * _1343;
        _1337 = _1345;
    }
    _1339 = false;
    float _1347 = _1337;
    float _1349 = in.m_42.x;
    float _1351 = in.m_42.y;
    float _1353 = in.m_42.z;
    float _1355 = in.m_42.w;
    float _1357 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1359 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1361 = log2(_1359);
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1365 = _1363 != 0;
    float _1367 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1357);
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1371 = _1369 != 0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1379 = _1377 != 0;
    float _1381 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1385 = _1383 != 0;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1389 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1395 = 1.0 / _1375;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1401 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1403 = _1353 * 2.0;
    bool _1405 = _1349 > 0.5;
    float _1407 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1409 = _1355 > 0.5;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1413 = floor(_1403);
    float _1415 = -_173;
    int _1417 = _1405 ? as_type<int>(_1415) : as_type<int>(_173);
    float _1419 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1423 = _1421 != 0;
    float _1425 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1427 = !_1365;
    float _1429 = _1427 ? _173 : as_type<float>(_1417);
    float _1431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1433 = _1351 > 0.5;
    float _1435 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1425);
    float _1437 = 1.0 / _1393;
    float _1439 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1431);
    float _1441 = -_183;
    int _1443 = _1433 ? as_type<int>(_1441) : as_type<int>(_183);
    float _1445 = _1349 * 2.0;
    bool _1447 = _1353 > 0.5;
    bool _1449 = !_1371;
    float _1451 = _1449 ? _183 : as_type<float>(_1443);
    float _1453 = floor(_1445);
    float _1455 = -_173;
    int _1457 = _1447 ? as_type<int>(_1455) : as_type<int>(_173);
    bool _1459 = _1413 > 0.0;
    bool _1461 = _1413 >= 0.0;
    bool _1463 = isnan(_1413);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(0.0);
    bool _1469 = _1465 || _1467;
    float _1471 = _1431;
    float _1473 = _1413;
    float _1475 = _1425;
    if (!_1423)
    {
        _1471 = _1351;
    }
    float _1477 = _1471;
    float _1479 = 1.0 / _1399;
    int _1481 = _1469 ? 0 : 1;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1485 = _1477;
    if (!_1423)
    {
        _1473 = _1353;
    }
    float _1487 = _1473;
    float _1489 = _1487;
    if (!_1423)
    {
        _1475 = _1353;
    }
    float _1491 = _1475;
    float _1493 = fma(_1407, -2.0, _1483);
    bool _1495 = !_1379;
    float _1497 = _1495 ? _173 : as_type<float>(_1457);
    float _1499 = _1351 * 2.0;
    float _1501 = _1491;
    if (_1423)
    {
        _1485 = _1349;
    }
    float _1503 = _1485;
    float _1505 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1493);
    if (_1423)
    {
        _1489 = _1351;
    }
    float _1507 = _1489;
    float _1509 = _1451 + (-0.5);
    if (_1423)
    {
        _1501 = _1351;
    }
    float _1511 = _1501;
    float _1513 = floor(_1499);
    int _1515 = ~_1481;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1525 = _1523 != 0;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1529 = _1527 != 0;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1533 = _1531 != 0;
    float _1535 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1537 = _1519;
    if (!_1459)
    {
        int _1539 = ~_1481;
        int _1541 = _1539 + 1;
        _1537 = _1541;
    }
    int _1543 = _1537;
    float _1545 = _105 * _1361;
    bool _1547 = _1453 >= 0.0;
    bool _1549 = isnan(_1453);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(0.0);
    bool _1555 = _1551 || _1553;
    float _1557 = -_1411;
    float _1559 = fma(_1535, 2.0, _1557);
    float _1561 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1435);
    int _1563 = _1555 ? 0 : 1;
    float _1565 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1367);
    bool _1567 = _1453 > 0.0;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1569;
    float _1573 = exp2(_1545);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1579 = _1571 * _1395;
    float _1581 = _1351 + _1353;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1583;
    float _1587 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1439);
    float _1589 = _1581 + (-1.0);
    float _1591 = _1585 * _1437;
    float _1593 = _1577 * _1479;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1597 = _1351 + _1349;
    int _1599 = ~_1563;
    int _1601 = _1599 + 1;
    int _1603 = _1601 + 1;
    float _1605 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1607 = _1603;
    if (!_1567)
    {
        int _1609 = ~_1563;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    float _1615 = _1597 + (-1.0);
    float _1617 = -_1573;
    float _1619 = _1617 + 1.0;
    bool _1621 = _1513 >= 0.0;
    bool _1623 = isnan(_1513);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan(0.0);
    bool _1629 = _1625 || _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1633 = _1347 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1637 = _1347 + _1635;
    float _1639 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1641 = _1629 ? 0 : 1;
    float _1643 = fma(_1579, _1633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1645 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1653 = _1649 || _1651;
    float _1655 = fma(_1593, _1637, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1659 = _1347 + _1657;
    float _1661 = _1653 ? _1619 : 0.0;
    float _1663 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1665 = _1513 > 0.0;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1669 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1671 = isnan(_1347);
    bool _1673 = _1669 || _1671;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1677 = _1673 || _1675;
    float _1679 = float(_1677);
    float _1681 = -_105;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1559);
    float _1685 = _1429 + 0.5;
    float _1687 = fma(_1591, _1659, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1689 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1667);
    bool _1691 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1693 = isnan(_1347);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = fma(_1663, _1685, _1683);
    float _1705 = -_1679;
    float _1707 = _1705 + 1.0;
    bool _1709 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1711 = isnan(_1347);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1723 = -_1701;
    float _1725 = _1723 + 1.0;
    float _1727 = _1701 * _1707;
    float _1729 = -_1419;
    float _1731 = -_1505;
    float _1733 = fma(_1729, _1509, _1731);
    bool _1735 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1737 = isnan(_1347);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = _1565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1751 = 1.0 + _1749;
    float _1753 = _1745 * _1725;
    float _1755 = -_1745;
    float _1757 = _1755 + 1.0;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1765 = _1719 * _1757;
    float _1767 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1759);
    float _1769 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1771 = _1643 * _1765;
    float _1773 = -_1719;
    float _1775 = _1773 + 1.0;
    float _1777 = 1.0 / _1751;
    float _1779 = -_1763;
    float _1781 = fma(_1769, 2.0, _1779);
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1785 = ~_1641;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1771);
    int _1793 = _1789;
    if (!_1665)
    {
        int _1795 = ~_1641;
        int _1797 = _1795 + 1;
        _1793 = _1797;
    }
    int _1799 = _1793;
    float _1801 = fma(_1521, -2.0, _1783);
    float _1803 = fma(_1655, _1753, _1791);
    float _1805 = -_183;
    int _1807 = _1409 ? as_type<int>(_1805) : as_type<int>(_183);
    float _1809 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1811 = _1497 + 0.5;
    float _1813 = -_105;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1781);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1819 = !_1385;
    float _1821 = _1819 ? _183 : as_type<float>(_1807);
    float _1823 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1767);
    float _1825 = _1661 * _1777;
    float _1827 = fma(_1809, _1811, _1815);
    float _1829 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1817);
    float _1831 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1833 = _1821 + (-0.5);
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1837 = _1561 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1839 = -_1823;
    float _1841 = _1839 + 1.0;
    float _1843 = _1587 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1845 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1835);
    float _1847 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1801);
    float _1849 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1829);
    float _1851 = -_1841;
    float _1853 = fma(_1497, _1851, _1827);
    float _1855 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1845);
    float _1857 = -_1831;
    float _1859 = -_1847;
    float _1861 = fma(_1857, _1833, _1859);
    float _1863 = -_1849;
    float _1865 = _1863 + 1.0;
    float _1867 = fma(_1687, _1727, _1803);
    bool _1869 = !_1529;
    int _1871 = _1869 ? 0 : 1;
    float _1873 = -_1855;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1451, _1865, _1733);
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1881 = _1837 + _1879;
    int _1883 = abs(_1871);
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1887 = _1747 + _1885;
    float _1889 = -_1875;
    float _1891 = fma(_1429, _1889, _1703);
    bool _1893 = !_1525;
    int _1895 = _1893 ? 0 : 1;
    float _1897 = in.m_46.x;
    float _1899 = in.m_46.y;
    float _1901 = in.m_46.z;
    float _1903 = _1887 * _1887;
    float _1905 = _1887 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1907 = abs(_1895);
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1911 = _1843 + _1909;
    float _1913 = fma(_1881, _1881, _1903);
    float _1915 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1905);
    float _1917 = fma(_1679, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1867);
    float _1919 = float(_1907);
    float _1921 = fma(_1911, _1911, _1913);
    float _1923 = float(_1543);
    float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1915);
    float _1927 = float(_1883);
    float _1929 = rsqrt(_1921);
    float _1931 = float(_1613);
    float _1933 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1689);
    float _1935 = _1919 * _1923;
    bool _1937 = _1925 >= 0.0;
    float _1939 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1941 = _1927 * _1931;
    float _1943 = -_1933;
    float _1945 = _1943 + 1.0;
    float _1947 = _1935 * (-2.0);
    float _1949 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1941 * (-2.0);
    float _1953 = fma(_1821, _1945, _1861);
    float _1955 = fma(_1639, _1947, _1639);
    float _1957 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1959 = fma(_1947, _1897, _1897);
    float _1961 = _1349 + (-0.5);
    float _1963 = fma(_1951, _1899, _1899);
    float _1965 = _1887 * _1929;
    float _1967 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_48.x = _1891;
    out.m_48.y = _1877;
    out.m_48.z = _1853;
    out.m_48.w = _1953;
    float _1969 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1959);
    float _1971 = _1881 * _1929;
    float _1973 = -_1965;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1887);
    out.m_50.x = _1949;
    out.m_50.y = _1957;
    out.m_50.z = _1401;
    out.m_50.w = _1967;
    bool _1977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1979 = isnan(1.0);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1985 = _1981 || _1983;
    float _1987 = -_1971;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1881);
    float _1991 = _1975 * _1975;
    float _1993 = _1853;
    float _1995 = _1965;
    if (_1937)
    {
        out.m_33.x = 0.0;
    }
    bool _1997 = !_1985;
    float _1999 = _1997 ? _105 : _1825;
    float _2001 = fma(_1605, _1951, _1605);
    float _2003 = fma(_1989, _1989, _1991);
    if (_1937)
    {
        _1993 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2005 = _1993;
    bool _2007 = !_1533;
    int _2009 = _2007 ? 0 : 1;
    float _2011 = fma(_1999, _1955, _1969);
    float _2013 = _1911 * _1929;
    int _2015 = as_type<int>(_2005);
    if (_1937)
    {
        float _2017 = _2005 * 5.0;
        _2015 = as_type<int>(_2017);
    }
    int _2019 = _2015;
    float _2021 = -_2013;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1911);
    if (_1937)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6052 = as_type<float>(_2019);
        out.gl_Position.z = _6052;
    }
    float _2025 = fma(_2023, _2023, _2003);
    int _2027 = abs(_2009);
    if (_1937)
    {
        return out;
    }
    float _2029 = -_1965;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1747);
    float _2033 = -_1971;
    float _2035 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _2037 = _1351 + (-0.5);
    float _2039 = float(_2027);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2043 = _2031 + _2041;
    float _2045 = float(_1799);
    float _2047 = -_2013;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1843);
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2053 = _2035 + _2051;
    float _2055 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2057 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1963);
    float _2059 = _2039 * _2045;
    float _2061 = _1353 + _1349;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2065 = _2049 + _2063;
    float _2067 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2055);
    float _2069 = fma(_1999, _2001, _2057);
    float _2071 = _2061 + (-1.0);
    float _2073 = _2059 * (-2.0);
    float _2075 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2067);
    float _2077 = _2069 * 0.15915493667125701904296875;
    float _2079 = _1353 + (-0.5);
    float _2081 = fma(_2071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2083 = fma(_2073, _1901, _1901);
    bool _2085 = _2075 >= 0.0;
    float _2087 = sqrt(_2025);
    float _2089 = fma(_2081, _2073, _2081);
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2083);
    float _2093 = _2011 * 0.15915493667125701904296875;
    float _2095 = fma(_1999, _2089, _2091);
    float _2097 = _2093 * 6.283185482025146484375;
    float _2099 = sin(_2097);
    float _2101 = _2095 * 0.15915493667125701904296875;
    float _2103 = _2079;
    float _2105 = _2053;
    float _2107 = _2031;
    if (_2085)
    {
        _2103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2109 = _2103;
    int _2111 = as_type<int>(_2109);
    if (_2085)
    {
        out.m_33.x = 0.0;
    }
    float _2113 = _2093 * 6.283185482025146484375;
    float _2115 = cos(_2113);
    if (_2085)
    {
        float _2117 = _2109 * 5.0;
        _2111 = as_type<int>(_2117);
    }
    int _2119 = _2111;
    float _2121 = _1929 * _2087;
    if (_2085)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6218 = as_type<float>(_2119);
        out.gl_Position.z = _6218;
    }
    float _2123 = _2077 * 6.283185482025146484375;
    float _2125 = sin(_2123);
    float _2127 = _2077 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2101 * 6.283185482025146484375;
    float _2133 = sin(_2131);
    if (_2085)
    {
        return out;
    }
    float _2135 = _2101 * 6.283185482025146484375;
    float _2137 = cos(_2135);
    float _2139 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2141 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _2143 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2145 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _2147 = _2121 * _2139;
    float _2149 = _2115 * _2129;
    float _2151 = _2121 * _2143;
    float _2153 = _2141 * _2147;
    float _2155 = _2099 * _2125;
    float _2157 = _2145 * _2151;
    float _2159 = _2115 * _2125;
    float _2161 = -_2153;
    float _2163 = _2133 * _2161;
    float _2165 = fma(_2133, _2149, _2155);
    float _2167 = fma(_2133, _2155, _2149);
    float _2169 = _2137 * _2153;
    float _2171 = _2125 * _2137;
    float _2173 = _2129 * _2137;
    float _2175 = _2099 * _2129;
    float _2177 = _2115 * _2169;
    float _2179 = fma(_2173, _2157, _2163);
    float _2181 = -_2175;
    float _2183 = fma(_2133, _2159, _2181);
    float _2185 = fma(_2165, _2157, _2177);
    float _2187 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2189 = _2187 * 0.5;
    float _2191 = -_2159;
    float _2193 = fma(_2133, _2175, _2191);
    float _2195 = _2099 * _2169;
    float _2197 = fma(_2183, _2189, _2185);
    float _2199 = fma(_2171, _2189, _2179);
    float _2201 = fma(_2193, _2157, _2195);
    float _2203 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2207 = fma(_2167, _2189, _2201);
    float _2209 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2203);
    float _2211 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2205);
    float _2213 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2209);
    float _2215 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2211);
    float _2217 = _2213 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2219 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2221 = _1843 + _2217;
    float _2223 = _1837 + _2219;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2227 = _2221 + _2225;
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2231 = _2223 + _2229;
    float _2233 = _2227 * _2227;
    float _2235 = fma(_2231, _2231, _2233);
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2239 = sqrt(_2235);
    float _2241 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2237);
    float _2243 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2241);
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2247 = _1747 + _2245;
    bool _2249 = _2239 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = _2245;
    float _2253 = _2223;
    float _2255 = _2221;
    float _2257 = _2235;
    if (!_2249)
    {
        _2251 = _2247;
    }
    float _2259 = _2251;
    bool _2261 = !_2249;
    float _2263 = _2259;
    if (!_2261)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2269 = _2239 + _2267;
        float _2271 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2273 = rsqrt(_2235);
        float _2275 = _2269 * _2265;
        float _2277 = _2275 * 0.15915493667125701904296875;
        float _2279 = _2277 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = _2277 * 6.283185482025146484375;
        float _2285 = sin(_2283);
        float _2287 = _2281 + (-1.0);
        float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2291 = fma(_2285, _2271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2293 = fma(_2247, _2281, _2289);
        float _2295 = _2273 * _2291;
        float _2297 = fma(_2231, _2295, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2299 = fma(_2227, _2295, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2263 = _2293;
        _2253 = _2297;
        _2255 = _2299;
    }
    float _2301 = _2263;
    float _2303 = _2253;
    float _2305 = _2255;
    float _2307 = -_1747;
    float _2309 = _2307 + _2301;
    float _2311 = -_1837;
    float _2313 = _2311 + _2303;
    float _2315 = -_1843;
    float _2317 = _2315 + _2305;
    float _2319 = _2309 * _2309;
    float _2321 = fma(_2313, _2313, _2319);
    float _2323 = fma(_2317, _2317, _2321);
    float _2325 = sqrt(_2323);
    bool _2327 = _2325 > 0.0;
    bool _2329 = !_2327;
    float _2331 = _2325;
    float _2333 = _2317;
    float _2335 = _2305;
    float _2337 = _2301;
    float _2339 = _2303;
    float _2341 = _2323;
    if (!_2329)
    {
        bool _2343 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2345 = _2227;
        if (_2343)
        {
            float _2347 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2345 = _2347;
        }
        float _2349 = _2345;
        float _2351 = _2349;
        if (_2343)
        {
            float _2353 = _425 * _2349;
            _2257 = _2353;
        }
        float _2355 = _2257;
        float _2357 = _2355;
        if (_2343)
        {
            float _2359 = _427 * _2349;
            _2331 = _2359;
        }
        float _2361 = _2331;
        float _2363 = _2361;
        if (_2343)
        {
            float _2365 = _429 * _2349;
            _2351 = _2365;
        }
        float _2367 = _2351;
        float _2369 = _2367;
        if (!_2343)
        {
            float _2371 = _105 + 1.0;
            float _2373 = _2371;
            if (!_139)
            {
                float _2375 = _2371 * _2371;
                float _2377 = _2375 * 0.5;
                _433 = _2377;
            }
            float _2379 = _433;
            float _2381 = _2379;
            if (!_139)
            {
                float _2383 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2381 = _2383;
            }
            float _2385 = _2381;
            bool _2387 = !_139;
            float _2389 = _2385;
            if (!_2387)
            {
                float _2391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2393 = log2(_2391);
                float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2397 = 1.0 + _2395;
                float _2399 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2401 = _2393 * _2371;
                float _2403 = 1.0 / _2397;
                float _2405 = _2399 * 0.693147182464599609375;
                float _2407 = exp2(_2401);
                float _2409 = 1.0 / _2405;
                float _2411 = _2407 + (-1.0);
                float _2413 = -_2411;
                float _2415 = fma(_2413, _2409, _2371);
                float _2417 = _2415 * _2403;
                float _2419 = _2417 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2389 = _2419;
            }
            float _2421 = _2389;
            float _2423 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2425 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2427 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2429 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2431 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2433 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2435 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2429);
            float _2437 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2431);
            float _2439 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2435);
            bool _2441 = !_139;
            if (!_2441)
            {
                float _2443 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2445 = log2(_2443);
                float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2449 = 1.0 + _2447;
                float _2451 = 1.0 / _2449;
                float _2453 = _2445 * _2371;
                float _2455 = exp2(_2453);
                float _2457 = -_2455;
                float _2459 = _2457 + 1.0;
                float _2461 = _2459 * _2451;
                _2373 = _2461;
            }
            float _2463 = _2373;
            float _2465 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2433);
            float _2467 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2437);
            float _2469 = fma(_2463, _143, _2439);
            float _2471 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2465);
            float _2473 = fma(_2463, _141, _2467);
            float _2475 = -_387;
            float _2477 = _2475 + _2469;
            float _2479 = fma(_2463, _145, _2471);
            float _2481 = -_389;
            float _2483 = _2481 + _2473;
            float _2485 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2487 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2489 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2491 = -_401;
            float _2493 = _2491 + _2479;
            float _2495 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2485);
            float _2497 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2487);
            float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2489);
            float _2501 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2495);
            float _2503 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2497);
            float _2505 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2499);
            _435 = _2503;
            _437 = _2501;
            _439 = _2505;
            _2357 = _2501;
            _2363 = _2503;
            _2369 = _2505;
        }
        float _2507 = _435;
        float _2509 = _437;
        float _2511 = _439;
        float _2513 = _2357;
        float _2515 = _2363;
        float _2517 = _2369;
        float _2519 = _2507 * _2507;
        float _2521 = rsqrt(_2323);
        float _2523 = fma(_2509, _2509, _2519);
        float _2525 = fma(_2511, _2511, _2523);
        float _2527 = sqrt(_2525);
        float _2529 = _2313 * _2521;
        float _2531 = _2309 * _2521;
        float _2533 = _2317 * _2521;
        bool _2535 = _2527 > 0.0;
        bool _2537 = !_2535;
        _2333 = _2533;
        if (!_2537)
        {
            float _2539 = rsqrt(_2525);
            float _2541 = _2539 * _2507;
            float _2543 = _2539 * _2509;
            float _2545 = _2539 * _2511;
            float _2547 = _2531 * _2541;
            float _2549 = fma(_2529, _2543, _2547);
            float _2551 = fma(_2533, _2545, _2549);
            float _2553 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2555 = fma(_2513, _2553, _2303);
            float _2557 = fma(_2515, _2553, _2301);
            float _2559 = fma(_2517, _2553, _2305);
            _2335 = _2559;
            _2337 = _2557;
            _2339 = _2555;
        }
    }
    float _2561 = _2333;
    float _2563 = _2335;
    float _2565 = _2337;
    float _2567 = _2339;
    float _2569 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2571 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2573 = isnan(0.5);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2579 = _2575 || _2577;
    bool _2581 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2583 = isnan(0.5);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2589 = _2585 || _2587;
    float _2591 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2569);
    float _2593 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2595 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2591);
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2599 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2593);
    float _2601 = _2561;
    float _2603 = _2593;
    float _2605 = _2565;
    if (!_2579)
    {
        _2601 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2607 = _2601;
    float _2609 = 1.0 / _2597;
    float _2611 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2599);
    float _2613 = _2607;
    if (!_2579)
    {
        _2341 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2615 = _2341;
    if (!_2579)
    {
        float _2617 = -_2607;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2603 = _2619;
    }
    float _2621 = _2603;
    float _2623 = _2611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2625 = _2623 + _2597;
    float _2627 = _2621;
    if (!_2579)
    {
        float _2629 = 1.0 / _2621;
        _2627 = _2629;
    }
    float _2631 = _2627;
    float _2633 = -_2013;
    float _2635 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2563);
    float _2637 = _2625 * _2609;
    float _2639 = _2637 * 0.5;
    float _2641 = -_1965;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2565);
    float _2645 = _2643;
    float _2647 = _2635;
    if (!_2579)
    {
        float _2649 = -_2615;
        float _2651 = _2649 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1995 = _2651;
    }
    float _2653 = _1995;
    float _2655 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2657 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2655);
    float _2659 = -_1971;
    float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2567);
    float _2663 = 1.0 / _2657;
    float _2665 = _2661;
    float _2667 = _2631;
    if (!_2589)
    {
        float _2669 = _2043 * _2043;
        float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2673 = -_1843;
        float _2675 = _2673 + _2563;
        float _2677 = -_1837;
        float _2679 = _2677 + _2567;
        float _2681 = fma(_2053, _2053, _2669);
        float _2683 = -_1747;
        float _2685 = _2683 + _2565;
        float _2687 = fma(_2065, _2065, _2681);
        float _2689 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2691 = sqrt(_2687);
        float _2693 = 1.0 / _2121;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2697 = precise::min(_2691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2699 = _2697 * _2671;
        float _2701 = _2699 * _2693;
        float _2703 = _2695 * _2701;
        float _2705 = _2675 * _2701;
        float _2707 = fma(_2679, _2703, _2035);
        float _2709 = fma(_2685, _2703, _2031);
        float _2711 = fma(_2695, _2705, _2049);
        _2645 = _2709;
        _2105 = _2691;
        _2665 = _2707;
        _2647 = _2711;
        _2605 = _2685;
    }
    float _2713 = _2645;
    float _2715 = _2105;
    float _2717 = _2665;
    float _2719 = _2647;
    float _2721 = _2605;
    float _2723 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2725 = _2715;
    float _2727 = _2721;
    if (!_2579)
    {
        float _2729 = 1.0 / _2653;
        _2725 = _2729;
    }
    float _2731 = _2725;
    float _2733 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2735 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2737 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2723);
    float _2739 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2741 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2733);
    float _2743 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2735);
    float _2745 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2737);
    float _2747 = _2739;
    if (!_2579)
    {
        float _2749 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2751 = -_2615;
        float _2753 = fma(_2663, _2749, _2751);
        _2727 = _2753;
    }
    float _2755 = _2727;
    float _2757 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2741);
    float _2759 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2739);
    float _2761 = _2745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_2579)
    {
        float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2765 = -_2607;
        float _2767 = fma(_2663, _2763, _2765);
        _2107 = _2767;
    }
    float _2769 = _2107;
    float _2771 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2743);
    float _2773 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2775 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2777 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    if (!_2579)
    {
        float _2779 = _2755 * _2731;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        _2613 = _2781;
    }
    float _2783 = _2613;
    if (_2579)
    {
        _2747 = 1.0;
    }
    float _2785 = _2747;
    float _2787 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2789 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2759);
    float _2791 = _2785;
    if (!_2579)
    {
        float _2793 = _2769 * _2631;
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        _2791 = _2795;
    }
    float _2797 = _2791;
    float _2799 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2801 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2775);
    float _2803 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    if (_2579)
    {
        _2667 = 1.0;
    }
    float _2805 = _2667;
    float _2807 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2809 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2787);
    float _2811 = _2805;
    if (!_2579)
    {
        float _2813 = -_2783;
        float _2815 = _2813 + 1.0;
        _2811 = _2815;
    }
    float _2817 = _2811;
    float _2819 = _2789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2821 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2801);
    float _2823 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2803);
    bool _2825 = _2797 > 0.0;
    bool _2827 = isnan(_2797);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(0.0);
    bool _2833 = _2829 || _2831;
    float _2835 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2807);
    float _2837 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2809);
    float _2839 = _2797 * _2817;
    float _2841 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2821);
    float _2843 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2823);
    bool _2845 = _2817 <= 0.0;
    bool _2847 = !_2833;
    bool _2849 = _2845 || _2847;
    float _2851 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2835);
    float _2853 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2837);
    float _2855 = _2841 + _2843;
    float _2857 = _2839 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2859 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2851);
    float _2861 = _2855 * 0.5;
    float _2863 = _2857 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2853;
    out.gl_Position.y = _2859;
    out.gl_Position.z = _2841;
    out.gl_Position.w = _2843;
    out.m_52.z = _2861;
    out.m_52.w = _2843;
    out.m_33.x = _2863;
    if (!_2849)
    {
        return out;
    }
    float _2865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2865;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1339 = false;
    bool _1009 = false;
    bool _829 = false;
    bool _661 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2922 = as_type<float>(_87);
        out.gl_Position.z = _2922;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2991 = as_type<float>(_123);
        out.gl_Position.z = _2991;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_40.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_35.x;
    float _143 = in.m_35.y;
    float _145 = in.m_35.z;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    int _153 = as_type<int>(_125) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_125) & 2;
    bool _159 = _157 != 0;
    float _161 = _125;
    float _163 = _127;
    if (!_139)
    {
        float _165 = _127 * _127;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    bool _171 = !_155;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _169;
    if (!_139)
    {
        float _177 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _179;
    float _189 = 0.0;
    if (!_185)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _127 * _193;
        float _203 = exp2(_201);
        float _205 = _199 * 0.693147182464599609375;
        float _207 = 1.0 / _205;
        float _209 = 1.0 / _197;
        float _211 = _203 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _207, _127);
        float _217 = _215 * _209;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _219;
        _189 = _197;
    }
    float _221 = _187;
    float _223 = _189;
    float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _227 = !_139;
    float _229 = _223;
    float _231 = _221;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _127 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _241;
        _163 = _251;
    }
    float _253 = _229;
    float _255 = _163;
    float _257 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _259 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _261 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _225 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _265 = _253;
    if (!_139)
    {
        float _267 = _105 * _105;
        float _269 = _267 * 0.5;
        _265 = _269;
    }
    float _271 = _265;
    float _273 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].x, _257);
    float _275 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].y, _259);
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[8].z, _263);
    float _279 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_139)
    {
        float _281 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _281;
    }
    float _283 = _231;
    bool _285 = !_139;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _105 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _105);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].x, _273);
    float _325 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].y, _275);
    float _327 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _329 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _331 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _333 = _321 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _335 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[10].z, _277);
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].x, _329);
    float _339 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].y, _331);
    float _341 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[8].z, _333);
    float _343 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _141, _323);
    float _347 = fma(_255, _143, _325);
    float _349 = fma(_255, _145, _335);
    float _351 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].x, _337);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].y, _339);
    float _355 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[10].z, _341);
    float _357 = _343;
    if (!_139)
    {
        _357 = _105;
    }
    float _359 = _357;
    bool _361 = !_139;
    float _363 = _359;
    if (!_361)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = 1.0 / _371;
        float _375 = _105 * _367;
        float _377 = exp2(_375);
        float _379 = -_377;
        float _381 = _379 + 1.0;
        float _383 = _381 * _373;
        _363 = _383;
    }
    float _385 = _363;
    float _387 = fma(_385, _143, _353);
    float _389 = fma(_385, _141, _351);
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _393 = fma(_347, _129, _149);
    float _395 = -_387;
    float _397 = _347 + _395;
    float _399 = fma(_345, _129, _147);
    float _401 = fma(_385, _145, _355);
    float _403 = -_389;
    float _405 = _345 + _403;
    float _407 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _409 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = -_401;
    float _415 = _349 + _413;
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _407);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _423 = fma(_349, _129, _151);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _429 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    bool _431 = !_391;
    float _433 = _429;
    float _435 = _427;
    float _437 = _425;
    float _439 = _429;
    float _457;
    if (!_431)
    {
        float _441 = in.m_42.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_71);
        float _463 = 1.0 / _461;
        float _465 = _105 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _467 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _485;
    bool _489 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _479;
    bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _505 = 1.0 / _483;
    float _507 = 1.0 / _487;
    float _509 = _471 * _501;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _467 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _515;
    float _519 = _513 * _505;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _531 = fma(_523, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _533 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_467);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = _475 * _507;
    bool _547 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _549 = isnan(_467);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_499;
    float _561 = _559 + 1.0;
    float _563 = _557 * _561;
    bool _565 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _567 = isnan(_467);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = -_557;
    float _583 = _581 + 1.0;
    float _585 = -_543;
    float _587 = _585 + 1.0;
    float _589 = fma(_529, _519, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _591 = fma(_579, _519, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _593 = _543 * _583;
    float _595 = _575 * _587;
    float _597 = in.m_40.x;
    float _599 = in.m_40.y;
    float _601 = -_575;
    float _603 = _601 + 1.0;
    float _605 = _525 * _595;
    float _607 = _531 * _595;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _613;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[143].y, _607);
    float _621 = fma(_611, _545, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = fma(_615, _545, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _625 = fma(_591, _593, _617);
    float _627 = fma(_589, _593, _619);
    float _629 = fma(_623, _563, _625);
    float _631 = fma(_621, _563, _627);
    float _633 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[146].x, _629);
    float _635 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[146].y, _631);
    float _637 = _633 * _597;
    float _639 = _635 * _599;
    bool _641 = !_503;
    float _659;
    if (!_641)
    {
        float _643 = in.m_42.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_71);
        float _665 = 1.0 / _663;
        float _667 = _105 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _673 = _669 + _671;
    bool _675 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _677 = isnan(_669);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _689 = _669 + _687;
    bool _691 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _693 = isnan(_669);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _711 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _713 = isnan(_669);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_685;
    float _725 = _723 + 1.0;
    float _727 = 1.0 / _709;
    float _729 = _721 * _725;
    float _731 = -_721;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _735;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _741 = 1.0 / _705;
    float _743 = _701 * _733;
    float _745 = -_701;
    float _747 = _745 + 1.0;
    float _749 = _689 * _727;
    float _751 = _673 * _741;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _757;
    float _761 = fma(_737, _751, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _763 = fma(_755, _751, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _765 = fma(_759, _751, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _767 = _761 * _743;
    float _769 = _763 * _743;
    float _771 = _765 * _743;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _785 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].x, _767);
    float _787 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].y, _769);
    float _789 = fma(_775, _749, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _791 = fma(_779, _749, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _793 = fma(_783, _749, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _795 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[107].z, _771);
    float _797 = fma(_789, _729, _785);
    float _799 = fma(_791, _729, _787);
    float _801 = fma(_793, _729, _795);
    float _803 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].x, _797);
    float _805 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].y, _799);
    float _807 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[109].z, _801);
    bool _809 = !_739;
    float _827;
    if (!_809)
    {
        float _811 = in.m_42.x;
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _815 = _811 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        float _831 = float(_71);
        float _833 = 1.0 / _831;
        float _835 = _105 * _833;
        _827 = _835;
    }
    _829 = false;
    float _837 = _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _841 = _837 + _839;
    float _843 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _853 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _855 = isnan(_837);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _869 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _871 = isnan(_837);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = 1.0 / _847;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _883;
    float _887 = -_863;
    float _889 = _887 + 1.0;
    bool _891 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _893 = isnan(_837);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _905 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _907 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = 1.0 / _851;
    float _911 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _915 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _917 = 1.0 / _867;
    float _919 = _885 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _925 = _879 * _889;
    float _927 = -_879;
    float _929 = _927 + 1.0;
    float _931 = fma(_919, _841, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _933;
    float _937 = _901 * _929;
    float _939 = _923 * _909;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _837 + _941;
    bool _945 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _947 = isnan(_837);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = _931 * _937;
    float _959 = -_901;
    float _961 = _959 + 1.0;
    float _963 = fma(_939, _943, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _837 + _965;
    float _969 = _935 * _917;
    float _971 = -_955;
    float _973 = _971 + 1.0;
    float _975 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[115].x, _957);
    float _977 = fma(_969, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _979 = _863 * _973;
    float _981 = fma(_963, _925, _975);
    float _983 = fma(_977, _979, _981);
    float _985 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[118].x, _983);
    float _987 = _985 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _907;
    out.m_44.y = _911;
    out.m_44.z = _913;
    out.m_44.w = _987;
    bool _989 = !_915;
    float _1007;
    if (!_989)
    {
        float _991 = in.m_42.x;
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _995 = _991 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _999 = _997 * _993;
        float _1001 = floor(_999);
        float _1003 = -_1001;
        float _1005 = _999 + _1003;
        _1007 = _1005;
        _1009 = true;
    }
    else
    {
        float _1011 = float(_71);
        float _1013 = 1.0 / _1011;
        float _1015 = _105 * _1013;
        _1007 = _1015;
    }
    _1009 = false;
    float _1017 = _1007;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1021 = _1017 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1039 = 1.0 / _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1041;
    bool _1045 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1047 = isnan(_1017);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = 1.0 / _1029;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1061 = _1017 + _1059;
    bool _1063 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1065 = isnan(_1017);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    bool _1075 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1077 = isnan(_1017);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = 1.0 / _1037;
    float _1089 = _1061 * _1039;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1093 = _1017 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1097 = _1017 + _1095;
    bool _1099 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1101 = isnan(_1017);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1033;
    float _1113 = _1021 * _1057;
    bool _1115 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1117 = isnan(_1017);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1129 = _1017 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1131;
    float _1135 = 1.0 / _1043;
    float _1137 = _1093 * _1087;
    bool _1139 = _1017 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1141 = isnan(_1017);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    bool _1151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1153 = _1097 * _1111;
    float _1155 = -_1055;
    float _1157 = _1155 + 1.0;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1159;
    float _1163 = _1125 * _1157;
    float _1165 = -_1125;
    float _1167 = _1165 + 1.0;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1169;
    float _1173 = _1129 * _1135;
    float _1175 = -_1149;
    float _1177 = _1175 + 1.0;
    float _1179 = _1149 * _1167;
    float _1181 = fma(_1133, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1183 = fma(_1171, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1185 = fma(_1161, _1089, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1187 = _1073 * _1177;
    float _1189 = -_1073;
    float _1191 = _1189 + 1.0;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1197 = -_1085;
    float _1199 = _1197 + 1.0;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1205 = _1085 * _1191;
    float _1207 = fma(_1195, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1209 = _1109 * _1199;
    float _1211 = -_1109;
    float _1213 = _1211 + 1.0;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1219 = fma(_1203, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1221 = _1181 * _1209;
    float _1223 = _1183 * _1209;
    float _1225 = _1185 * _1209;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1227;
    float _1231 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1221);
    float _1233 = fma(_1217, _1113, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1223);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1237;
    float _1241 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1225);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1243;
    float _1247 = fma(_1229, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1249 = fma(_1219, _1205, _1231);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1255 = fma(_1239, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1257 = fma(_1207, _1205, _1235);
    float _1259 = fma(_1233, _1205, _1241);
    float _1261 = fma(_1245, _1153, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1263 = fma(_1247, _1187, _1249);
    float _1265 = fma(_1253, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1275 = fma(_1255, _1187, _1257);
    float _1277 = fma(_1261, _1187, _1259);
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1279;
    float _1283 = fma(_1269, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1285;
    float _1289 = fma(_1273, _1137, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1291;
    float _1295 = fma(_1265, _1179, _1263);
    float _1297 = fma(_1281, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1299 = fma(_1287, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1301 = fma(_1283, _1179, _1275);
    float _1303 = fma(_1293, _1173, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1305 = fma(_1289, _1179, _1277);
    float _1307 = fma(_1297, _1163, _1295);
    float _1309 = fma(_1299, _1163, _1301);
    float _1311 = fma(_1303, _1163, _1305);
    float _1313 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1307);
    float _1315 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1309);
    float _1317 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1311);
    bool _1319 = !_1151;
    float _1337;
    if (!_1319)
    {
        float _1321 = in.m_42.x;
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1325 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _1329 = _1327 * _1323;
        float _1331 = floor(_1329);
        float _1333 = -_1331;
        float _1335 = _1329 + _1333;
        _1337 = _1335;
        _1339 = true;
    }
    else
    {
        float _1341 = float(_71);
        float _1343 = 1.0 / _1341;
        float _1345 = _105 * _1343;
        _1337 = _1345;
    }
    _1339 = false;
    float _1347 = _1337;
    float _1349 = in.m_42.x;
    float _1351 = in.m_42.y;
    float _1353 = in.m_42.z;
    float _1355 = in.m_42.w;
    float _1357 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1359 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1361 = log2(_1359);
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1365 = _1363 != 0;
    float _1367 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1357);
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1371 = _1369 != 0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1379 = _1377 != 0;
    float _1381 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1385 = _1383 != 0;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1389 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1395 = 1.0 / _1375;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1401 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1403 = _1353 * 2.0;
    bool _1405 = _1349 > 0.5;
    float _1407 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1409 = _1355 > 0.5;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1413 = floor(_1403);
    float _1415 = -_173;
    int _1417 = _1405 ? as_type<int>(_1415) : as_type<int>(_173);
    float _1419 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1423 = _1421 != 0;
    float _1425 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1427 = !_1365;
    float _1429 = _1427 ? _173 : as_type<float>(_1417);
    float _1431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1433 = _1351 > 0.5;
    float _1435 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1425);
    float _1437 = 1.0 / _1393;
    float _1439 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1431);
    float _1441 = -_183;
    int _1443 = _1433 ? as_type<int>(_1441) : as_type<int>(_183);
    float _1445 = _1349 * 2.0;
    bool _1447 = _1353 > 0.5;
    bool _1449 = !_1371;
    float _1451 = _1449 ? _183 : as_type<float>(_1443);
    float _1453 = floor(_1445);
    float _1455 = -_173;
    int _1457 = _1447 ? as_type<int>(_1455) : as_type<int>(_173);
    bool _1459 = _1413 > 0.0;
    bool _1461 = _1413 >= 0.0;
    bool _1463 = isnan(_1413);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(0.0);
    bool _1469 = _1465 || _1467;
    float _1471 = _1431;
    float _1473 = _1413;
    float _1475 = _1425;
    if (!_1423)
    {
        _1471 = _1351;
    }
    float _1477 = _1471;
    float _1479 = 1.0 / _1399;
    int _1481 = _1469 ? 0 : 1;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1485 = _1477;
    if (!_1423)
    {
        _1473 = _1353;
    }
    float _1487 = _1473;
    float _1489 = _1487;
    if (!_1423)
    {
        _1475 = _1353;
    }
    float _1491 = _1475;
    float _1493 = fma(_1407, -2.0, _1483);
    bool _1495 = !_1379;
    float _1497 = _1495 ? _173 : as_type<float>(_1457);
    float _1499 = _1351 * 2.0;
    float _1501 = _1491;
    if (_1423)
    {
        _1485 = _1349;
    }
    float _1503 = _1485;
    float _1505 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1493);
    if (_1423)
    {
        _1489 = _1351;
    }
    float _1507 = _1489;
    float _1509 = _1451 + (-0.5);
    if (_1423)
    {
        _1501 = _1351;
    }
    float _1511 = _1501;
    float _1513 = floor(_1499);
    int _1515 = ~_1481;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1525 = _1523 != 0;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1529 = _1527 != 0;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1533 = _1531 != 0;
    float _1535 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1537 = _1519;
    if (!_1459)
    {
        int _1539 = ~_1481;
        int _1541 = _1539 + 1;
        _1537 = _1541;
    }
    int _1543 = _1537;
    float _1545 = _105 * _1361;
    bool _1547 = _1453 >= 0.0;
    bool _1549 = isnan(_1453);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(0.0);
    bool _1555 = _1551 || _1553;
    float _1557 = -_1411;
    float _1559 = fma(_1535, 2.0, _1557);
    float _1561 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1435);
    int _1563 = _1555 ? 0 : 1;
    float _1565 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1367);
    bool _1567 = _1453 > 0.0;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1569;
    float _1573 = exp2(_1545);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1579 = _1571 * _1395;
    float _1581 = _1351 + _1353;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1583;
    float _1587 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1439);
    float _1589 = _1581 + (-1.0);
    float _1591 = _1585 * _1437;
    float _1593 = _1577 * _1479;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1597 = _1351 + _1349;
    int _1599 = ~_1563;
    int _1601 = _1599 + 1;
    int _1603 = _1601 + 1;
    float _1605 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1607 = _1603;
    if (!_1567)
    {
        int _1609 = ~_1563;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    float _1615 = _1597 + (-1.0);
    float _1617 = -_1573;
    float _1619 = _1617 + 1.0;
    bool _1621 = _1513 >= 0.0;
    bool _1623 = isnan(_1513);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan(0.0);
    bool _1629 = _1625 || _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1633 = _1347 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1637 = _1347 + _1635;
    float _1639 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1641 = _1629 ? 0 : 1;
    float _1643 = fma(_1579, _1633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1645 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1653 = _1649 || _1651;
    float _1655 = fma(_1593, _1637, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1659 = _1347 + _1657;
    float _1661 = _1653 ? _1619 : 0.0;
    float _1663 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1665 = _1513 > 0.0;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1669 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1671 = isnan(_1347);
    bool _1673 = _1669 || _1671;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1677 = _1673 || _1675;
    float _1679 = float(_1677);
    float _1681 = -_105;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1559);
    float _1685 = _1429 + 0.5;
    float _1687 = fma(_1591, _1659, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1689 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1667);
    bool _1691 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1693 = isnan(_1347);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = fma(_1663, _1685, _1683);
    float _1705 = -_1679;
    float _1707 = _1705 + 1.0;
    bool _1709 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1711 = isnan(_1347);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1723 = -_1701;
    float _1725 = _1723 + 1.0;
    float _1727 = _1701 * _1707;
    float _1729 = -_1419;
    float _1731 = -_1505;
    float _1733 = fma(_1729, _1509, _1731);
    bool _1735 = _1347 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1737 = isnan(_1347);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = _1565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1751 = 1.0 + _1749;
    float _1753 = _1745 * _1725;
    float _1755 = -_1745;
    float _1757 = _1755 + 1.0;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1765 = _1719 * _1757;
    float _1767 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1759);
    float _1769 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1771 = _1643 * _1765;
    float _1773 = -_1719;
    float _1775 = _1773 + 1.0;
    float _1777 = 1.0 / _1751;
    float _1779 = -_1763;
    float _1781 = fma(_1769, 2.0, _1779);
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1785 = ~_1641;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1771);
    int _1793 = _1789;
    if (!_1665)
    {
        int _1795 = ~_1641;
        int _1797 = _1795 + 1;
        _1793 = _1797;
    }
    int _1799 = _1793;
    float _1801 = fma(_1521, -2.0, _1783);
    float _1803 = fma(_1655, _1753, _1791);
    float _1805 = -_183;
    int _1807 = _1409 ? as_type<int>(_1805) : as_type<int>(_183);
    float _1809 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1811 = _1497 + 0.5;
    float _1813 = -_105;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1781);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1819 = !_1385;
    float _1821 = _1819 ? _183 : as_type<float>(_1807);
    float _1823 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1767);
    float _1825 = _1661 * _1777;
    float _1827 = fma(_1809, _1811, _1815);
    float _1829 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1817);
    float _1831 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1833 = _1821 + (-0.5);
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1837 = _1561 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1839 = -_1823;
    float _1841 = _1839 + 1.0;
    float _1843 = _1587 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1845 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1835);
    float _1847 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1801);
    float _1849 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1829);
    float _1851 = -_1841;
    float _1853 = fma(_1497, _1851, _1827);
    float _1855 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1845);
    float _1857 = -_1831;
    float _1859 = -_1847;
    float _1861 = fma(_1857, _1833, _1859);
    float _1863 = -_1849;
    float _1865 = _1863 + 1.0;
    float _1867 = fma(_1687, _1727, _1803);
    bool _1869 = !_1529;
    int _1871 = _1869 ? 0 : 1;
    float _1873 = -_1855;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1451, _1865, _1733);
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1881 = _1837 + _1879;
    int _1883 = abs(_1871);
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1887 = _1747 + _1885;
    float _1889 = -_1875;
    float _1891 = fma(_1429, _1889, _1703);
    bool _1893 = !_1525;
    int _1895 = _1893 ? 0 : 1;
    float _1897 = in.m_46.x;
    float _1899 = in.m_46.y;
    float _1901 = in.m_46.z;
    float _1903 = _1887 * _1887;
    float _1905 = _1887 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1907 = abs(_1895);
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1911 = _1843 + _1909;
    float _1913 = fma(_1881, _1881, _1903);
    float _1915 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1905);
    float _1917 = fma(_1679, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1867);
    float _1919 = float(_1907);
    float _1921 = fma(_1911, _1911, _1913);
    float _1923 = float(_1543);
    float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1915);
    float _1927 = float(_1883);
    float _1929 = rsqrt(_1921);
    float _1931 = float(_1613);
    float _1933 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1689);
    float _1935 = _1919 * _1923;
    bool _1937 = _1925 >= 0.0;
    float _1939 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1941 = _1927 * _1931;
    float _1943 = -_1933;
    float _1945 = _1943 + 1.0;
    float _1947 = _1935 * (-2.0);
    float _1949 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1941 * (-2.0);
    float _1953 = fma(_1821, _1945, _1861);
    float _1955 = fma(_1639, _1947, _1639);
    float _1957 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1959 = fma(_1947, _1897, _1897);
    float _1961 = _1349 + (-0.5);
    float _1963 = fma(_1951, _1899, _1899);
    float _1965 = _1887 * _1929;
    float _1967 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_48.x = _1891;
    out.m_48.y = _1877;
    out.m_48.z = _1853;
    out.m_48.w = _1953;
    float _1969 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1959);
    float _1971 = _1881 * _1929;
    float _1973 = -_1965;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1887);
    out.m_50.x = _1949;
    out.m_50.y = _1957;
    out.m_50.z = _1401;
    out.m_50.w = _1967;
    bool _1977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1979 = isnan(1.0);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1985 = _1981 || _1983;
    float _1987 = -_1971;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1881);
    float _1991 = _1975 * _1975;
    float _1993 = _1853;
    float _1995 = _1965;
    if (_1937)
    {
        out.m_33.x = 0.0;
    }
    bool _1997 = !_1985;
    float _1999 = _1997 ? _105 : _1825;
    float _2001 = fma(_1605, _1951, _1605);
    float _2003 = fma(_1989, _1989, _1991);
    if (_1937)
    {
        _1993 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2005 = _1993;
    bool _2007 = !_1533;
    int _2009 = _2007 ? 0 : 1;
    float _2011 = fma(_1999, _1955, _1969);
    float _2013 = _1911 * _1929;
    int _2015 = as_type<int>(_2005);
    if (_1937)
    {
        float _2017 = _2005 * 5.0;
        _2015 = as_type<int>(_2017);
    }
    int _2019 = _2015;
    float _2021 = -_2013;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1911);
    if (_1937)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6052 = as_type<float>(_2019);
        out.gl_Position.z = _6052;
    }
    float _2025 = fma(_2023, _2023, _2003);
    int _2027 = abs(_2009);
    if (_1937)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2029 = -_1965;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1747);
    float _2033 = -_1971;
    float _2035 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _2037 = _1351 + (-0.5);
    float _2039 = float(_2027);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2043 = _2031 + _2041;
    float _2045 = float(_1799);
    float _2047 = -_2013;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1843);
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2053 = _2035 + _2051;
    float _2055 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2057 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1963);
    float _2059 = _2039 * _2045;
    float _2061 = _1353 + _1349;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2065 = _2049 + _2063;
    float _2067 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2055);
    float _2069 = fma(_1999, _2001, _2057);
    float _2071 = _2061 + (-1.0);
    float _2073 = _2059 * (-2.0);
    float _2075 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2067);
    float _2077 = _2069 * 0.15915493667125701904296875;
    float _2079 = _1353 + (-0.5);
    float _2081 = fma(_2071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2083 = fma(_2073, _1901, _1901);
    bool _2085 = _2075 >= 0.0;
    float _2087 = sqrt(_2025);
    float _2089 = fma(_2081, _2073, _2081);
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2083);
    float _2093 = _2011 * 0.15915493667125701904296875;
    float _2095 = fma(_1999, _2089, _2091);
    float _2097 = _2093 * 6.283185482025146484375;
    float _2099 = sin(_2097);
    float _2101 = _2095 * 0.15915493667125701904296875;
    float _2103 = _2079;
    float _2105 = _2053;
    float _2107 = _2031;
    if (_2085)
    {
        _2103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2109 = _2103;
    int _2111 = as_type<int>(_2109);
    if (_2085)
    {
        out.m_33.x = 0.0;
    }
    float _2113 = _2093 * 6.283185482025146484375;
    float _2115 = cos(_2113);
    if (_2085)
    {
        float _2117 = _2109 * 5.0;
        _2111 = as_type<int>(_2117);
    }
    int _2119 = _2111;
    float _2121 = _1929 * _2087;
    if (_2085)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6218 = as_type<float>(_2119);
        out.gl_Position.z = _6218;
    }
    float _2123 = _2077 * 6.283185482025146484375;
    float _2125 = sin(_2123);
    float _2127 = _2077 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2101 * 6.283185482025146484375;
    float _2133 = sin(_2131);
    if (_2085)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2135 = _2101 * 6.283185482025146484375;
    float _2137 = cos(_2135);
    float _2139 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2141 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _2143 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2145 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _2147 = _2121 * _2139;
    float _2149 = _2115 * _2129;
    float _2151 = _2121 * _2143;
    float _2153 = _2141 * _2147;
    float _2155 = _2099 * _2125;
    float _2157 = _2145 * _2151;
    float _2159 = _2115 * _2125;
    float _2161 = -_2153;
    float _2163 = _2133 * _2161;
    float _2165 = fma(_2133, _2149, _2155);
    float _2167 = fma(_2133, _2155, _2149);
    float _2169 = _2137 * _2153;
    float _2171 = _2125 * _2137;
    float _2173 = _2129 * _2137;
    float _2175 = _2099 * _2129;
    float _2177 = _2115 * _2169;
    float _2179 = fma(_2173, _2157, _2163);
    float _2181 = -_2175;
    float _2183 = fma(_2133, _2159, _2181);
    float _2185 = fma(_2165, _2157, _2177);
    float _2187 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2189 = _2187 * 0.5;
    float _2191 = -_2159;
    float _2193 = fma(_2133, _2175, _2191);
    float _2195 = _2099 * _2169;
    float _2197 = fma(_2183, _2189, _2185);
    float _2199 = fma(_2171, _2189, _2179);
    float _2201 = fma(_2193, _2157, _2195);
    float _2203 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2207 = fma(_2167, _2189, _2201);
    float _2209 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2203);
    float _2211 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2205);
    float _2213 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2209);
    float _2215 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2211);
    float _2217 = _2213 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2219 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2221 = _1843 + _2217;
    float _2223 = _1837 + _2219;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2227 = _2221 + _2225;
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2231 = _2223 + _2229;
    float _2233 = _2227 * _2227;
    float _2235 = fma(_2231, _2231, _2233);
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2239 = sqrt(_2235);
    float _2241 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2237);
    float _2243 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2241);
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2247 = _1747 + _2245;
    bool _2249 = _2239 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = _2245;
    float _2253 = _2223;
    float _2255 = _2221;
    float _2257 = _2235;
    if (!_2249)
    {
        _2251 = _2247;
    }
    float _2259 = _2251;
    bool _2261 = !_2249;
    float _2263 = _2259;
    if (!_2261)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2269 = _2239 + _2267;
        float _2271 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2273 = rsqrt(_2235);
        float _2275 = _2269 * _2265;
        float _2277 = _2275 * 0.15915493667125701904296875;
        float _2279 = _2277 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = _2277 * 6.283185482025146484375;
        float _2285 = sin(_2283);
        float _2287 = _2281 + (-1.0);
        float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2291 = fma(_2285, _2271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2293 = fma(_2247, _2281, _2289);
        float _2295 = _2273 * _2291;
        float _2297 = fma(_2231, _2295, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2299 = fma(_2227, _2295, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2263 = _2293;
        _2253 = _2297;
        _2255 = _2299;
    }
    float _2301 = _2263;
    float _2303 = _2253;
    float _2305 = _2255;
    float _2307 = -_1747;
    float _2309 = _2307 + _2301;
    float _2311 = -_1837;
    float _2313 = _2311 + _2303;
    float _2315 = -_1843;
    float _2317 = _2315 + _2305;
    float _2319 = _2309 * _2309;
    float _2321 = fma(_2313, _2313, _2319);
    float _2323 = fma(_2317, _2317, _2321);
    float _2325 = sqrt(_2323);
    bool _2327 = _2325 > 0.0;
    bool _2329 = !_2327;
    float _2331 = _2325;
    float _2333 = _2317;
    float _2335 = _2305;
    float _2337 = _2301;
    float _2339 = _2303;
    float _2341 = _2323;
    if (!_2329)
    {
        bool _2343 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2345 = _2227;
        if (_2343)
        {
            float _2347 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2345 = _2347;
        }
        float _2349 = _2345;
        float _2351 = _2349;
        if (_2343)
        {
            float _2353 = _425 * _2349;
            _2257 = _2353;
        }
        float _2355 = _2257;
        float _2357 = _2355;
        if (_2343)
        {
            float _2359 = _427 * _2349;
            _2331 = _2359;
        }
        float _2361 = _2331;
        float _2363 = _2361;
        if (_2343)
        {
            float _2365 = _429 * _2349;
            _2351 = _2365;
        }
        float _2367 = _2351;
        float _2369 = _2367;
        if (!_2343)
        {
            float _2371 = _105 + 1.0;
            float _2373 = _2371;
            if (!_139)
            {
                float _2375 = _2371 * _2371;
                float _2377 = _2375 * 0.5;
                _433 = _2377;
            }
            float _2379 = _433;
            float _2381 = _2379;
            if (!_139)
            {
                float _2383 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2381 = _2383;
            }
            float _2385 = _2381;
            bool _2387 = !_139;
            float _2389 = _2385;
            if (!_2387)
            {
                float _2391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2393 = log2(_2391);
                float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2397 = 1.0 + _2395;
                float _2399 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2401 = _2393 * _2371;
                float _2403 = 1.0 / _2397;
                float _2405 = _2399 * 0.693147182464599609375;
                float _2407 = exp2(_2401);
                float _2409 = 1.0 / _2405;
                float _2411 = _2407 + (-1.0);
                float _2413 = -_2411;
                float _2415 = fma(_2413, _2409, _2371);
                float _2417 = _2415 * _2403;
                float _2419 = _2417 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2389 = _2419;
            }
            float _2421 = _2389;
            float _2423 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2425 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2427 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2429 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2431 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2433 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2435 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2429);
            float _2437 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2431);
            float _2439 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2435);
            bool _2441 = !_139;
            if (!_2441)
            {
                float _2443 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2445 = log2(_2443);
                float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2449 = 1.0 + _2447;
                float _2451 = 1.0 / _2449;
                float _2453 = _2445 * _2371;
                float _2455 = exp2(_2453);
                float _2457 = -_2455;
                float _2459 = _2457 + 1.0;
                float _2461 = _2459 * _2451;
                _2373 = _2461;
            }
            float _2463 = _2373;
            float _2465 = fma(_2425, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2433);
            float _2467 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2437);
            float _2469 = fma(_2463, _143, _2439);
            float _2471 = fma(_2427, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2465);
            float _2473 = fma(_2463, _141, _2467);
            float _2475 = -_387;
            float _2477 = _2475 + _2469;
            float _2479 = fma(_2463, _145, _2471);
            float _2481 = -_389;
            float _2483 = _2481 + _2473;
            float _2485 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2487 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2489 = _2477 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2491 = -_401;
            float _2493 = _2491 + _2479;
            float _2495 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2485);
            float _2497 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2487);
            float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2489);
            float _2501 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2495);
            float _2503 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2497);
            float _2505 = fma(_2493, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2499);
            _435 = _2503;
            _437 = _2501;
            _439 = _2505;
            _2357 = _2501;
            _2363 = _2503;
            _2369 = _2505;
        }
        float _2507 = _435;
        float _2509 = _437;
        float _2511 = _439;
        float _2513 = _2357;
        float _2515 = _2363;
        float _2517 = _2369;
        float _2519 = _2507 * _2507;
        float _2521 = rsqrt(_2323);
        float _2523 = fma(_2509, _2509, _2519);
        float _2525 = fma(_2511, _2511, _2523);
        float _2527 = sqrt(_2525);
        float _2529 = _2313 * _2521;
        float _2531 = _2309 * _2521;
        float _2533 = _2317 * _2521;
        bool _2535 = _2527 > 0.0;
        bool _2537 = !_2535;
        _2333 = _2533;
        if (!_2537)
        {
            float _2539 = rsqrt(_2525);
            float _2541 = _2539 * _2507;
            float _2543 = _2539 * _2509;
            float _2545 = _2539 * _2511;
            float _2547 = _2531 * _2541;
            float _2549 = fma(_2529, _2543, _2547);
            float _2551 = fma(_2533, _2545, _2549);
            float _2553 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2555 = fma(_2513, _2553, _2303);
            float _2557 = fma(_2515, _2553, _2301);
            float _2559 = fma(_2517, _2553, _2305);
            _2335 = _2559;
            _2337 = _2557;
            _2339 = _2555;
        }
    }
    float _2561 = _2333;
    float _2563 = _2335;
    float _2565 = _2337;
    float _2567 = _2339;
    float _2569 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2571 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2573 = isnan(0.5);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2579 = _2575 || _2577;
    bool _2581 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2583 = isnan(0.5);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2589 = _2585 || _2587;
    float _2591 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2569);
    float _2593 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2595 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2591);
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2599 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2593);
    float _2601 = _2561;
    float _2603 = _2593;
    float _2605 = _2565;
    if (!_2579)
    {
        _2601 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2607 = _2601;
    float _2609 = 1.0 / _2597;
    float _2611 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2599);
    float _2613 = _2607;
    if (!_2579)
    {
        _2341 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2615 = _2341;
    if (!_2579)
    {
        float _2617 = -_2607;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2603 = _2619;
    }
    float _2621 = _2603;
    float _2623 = _2611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2625 = _2623 + _2597;
    float _2627 = _2621;
    if (!_2579)
    {
        float _2629 = 1.0 / _2621;
        _2627 = _2629;
    }
    float _2631 = _2627;
    float _2633 = -_2013;
    float _2635 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2563);
    float _2637 = _2625 * _2609;
    float _2639 = _2637 * 0.5;
    float _2641 = -_1965;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2565);
    float _2645 = _2643;
    float _2647 = _2635;
    if (!_2579)
    {
        float _2649 = -_2615;
        float _2651 = _2649 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1995 = _2651;
    }
    float _2653 = _1995;
    float _2655 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2657 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2655);
    float _2659 = -_1971;
    float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2567);
    float _2663 = 1.0 / _2657;
    float _2665 = _2661;
    float _2667 = _2631;
    if (!_2589)
    {
        float _2669 = _2043 * _2043;
        float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2673 = -_1843;
        float _2675 = _2673 + _2563;
        float _2677 = -_1837;
        float _2679 = _2677 + _2567;
        float _2681 = fma(_2053, _2053, _2669);
        float _2683 = -_1747;
        float _2685 = _2683 + _2565;
        float _2687 = fma(_2065, _2065, _2681);
        float _2689 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2691 = sqrt(_2687);
        float _2693 = 1.0 / _2121;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2697 = precise::min(_2691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2699 = _2697 * _2671;
        float _2701 = _2699 * _2693;
        float _2703 = _2695 * _2701;
        float _2705 = _2675 * _2701;
        float _2707 = fma(_2679, _2703, _2035);
        float _2709 = fma(_2685, _2703, _2031);
        float _2711 = fma(_2695, _2705, _2049);
        _2645 = _2709;
        _2105 = _2691;
        _2665 = _2707;
        _2647 = _2711;
        _2605 = _2685;
    }
    float _2713 = _2645;
    float _2715 = _2105;
    float _2717 = _2665;
    float _2719 = _2647;
    float _2721 = _2605;
    float _2723 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2725 = _2715;
    float _2727 = _2721;
    if (!_2579)
    {
        float _2729 = 1.0 / _2653;
        _2725 = _2729;
    }
    float _2731 = _2725;
    float _2733 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2735 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2737 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2723);
    float _2739 = _2713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2741 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2733);
    float _2743 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2735);
    float _2745 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2737);
    float _2747 = _2739;
    if (!_2579)
    {
        float _2749 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2751 = -_2615;
        float _2753 = fma(_2663, _2749, _2751);
        _2727 = _2753;
    }
    float _2755 = _2727;
    float _2757 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2741);
    float _2759 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2739);
    float _2761 = _2745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_2579)
    {
        float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2765 = -_2607;
        float _2767 = fma(_2663, _2763, _2765);
        _2107 = _2767;
    }
    float _2769 = _2107;
    float _2771 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2743);
    float _2773 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2775 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2777 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    if (!_2579)
    {
        float _2779 = _2755 * _2731;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        _2613 = _2781;
    }
    float _2783 = _2613;
    if (_2579)
    {
        _2747 = 1.0;
    }
    float _2785 = _2747;
    float _2787 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2789 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2759);
    float _2791 = _2785;
    if (!_2579)
    {
        float _2793 = _2769 * _2631;
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        _2791 = _2795;
    }
    float _2797 = _2791;
    float _2799 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2801 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2775);
    float _2803 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    if (_2579)
    {
        _2667 = 1.0;
    }
    float _2805 = _2667;
    float _2807 = _2761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2809 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2787);
    float _2811 = _2805;
    if (!_2579)
    {
        float _2813 = -_2783;
        float _2815 = _2813 + 1.0;
        _2811 = _2815;
    }
    float _2817 = _2811;
    float _2819 = _2789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2821 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2801);
    float _2823 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2803);
    bool _2825 = _2797 > 0.0;
    bool _2827 = isnan(_2797);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(0.0);
    bool _2833 = _2829 || _2831;
    float _2835 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2807);
    float _2837 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2809);
    float _2839 = _2797 * _2817;
    float _2841 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2821);
    float _2843 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2823);
    bool _2845 = _2817 <= 0.0;
    bool _2847 = !_2833;
    bool _2849 = _2845 || _2847;
    float _2851 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2835);
    float _2853 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2837);
    float _2855 = _2841 + _2843;
    float _2857 = _2839 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2859 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2851);
    float _2861 = _2855 * 0.5;
    float _2863 = _2857 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2853;
    out.gl_Position.y = _2859;
    out.gl_Position.z = _2841;
    out.gl_Position.w = _2843;
    out.m_52.z = _2861;
    out.m_52.w = _2843;
    out.m_33.x = _2863;
    if (!_2849)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2865;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

