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
    float4 m_43 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_45 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_41 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1759 = false;
    bool _929 = false;
    bool _827 = false;
    bool _599 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2140 = as_type<float>(_89);
        out.gl_Position.z = _2140;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2210 = as_type<float>(_127);
        out.gl_Position.z = _2210;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _133 * _131;
    float _149 = 0.0;
    if (!_145)
    {
        float _151 = _135 * _135;
        float _153 = _151 * 0.5;
        _149 = _153;
    }
    float _155 = _149;
    float _157 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _159 = _155;
    if (!_145)
    {
        float _161 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    float _165 = in.m_37.x;
    float _167 = in.m_37.y;
    float _169 = in.m_37.z;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    float _175 = _171 * 0.15915493667125701904296875;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _175 * 6.283185482025146484375;
    float _183 = cos(_181);
    float _185 = 1.4012984643248170709237295832899e-45;
    float _187 = _163;
    if (!_145)
    {
        _185 = _135;
    }
    float _189 = _185;
    float _191 = -_173;
    float _193 = _157 + _191;
    bool _195 = !_145;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _135 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _135);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _227;
    }
    float _229 = _187;
    bool _231 = !_145;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _135 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _197 = _251;
    }
    float _253 = _197;
    float _255 = in.m_41.w;
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = in.m_32.x;
    float _267 = in.m_32.y;
    float _269 = in.m_32.z;
    float _271 = -_193;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = _193 < 0.5;
    float _277 = float(_275);
    bool _279 = !_259;
    int _281 = _279 ? 0 : 1;
    float _283 = fma(_183, 0.5, 0.5);
    bool _285 = !_179;
    int _287 = _285 ? 0 : 1;
    float _289 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _291 = abs(_281);
    float _293 = -_277;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_253, _165, _289);
    int _303 = abs(_287);
    float _305 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _307 = !_263;
    int _309 = _307 ? 0 : 1;
    float _311 = fma(_253, _167, _305);
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _315 = abs(_309);
    float _317 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _319 = float(_291);
    float _321 = fma(_301, _255, _265);
    float _323 = float(_303);
    float _325 = fma(_253, _169, _317);
    float _327 = abs(_273);
    float _329 = _319 * _327;
    float _331 = fma(_311, _255, _267);
    float _333 = fma(_325, _255, _269);
    float _335 = float(_315);
    float _337 = fma(_323, _299, _329);
    float _339 = abs(_295);
    float _341 = fma(_335, _339, _337);
    bool _343 = !_313;
    float _359;
    if (!_343)
    {
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _347 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_73);
        float _365 = 1.0 / _363;
        float _367 = _107 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _359;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = _369 + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _369 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _369 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _399 = 1.0 / _385;
    bool _401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _403 = 1.0 / _393;
    float _405 = 1.0 / _389;
    float _407 = _377 * _399;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _369 + _409;
    float _413 = 1.0 / _397;
    float _415 = _373 * _403;
    bool _417 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _419 = isnan(_369);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_427;
    float _431 = _429 + 1.0;
    float _433 = _381 * _405;
    bool _435 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _437 = isnan(_369);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    bool _447 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _449 = isnan(_369);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _445 * _431;
    bool _461 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_369);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _411 * _413;
    float _475 = -_445;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    bool _487 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _489 = isnan(_369);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = _457 * _477;
    float _501 = -_457;
    float _503 = _501 + 1.0;
    float _505 = fma(_481, _407, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_485, _407, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = _471 * _503;
    float _515 = -_471;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = fma(_511, _433, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _525 = -_497;
    float _527 = _525 + 1.0;
    float _529 = _497 * _517;
    float _531 = fma(_521, _433, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _537;
    float _541 = _505 * _529;
    float _543 = _507 * _529;
    float _545 = fma(_535, _415, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _547 = fma(_539, _415, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _549 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _541);
    float _551 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = fma(_523, _513, _549);
    float _563 = fma(_531, _513, _551);
    float _565 = fma(_555, _473, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _567 = fma(_559, _473, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_545, _499, _561);
    float _571 = fma(_547, _499, _563);
    float _573 = fma(_565, _459, _569);
    float _575 = fma(_567, _459, _571);
    float _577 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].x, _573);
    float _579 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].y, _575);
    bool _581 = !_401;
    float _597;
    if (!_581)
    {
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _585 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_73);
        float _603 = 1.0 / _601;
        float _605 = _107 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = in.m_41.x;
    float _611 = in.m_41.y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _615 = _607 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _619 = _607 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _623 = _607 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _633;
    float _637 = 1.0 / _627;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _641 = 1.0 / _631;
    float _643 = _579 * _611;
    bool _645 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _647 = isnan(_607);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = 1.0 / _635;
    float _659 = _623 * _637;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _661;
    float _665 = _577 * _609;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _667;
    float _671 = _615 * _641;
    bool _673 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _675 = isnan(_607);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _685;
    bool _689 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _691 = isnan(_607);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_669, _659, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _703 = fma(_663, _659, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _705 = fma(_687, _659, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _707 = _619 * _657;
    float _709 = -_655;
    float _711 = _709 + 1.0;
    bool _713 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _715 = isnan(_607);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _729 = _683 * _711;
    float _731 = -_699;
    float _733 = _731 + 1.0;
    float _735 = -_683;
    float _737 = _735 + 1.0;
    float _739 = fma(_727, _671, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _741 = _723 * _733;
    float _743 = _699 * _737;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _749 = -_723;
    float _751 = _749 + 1.0;
    float _753 = _705 * _741;
    float _755 = _701 * _741;
    float _757 = _703 * _741;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _763 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _755);
    float _765 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _757);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _767;
    float _771 = fma(_761, _671, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _773 = fma(_747, _671, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _753);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _781;
    float _785 = fma(_739, _743, _763);
    float _787 = fma(_769, _707, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _789 = fma(_779, _707, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _791 = fma(_783, _707, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _793 = fma(_771, _743, _765);
    float _795 = fma(_773, _743, _775);
    float _797 = fma(_787, _729, _785);
    float _799 = fma(_789, _729, _793);
    float _801 = fma(_791, _729, _795);
    float _803 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].x, _797);
    float _805 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].y, _799);
    float _807 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].z, _801);
    bool _809 = !_639;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _813 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_73);
        float _831 = 1.0 / _829;
        float _833 = _107 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    bool _837 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = isnan(_835);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _853 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _855 = isnan(_835);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _871 = _835 + _869;
    float _873 = -_847;
    float _875 = _873 + 1.0;
    bool _877 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _879 = 1.0 / _851;
    float _881 = _863 * _875;
    float _883 = -_863;
    float _885 = _883 + 1.0;
    float _887 = _867 * _879;
    float _889 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = fma(_887, _871, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _893 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _891 * _881;
    float _899 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[115].x, _897);
    float _905 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[116].x, _903);
    float _909 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _905;
    out.m_43.y = _901;
    out.m_43.z = _895;
    out.m_43.w = _909;
    bool _911 = !_877;
    float _927;
    if (!_911)
    {
        float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _915 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _919 = _917 * _913;
        float _921 = floor(_919);
        float _923 = -_921;
        float _925 = _919 + _923;
        _927 = _925;
        _929 = true;
    }
    else
    {
        float _931 = float(_73);
        float _933 = 1.0 / _931;
        float _935 = _107 * _933;
        _927 = _935;
    }
    _929 = false;
    float _937 = _927;
    float _939 = in.m_39.z;
    float _941 = _129 * 2.0;
    float _943 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _945 = log2(_943);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = in.m_39.y;
    float _961 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _963 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _965 = floor(_941);
    bool _967 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _969 = isnan(_937);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    bool _979 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _981 = isnan(_937);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = _939 * 2.0;
    bool _993 = _965 > 0.0;
    float _995 = _129 + _959;
    float _997 = _959 + _939;
    float _999 = floor(_991);
    float _1001 = _959 * 2.0;
    float _1003 = _995 + (-1.0);
    float _1005 = _997 + (-1.0);
    bool _1007 = _965 >= 0.0;
    bool _1009 = isnan(_965);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan(0.0);
    bool _1015 = _1011 || _1013;
    float _1017 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1021 = floor(_1001);
    bool _1023 = !_953;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = abs(_1025);
    bool _1029 = _999 > 0.0;
    bool _1031 = _999 >= 0.0;
    bool _1033 = isnan(_999);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan(0.0);
    bool _1039 = _1035 || _1037;
    float _1041 = _945 * _107;
    int _1043 = _1015 ? 0 : 1;
    int _1045 = _1039 ? 0 : 1;
    int _1047 = ~_1043;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = exp2(_1041);
    int _1055 = ~_1045;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1051;
    int _1063 = _1059;
    if (!_993)
    {
        int _1065 = ~_1043;
        int _1067 = _1065 + 1;
        _1061 = _1067;
    }
    int _1069 = _1061;
    if (!_1029)
    {
        int _1071 = ~_1045;
        int _1073 = _1071 + 1;
        _1063 = _1073;
    }
    int _1075 = _1063;
    float _1077 = in.m_45.x;
    float _1079 = in.m_45.y;
    float _1081 = in.m_45.z;
    bool _1083 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1085 = isnan(1.0);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1091 = _1087 || _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1095 = 1.0 + _1093;
    bool _1097 = _1021 > 0.0;
    float _1099 = float(_1027);
    float _1101 = 1.0 / _1095;
    float _1103 = float(_1069);
    bool _1105 = _1021 >= 0.0;
    bool _1107 = isnan(_1021);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.0);
    bool _1113 = _1109 || _1111;
    float _1115 = -_1053;
    float _1117 = _1115 + 1.0;
    bool _1119 = !_949;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1099 * _1103;
    bool _1125 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1133 = _1129 || _1131;
    int _1135 = abs(_1121);
    float _1137 = _1123 * (-2.0);
    int _1139 = _1113 ? 0 : 1;
    float _1141 = as_type<float>(int(gl_VertexIndex));
    float _1143 = _1133 ? _1117 : 0.0;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1145;
    float _1149 = float(_1135);
    float _1151 = float(_1075);
    if (_1091)
    {
        float _1153 = _1143 * _1101;
        _109 = _1153;
    }
    float _1155 = _109;
    int _1157 = ~_1139;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = fma(_1137, _1079, _1079);
    int _1165 = _1161;
    if (!_1097)
    {
        int _1167 = ~_1139;
        int _1169 = _1167 + 1;
        _1165 = _1169;
    }
    int _1171 = _1165;
    float _1173 = fma(_1019, _1137, _1019);
    float _1175 = _959 + (-0.5);
    float _1177 = _1149 * _1151;
    bool _1179 = !_957;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1163);
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1189;
    int _1193 = abs(_1181);
    float _1195 = _1177 * (-2.0);
    float _1197 = fma(_1173, _1155, _1187);
    float _1199 = 1.0 / _1185;
    float _1201 = fma(_1017, _1195, _1017);
    float _1203 = fma(_1195, _1077, _1077);
    float _1205 = _129 + (-0.5);
    float _1207 = float(_1171);
    float _1209 = _1197 * 0.15915493667125701904296875;
    bool _1211 = _129 > 0.5;
    float _1213 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1203);
    float _1215 = float(_1193);
    float _1217 = _129 + _939;
    float _1219 = _939 + (-0.5);
    float _1221 = fma(_1201, _1155, _1213);
    float _1223 = _1215 * _1207;
    float _1225 = _1217 + (-1.0);
    float _1227 = 1.0 / _1147;
    int _1229 = as_type<int>(_1141) & 1;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>(_1141) & 2;
    bool _1235 = _1233 != 0;
    float _1237 = _1223 * (-2.0);
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1241 = _959 > 0.5;
    float _1243 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1245 = fma(_1237, _1081, _1081);
    float _1247 = fma(_1239, _1237, _1239);
    float _1249 = _1221 * 0.15915493667125701904296875;
    float _1251 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1245);
    float _1253 = 1.0 / _1191;
    float _1255 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1243);
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1259 = _1257 != 0;
    float _1261 = fma(_1247, _1155, _1251);
    float _1263 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1265 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1269 = _1267 != 0;
    float _1271 = _1261 * 0.15915493667125701904296875;
    float _1273 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1263);
    float _1275 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1265);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1279 = _937 + _1277;
    float _1281 = _1209 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1273);
    float _1287 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1255);
    float _1289 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1275);
    float _1291 = _1279 * _1227;
    bool _1293 = !_1235;
    float _1295 = _1293 ? (-0.5) : 0.5;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1299 = _937 + _1297;
    bool _1301 = !_1231;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = _1209 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1311 = _937 + _1309;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1315 = _1299 * _1199;
    float _1317 = _1311 * _1253;
    float _1319 = _961 * _1313;
    float _1321 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1323 = _1249 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = -_1295;
    int _1329 = _1241 ? as_type<int>(_1327) : as_type<int>(_1295);
    bool _1331 = !_1269;
    float _1333 = _1331 ? _1295 : as_type<float>(_1329);
    float _1335 = _1249 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    float _1339 = _1271 * 6.283185482025146484375;
    float _1341 = cos(_1339);
    float _1343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1345 = _1325 * _1283;
    float _1347 = _1325 * _1307;
    float _1349 = _963 * _1343;
    float _1351 = _1271 * 6.283185482025146484375;
    float _1353 = sin(_1351);
    float _1355 = _1337 * _1283;
    float _1357 = _1337 * _1307;
    float _1359 = _1307 * _1341;
    float _1361 = _1283 * _1341;
    float _1363 = _1341 * _1319;
    float _1365 = _1337 * _1363;
    float _1367 = _1325 * _1363;
    float _1369 = -_1355;
    float _1371 = fma(_1353, _1347, _1369);
    float _1373 = -_1347;
    float _1375 = fma(_1353, _1355, _1373);
    float _1377 = fma(_1353, _1357, _1345);
    float _1379 = -_1319;
    float _1381 = _1353 * _1379;
    float _1383 = fma(_1353, _1345, _1357);
    float _1385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1387 = fma(_1377, _1349, _1365);
    float _1389 = fma(_1359, _1349, _1381);
    float _1391 = fma(_1371, _1349, _1367);
    float _1393 = fma(_1375, _1385, _1387);
    float _1395 = fma(_1361, _1385, _1389);
    float _1397 = fma(_1383, _1385, _1391);
    float _1399 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1411 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1413 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1401);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1423 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1411);
    float _1425 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1413);
    float _1427 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1429 = _1289 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1431 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1435;
    bool _1439 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1441 = isnan(_937);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1447 = _1443 || _1445;
    float _1449 = float(_1447);
    float _1451 = _1427 + _1431;
    float _1453 = _1429 + _1433;
    float _1455 = fma(_1437, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1457 = fma(_1405, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1451 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1453 + _1463;
    float _1467 = fma(_1417, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1473 = _1461 * _1461;
    float _1475 = _1465 * _1465;
    float _1477 = -_1449;
    float _1479 = _1477 + 1.0;
    float _1481 = fma(_1471, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1483 = fma(_1409, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1485 = _1473 + _1475;
    float _1487 = fma(_1421, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1489 = _977 * _1479;
    float _1491 = sqrt(_1485);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1493;
    float _1497 = -_977;
    float _1499 = _1497 + 1.0;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1501;
    float _1505 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1507;
    float _1511 = fma(_1495, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1513 = fma(_1503, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1515 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1505);
    float _1517 = fma(_1509, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1519 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1521 = isnan(_937);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = _989 * _1499;
    float _1533 = -_989;
    float _1535 = _1533 + 1.0;
    float _1537 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1515);
    float _1539 = -_1303;
    int _1541 = _1211 ? as_type<int>(_1539) : as_type<int>(_1303);
    float _1543 = _1529 * _1535;
    bool _1545 = _1491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1547 = -_1529;
    float _1549 = _1547 + 1.0;
    bool _1551 = !_1259;
    float _1553 = _1551 ? _1303 : as_type<float>(_1541);
    float _1555 = _1455 * _1543;
    float _1557 = _1457 * _1543;
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1563 = _1467 * _1543;
    float _1565 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1555);
    float _1567 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1557);
    float _1569 = _1321 + _1561;
    float _1571 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1563);
    float _1573 = fma(_1481, _1531, _1565);
    float _1575 = _1549;
    float _1577 = _1561;
    float _1579 = _1563;
    float _1581 = _1473;
    float _1583 = _1475;
    float _1585 = _1449;
    float _1587 = _1321;
    if (!_1545)
    {
        _1575 = _1451;
    }
    float _1589 = _1575;
    float _1591 = _1589;
    if (!_1545)
    {
        _1577 = _1453;
    }
    float _1593 = _1577;
    float _1595 = _1593;
    if (!_1545)
    {
        _1579 = _1569;
    }
    float _1597 = _1579;
    bool _1599 = !_1545;
    float _1601 = _1597;
    if (!_1599)
    {
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1607 = _1491 + _1605;
        float _1609 = rsqrt(_1485);
        float _1611 = _1607 * _1603;
        float _1613 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1615 = _1611 * 0.15915493667125701904296875;
        float _1617 = _1615 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        float _1621 = _1615 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = fma(_1619, _1613, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1627 = _1609 * _1625;
        float _1629 = fma(_1461, _1627, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1631 = _1623 + (-1.0);
        float _1633 = fma(_1465, _1627, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1637 = _1629 + _1635;
        float _1639 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1643 = _1633 + _1641;
        float _1645 = _1637 * _1637;
        float _1647 = fma(_1569, _1623, _1639);
        float _1649 = _1643 * _1643;
        _1601 = _1647;
        _1581 = _1645;
        _1583 = _1649;
        _1591 = _1629;
        _1595 = _1633;
    }
    float _1651 = _1601;
    float _1653 = _1581;
    float _1655 = _1583;
    float _1657 = _1591;
    float _1659 = _1595;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_1483, _1531, _1567);
    float _1667 = fma(_1487, _1531, _1571);
    float _1669 = fma(_1511, _1489, _1573);
    float _1671 = fma(_1663, _1663, _1653);
    float _1673 = fma(_1513, _1489, _1665);
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1677 = fma(_1517, _1489, _1667);
    float _1679 = _1671 + _1655;
    float _1681 = _1553 + 0.5;
    float _1683 = -_1333;
    float _1685 = _1683 + 0.5;
    float _1687 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1669);
    float _1689 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1673);
    float _1691 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1677);
    float _1693 = sqrt(_1679);
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1701 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1703 = _1691 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1705 = _1695 * _1559;
    float _1707 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1697 * _1675;
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1705;
    out.m_50.y = _1709;
    bool _1715 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1717 = isnan(_1693);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1723 = _1719 || _1721;
    out.m_52.x = _1707;
    out.m_52.y = _1711;
    out.m_52.z = _1713;
    if (!_1723)
    {
        _1585 = 1.0;
    }
    float _1725 = _1585;
    bool _1727 = !_1723;
    float _1729 = _1725;
    if (!_1727)
    {
        bool _1731 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1733 = isnan(_1693);
        bool _1735 = _1731 || _1733;
        bool _1737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1739 = _1735 || _1737;
        if (!_1739)
        {
            float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1743 = _1693 + _1741;
            float _1745 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1747 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1745;
            float _1749 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1751 = _1749 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1753 = 1.0 / _1747;
            float _1755 = _1743 * _1753;
            float _1757 = fma(_1755, _1751, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1729 = _1757;
            _1759 = true;
        }
        else
        {
            bool _1761 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1763 = isnan(_1693);
            bool _1765 = _1761 || _1763;
            bool _1767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1769 = _1765 || _1767;
            if (!_1769)
            {
                float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1773 = _1693 + _1771;
                float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1777 = _1775 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1781 = _1779 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1783 = 1.0 / _1777;
                float _1785 = _1773 * _1783;
                float _1787 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1729 = _1787;
                _1759 = true;
            }
            else
            {
                _1729 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1759 = false;
    float _1789 = _1729;
    float _1791 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1795 = _1657 + _1793;
    float _1797 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1791);
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.5);
    bool _1819 = _1815 || _1817;
    float _1821 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1797);
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1825 = _1659 + _1823;
    float _1827 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1809);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1833 = _1651 + _1831;
    float _1835 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1827);
    float _1837 = fma(_1795, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1839 = 1.0 / _1829;
    float _1841 = fma(_1833, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1843 = fma(_1825, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1845 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1847 = _1809;
    float _1849 = _1833;
    float _1851 = _1789;
    if (_1807)
    {
        _1847 = _1837;
    }
    float _1853 = _1847;
    float _1855 = _1853;
    if (_1807)
    {
        _1849 = _1841;
    }
    float _1857 = _1849;
    float _1859 = _1845 + _1829;
    float _1861 = _1857;
    if (_1807)
    {
        _1851 = _1843;
    }
    float _1863 = _1851;
    float _1865 = _1863;
    if (!_1807)
    {
        float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1869 = _1321 + _1867;
        float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1873 = _1427 + _1871;
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1877 = _1869 * _1869;
        float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1881 = _1429 + _1879;
        float _1883 = fma(_1873, _1873, _1877);
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1887 = fma(_1881, _1881, _1883);
        float _1889 = sqrt(_1887);
        float _1891 = _1875 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1893 = precise::min(_1889, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1895 = _1893 * _1885;
        float _1897 = -_1427;
        float _1899 = _1897 + _1837;
        float _1901 = -_1429;
        float _1903 = _1901 + _1843;
        float _1905 = _1891 * _1895;
        float _1907 = -_1321;
        float _1909 = _1907 + _1841;
        float _1911 = fma(_1899, _1905, _1427);
        float _1913 = fma(_1909, _1905, _1321);
        float _1915 = fma(_1903, _1905, _1429);
        _1861 = _1913;
        _1855 = _1911;
        _1865 = _1915;
    }
    float _1917 = _1861;
    float _1919 = _1855;
    float _1921 = _1865;
    float _1923 = _1859 * _1839;
    float _1925 = _1923 * 0.5;
    float _1927 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1929 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1933 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1935 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    float _1937 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1929);
    float _1939 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1931);
    float _1941 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1933);
    if (_1819)
    {
        _1587 = 1.0;
    }
    float _1943 = _1587;
    float _1945 = _1943;
    if (!_1819)
    {
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1951 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
        float _1953 = _1947 * 0.15915493667125701904296875;
        float _1955 = _1953 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1953 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = 1.0 / _1957;
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1951;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = _1971 * _1973;
        float _1983 = _1961 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = 1.0 / _1981;
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1991 = _1975 * _1989;
        float _1993 = 1.0 / _1979;
        float _1995 = _1985 * _1987;
        float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1999 = fma(_1995, _1991, _1997);
        float _2001 = _1999 * _1993;
        float _2003 = precise::clamp(_2001, 0.0, 1.0);
        _1945 = _2003;
    }
    float _2005 = _1945;
    float _2007 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1937);
    float _2009 = _2005 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2011 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    float _2013 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    float _2015 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2017 = _341 * _2009;
    float _2019 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    bool _2021 = _2005 > 0.0;
    bool _2023 = isnan(_2005);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(0.0);
    bool _2029 = _2025 || _2027;
    float _2031 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2033 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2035 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2037 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2039 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2041 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2033);
    float _2045 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2035);
    float _2047 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2037);
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2039);
    float _2051 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2043);
    float _2055 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2045);
    float _2057 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2049);
    float _2059 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2047);
    float _2061 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2053);
    float _2063 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2065 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2057);
    float _2067 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2059);
    float _2069 = _2017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2071 = _2063 + _2065;
    float _2073 = _2067 + _2065;
    float _2075 = _2065 * 0.5;
    float _2077 = _2071 * 0.5;
    float _2079 = _2073 * 0.5;
    float _2081 = fma(_2061, -0.5, _2075);
    out.m_35.x = _2069;
    out.gl_Position.x = _2063;
    out.gl_Position.y = _2061;
    out.gl_Position.z = _2067;
    out.gl_Position.w = _2065;
    out.m_54.x = _2077;
    out.m_54.y = _2081;
    out.m_54.z = _2079;
    out.m_54.w = _2065;
    if (_2029)
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1759 = false;
    bool _929 = false;
    bool _827 = false;
    bool _599 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2140 = as_type<float>(_89);
        out.gl_Position.z = _2140;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2210 = as_type<float>(_127);
        out.gl_Position.z = _2210;
    }
    if (_119)
    {
        return out;
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _133 * _131;
    float _149 = 0.0;
    if (!_145)
    {
        float _151 = _135 * _135;
        float _153 = _151 * 0.5;
        _149 = _153;
    }
    float _155 = _149;
    float _157 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _159 = _155;
    if (!_145)
    {
        float _161 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    float _165 = in.m_37.x;
    float _167 = in.m_37.y;
    float _169 = in.m_37.z;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    float _175 = _171 * 0.15915493667125701904296875;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _175 * 6.283185482025146484375;
    float _183 = cos(_181);
    float _185 = 1.4012984643248170709237295832899e-45;
    float _187 = _163;
    if (!_145)
    {
        _185 = _135;
    }
    float _189 = _185;
    float _191 = -_173;
    float _193 = _157 + _191;
    bool _195 = !_145;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _135 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _135);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _227;
    }
    float _229 = _187;
    bool _231 = !_145;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _135 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _197 = _251;
    }
    float _253 = _197;
    float _255 = in.m_41.w;
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = in.m_32.x;
    float _267 = in.m_32.y;
    float _269 = in.m_32.z;
    float _271 = -_193;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = _193 < 0.5;
    float _277 = float(_275);
    bool _279 = !_259;
    int _281 = _279 ? 0 : 1;
    float _283 = fma(_183, 0.5, 0.5);
    bool _285 = !_179;
    int _287 = _285 ? 0 : 1;
    float _289 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _291 = abs(_281);
    float _293 = -_277;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_253, _165, _289);
    int _303 = abs(_287);
    float _305 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _307 = !_263;
    int _309 = _307 ? 0 : 1;
    float _311 = fma(_253, _167, _305);
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _315 = abs(_309);
    float _317 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _319 = float(_291);
    float _321 = fma(_301, _255, _265);
    float _323 = float(_303);
    float _325 = fma(_253, _169, _317);
    float _327 = abs(_273);
    float _329 = _319 * _327;
    float _331 = fma(_311, _255, _267);
    float _333 = fma(_325, _255, _269);
    float _335 = float(_315);
    float _337 = fma(_323, _299, _329);
    float _339 = abs(_295);
    float _341 = fma(_335, _339, _337);
    bool _343 = !_313;
    float _359;
    if (!_343)
    {
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _347 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_73);
        float _365 = 1.0 / _363;
        float _367 = _107 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _359;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = _369 + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _369 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _369 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _399 = 1.0 / _385;
    bool _401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _403 = 1.0 / _393;
    float _405 = 1.0 / _389;
    float _407 = _377 * _399;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _369 + _409;
    float _413 = 1.0 / _397;
    float _415 = _373 * _403;
    bool _417 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _419 = isnan(_369);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_427;
    float _431 = _429 + 1.0;
    float _433 = _381 * _405;
    bool _435 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _437 = isnan(_369);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    bool _447 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _449 = isnan(_369);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _445 * _431;
    bool _461 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_369);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _411 * _413;
    float _475 = -_445;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    bool _487 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _489 = isnan(_369);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = _457 * _477;
    float _501 = -_457;
    float _503 = _501 + 1.0;
    float _505 = fma(_481, _407, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_485, _407, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = _471 * _503;
    float _515 = -_471;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = fma(_511, _433, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _525 = -_497;
    float _527 = _525 + 1.0;
    float _529 = _497 * _517;
    float _531 = fma(_521, _433, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _537;
    float _541 = _505 * _529;
    float _543 = _507 * _529;
    float _545 = fma(_535, _415, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _547 = fma(_539, _415, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _549 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _541);
    float _551 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = fma(_523, _513, _549);
    float _563 = fma(_531, _513, _551);
    float _565 = fma(_555, _473, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _567 = fma(_559, _473, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_545, _499, _561);
    float _571 = fma(_547, _499, _563);
    float _573 = fma(_565, _459, _569);
    float _575 = fma(_567, _459, _571);
    float _577 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].x, _573);
    float _579 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].y, _575);
    bool _581 = !_401;
    float _597;
    if (!_581)
    {
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _585 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_73);
        float _603 = 1.0 / _601;
        float _605 = _107 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = in.m_41.x;
    float _611 = in.m_41.y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _615 = _607 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _619 = _607 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _623 = _607 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _633;
    float _637 = 1.0 / _627;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _641 = 1.0 / _631;
    float _643 = _579 * _611;
    bool _645 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _647 = isnan(_607);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = 1.0 / _635;
    float _659 = _623 * _637;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _661;
    float _665 = _577 * _609;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _667;
    float _671 = _615 * _641;
    bool _673 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _675 = isnan(_607);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _685;
    bool _689 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _691 = isnan(_607);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_669, _659, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _703 = fma(_663, _659, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _705 = fma(_687, _659, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _707 = _619 * _657;
    float _709 = -_655;
    float _711 = _709 + 1.0;
    bool _713 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _715 = isnan(_607);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _729 = _683 * _711;
    float _731 = -_699;
    float _733 = _731 + 1.0;
    float _735 = -_683;
    float _737 = _735 + 1.0;
    float _739 = fma(_727, _671, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _741 = _723 * _733;
    float _743 = _699 * _737;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _749 = -_723;
    float _751 = _749 + 1.0;
    float _753 = _705 * _741;
    float _755 = _701 * _741;
    float _757 = _703 * _741;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _763 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _755);
    float _765 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _757);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _767;
    float _771 = fma(_761, _671, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _773 = fma(_747, _671, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _753);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _781;
    float _785 = fma(_739, _743, _763);
    float _787 = fma(_769, _707, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _789 = fma(_779, _707, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _791 = fma(_783, _707, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _793 = fma(_771, _743, _765);
    float _795 = fma(_773, _743, _775);
    float _797 = fma(_787, _729, _785);
    float _799 = fma(_789, _729, _793);
    float _801 = fma(_791, _729, _795);
    float _803 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].x, _797);
    float _805 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].y, _799);
    float _807 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].z, _801);
    bool _809 = !_639;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _813 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_73);
        float _831 = 1.0 / _829;
        float _833 = _107 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    bool _837 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = isnan(_835);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _853 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _855 = isnan(_835);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _871 = _835 + _869;
    float _873 = -_847;
    float _875 = _873 + 1.0;
    bool _877 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _879 = 1.0 / _851;
    float _881 = _863 * _875;
    float _883 = -_863;
    float _885 = _883 + 1.0;
    float _887 = _867 * _879;
    float _889 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = fma(_887, _871, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _893 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _891 * _881;
    float _899 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[115].x, _897);
    float _905 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[116].x, _903);
    float _909 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _905;
    out.m_43.y = _901;
    out.m_43.z = _895;
    out.m_43.w = _909;
    bool _911 = !_877;
    float _927;
    if (!_911)
    {
        float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _915 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _919 = _917 * _913;
        float _921 = floor(_919);
        float _923 = -_921;
        float _925 = _919 + _923;
        _927 = _925;
        _929 = true;
    }
    else
    {
        float _931 = float(_73);
        float _933 = 1.0 / _931;
        float _935 = _107 * _933;
        _927 = _935;
    }
    _929 = false;
    float _937 = _927;
    float _939 = in.m_39.z;
    float _941 = _129 * 2.0;
    float _943 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _945 = log2(_943);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = in.m_39.y;
    float _961 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _963 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _965 = floor(_941);
    bool _967 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _969 = isnan(_937);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    bool _979 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _981 = isnan(_937);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = _939 * 2.0;
    bool _993 = _965 > 0.0;
    float _995 = _129 + _959;
    float _997 = _959 + _939;
    float _999 = floor(_991);
    float _1001 = _959 * 2.0;
    float _1003 = _995 + (-1.0);
    float _1005 = _997 + (-1.0);
    bool _1007 = _965 >= 0.0;
    bool _1009 = isnan(_965);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan(0.0);
    bool _1015 = _1011 || _1013;
    float _1017 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1021 = floor(_1001);
    bool _1023 = !_953;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = abs(_1025);
    bool _1029 = _999 > 0.0;
    bool _1031 = _999 >= 0.0;
    bool _1033 = isnan(_999);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan(0.0);
    bool _1039 = _1035 || _1037;
    float _1041 = _945 * _107;
    int _1043 = _1015 ? 0 : 1;
    int _1045 = _1039 ? 0 : 1;
    int _1047 = ~_1043;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = exp2(_1041);
    int _1055 = ~_1045;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1051;
    int _1063 = _1059;
    if (!_993)
    {
        int _1065 = ~_1043;
        int _1067 = _1065 + 1;
        _1061 = _1067;
    }
    int _1069 = _1061;
    if (!_1029)
    {
        int _1071 = ~_1045;
        int _1073 = _1071 + 1;
        _1063 = _1073;
    }
    int _1075 = _1063;
    float _1077 = in.m_45.x;
    float _1079 = in.m_45.y;
    float _1081 = in.m_45.z;
    bool _1083 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1085 = isnan(1.0);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1091 = _1087 || _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1095 = 1.0 + _1093;
    bool _1097 = _1021 > 0.0;
    float _1099 = float(_1027);
    float _1101 = 1.0 / _1095;
    float _1103 = float(_1069);
    bool _1105 = _1021 >= 0.0;
    bool _1107 = isnan(_1021);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.0);
    bool _1113 = _1109 || _1111;
    float _1115 = -_1053;
    float _1117 = _1115 + 1.0;
    bool _1119 = !_949;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1099 * _1103;
    bool _1125 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1133 = _1129 || _1131;
    int _1135 = abs(_1121);
    float _1137 = _1123 * (-2.0);
    int _1139 = _1113 ? 0 : 1;
    float _1141 = as_type<float>(int(gl_VertexIndex));
    float _1143 = _1133 ? _1117 : 0.0;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1145;
    float _1149 = float(_1135);
    float _1151 = float(_1075);
    if (_1091)
    {
        float _1153 = _1143 * _1101;
        _109 = _1153;
    }
    float _1155 = _109;
    int _1157 = ~_1139;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = fma(_1137, _1079, _1079);
    int _1165 = _1161;
    if (!_1097)
    {
        int _1167 = ~_1139;
        int _1169 = _1167 + 1;
        _1165 = _1169;
    }
    int _1171 = _1165;
    float _1173 = fma(_1019, _1137, _1019);
    float _1175 = _959 + (-0.5);
    float _1177 = _1149 * _1151;
    bool _1179 = !_957;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1163);
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1189;
    int _1193 = abs(_1181);
    float _1195 = _1177 * (-2.0);
    float _1197 = fma(_1173, _1155, _1187);
    float _1199 = 1.0 / _1185;
    float _1201 = fma(_1017, _1195, _1017);
    float _1203 = fma(_1195, _1077, _1077);
    float _1205 = _129 + (-0.5);
    float _1207 = float(_1171);
    float _1209 = _1197 * 0.15915493667125701904296875;
    bool _1211 = _129 > 0.5;
    float _1213 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1203);
    float _1215 = float(_1193);
    float _1217 = _129 + _939;
    float _1219 = _939 + (-0.5);
    float _1221 = fma(_1201, _1155, _1213);
    float _1223 = _1215 * _1207;
    float _1225 = _1217 + (-1.0);
    float _1227 = 1.0 / _1147;
    int _1229 = as_type<int>(_1141) & 1;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>(_1141) & 2;
    bool _1235 = _1233 != 0;
    float _1237 = _1223 * (-2.0);
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1241 = _959 > 0.5;
    float _1243 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1245 = fma(_1237, _1081, _1081);
    float _1247 = fma(_1239, _1237, _1239);
    float _1249 = _1221 * 0.15915493667125701904296875;
    float _1251 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1245);
    float _1253 = 1.0 / _1191;
    float _1255 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1243);
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1259 = _1257 != 0;
    float _1261 = fma(_1247, _1155, _1251);
    float _1263 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1265 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1269 = _1267 != 0;
    float _1271 = _1261 * 0.15915493667125701904296875;
    float _1273 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1263);
    float _1275 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1265);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1279 = _937 + _1277;
    float _1281 = _1209 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1273);
    float _1287 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1255);
    float _1289 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1275);
    float _1291 = _1279 * _1227;
    bool _1293 = !_1235;
    float _1295 = _1293 ? (-0.5) : 0.5;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1299 = _937 + _1297;
    bool _1301 = !_1231;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = _1209 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1311 = _937 + _1309;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1315 = _1299 * _1199;
    float _1317 = _1311 * _1253;
    float _1319 = _961 * _1313;
    float _1321 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1323 = _1249 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = -_1295;
    int _1329 = _1241 ? as_type<int>(_1327) : as_type<int>(_1295);
    bool _1331 = !_1269;
    float _1333 = _1331 ? _1295 : as_type<float>(_1329);
    float _1335 = _1249 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    float _1339 = _1271 * 6.283185482025146484375;
    float _1341 = cos(_1339);
    float _1343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1345 = _1325 * _1283;
    float _1347 = _1325 * _1307;
    float _1349 = _963 * _1343;
    float _1351 = _1271 * 6.283185482025146484375;
    float _1353 = sin(_1351);
    float _1355 = _1337 * _1283;
    float _1357 = _1337 * _1307;
    float _1359 = _1307 * _1341;
    float _1361 = _1283 * _1341;
    float _1363 = _1341 * _1319;
    float _1365 = _1337 * _1363;
    float _1367 = _1325 * _1363;
    float _1369 = -_1355;
    float _1371 = fma(_1353, _1347, _1369);
    float _1373 = -_1347;
    float _1375 = fma(_1353, _1355, _1373);
    float _1377 = fma(_1353, _1357, _1345);
    float _1379 = -_1319;
    float _1381 = _1353 * _1379;
    float _1383 = fma(_1353, _1345, _1357);
    float _1385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1387 = fma(_1377, _1349, _1365);
    float _1389 = fma(_1359, _1349, _1381);
    float _1391 = fma(_1371, _1349, _1367);
    float _1393 = fma(_1375, _1385, _1387);
    float _1395 = fma(_1361, _1385, _1389);
    float _1397 = fma(_1383, _1385, _1391);
    float _1399 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1411 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1413 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1401);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1423 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1411);
    float _1425 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1413);
    float _1427 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1429 = _1289 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1431 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1435;
    bool _1439 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1441 = isnan(_937);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1447 = _1443 || _1445;
    float _1449 = float(_1447);
    float _1451 = _1427 + _1431;
    float _1453 = _1429 + _1433;
    float _1455 = fma(_1437, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1457 = fma(_1405, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1451 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1453 + _1463;
    float _1467 = fma(_1417, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1473 = _1461 * _1461;
    float _1475 = _1465 * _1465;
    float _1477 = -_1449;
    float _1479 = _1477 + 1.0;
    float _1481 = fma(_1471, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1483 = fma(_1409, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1485 = _1473 + _1475;
    float _1487 = fma(_1421, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1489 = _977 * _1479;
    float _1491 = sqrt(_1485);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1493;
    float _1497 = -_977;
    float _1499 = _1497 + 1.0;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1501;
    float _1505 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1507;
    float _1511 = fma(_1495, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1513 = fma(_1503, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1515 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1505);
    float _1517 = fma(_1509, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1519 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1521 = isnan(_937);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = _989 * _1499;
    float _1533 = -_989;
    float _1535 = _1533 + 1.0;
    float _1537 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1515);
    float _1539 = -_1303;
    int _1541 = _1211 ? as_type<int>(_1539) : as_type<int>(_1303);
    float _1543 = _1529 * _1535;
    bool _1545 = _1491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1547 = -_1529;
    float _1549 = _1547 + 1.0;
    bool _1551 = !_1259;
    float _1553 = _1551 ? _1303 : as_type<float>(_1541);
    float _1555 = _1455 * _1543;
    float _1557 = _1457 * _1543;
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1563 = _1467 * _1543;
    float _1565 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1555);
    float _1567 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1557);
    float _1569 = _1321 + _1561;
    float _1571 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1563);
    float _1573 = fma(_1481, _1531, _1565);
    float _1575 = _1549;
    float _1577 = _1561;
    float _1579 = _1563;
    float _1581 = _1473;
    float _1583 = _1475;
    float _1585 = _1449;
    float _1587 = _1321;
    if (!_1545)
    {
        _1575 = _1451;
    }
    float _1589 = _1575;
    float _1591 = _1589;
    if (!_1545)
    {
        _1577 = _1453;
    }
    float _1593 = _1577;
    float _1595 = _1593;
    if (!_1545)
    {
        _1579 = _1569;
    }
    float _1597 = _1579;
    bool _1599 = !_1545;
    float _1601 = _1597;
    if (!_1599)
    {
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1607 = _1491 + _1605;
        float _1609 = rsqrt(_1485);
        float _1611 = _1607 * _1603;
        float _1613 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1615 = _1611 * 0.15915493667125701904296875;
        float _1617 = _1615 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        float _1621 = _1615 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = fma(_1619, _1613, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1627 = _1609 * _1625;
        float _1629 = fma(_1461, _1627, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1631 = _1623 + (-1.0);
        float _1633 = fma(_1465, _1627, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1637 = _1629 + _1635;
        float _1639 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1643 = _1633 + _1641;
        float _1645 = _1637 * _1637;
        float _1647 = fma(_1569, _1623, _1639);
        float _1649 = _1643 * _1643;
        _1601 = _1647;
        _1581 = _1645;
        _1583 = _1649;
        _1591 = _1629;
        _1595 = _1633;
    }
    float _1651 = _1601;
    float _1653 = _1581;
    float _1655 = _1583;
    float _1657 = _1591;
    float _1659 = _1595;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_1483, _1531, _1567);
    float _1667 = fma(_1487, _1531, _1571);
    float _1669 = fma(_1511, _1489, _1573);
    float _1671 = fma(_1663, _1663, _1653);
    float _1673 = fma(_1513, _1489, _1665);
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1677 = fma(_1517, _1489, _1667);
    float _1679 = _1671 + _1655;
    float _1681 = _1553 + 0.5;
    float _1683 = -_1333;
    float _1685 = _1683 + 0.5;
    float _1687 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1669);
    float _1689 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1673);
    float _1691 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1677);
    float _1693 = sqrt(_1679);
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1701 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1703 = _1691 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1705 = _1695 * _1559;
    float _1707 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1697 * _1675;
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1705;
    out.m_50.y = _1709;
    bool _1715 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1717 = isnan(_1693);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1723 = _1719 || _1721;
    out.m_52.x = _1707;
    out.m_52.y = _1711;
    out.m_52.z = _1713;
    if (!_1723)
    {
        _1585 = 1.0;
    }
    float _1725 = _1585;
    bool _1727 = !_1723;
    float _1729 = _1725;
    if (!_1727)
    {
        bool _1731 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1733 = isnan(_1693);
        bool _1735 = _1731 || _1733;
        bool _1737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1739 = _1735 || _1737;
        if (!_1739)
        {
            float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1743 = _1693 + _1741;
            float _1745 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1747 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1745;
            float _1749 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1751 = _1749 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1753 = 1.0 / _1747;
            float _1755 = _1743 * _1753;
            float _1757 = fma(_1755, _1751, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1729 = _1757;
            _1759 = true;
        }
        else
        {
            bool _1761 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1763 = isnan(_1693);
            bool _1765 = _1761 || _1763;
            bool _1767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1769 = _1765 || _1767;
            if (!_1769)
            {
                float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1773 = _1693 + _1771;
                float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1777 = _1775 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1781 = _1779 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1783 = 1.0 / _1777;
                float _1785 = _1773 * _1783;
                float _1787 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1729 = _1787;
                _1759 = true;
            }
            else
            {
                _1729 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1759 = false;
    float _1789 = _1729;
    float _1791 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1795 = _1657 + _1793;
    float _1797 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1791);
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.5);
    bool _1819 = _1815 || _1817;
    float _1821 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1797);
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1825 = _1659 + _1823;
    float _1827 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1809);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1833 = _1651 + _1831;
    float _1835 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1827);
    float _1837 = fma(_1795, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1839 = 1.0 / _1829;
    float _1841 = fma(_1833, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1843 = fma(_1825, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1845 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1847 = _1809;
    float _1849 = _1833;
    float _1851 = _1789;
    if (_1807)
    {
        _1847 = _1837;
    }
    float _1853 = _1847;
    float _1855 = _1853;
    if (_1807)
    {
        _1849 = _1841;
    }
    float _1857 = _1849;
    float _1859 = _1845 + _1829;
    float _1861 = _1857;
    if (_1807)
    {
        _1851 = _1843;
    }
    float _1863 = _1851;
    float _1865 = _1863;
    if (!_1807)
    {
        float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1869 = _1321 + _1867;
        float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1873 = _1427 + _1871;
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1877 = _1869 * _1869;
        float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1881 = _1429 + _1879;
        float _1883 = fma(_1873, _1873, _1877);
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1887 = fma(_1881, _1881, _1883);
        float _1889 = sqrt(_1887);
        float _1891 = _1875 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1893 = precise::min(_1889, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1895 = _1893 * _1885;
        float _1897 = -_1427;
        float _1899 = _1897 + _1837;
        float _1901 = -_1429;
        float _1903 = _1901 + _1843;
        float _1905 = _1891 * _1895;
        float _1907 = -_1321;
        float _1909 = _1907 + _1841;
        float _1911 = fma(_1899, _1905, _1427);
        float _1913 = fma(_1909, _1905, _1321);
        float _1915 = fma(_1903, _1905, _1429);
        _1861 = _1913;
        _1855 = _1911;
        _1865 = _1915;
    }
    float _1917 = _1861;
    float _1919 = _1855;
    float _1921 = _1865;
    float _1923 = _1859 * _1839;
    float _1925 = _1923 * 0.5;
    float _1927 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1929 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1933 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1935 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    float _1937 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1929);
    float _1939 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1931);
    float _1941 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1933);
    if (_1819)
    {
        _1587 = 1.0;
    }
    float _1943 = _1587;
    float _1945 = _1943;
    if (!_1819)
    {
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1951 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
        float _1953 = _1947 * 0.15915493667125701904296875;
        float _1955 = _1953 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1953 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = 1.0 / _1957;
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1951;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = _1971 * _1973;
        float _1983 = _1961 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = 1.0 / _1981;
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1991 = _1975 * _1989;
        float _1993 = 1.0 / _1979;
        float _1995 = _1985 * _1987;
        float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1999 = fma(_1995, _1991, _1997);
        float _2001 = _1999 * _1993;
        float _2003 = precise::clamp(_2001, 0.0, 1.0);
        _1945 = _2003;
    }
    float _2005 = _1945;
    float _2007 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1937);
    float _2009 = _2005 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2011 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    float _2013 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    float _2015 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2017 = _341 * _2009;
    float _2019 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    bool _2021 = _2005 > 0.0;
    bool _2023 = isnan(_2005);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(0.0);
    bool _2029 = _2025 || _2027;
    float _2031 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2033 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2035 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2037 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2039 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2041 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2033);
    float _2045 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2035);
    float _2047 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2037);
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2039);
    float _2051 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2043);
    float _2055 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2045);
    float _2057 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2049);
    float _2059 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2047);
    float _2061 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2053);
    float _2063 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2065 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2057);
    float _2067 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2059);
    float _2069 = _2017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2071 = _2063 + _2065;
    float _2073 = _2067 + _2065;
    float _2075 = _2065 * 0.5;
    float _2077 = _2071 * 0.5;
    float _2079 = _2073 * 0.5;
    float _2081 = fma(_2061, -0.5, _2075);
    out.m_35.x = _2069;
    out.gl_Position.x = _2063;
    out.gl_Position.y = _2061;
    out.gl_Position.z = _2067;
    out.gl_Position.w = _2065;
    out.m_54.x = _2077;
    out.m_54.y = _2081;
    out.m_54.z = _2079;
    out.m_54.w = _2065;
    if (_2029)
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1759 = false;
    bool _929 = false;
    bool _827 = false;
    bool _599 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2140 = as_type<float>(_89);
        out.gl_Position.z = _2140;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2210 = as_type<float>(_127);
        out.gl_Position.z = _2210;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _133 * _131;
    float _149 = 0.0;
    if (!_145)
    {
        float _151 = _135 * _135;
        float _153 = _151 * 0.5;
        _149 = _153;
    }
    float _155 = _149;
    float _157 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _159 = _155;
    if (!_145)
    {
        float _161 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    float _165 = in.m_37.x;
    float _167 = in.m_37.y;
    float _169 = in.m_37.z;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    float _175 = _171 * 0.15915493667125701904296875;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _175 * 6.283185482025146484375;
    float _183 = cos(_181);
    float _185 = 1.4012984643248170709237295832899e-45;
    float _187 = _163;
    if (!_145)
    {
        _185 = _135;
    }
    float _189 = _185;
    float _191 = -_173;
    float _193 = _157 + _191;
    bool _195 = !_145;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _135 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _135);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _227;
    }
    float _229 = _187;
    bool _231 = !_145;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _135 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _197 = _251;
    }
    float _253 = _197;
    float _255 = in.m_41.w;
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = in.m_32.x;
    float _267 = in.m_32.y;
    float _269 = in.m_32.z;
    float _271 = -_193;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = _193 < 0.5;
    float _277 = float(_275);
    bool _279 = !_259;
    int _281 = _279 ? 0 : 1;
    float _283 = fma(_183, 0.5, 0.5);
    bool _285 = !_179;
    int _287 = _285 ? 0 : 1;
    float _289 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _291 = abs(_281);
    float _293 = -_277;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_253, _165, _289);
    int _303 = abs(_287);
    float _305 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _307 = !_263;
    int _309 = _307 ? 0 : 1;
    float _311 = fma(_253, _167, _305);
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _315 = abs(_309);
    float _317 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _319 = float(_291);
    float _321 = fma(_301, _255, _265);
    float _323 = float(_303);
    float _325 = fma(_253, _169, _317);
    float _327 = abs(_273);
    float _329 = _319 * _327;
    float _331 = fma(_311, _255, _267);
    float _333 = fma(_325, _255, _269);
    float _335 = float(_315);
    float _337 = fma(_323, _299, _329);
    float _339 = abs(_295);
    float _341 = fma(_335, _339, _337);
    bool _343 = !_313;
    float _359;
    if (!_343)
    {
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _347 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_73);
        float _365 = 1.0 / _363;
        float _367 = _107 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _359;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = _369 + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _369 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _369 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _399 = 1.0 / _385;
    bool _401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _403 = 1.0 / _393;
    float _405 = 1.0 / _389;
    float _407 = _377 * _399;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _369 + _409;
    float _413 = 1.0 / _397;
    float _415 = _373 * _403;
    bool _417 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _419 = isnan(_369);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_427;
    float _431 = _429 + 1.0;
    float _433 = _381 * _405;
    bool _435 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _437 = isnan(_369);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    bool _447 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _449 = isnan(_369);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _445 * _431;
    bool _461 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_369);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _411 * _413;
    float _475 = -_445;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    bool _487 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _489 = isnan(_369);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = _457 * _477;
    float _501 = -_457;
    float _503 = _501 + 1.0;
    float _505 = fma(_481, _407, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_485, _407, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = _471 * _503;
    float _515 = -_471;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = fma(_511, _433, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _525 = -_497;
    float _527 = _525 + 1.0;
    float _529 = _497 * _517;
    float _531 = fma(_521, _433, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _537;
    float _541 = _505 * _529;
    float _543 = _507 * _529;
    float _545 = fma(_535, _415, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _547 = fma(_539, _415, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _549 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _541);
    float _551 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = fma(_523, _513, _549);
    float _563 = fma(_531, _513, _551);
    float _565 = fma(_555, _473, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _567 = fma(_559, _473, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_545, _499, _561);
    float _571 = fma(_547, _499, _563);
    float _573 = fma(_565, _459, _569);
    float _575 = fma(_567, _459, _571);
    float _577 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].x, _573);
    float _579 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].y, _575);
    bool _581 = !_401;
    float _597;
    if (!_581)
    {
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _585 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_73);
        float _603 = 1.0 / _601;
        float _605 = _107 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = in.m_41.x;
    float _611 = in.m_41.y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _615 = _607 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _619 = _607 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _623 = _607 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _633;
    float _637 = 1.0 / _627;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _641 = 1.0 / _631;
    float _643 = _579 * _611;
    bool _645 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _647 = isnan(_607);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = 1.0 / _635;
    float _659 = _623 * _637;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _661;
    float _665 = _577 * _609;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _667;
    float _671 = _615 * _641;
    bool _673 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _675 = isnan(_607);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _685;
    bool _689 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _691 = isnan(_607);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_669, _659, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _703 = fma(_663, _659, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _705 = fma(_687, _659, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _707 = _619 * _657;
    float _709 = -_655;
    float _711 = _709 + 1.0;
    bool _713 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _715 = isnan(_607);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _729 = _683 * _711;
    float _731 = -_699;
    float _733 = _731 + 1.0;
    float _735 = -_683;
    float _737 = _735 + 1.0;
    float _739 = fma(_727, _671, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _741 = _723 * _733;
    float _743 = _699 * _737;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _749 = -_723;
    float _751 = _749 + 1.0;
    float _753 = _705 * _741;
    float _755 = _701 * _741;
    float _757 = _703 * _741;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _763 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _755);
    float _765 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _757);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _767;
    float _771 = fma(_761, _671, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _773 = fma(_747, _671, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _753);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _781;
    float _785 = fma(_739, _743, _763);
    float _787 = fma(_769, _707, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _789 = fma(_779, _707, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _791 = fma(_783, _707, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _793 = fma(_771, _743, _765);
    float _795 = fma(_773, _743, _775);
    float _797 = fma(_787, _729, _785);
    float _799 = fma(_789, _729, _793);
    float _801 = fma(_791, _729, _795);
    float _803 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].x, _797);
    float _805 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].y, _799);
    float _807 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[110].z, _801);
    bool _809 = !_639;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _813 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_73);
        float _831 = 1.0 / _829;
        float _833 = _107 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    bool _837 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = isnan(_835);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _853 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _855 = isnan(_835);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _871 = _835 + _869;
    float _873 = -_847;
    float _875 = _873 + 1.0;
    bool _877 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _879 = 1.0 / _851;
    float _881 = _863 * _875;
    float _883 = -_863;
    float _885 = _883 + 1.0;
    float _887 = _867 * _879;
    float _889 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = fma(_887, _871, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _893 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _891 * _881;
    float _899 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[115].x, _897);
    float _905 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[116].x, _903);
    float _909 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _905;
    out.m_43.y = _901;
    out.m_43.z = _895;
    out.m_43.w = _909;
    bool _911 = !_877;
    float _927;
    if (!_911)
    {
        float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _915 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _919 = _917 * _913;
        float _921 = floor(_919);
        float _923 = -_921;
        float _925 = _919 + _923;
        _927 = _925;
        _929 = true;
    }
    else
    {
        float _931 = float(_73);
        float _933 = 1.0 / _931;
        float _935 = _107 * _933;
        _927 = _935;
    }
    _929 = false;
    float _937 = _927;
    float _939 = in.m_39.z;
    float _941 = _129 * 2.0;
    float _943 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _945 = log2(_943);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = in.m_39.y;
    float _961 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _963 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _965 = floor(_941);
    bool _967 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _969 = isnan(_937);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    bool _979 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _981 = isnan(_937);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = _939 * 2.0;
    bool _993 = _965 > 0.0;
    float _995 = _129 + _959;
    float _997 = _959 + _939;
    float _999 = floor(_991);
    float _1001 = _959 * 2.0;
    float _1003 = _995 + (-1.0);
    float _1005 = _997 + (-1.0);
    bool _1007 = _965 >= 0.0;
    bool _1009 = isnan(_965);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan(0.0);
    bool _1015 = _1011 || _1013;
    float _1017 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1021 = floor(_1001);
    bool _1023 = !_953;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = abs(_1025);
    bool _1029 = _999 > 0.0;
    bool _1031 = _999 >= 0.0;
    bool _1033 = isnan(_999);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan(0.0);
    bool _1039 = _1035 || _1037;
    float _1041 = _945 * _107;
    int _1043 = _1015 ? 0 : 1;
    int _1045 = _1039 ? 0 : 1;
    int _1047 = ~_1043;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = exp2(_1041);
    int _1055 = ~_1045;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1051;
    int _1063 = _1059;
    if (!_993)
    {
        int _1065 = ~_1043;
        int _1067 = _1065 + 1;
        _1061 = _1067;
    }
    int _1069 = _1061;
    if (!_1029)
    {
        int _1071 = ~_1045;
        int _1073 = _1071 + 1;
        _1063 = _1073;
    }
    int _1075 = _1063;
    float _1077 = in.m_45.x;
    float _1079 = in.m_45.y;
    float _1081 = in.m_45.z;
    bool _1083 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1085 = isnan(1.0);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1091 = _1087 || _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1095 = 1.0 + _1093;
    bool _1097 = _1021 > 0.0;
    float _1099 = float(_1027);
    float _1101 = 1.0 / _1095;
    float _1103 = float(_1069);
    bool _1105 = _1021 >= 0.0;
    bool _1107 = isnan(_1021);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.0);
    bool _1113 = _1109 || _1111;
    float _1115 = -_1053;
    float _1117 = _1115 + 1.0;
    bool _1119 = !_949;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1099 * _1103;
    bool _1125 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1133 = _1129 || _1131;
    int _1135 = abs(_1121);
    float _1137 = _1123 * (-2.0);
    int _1139 = _1113 ? 0 : 1;
    float _1141 = as_type<float>(int(gl_VertexIndex));
    float _1143 = _1133 ? _1117 : 0.0;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1145;
    float _1149 = float(_1135);
    float _1151 = float(_1075);
    if (_1091)
    {
        float _1153 = _1143 * _1101;
        _109 = _1153;
    }
    float _1155 = _109;
    int _1157 = ~_1139;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = fma(_1137, _1079, _1079);
    int _1165 = _1161;
    if (!_1097)
    {
        int _1167 = ~_1139;
        int _1169 = _1167 + 1;
        _1165 = _1169;
    }
    int _1171 = _1165;
    float _1173 = fma(_1019, _1137, _1019);
    float _1175 = _959 + (-0.5);
    float _1177 = _1149 * _1151;
    bool _1179 = !_957;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1163);
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1189;
    int _1193 = abs(_1181);
    float _1195 = _1177 * (-2.0);
    float _1197 = fma(_1173, _1155, _1187);
    float _1199 = 1.0 / _1185;
    float _1201 = fma(_1017, _1195, _1017);
    float _1203 = fma(_1195, _1077, _1077);
    float _1205 = _129 + (-0.5);
    float _1207 = float(_1171);
    float _1209 = _1197 * 0.15915493667125701904296875;
    bool _1211 = _129 > 0.5;
    float _1213 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1203);
    float _1215 = float(_1193);
    float _1217 = _129 + _939;
    float _1219 = _939 + (-0.5);
    float _1221 = fma(_1201, _1155, _1213);
    float _1223 = _1215 * _1207;
    float _1225 = _1217 + (-1.0);
    float _1227 = 1.0 / _1147;
    int _1229 = as_type<int>(_1141) & 1;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>(_1141) & 2;
    bool _1235 = _1233 != 0;
    float _1237 = _1223 * (-2.0);
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1241 = _959 > 0.5;
    float _1243 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1245 = fma(_1237, _1081, _1081);
    float _1247 = fma(_1239, _1237, _1239);
    float _1249 = _1221 * 0.15915493667125701904296875;
    float _1251 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1245);
    float _1253 = 1.0 / _1191;
    float _1255 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1243);
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1259 = _1257 != 0;
    float _1261 = fma(_1247, _1155, _1251);
    float _1263 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1265 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1269 = _1267 != 0;
    float _1271 = _1261 * 0.15915493667125701904296875;
    float _1273 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1263);
    float _1275 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1265);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1279 = _937 + _1277;
    float _1281 = _1209 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1273);
    float _1287 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1255);
    float _1289 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1275);
    float _1291 = _1279 * _1227;
    bool _1293 = !_1235;
    float _1295 = _1293 ? (-0.5) : 0.5;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1299 = _937 + _1297;
    bool _1301 = !_1231;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = _1209 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1311 = _937 + _1309;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1315 = _1299 * _1199;
    float _1317 = _1311 * _1253;
    float _1319 = _961 * _1313;
    float _1321 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1323 = _1249 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = -_1295;
    int _1329 = _1241 ? as_type<int>(_1327) : as_type<int>(_1295);
    bool _1331 = !_1269;
    float _1333 = _1331 ? _1295 : as_type<float>(_1329);
    float _1335 = _1249 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    float _1339 = _1271 * 6.283185482025146484375;
    float _1341 = cos(_1339);
    float _1343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1345 = _1325 * _1283;
    float _1347 = _1325 * _1307;
    float _1349 = _963 * _1343;
    float _1351 = _1271 * 6.283185482025146484375;
    float _1353 = sin(_1351);
    float _1355 = _1337 * _1283;
    float _1357 = _1337 * _1307;
    float _1359 = _1307 * _1341;
    float _1361 = _1283 * _1341;
    float _1363 = _1341 * _1319;
    float _1365 = _1337 * _1363;
    float _1367 = _1325 * _1363;
    float _1369 = -_1355;
    float _1371 = fma(_1353, _1347, _1369);
    float _1373 = -_1347;
    float _1375 = fma(_1353, _1355, _1373);
    float _1377 = fma(_1353, _1357, _1345);
    float _1379 = -_1319;
    float _1381 = _1353 * _1379;
    float _1383 = fma(_1353, _1345, _1357);
    float _1385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1387 = fma(_1377, _1349, _1365);
    float _1389 = fma(_1359, _1349, _1381);
    float _1391 = fma(_1371, _1349, _1367);
    float _1393 = fma(_1375, _1385, _1387);
    float _1395 = fma(_1361, _1385, _1389);
    float _1397 = fma(_1383, _1385, _1391);
    float _1399 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1411 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1413 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1401);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1423 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1411);
    float _1425 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1413);
    float _1427 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1429 = _1289 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1431 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1435;
    bool _1439 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1441 = isnan(_937);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1447 = _1443 || _1445;
    float _1449 = float(_1447);
    float _1451 = _1427 + _1431;
    float _1453 = _1429 + _1433;
    float _1455 = fma(_1437, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1457 = fma(_1405, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1451 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1453 + _1463;
    float _1467 = fma(_1417, _1291, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1473 = _1461 * _1461;
    float _1475 = _1465 * _1465;
    float _1477 = -_1449;
    float _1479 = _1477 + 1.0;
    float _1481 = fma(_1471, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1483 = fma(_1409, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1485 = _1473 + _1475;
    float _1487 = fma(_1421, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1489 = _977 * _1479;
    float _1491 = sqrt(_1485);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1493;
    float _1497 = -_977;
    float _1499 = _1497 + 1.0;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1501;
    float _1505 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1507;
    float _1511 = fma(_1495, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1513 = fma(_1503, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1515 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1505);
    float _1517 = fma(_1509, _1317, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1519 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1521 = isnan(_937);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = _989 * _1499;
    float _1533 = -_989;
    float _1535 = _1533 + 1.0;
    float _1537 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1515);
    float _1539 = -_1303;
    int _1541 = _1211 ? as_type<int>(_1539) : as_type<int>(_1303);
    float _1543 = _1529 * _1535;
    bool _1545 = _1491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1547 = -_1529;
    float _1549 = _1547 + 1.0;
    bool _1551 = !_1259;
    float _1553 = _1551 ? _1303 : as_type<float>(_1541);
    float _1555 = _1455 * _1543;
    float _1557 = _1457 * _1543;
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1563 = _1467 * _1543;
    float _1565 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1555);
    float _1567 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1557);
    float _1569 = _1321 + _1561;
    float _1571 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1563);
    float _1573 = fma(_1481, _1531, _1565);
    float _1575 = _1549;
    float _1577 = _1561;
    float _1579 = _1563;
    float _1581 = _1473;
    float _1583 = _1475;
    float _1585 = _1449;
    float _1587 = _1321;
    if (!_1545)
    {
        _1575 = _1451;
    }
    float _1589 = _1575;
    float _1591 = _1589;
    if (!_1545)
    {
        _1577 = _1453;
    }
    float _1593 = _1577;
    float _1595 = _1593;
    if (!_1545)
    {
        _1579 = _1569;
    }
    float _1597 = _1579;
    bool _1599 = !_1545;
    float _1601 = _1597;
    if (!_1599)
    {
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1607 = _1491 + _1605;
        float _1609 = rsqrt(_1485);
        float _1611 = _1607 * _1603;
        float _1613 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1615 = _1611 * 0.15915493667125701904296875;
        float _1617 = _1615 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        float _1621 = _1615 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = fma(_1619, _1613, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1627 = _1609 * _1625;
        float _1629 = fma(_1461, _1627, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1631 = _1623 + (-1.0);
        float _1633 = fma(_1465, _1627, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1637 = _1629 + _1635;
        float _1639 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1643 = _1633 + _1641;
        float _1645 = _1637 * _1637;
        float _1647 = fma(_1569, _1623, _1639);
        float _1649 = _1643 * _1643;
        _1601 = _1647;
        _1581 = _1645;
        _1583 = _1649;
        _1591 = _1629;
        _1595 = _1633;
    }
    float _1651 = _1601;
    float _1653 = _1581;
    float _1655 = _1583;
    float _1657 = _1591;
    float _1659 = _1595;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_1483, _1531, _1567);
    float _1667 = fma(_1487, _1531, _1571);
    float _1669 = fma(_1511, _1489, _1573);
    float _1671 = fma(_1663, _1663, _1653);
    float _1673 = fma(_1513, _1489, _1665);
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1677 = fma(_1517, _1489, _1667);
    float _1679 = _1671 + _1655;
    float _1681 = _1553 + 0.5;
    float _1683 = -_1333;
    float _1685 = _1683 + 0.5;
    float _1687 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1669);
    float _1689 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1673);
    float _1691 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1677);
    float _1693 = sqrt(_1679);
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1701 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1703 = _1691 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1705 = _1695 * _1559;
    float _1707 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1697 * _1675;
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1705;
    out.m_50.y = _1709;
    bool _1715 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1717 = isnan(_1693);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1723 = _1719 || _1721;
    out.m_52.x = _1707;
    out.m_52.y = _1711;
    out.m_52.z = _1713;
    if (!_1723)
    {
        _1585 = 1.0;
    }
    float _1725 = _1585;
    bool _1727 = !_1723;
    float _1729 = _1725;
    if (!_1727)
    {
        bool _1731 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1733 = isnan(_1693);
        bool _1735 = _1731 || _1733;
        bool _1737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1739 = _1735 || _1737;
        if (!_1739)
        {
            float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1743 = _1693 + _1741;
            float _1745 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1747 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1745;
            float _1749 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1751 = _1749 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1753 = 1.0 / _1747;
            float _1755 = _1743 * _1753;
            float _1757 = fma(_1755, _1751, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1729 = _1757;
            _1759 = true;
        }
        else
        {
            bool _1761 = _1693 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1763 = isnan(_1693);
            bool _1765 = _1761 || _1763;
            bool _1767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1769 = _1765 || _1767;
            if (!_1769)
            {
                float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1773 = _1693 + _1771;
                float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1777 = _1775 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1781 = _1779 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1783 = 1.0 / _1777;
                float _1785 = _1773 * _1783;
                float _1787 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1729 = _1787;
                _1759 = true;
            }
            else
            {
                _1729 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1759 = false;
    float _1789 = _1729;
    float _1791 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1795 = _1657 + _1793;
    float _1797 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1791);
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.5);
    bool _1819 = _1815 || _1817;
    float _1821 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1797);
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1825 = _1659 + _1823;
    float _1827 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1809);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1833 = _1651 + _1831;
    float _1835 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1827);
    float _1837 = fma(_1795, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1839 = 1.0 / _1829;
    float _1841 = fma(_1833, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1843 = fma(_1825, _1789, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1845 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1847 = _1809;
    float _1849 = _1833;
    float _1851 = _1789;
    if (_1807)
    {
        _1847 = _1837;
    }
    float _1853 = _1847;
    float _1855 = _1853;
    if (_1807)
    {
        _1849 = _1841;
    }
    float _1857 = _1849;
    float _1859 = _1845 + _1829;
    float _1861 = _1857;
    if (_1807)
    {
        _1851 = _1843;
    }
    float _1863 = _1851;
    float _1865 = _1863;
    if (!_1807)
    {
        float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1869 = _1321 + _1867;
        float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1873 = _1427 + _1871;
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1877 = _1869 * _1869;
        float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1881 = _1429 + _1879;
        float _1883 = fma(_1873, _1873, _1877);
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1887 = fma(_1881, _1881, _1883);
        float _1889 = sqrt(_1887);
        float _1891 = _1875 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1893 = precise::min(_1889, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1895 = _1893 * _1885;
        float _1897 = -_1427;
        float _1899 = _1897 + _1837;
        float _1901 = -_1429;
        float _1903 = _1901 + _1843;
        float _1905 = _1891 * _1895;
        float _1907 = -_1321;
        float _1909 = _1907 + _1841;
        float _1911 = fma(_1899, _1905, _1427);
        float _1913 = fma(_1909, _1905, _1321);
        float _1915 = fma(_1903, _1905, _1429);
        _1861 = _1913;
        _1855 = _1911;
        _1865 = _1915;
    }
    float _1917 = _1861;
    float _1919 = _1855;
    float _1921 = _1865;
    float _1923 = _1859 * _1839;
    float _1925 = _1923 * 0.5;
    float _1927 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1929 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1933 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1935 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    float _1937 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1929);
    float _1939 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1931);
    float _1941 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1933);
    if (_1819)
    {
        _1587 = 1.0;
    }
    float _1943 = _1587;
    float _1945 = _1943;
    if (!_1819)
    {
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1951 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
        float _1953 = _1947 * 0.15915493667125701904296875;
        float _1955 = _1953 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1953 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = 1.0 / _1957;
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1951;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = _1971 * _1973;
        float _1983 = _1961 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = 1.0 / _1981;
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1991 = _1975 * _1989;
        float _1993 = 1.0 / _1979;
        float _1995 = _1985 * _1987;
        float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1999 = fma(_1995, _1991, _1997);
        float _2001 = _1999 * _1993;
        float _2003 = precise::clamp(_2001, 0.0, 1.0);
        _1945 = _2003;
    }
    float _2005 = _1945;
    float _2007 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1937);
    float _2009 = _2005 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2011 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    float _2013 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    float _2015 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2017 = _341 * _2009;
    float _2019 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    bool _2021 = _2005 > 0.0;
    bool _2023 = isnan(_2005);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(0.0);
    bool _2029 = _2025 || _2027;
    float _2031 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2033 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2035 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2037 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2039 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2041 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2033);
    float _2045 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2035);
    float _2047 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2037);
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2039);
    float _2051 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2043);
    float _2055 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2045);
    float _2057 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2049);
    float _2059 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2047);
    float _2061 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2053);
    float _2063 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2065 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2057);
    float _2067 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2059);
    float _2069 = _2017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2071 = _2063 + _2065;
    float _2073 = _2067 + _2065;
    float _2075 = _2065 * 0.5;
    float _2077 = _2071 * 0.5;
    float _2079 = _2073 * 0.5;
    float _2081 = fma(_2061, -0.5, _2075);
    out.m_35.x = _2069;
    out.gl_Position.x = _2063;
    out.gl_Position.y = _2061;
    out.gl_Position.z = _2067;
    out.gl_Position.w = _2065;
    out.m_54.x = _2077;
    out.m_54.y = _2081;
    out.m_54.z = _2079;
    out.m_54.w = _2065;
    if (_2029)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2083 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2083;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

