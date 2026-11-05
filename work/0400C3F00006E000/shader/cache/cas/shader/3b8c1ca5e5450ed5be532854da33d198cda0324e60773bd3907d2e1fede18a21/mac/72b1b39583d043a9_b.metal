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
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1157 = false;
    bool _753 = false;
    bool _575 = false;
    bool _401 = false;
    bool _255 = false;
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
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_89);
        out.gl_Position.z = _1595;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.z;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _93;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_119)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1667 = as_type<float>(_127);
        out.gl_Position.z = _1667;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    float _153 = _149 * 0.15915493667125701904296875;
    bool _155 = !_147;
    int _157 = _155 ? (-1090519040) : 1056964608;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_143;
    int _173 = _171 ? (-1090519040) : 1056964608;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    out.m_46.x = as_type<float>(_173);
    out.m_46.y = as_type<float>(_157);
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_169, 0.5, 0.5);
    float _205 = float(_191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_197);
    float _213 = _205 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_203;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_73);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_263);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _295;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _291 * _303;
    float _321 = -_291;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = _317 * _323;
    float _329 = 1.0 / _299;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _267 * _305;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _263 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_343, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _339 * _329;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _327;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _351 * _327;
    float _367 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _371 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_367, _319, _369);
    float _377 = fma(_371, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_325;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _387 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_73);
        float _405 = 1.0 / _403;
        float _407 = _107 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = in.m_48.x;
    float _413 = in.m_48.y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = _409 + _415;
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    bool _431 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _433 = isnan(_409);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _451 = -_429;
    float _453 = _451 + 1.0;
    float _455 = 1.0 / _449;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _459 = 1.0 / _445;
    float _461 = _381 * _413;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _465 = _409 + _463;
    bool _467 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _469 = isnan(_409);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _379 * _411;
    float _481 = _465 * _455;
    float _483 = _477 * _453;
    float _485 = -_477;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _489;
    float _493 = _417 * _459;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _499;
    float _503 = _441 * _487;
    float _505 = fma(_491, _493, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _507 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _509 = fma(_501, _493, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _511 = -_441;
    float _513 = _511 + 1.0;
    float _515 = _505 * _503;
    float _517 = _507 * _503;
    float _519 = _509 * _503;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _533 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].x, _515);
    float _535 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].y, _517);
    float _537 = fma(_523, _481, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _539 = fma(_527, _481, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _541 = fma(_531, _481, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _543 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].z, _519);
    float _545 = fma(_537, _483, _533);
    float _547 = fma(_539, _483, _535);
    float _549 = fma(_541, _483, _543);
    float _551 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].x, _545);
    float _553 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].y, _547);
    float _555 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].z, _549);
    bool _557 = !_457;
    float _573;
    if (!_557)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _561 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_73);
        float _579 = 1.0 / _577;
        float _581 = _107 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _587 = _583 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _597 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _599 = isnan(_583);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_583);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _591;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _627;
    float _631 = -_607;
    float _633 = _631 + 1.0;
    bool _635 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _637 = isnan(_583);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _649 = 1.0 / _595;
    float _651 = 1.0 / _611;
    float _653 = _629 * _625;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = _623 * _633;
    float _661 = -_623;
    float _663 = _661 + 1.0;
    float _665 = fma(_653, _587, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _667;
    float _671 = _645 * _663;
    float _673 = _657 * _649;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _583 + _675;
    bool _679 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _681 = isnan(_583);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _665 * _671;
    float _693 = -_645;
    float _695 = _693 + 1.0;
    float _697 = fma(_673, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _701 = _583 + _699;
    float _703 = _669 * _651;
    float _705 = -_689;
    float _707 = _705 + 1.0;
    float _709 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    float _711 = fma(_703, _701, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _713 = _607 * _707;
    float _715 = fma(_697, _659, _709);
    float _717 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _719 = fma(_711, _713, _715);
    float _721 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _723 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[118].x, _719);
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_50.x = _729;
    out.m_50.y = _725;
    out.m_50.z = _731;
    out.m_50.w = _733;
    bool _735 = !_647;
    float _751;
    if (!_735)
    {
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _739 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_73);
        float _757 = 1.0 / _755;
        float _759 = _107 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = in.m_32.x;
    float _765 = in.m_32.y;
    float _767 = in.m_32.z;
    float _769 = _235 * _461;
    float _771 = _235 * _479;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _775 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _775 * _773;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _783;
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _793 = _779 * _777;
    float _795 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _799 = 1.0 / _785;
    float _801 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _803 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[26].x, _797);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _801);
    float _807 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _803);
    float _809 = _765 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _811 = _765 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _813 = _765 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _815 = 1.0 / _791;
    float _817 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[4].x, _809);
    float _819 = _807 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[6].x, _813);
    float _823 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[5].x, _811);
    float _825 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _817);
    float _827 = _805 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _829 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _821);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _833 = _761 + _831;
    float _835 = _825 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _837 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _823);
    float _839 = _829 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = _833 * _799;
    float _843 = _835 + _827;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _761 + _845;
    float _849 = _839 + _819;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _853 = _843 + _851;
    float _855 = _847 * _815;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _859 = _849 + _857;
    float _861 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _863 = _853 * _853;
    float _865 = _859 * _859;
    float _867 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[25].x, _861);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _873;
    float _877 = _863 + _865;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _879;
    bool _883 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _885 = isnan(_761);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_871, _841, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = sqrt(_877);
    float _899 = fma(_881, _841, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _901 = fma(_875, _841, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _903 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _905 = isnan(_761);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _867);
    bool _921 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _923 = isnan(_761);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _937 = _913 * _917;
    float _939 = -_913;
    float _941 = _939 + 1.0;
    float _943 = _919 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _953 = _931 * _941;
    float _955 = fma(_935, _855, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _957 = _837 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _959 = _897 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = fma(_947, _855, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _963 = fma(_951, _855, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _965 = _957 + _943;
    float _967 = _895 * _953;
    float _969 = _899 * _953;
    float _971 = _901 * _953;
    float _973 = -_931;
    float _975 = _973 + 1.0;
    float _977 = _951;
    float _979 = _895;
    float _981 = _947;
    float _983 = _899;
    float _985 = _901;
    float _987 = _893;
    if (!_959)
    {
        _977 = _865;
    }
    float _989 = _977;
    float _991 = _989;
    if (!_959)
    {
        _979 = _863;
    }
    float _993 = _979;
    float _995 = _993;
    if (!_959)
    {
        _981 = _843;
    }
    float _997 = _981;
    float _999 = _997;
    if (!_959)
    {
        _983 = _849;
    }
    float _1001 = _983;
    float _1003 = _1001;
    if (!_959)
    {
        _985 = _965;
    }
    float _1005 = _985;
    bool _1007 = !_959;
    float _1009 = _1005;
    if (!_1007)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1015 = _897 + _1013;
        float _1017 = rsqrt(_877);
        float _1019 = _1015 * _1011;
        float _1021 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = _1019 * 0.15915493667125701904296875;
        float _1025 = _1023 * 6.283185482025146484375;
        float _1027 = sin(_1025);
        float _1029 = _1023 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        float _1033 = fma(_1027, _1021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1035 = _1017 * _1033;
        float _1037 = _1031 + (-1.0);
        float _1039 = fma(_853, _1035, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1041 = fma(_859, _1035, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1043 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1047 = _1039 + _1045;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1051 = _1041 + _1049;
        float _1053 = fma(_965, _1031, _1043);
        float _1055 = _1047 * _1047;
        float _1057 = _1051 * _1051;
        _1009 = _1053;
        _995 = _1055;
        _991 = _1057;
        _999 = _1039;
        _1003 = _1041;
    }
    float _1059 = _1009;
    float _1061 = _995;
    float _1063 = _991;
    float _1065 = _999;
    float _1067 = _1003;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1071 = _1059 + _1069;
    float _1073 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].x, _967);
    float _1075 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].y, _969);
    float _1077 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].z, _971);
    float _1079 = fma(_1071, _1071, _1061);
    float _1081 = fma(_955, _937, _1073);
    float _1083 = fma(_961, _937, _1075);
    float _1085 = fma(_963, _937, _1077);
    float _1087 = _1079 + _1063;
    float _1089 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1081);
    float _1091 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1083);
    float _1093 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1085);
    float _1095 = sqrt(_1087);
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1101 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1103 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1109 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1107;
    out.m_52.y = _1103;
    out.m_52.z = _1109;
    out.m_52.w = _1105;
    bool _1111 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1113 = isnan(_1095);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1119 = _1115 || _1117;
    float _1121 = _1067;
    if (!_1119)
    {
        _987 = 1.0;
    }
    float _1123 = _987;
    bool _1125 = !_1119;
    float _1127 = _1123;
    if (!_1125)
    {
        bool _1129 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1131 = isnan(_1095);
        bool _1133 = _1129 || _1131;
        bool _1135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1137 = _1133 || _1135;
        if (!_1137)
        {
            float _1139 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1141 = _1095 + _1139;
            float _1143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1145 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1143;
            float _1147 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1149 = _1147 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1151 = 1.0 / _1145;
            float _1153 = _1141 * _1151;
            float _1155 = fma(_1153, _1149, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1127 = _1155;
            _1157 = true;
        }
        else
        {
            bool _1159 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1161 = isnan(_1095);
            bool _1163 = _1159 || _1161;
            bool _1165 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1167 = _1163 || _1165;
            if (!_1167)
            {
                float _1169 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1171 = _1095 + _1169;
                float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1175 = _1173 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1179 = _1177 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1181 = 1.0 / _1175;
                float _1183 = _1171 * _1181;
                float _1185 = fma(_1183, _1179, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1127 = _1185;
                _1157 = true;
            }
            else
            {
                _1127 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1157 = false;
    float _1187 = _1127;
    float _1189 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1191 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1193 = _1065 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1197 = _1059 + _1195;
    float _1199 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1189);
    float _1201 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = fma(_1193, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1205 = fma(_1197, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1207 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1199);
    bool _1209 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.5);
    bool _1217 = _1213 || _1215;
    float _1219 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1221 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1223 = 1.0 / _1219;
    float _1225 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    bool _1227 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1239 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1241 = _1067 + _1239;
    float _1243 = _1237 + _1219;
    float _1245 = fma(_1241, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1247 = _1187;
    float _1249 = _1193;
    if (_1235)
    {
        _1247 = _1203;
    }
    float _1251 = _1247;
    float _1253 = _1243 * _1223;
    float _1255 = _1253 * 0.5;
    float _1257 = _1251;
    if (_1235)
    {
        _1249 = _1205;
    }
    float _1259 = _1249;
    float _1261 = _1259;
    if (_1235)
    {
        _1121 = _1245;
    }
    float _1263 = _1121;
    float _1265 = _1263;
    if (!_1235)
    {
        float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1269 = _957 + _1267;
        float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1273 = _835 + _1271;
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1277 = _1269 * _1269;
        float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1281 = _839 + _1279;
        float _1283 = fma(_1273, _1273, _1277);
        float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1287 = fma(_1281, _1281, _1283);
        float _1289 = sqrt(_1287);
        float _1291 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1293 = precise::min(_1289, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1295 = _1293 * _1285;
        float _1297 = -_835;
        float _1299 = _1297 + _1203;
        float _1301 = -_839;
        float _1303 = _1301 + _1245;
        float _1305 = _1291 * _1295;
        float _1307 = -_957;
        float _1309 = _1307 + _1205;
        float _1311 = fma(_1299, _1305, _835);
        float _1313 = fma(_1309, _1305, _957);
        float _1315 = fma(_1303, _1305, _839);
        _1261 = _1313;
        _1257 = _1311;
        _1265 = _1315;
    }
    float _1317 = _1261;
    float _1319 = _1257;
    float _1321 = _1265;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1325 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1323);
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1333 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    float _1337 = 1.0 / _1325;
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1331);
    float _1343 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1335);
    float _1345 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1333);
    float _1347 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1349 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1341);
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1345);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1359 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1363 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1365 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1367 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1359);
    float _1369 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1361);
    float _1371 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1363);
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1365);
    float _1375 = _1359;
    float _1377 = _1355;
    if (_1217)
    {
        _1375 = 1.0;
    }
    float _1379 = _1375;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1383 = _1337 * _1381;
    float _1385 = _1379;
    if (_1217)
    {
        _1377 = 1.0;
    }
    float _1387 = _1377;
    float _1389 = _1387;
    if (!_1217)
    {
        float _1391 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1401 = _1399 * 0.15915493667125701904296875;
        float _1403 = _1393 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = 1.0 / _1397;
        float _1409 = _1401 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1405 * _1407;
        float _1415 = _1401 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1419;
        float _1423 = _1411 * _1413;
        float _1425 = 1.0 / _1421;
        float _1427 = 1.0 / _1423;
        float _1429 = _1417 * _1427;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = fma(_1383, _1429, _1431);
        float _1435 = _1433 * _1425;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1385 = _1437;
    }
    float _1439 = _1385;
    if (!_1217)
    {
        float _1441 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1443 * 6.283185482025146484375;
        float _1455 = sin(_1453);
        float _1457 = 1.0 / _1447;
        float _1459 = _1451 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        float _1463 = _1455 * _1457;
        float _1465 = _1451 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1461 * _1463;
        float _1471 = 1.0 / _1469;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1475 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1473;
        float _1477 = 1.0 / _1475;
        float _1479 = _1467 * _1471;
        float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1483 = fma(_1383, _1479, _1481);
        float _1485 = _1483 * _1477;
        float _1487 = precise::clamp(_1485, 0.0, 1.0);
        float _1489 = -_1487;
        float _1491 = _1489 + 1.0;
        _1389 = _1491;
    }
    float _1493 = _1389;
    float _1495 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1371);
    float _1499 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1373);
    bool _1501 = _1439 > 0.0;
    bool _1503 = isnan(_1439);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan(0.0);
    bool _1509 = _1505 || _1507;
    float _1511 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1367);
    float _1513 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1369);
    float _1515 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1497);
    float _1517 = _1439 * _1493;
    float _1519 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1499);
    bool _1521 = _1493 <= 0.0;
    bool _1523 = !_1509;
    bool _1525 = _1521 || _1523;
    float _1527 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1511);
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1531 = _1515 + _1519;
    float _1533 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1513);
    float _1535 = _1529 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1537 = _1531 * 0.5;
    out.gl_Position.x = _1527;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _1515;
    out.gl_Position.w = _1519;
    out.m_54.z = _1537;
    out.m_54.w = _1519;
    out.m_35.x = _1535;
    if (!_1525)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1539;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1157 = false;
    bool _753 = false;
    bool _575 = false;
    bool _401 = false;
    bool _255 = false;
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
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_89);
        out.gl_Position.z = _1595;
    }
    if (!_77)
    {
        return out;
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.z;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _93;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_119)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1667 = as_type<float>(_127);
        out.gl_Position.z = _1667;
    }
    if (_119)
    {
        return out;
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    float _153 = _149 * 0.15915493667125701904296875;
    bool _155 = !_147;
    int _157 = _155 ? (-1090519040) : 1056964608;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_143;
    int _173 = _171 ? (-1090519040) : 1056964608;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    out.m_46.x = as_type<float>(_173);
    out.m_46.y = as_type<float>(_157);
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_169, 0.5, 0.5);
    float _205 = float(_191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_197);
    float _213 = _205 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_203;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_73);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_263);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _295;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _291 * _303;
    float _321 = -_291;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = _317 * _323;
    float _329 = 1.0 / _299;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _267 * _305;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _263 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_343, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _339 * _329;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _327;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _351 * _327;
    float _367 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _371 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_367, _319, _369);
    float _377 = fma(_371, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_325;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _387 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_73);
        float _405 = 1.0 / _403;
        float _407 = _107 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = in.m_48.x;
    float _413 = in.m_48.y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = _409 + _415;
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    bool _431 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _433 = isnan(_409);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _451 = -_429;
    float _453 = _451 + 1.0;
    float _455 = 1.0 / _449;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _459 = 1.0 / _445;
    float _461 = _381 * _413;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _465 = _409 + _463;
    bool _467 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _469 = isnan(_409);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _379 * _411;
    float _481 = _465 * _455;
    float _483 = _477 * _453;
    float _485 = -_477;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _489;
    float _493 = _417 * _459;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _499;
    float _503 = _441 * _487;
    float _505 = fma(_491, _493, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _507 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _509 = fma(_501, _493, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _511 = -_441;
    float _513 = _511 + 1.0;
    float _515 = _505 * _503;
    float _517 = _507 * _503;
    float _519 = _509 * _503;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _533 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].x, _515);
    float _535 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].y, _517);
    float _537 = fma(_523, _481, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _539 = fma(_527, _481, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _541 = fma(_531, _481, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _543 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].z, _519);
    float _545 = fma(_537, _483, _533);
    float _547 = fma(_539, _483, _535);
    float _549 = fma(_541, _483, _543);
    float _551 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].x, _545);
    float _553 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].y, _547);
    float _555 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].z, _549);
    bool _557 = !_457;
    float _573;
    if (!_557)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _561 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_73);
        float _579 = 1.0 / _577;
        float _581 = _107 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _587 = _583 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _597 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _599 = isnan(_583);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_583);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _591;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _627;
    float _631 = -_607;
    float _633 = _631 + 1.0;
    bool _635 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _637 = isnan(_583);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _649 = 1.0 / _595;
    float _651 = 1.0 / _611;
    float _653 = _629 * _625;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = _623 * _633;
    float _661 = -_623;
    float _663 = _661 + 1.0;
    float _665 = fma(_653, _587, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _667;
    float _671 = _645 * _663;
    float _673 = _657 * _649;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _583 + _675;
    bool _679 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _681 = isnan(_583);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _665 * _671;
    float _693 = -_645;
    float _695 = _693 + 1.0;
    float _697 = fma(_673, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _701 = _583 + _699;
    float _703 = _669 * _651;
    float _705 = -_689;
    float _707 = _705 + 1.0;
    float _709 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    float _711 = fma(_703, _701, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _713 = _607 * _707;
    float _715 = fma(_697, _659, _709);
    float _717 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _719 = fma(_711, _713, _715);
    float _721 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _723 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[118].x, _719);
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_50.x = _729;
    out.m_50.y = _725;
    out.m_50.z = _731;
    out.m_50.w = _733;
    bool _735 = !_647;
    float _751;
    if (!_735)
    {
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _739 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_73);
        float _757 = 1.0 / _755;
        float _759 = _107 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = in.m_32.x;
    float _765 = in.m_32.y;
    float _767 = in.m_32.z;
    float _769 = _235 * _461;
    float _771 = _235 * _479;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _775 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _775 * _773;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _783;
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _793 = _779 * _777;
    float _795 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _799 = 1.0 / _785;
    float _801 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _803 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[26].x, _797);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _801);
    float _807 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _803);
    float _809 = _765 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _811 = _765 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _813 = _765 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _815 = 1.0 / _791;
    float _817 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[4].x, _809);
    float _819 = _807 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[6].x, _813);
    float _823 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[5].x, _811);
    float _825 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _817);
    float _827 = _805 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _829 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _821);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _833 = _761 + _831;
    float _835 = _825 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _837 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _823);
    float _839 = _829 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = _833 * _799;
    float _843 = _835 + _827;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _761 + _845;
    float _849 = _839 + _819;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _853 = _843 + _851;
    float _855 = _847 * _815;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _859 = _849 + _857;
    float _861 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _863 = _853 * _853;
    float _865 = _859 * _859;
    float _867 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[25].x, _861);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _873;
    float _877 = _863 + _865;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _879;
    bool _883 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _885 = isnan(_761);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_871, _841, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = sqrt(_877);
    float _899 = fma(_881, _841, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _901 = fma(_875, _841, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _903 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _905 = isnan(_761);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _867);
    bool _921 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _923 = isnan(_761);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _937 = _913 * _917;
    float _939 = -_913;
    float _941 = _939 + 1.0;
    float _943 = _919 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _953 = _931 * _941;
    float _955 = fma(_935, _855, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _957 = _837 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _959 = _897 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = fma(_947, _855, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _963 = fma(_951, _855, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _965 = _957 + _943;
    float _967 = _895 * _953;
    float _969 = _899 * _953;
    float _971 = _901 * _953;
    float _973 = -_931;
    float _975 = _973 + 1.0;
    float _977 = _951;
    float _979 = _895;
    float _981 = _947;
    float _983 = _899;
    float _985 = _901;
    float _987 = _893;
    if (!_959)
    {
        _977 = _865;
    }
    float _989 = _977;
    float _991 = _989;
    if (!_959)
    {
        _979 = _863;
    }
    float _993 = _979;
    float _995 = _993;
    if (!_959)
    {
        _981 = _843;
    }
    float _997 = _981;
    float _999 = _997;
    if (!_959)
    {
        _983 = _849;
    }
    float _1001 = _983;
    float _1003 = _1001;
    if (!_959)
    {
        _985 = _965;
    }
    float _1005 = _985;
    bool _1007 = !_959;
    float _1009 = _1005;
    if (!_1007)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1015 = _897 + _1013;
        float _1017 = rsqrt(_877);
        float _1019 = _1015 * _1011;
        float _1021 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = _1019 * 0.15915493667125701904296875;
        float _1025 = _1023 * 6.283185482025146484375;
        float _1027 = sin(_1025);
        float _1029 = _1023 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        float _1033 = fma(_1027, _1021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1035 = _1017 * _1033;
        float _1037 = _1031 + (-1.0);
        float _1039 = fma(_853, _1035, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1041 = fma(_859, _1035, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1043 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1047 = _1039 + _1045;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1051 = _1041 + _1049;
        float _1053 = fma(_965, _1031, _1043);
        float _1055 = _1047 * _1047;
        float _1057 = _1051 * _1051;
        _1009 = _1053;
        _995 = _1055;
        _991 = _1057;
        _999 = _1039;
        _1003 = _1041;
    }
    float _1059 = _1009;
    float _1061 = _995;
    float _1063 = _991;
    float _1065 = _999;
    float _1067 = _1003;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1071 = _1059 + _1069;
    float _1073 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].x, _967);
    float _1075 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].y, _969);
    float _1077 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].z, _971);
    float _1079 = fma(_1071, _1071, _1061);
    float _1081 = fma(_955, _937, _1073);
    float _1083 = fma(_961, _937, _1075);
    float _1085 = fma(_963, _937, _1077);
    float _1087 = _1079 + _1063;
    float _1089 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1081);
    float _1091 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1083);
    float _1093 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1085);
    float _1095 = sqrt(_1087);
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1101 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1103 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1109 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1107;
    out.m_52.y = _1103;
    out.m_52.z = _1109;
    out.m_52.w = _1105;
    bool _1111 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1113 = isnan(_1095);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1119 = _1115 || _1117;
    float _1121 = _1067;
    if (!_1119)
    {
        _987 = 1.0;
    }
    float _1123 = _987;
    bool _1125 = !_1119;
    float _1127 = _1123;
    if (!_1125)
    {
        bool _1129 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1131 = isnan(_1095);
        bool _1133 = _1129 || _1131;
        bool _1135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1137 = _1133 || _1135;
        if (!_1137)
        {
            float _1139 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1141 = _1095 + _1139;
            float _1143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1145 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1143;
            float _1147 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1149 = _1147 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1151 = 1.0 / _1145;
            float _1153 = _1141 * _1151;
            float _1155 = fma(_1153, _1149, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1127 = _1155;
            _1157 = true;
        }
        else
        {
            bool _1159 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1161 = isnan(_1095);
            bool _1163 = _1159 || _1161;
            bool _1165 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1167 = _1163 || _1165;
            if (!_1167)
            {
                float _1169 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1171 = _1095 + _1169;
                float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1175 = _1173 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1179 = _1177 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1181 = 1.0 / _1175;
                float _1183 = _1171 * _1181;
                float _1185 = fma(_1183, _1179, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1127 = _1185;
                _1157 = true;
            }
            else
            {
                _1127 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1157 = false;
    float _1187 = _1127;
    float _1189 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1191 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1193 = _1065 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1197 = _1059 + _1195;
    float _1199 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1189);
    float _1201 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = fma(_1193, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1205 = fma(_1197, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1207 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1199);
    bool _1209 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.5);
    bool _1217 = _1213 || _1215;
    float _1219 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1221 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1223 = 1.0 / _1219;
    float _1225 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    bool _1227 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1239 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1241 = _1067 + _1239;
    float _1243 = _1237 + _1219;
    float _1245 = fma(_1241, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1247 = _1187;
    float _1249 = _1193;
    if (_1235)
    {
        _1247 = _1203;
    }
    float _1251 = _1247;
    float _1253 = _1243 * _1223;
    float _1255 = _1253 * 0.5;
    float _1257 = _1251;
    if (_1235)
    {
        _1249 = _1205;
    }
    float _1259 = _1249;
    float _1261 = _1259;
    if (_1235)
    {
        _1121 = _1245;
    }
    float _1263 = _1121;
    float _1265 = _1263;
    if (!_1235)
    {
        float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1269 = _957 + _1267;
        float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1273 = _835 + _1271;
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1277 = _1269 * _1269;
        float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1281 = _839 + _1279;
        float _1283 = fma(_1273, _1273, _1277);
        float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1287 = fma(_1281, _1281, _1283);
        float _1289 = sqrt(_1287);
        float _1291 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1293 = precise::min(_1289, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1295 = _1293 * _1285;
        float _1297 = -_835;
        float _1299 = _1297 + _1203;
        float _1301 = -_839;
        float _1303 = _1301 + _1245;
        float _1305 = _1291 * _1295;
        float _1307 = -_957;
        float _1309 = _1307 + _1205;
        float _1311 = fma(_1299, _1305, _835);
        float _1313 = fma(_1309, _1305, _957);
        float _1315 = fma(_1303, _1305, _839);
        _1261 = _1313;
        _1257 = _1311;
        _1265 = _1315;
    }
    float _1317 = _1261;
    float _1319 = _1257;
    float _1321 = _1265;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1325 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1323);
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1333 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    float _1337 = 1.0 / _1325;
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1331);
    float _1343 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1335);
    float _1345 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1333);
    float _1347 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1349 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1341);
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1345);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1359 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1363 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1365 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1367 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1359);
    float _1369 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1361);
    float _1371 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1363);
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1365);
    float _1375 = _1359;
    float _1377 = _1355;
    if (_1217)
    {
        _1375 = 1.0;
    }
    float _1379 = _1375;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1383 = _1337 * _1381;
    float _1385 = _1379;
    if (_1217)
    {
        _1377 = 1.0;
    }
    float _1387 = _1377;
    float _1389 = _1387;
    if (!_1217)
    {
        float _1391 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1401 = _1399 * 0.15915493667125701904296875;
        float _1403 = _1393 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = 1.0 / _1397;
        float _1409 = _1401 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1405 * _1407;
        float _1415 = _1401 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1419;
        float _1423 = _1411 * _1413;
        float _1425 = 1.0 / _1421;
        float _1427 = 1.0 / _1423;
        float _1429 = _1417 * _1427;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = fma(_1383, _1429, _1431);
        float _1435 = _1433 * _1425;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1385 = _1437;
    }
    float _1439 = _1385;
    if (!_1217)
    {
        float _1441 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1443 * 6.283185482025146484375;
        float _1455 = sin(_1453);
        float _1457 = 1.0 / _1447;
        float _1459 = _1451 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        float _1463 = _1455 * _1457;
        float _1465 = _1451 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1461 * _1463;
        float _1471 = 1.0 / _1469;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1475 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1473;
        float _1477 = 1.0 / _1475;
        float _1479 = _1467 * _1471;
        float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1483 = fma(_1383, _1479, _1481);
        float _1485 = _1483 * _1477;
        float _1487 = precise::clamp(_1485, 0.0, 1.0);
        float _1489 = -_1487;
        float _1491 = _1489 + 1.0;
        _1389 = _1491;
    }
    float _1493 = _1389;
    float _1495 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1371);
    float _1499 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1373);
    bool _1501 = _1439 > 0.0;
    bool _1503 = isnan(_1439);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan(0.0);
    bool _1509 = _1505 || _1507;
    float _1511 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1367);
    float _1513 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1369);
    float _1515 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1497);
    float _1517 = _1439 * _1493;
    float _1519 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1499);
    bool _1521 = _1493 <= 0.0;
    bool _1523 = !_1509;
    bool _1525 = _1521 || _1523;
    float _1527 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1511);
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1531 = _1515 + _1519;
    float _1533 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1513);
    float _1535 = _1529 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1537 = _1531 * 0.5;
    out.gl_Position.x = _1527;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _1515;
    out.gl_Position.w = _1519;
    out.m_54.z = _1537;
    out.m_54.w = _1519;
    out.m_35.x = _1535;
    if (!_1525)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1539;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1157 = false;
    bool _753 = false;
    bool _575 = false;
    bool _401 = false;
    bool _255 = false;
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
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_89);
        out.gl_Position.z = _1595;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.z;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _93;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_119)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1667 = as_type<float>(_127);
        out.gl_Position.z = _1667;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    float _153 = _149 * 0.15915493667125701904296875;
    bool _155 = !_147;
    int _157 = _155 ? (-1090519040) : 1056964608;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_143;
    int _173 = _171 ? (-1090519040) : 1056964608;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    out.m_46.x = as_type<float>(_173);
    out.m_46.y = as_type<float>(_157);
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_169, 0.5, 0.5);
    float _205 = float(_191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_197);
    float _213 = _205 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_203;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_73);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_263);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _295;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _291 * _303;
    float _321 = -_291;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = _317 * _323;
    float _329 = 1.0 / _299;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _267 * _305;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _263 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_343, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _339 * _329;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _327;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _351 * _327;
    float _367 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _371 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_367, _319, _369);
    float _377 = fma(_371, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_325;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _387 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_73);
        float _405 = 1.0 / _403;
        float _407 = _107 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = in.m_48.x;
    float _413 = in.m_48.y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = _409 + _415;
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    bool _431 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _433 = isnan(_409);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _451 = -_429;
    float _453 = _451 + 1.0;
    float _455 = 1.0 / _449;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _459 = 1.0 / _445;
    float _461 = _381 * _413;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _465 = _409 + _463;
    bool _467 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _469 = isnan(_409);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _379 * _411;
    float _481 = _465 * _455;
    float _483 = _477 * _453;
    float _485 = -_477;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _489;
    float _493 = _417 * _459;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _499;
    float _503 = _441 * _487;
    float _505 = fma(_491, _493, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _507 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _509 = fma(_501, _493, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _511 = -_441;
    float _513 = _511 + 1.0;
    float _515 = _505 * _503;
    float _517 = _507 * _503;
    float _519 = _509 * _503;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _533 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].x, _515);
    float _535 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].y, _517);
    float _537 = fma(_523, _481, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _539 = fma(_527, _481, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _541 = fma(_531, _481, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _543 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[107].z, _519);
    float _545 = fma(_537, _483, _533);
    float _547 = fma(_539, _483, _535);
    float _549 = fma(_541, _483, _543);
    float _551 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].x, _545);
    float _553 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].y, _547);
    float _555 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[109].z, _549);
    bool _557 = !_457;
    float _573;
    if (!_557)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _561 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_73);
        float _579 = 1.0 / _577;
        float _581 = _107 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _587 = _583 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _597 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _599 = isnan(_583);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_583);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _591;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _627;
    float _631 = -_607;
    float _633 = _631 + 1.0;
    bool _635 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _637 = isnan(_583);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _649 = 1.0 / _595;
    float _651 = 1.0 / _611;
    float _653 = _629 * _625;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = _623 * _633;
    float _661 = -_623;
    float _663 = _661 + 1.0;
    float _665 = fma(_653, _587, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _667;
    float _671 = _645 * _663;
    float _673 = _657 * _649;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _583 + _675;
    bool _679 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _681 = isnan(_583);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _665 * _671;
    float _693 = -_645;
    float _695 = _693 + 1.0;
    float _697 = fma(_673, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _701 = _583 + _699;
    float _703 = _669 * _651;
    float _705 = -_689;
    float _707 = _705 + 1.0;
    float _709 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    float _711 = fma(_703, _701, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _713 = _607 * _707;
    float _715 = fma(_697, _659, _709);
    float _717 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _719 = fma(_711, _713, _715);
    float _721 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _723 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[118].x, _719);
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_50.x = _729;
    out.m_50.y = _725;
    out.m_50.z = _731;
    out.m_50.w = _733;
    bool _735 = !_647;
    float _751;
    if (!_735)
    {
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _739 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_73);
        float _757 = 1.0 / _755;
        float _759 = _107 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = in.m_32.x;
    float _765 = in.m_32.y;
    float _767 = in.m_32.z;
    float _769 = _235 * _461;
    float _771 = _235 * _479;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _775 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _775 * _773;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _783;
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _793 = _779 * _777;
    float _795 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _799 = 1.0 / _785;
    float _801 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _803 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[26].x, _797);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _801);
    float _807 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _803);
    float _809 = _765 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _811 = _765 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _813 = _765 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _815 = 1.0 / _791;
    float _817 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[4].x, _809);
    float _819 = _807 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[6].x, _813);
    float _823 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[5].x, _811);
    float _825 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _817);
    float _827 = _805 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _829 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _821);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _833 = _761 + _831;
    float _835 = _825 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _837 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _823);
    float _839 = _829 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = _833 * _799;
    float _843 = _835 + _827;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _761 + _845;
    float _849 = _839 + _819;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _853 = _843 + _851;
    float _855 = _847 * _815;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _859 = _849 + _857;
    float _861 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _863 = _853 * _853;
    float _865 = _859 * _859;
    float _867 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[25].x, _861);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _873;
    float _877 = _863 + _865;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _879;
    bool _883 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _885 = isnan(_761);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_871, _841, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = sqrt(_877);
    float _899 = fma(_881, _841, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _901 = fma(_875, _841, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _903 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _905 = isnan(_761);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _867);
    bool _921 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _923 = isnan(_761);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _937 = _913 * _917;
    float _939 = -_913;
    float _941 = _939 + 1.0;
    float _943 = _919 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _953 = _931 * _941;
    float _955 = fma(_935, _855, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _957 = _837 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _959 = _897 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = fma(_947, _855, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _963 = fma(_951, _855, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _965 = _957 + _943;
    float _967 = _895 * _953;
    float _969 = _899 * _953;
    float _971 = _901 * _953;
    float _973 = -_931;
    float _975 = _973 + 1.0;
    float _977 = _951;
    float _979 = _895;
    float _981 = _947;
    float _983 = _899;
    float _985 = _901;
    float _987 = _893;
    if (!_959)
    {
        _977 = _865;
    }
    float _989 = _977;
    float _991 = _989;
    if (!_959)
    {
        _979 = _863;
    }
    float _993 = _979;
    float _995 = _993;
    if (!_959)
    {
        _981 = _843;
    }
    float _997 = _981;
    float _999 = _997;
    if (!_959)
    {
        _983 = _849;
    }
    float _1001 = _983;
    float _1003 = _1001;
    if (!_959)
    {
        _985 = _965;
    }
    float _1005 = _985;
    bool _1007 = !_959;
    float _1009 = _1005;
    if (!_1007)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1015 = _897 + _1013;
        float _1017 = rsqrt(_877);
        float _1019 = _1015 * _1011;
        float _1021 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1023 = _1019 * 0.15915493667125701904296875;
        float _1025 = _1023 * 6.283185482025146484375;
        float _1027 = sin(_1025);
        float _1029 = _1023 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        float _1033 = fma(_1027, _1021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1035 = _1017 * _1033;
        float _1037 = _1031 + (-1.0);
        float _1039 = fma(_853, _1035, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1041 = fma(_859, _1035, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1043 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1047 = _1039 + _1045;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1051 = _1041 + _1049;
        float _1053 = fma(_965, _1031, _1043);
        float _1055 = _1047 * _1047;
        float _1057 = _1051 * _1051;
        _1009 = _1053;
        _995 = _1055;
        _991 = _1057;
        _999 = _1039;
        _1003 = _1041;
    }
    float _1059 = _1009;
    float _1061 = _995;
    float _1063 = _991;
    float _1065 = _999;
    float _1067 = _1003;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1071 = _1059 + _1069;
    float _1073 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].x, _967);
    float _1075 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].y, _969);
    float _1077 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].z, _971);
    float _1079 = fma(_1071, _1071, _1061);
    float _1081 = fma(_955, _937, _1073);
    float _1083 = fma(_961, _937, _1075);
    float _1085 = fma(_963, _937, _1077);
    float _1087 = _1079 + _1063;
    float _1089 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1081);
    float _1091 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1083);
    float _1093 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1085);
    float _1095 = sqrt(_1087);
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1101 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1103 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1109 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1107;
    out.m_52.y = _1103;
    out.m_52.z = _1109;
    out.m_52.w = _1105;
    bool _1111 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1113 = isnan(_1095);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1119 = _1115 || _1117;
    float _1121 = _1067;
    if (!_1119)
    {
        _987 = 1.0;
    }
    float _1123 = _987;
    bool _1125 = !_1119;
    float _1127 = _1123;
    if (!_1125)
    {
        bool _1129 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1131 = isnan(_1095);
        bool _1133 = _1129 || _1131;
        bool _1135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1137 = _1133 || _1135;
        if (!_1137)
        {
            float _1139 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1141 = _1095 + _1139;
            float _1143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1145 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1143;
            float _1147 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1149 = _1147 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1151 = 1.0 / _1145;
            float _1153 = _1141 * _1151;
            float _1155 = fma(_1153, _1149, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1127 = _1155;
            _1157 = true;
        }
        else
        {
            bool _1159 = _1095 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1161 = isnan(_1095);
            bool _1163 = _1159 || _1161;
            bool _1165 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1167 = _1163 || _1165;
            if (!_1167)
            {
                float _1169 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1171 = _1095 + _1169;
                float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1175 = _1173 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1179 = _1177 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1181 = 1.0 / _1175;
                float _1183 = _1171 * _1181;
                float _1185 = fma(_1183, _1179, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1127 = _1185;
                _1157 = true;
            }
            else
            {
                _1127 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1157 = false;
    float _1187 = _1127;
    float _1189 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1191 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1193 = _1065 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1197 = _1059 + _1195;
    float _1199 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1189);
    float _1201 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1203 = fma(_1193, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1205 = fma(_1197, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1207 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1199);
    bool _1209 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.5);
    bool _1217 = _1213 || _1215;
    float _1219 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1221 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1201);
    float _1223 = 1.0 / _1219;
    float _1225 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    bool _1227 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1239 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1241 = _1067 + _1239;
    float _1243 = _1237 + _1219;
    float _1245 = fma(_1241, _1187, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1247 = _1187;
    float _1249 = _1193;
    if (_1235)
    {
        _1247 = _1203;
    }
    float _1251 = _1247;
    float _1253 = _1243 * _1223;
    float _1255 = _1253 * 0.5;
    float _1257 = _1251;
    if (_1235)
    {
        _1249 = _1205;
    }
    float _1259 = _1249;
    float _1261 = _1259;
    if (_1235)
    {
        _1121 = _1245;
    }
    float _1263 = _1121;
    float _1265 = _1263;
    if (!_1235)
    {
        float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1269 = _957 + _1267;
        float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1273 = _835 + _1271;
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1277 = _1269 * _1269;
        float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1281 = _839 + _1279;
        float _1283 = fma(_1273, _1273, _1277);
        float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1287 = fma(_1281, _1281, _1283);
        float _1289 = sqrt(_1287);
        float _1291 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1293 = precise::min(_1289, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1295 = _1293 * _1285;
        float _1297 = -_835;
        float _1299 = _1297 + _1203;
        float _1301 = -_839;
        float _1303 = _1301 + _1245;
        float _1305 = _1291 * _1295;
        float _1307 = -_957;
        float _1309 = _1307 + _1205;
        float _1311 = fma(_1299, _1305, _835);
        float _1313 = fma(_1309, _1305, _957);
        float _1315 = fma(_1303, _1305, _839);
        _1261 = _1313;
        _1257 = _1311;
        _1265 = _1315;
    }
    float _1317 = _1261;
    float _1319 = _1257;
    float _1321 = _1265;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1325 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1323);
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1333 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1327);
    float _1337 = 1.0 / _1325;
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1331);
    float _1343 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1335);
    float _1345 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1333);
    float _1347 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1349 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1341);
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1345);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1359 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1363 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1365 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1367 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1359);
    float _1369 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1361);
    float _1371 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1363);
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1365);
    float _1375 = _1359;
    float _1377 = _1355;
    if (_1217)
    {
        _1375 = 1.0;
    }
    float _1379 = _1375;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1383 = _1337 * _1381;
    float _1385 = _1379;
    if (_1217)
    {
        _1377 = 1.0;
    }
    float _1387 = _1377;
    float _1389 = _1387;
    if (!_1217)
    {
        float _1391 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1401 = _1399 * 0.15915493667125701904296875;
        float _1403 = _1393 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = 1.0 / _1397;
        float _1409 = _1401 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1405 * _1407;
        float _1415 = _1401 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1419;
        float _1423 = _1411 * _1413;
        float _1425 = 1.0 / _1421;
        float _1427 = 1.0 / _1423;
        float _1429 = _1417 * _1427;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = fma(_1383, _1429, _1431);
        float _1435 = _1433 * _1425;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1385 = _1437;
    }
    float _1439 = _1385;
    if (!_1217)
    {
        float _1441 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1443 * 6.283185482025146484375;
        float _1455 = sin(_1453);
        float _1457 = 1.0 / _1447;
        float _1459 = _1451 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        float _1463 = _1455 * _1457;
        float _1465 = _1451 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1461 * _1463;
        float _1471 = 1.0 / _1469;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1475 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1473;
        float _1477 = 1.0 / _1475;
        float _1479 = _1467 * _1471;
        float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1483 = fma(_1383, _1479, _1481);
        float _1485 = _1483 * _1477;
        float _1487 = precise::clamp(_1485, 0.0, 1.0);
        float _1489 = -_1487;
        float _1491 = _1489 + 1.0;
        _1389 = _1491;
    }
    float _1493 = _1389;
    float _1495 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1371);
    float _1499 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1373);
    bool _1501 = _1439 > 0.0;
    bool _1503 = isnan(_1439);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan(0.0);
    bool _1509 = _1505 || _1507;
    float _1511 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1367);
    float _1513 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1369);
    float _1515 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1497);
    float _1517 = _1439 * _1493;
    float _1519 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1499);
    bool _1521 = _1493 <= 0.0;
    bool _1523 = !_1509;
    bool _1525 = _1521 || _1523;
    float _1527 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1511);
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1531 = _1515 + _1519;
    float _1533 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1513);
    float _1535 = _1529 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1537 = _1531 * 0.5;
    out.gl_Position.x = _1527;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _1515;
    out.gl_Position.w = _1519;
    out.m_54.z = _1537;
    out.m_54.w = _1519;
    out.m_35.x = _1535;
    if (!_1525)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1539;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

