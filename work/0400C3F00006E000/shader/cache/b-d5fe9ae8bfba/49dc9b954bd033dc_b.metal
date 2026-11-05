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
    float4 m_54 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_40 [[attribute(7)]];
    float4 m_42 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _667 = false;
    bool _493 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _85 = 0;
    if (!_79)
    {
        float _87 = _83 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1443 = as_type<float>(_89);
        out.gl_Position.z = _1443;
    }
    if (!_79)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_75);
        _109 = _111;
    }
    float _113 = _109;
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
        out.m_33.x = 0.0;
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
        float _1512 = as_type<float>(_127);
        out.gl_Position.z = _1512;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_40.x;
    float _137 = _133 * _131;
    int _139 = as_type<int>(_129) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_129) & 2;
    bool _145 = _143 != 0;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    bool _149 = !_145;
    float _151 = _149 ? (-0.5) : 0.5;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _147 * 6.283185482025146484375;
    float _163 = floor(_147);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_141;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    bool _175 = !_155;
    int _177 = _175 ? 0 : 1;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    bool _183 = !_173;
    int _185 = _183 ? 0 : 1;
    int _187 = abs(_177);
    int _189 = abs(_185);
    float _191 = -_163;
    float _193 = _147 + _191;
    float _195 = float(_187);
    float _197 = -_193;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_159;
    int _205 = _203 ? 0 : 1;
    float _207 = fma(_181, 0.5, 0.5);
    float _209 = abs(_199);
    float _211 = _195 * _209;
    bool _213 = _193 < 0.5;
    float _215 = float(_213);
    int _217 = abs(_205);
    float _219 = -_207;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_189);
    float _225 = -_215;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_217);
    float _231 = fma(_223, _221, _211);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_201;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _257 = float(_75);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = 1.0 / _279;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = 1.0 / _291;
    float _299 = 1.0 / _287;
    float _301 = _267 * _293;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_263);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _283;
    float _333 = _271 * _297;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_263);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _345 * _329;
    float _361 = _275 * _299;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _365 = _263 + _363;
    float _367 = -_357;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_373, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = _365 * _331;
    float _379 = -_345;
    float _381 = _379 + 1.0;
    bool _383 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_263);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = _325 * _369;
    float _405 = -_325;
    float _407 = _405 + 1.0;
    float _409 = fma(_397, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _411 = _357 * _381;
    float _413 = -_393;
    float _415 = _413 + 1.0;
    float _417 = _393 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = fma(_401, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _425;
    float _429 = _409 * _417;
    float _431 = _375 * _417;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    float _439 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _429);
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _431);
    float _443 = fma(_427, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _445 = fma(_437, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _455 = fma(_423, _403, _439);
    float _457 = fma(_433, _403, _441);
    float _459 = fma(_449, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _461 = fma(_453, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _463 = fma(_443, _411, _455);
    float _465 = fma(_445, _411, _457);
    float _467 = fma(_459, _359, _463);
    float _469 = fma(_461, _359, _465);
    float _471 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[147].x, _467);
    float _473 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[147].y, _469);
    bool _475 = !_295;
    float _491;
    if (!_475)
    {
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _479 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_75);
        float _497 = 1.0 / _495;
        float _499 = _107 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_42.x;
    float _505 = in.m_42.y;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = _501 + _507;
    bool _511 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _513 = isnan(_501);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _525;
    bool _545 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _547 = 1.0 / _529;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = _509 * _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _557 = _501 + _555;
    float _559 = _473 * _505;
    bool _561 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _563 = isnan(_501);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -_521;
    float _575 = _573 + 1.0;
    float _577 = fma(_551, _553, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _579 = _471 * _503;
    float _581 = _571 * _575;
    float _583 = -_571;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _591;
    float _595 = _557 * _547;
    float _597 = _541 * _585;
    float _599 = fma(_589, _553, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _601 = fma(_593, _553, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _603 = -_541;
    float _605 = _603 + 1.0;
    float _607 = _599 * _597;
    float _609 = _601 * _597;
    float _611 = _577 * _597;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _625 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].x, _607);
    float _627 = fma(_615, _595, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _629 = fma(_619, _595, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _631 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].y, _609);
    float _633 = fma(_623, _595, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _635 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].z, _611);
    float _637 = fma(_627, _581, _625);
    float _639 = fma(_629, _581, _631);
    float _641 = fma(_633, _581, _635);
    float _643 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].x, _637);
    float _645 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].y, _639);
    float _647 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].z, _641);
    bool _649 = !_545;
    float _665;
    if (!_649)
    {
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _653 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_75);
        float _671 = 1.0 / _669;
        float _673 = _107 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = in.m_30.x;
    float _679 = in.m_30.y;
    float _681 = in.m_30.z;
    bool _683 = _135 > 0.5;
    float _685 = _235 * _579;
    float _687 = in.m_44.x;
    float _689 = in.m_44.y;
    float _691 = in.m_44.z;
    float _693 = in.m_44.w;
    float _695 = _235 * _559;
    float _697 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _699 = in.m_46.x;
    float _701 = in.m_46.y;
    float _703 = in.m_46.z;
    float _705 = in.m_46.w;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = in.m_48.x;
    float _717 = in.m_48.y;
    float _719 = in.m_48.z;
    float _721 = in.m_48.w;
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _725 = in.m_40.y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _679 * _689;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _679 * _701;
    float _743 = fma(_677, _687, _737);
    out.m_50.x = _733;
    out.m_50.y = _735;
    out.m_50.z = _739;
    float _745 = _679 * _717;
    float _747 = fma(_677, _699, _741);
    float _749 = fma(_681, _691, _743);
    bool _751 = _725 > 0.5;
    float _753 = fma(_677, _715, _745);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _759 = -_169;
    int _761 = _683 ? as_type<int>(_759) : as_type<int>(_169);
    float _763 = fma(_681, _703, _747);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _769 = !_709;
    float _771 = _769 ? _169 : as_type<float>(_761);
    float _773 = 1.0 / _757;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _169);
    float _783 = fma(_681, _719, _753);
    float _785 = _779 * _723;
    float _787 = 1.0 / _767;
    float _789 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _791 = _783 + _721;
    float _793 = _785 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _795 = _785 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _749 + _693;
    float _799 = _763 + _705;
    bool _801 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _803 = isnan(_675);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = 1.0 / _777;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _823 = _799 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _825 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _827 = isnan(_675);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = _785 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _839 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _823);
    float _841 = _697 * _781;
    float _843 = _821 * _787;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[11].z, _839);
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _793);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _675 + _853;
    float _857 = _847 * _773;
    float _859 = _817 * _813;
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _863 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _851);
    float _865 = -_811;
    float _867 = _865 + 1.0;
    float _869 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _871 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _861);
    float _873 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _875 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _877 = isnan(_675);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _799 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _889 = _871 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _891 = _791 + _873;
    bool _893 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _895 = isnan(_675);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = -_885;
    float _907 = _905 + 1.0;
    float _909 = _797 + _889;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _891 + _911;
    float _915 = _849 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = _811 * _907;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _921 = _909 + _919;
    float _923 = _913 * _913;
    float _925 = -_835;
    float _927 = _925 + 1.0;
    float _929 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _887);
    float _931 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].x, _837);
    float _933 = fma(_921, _921, _923);
    float _935 = _835 * _867;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _939 = _675 + _937;
    float _941 = _903 * _927;
    float _943 = sqrt(_933);
    float _945 = -_903;
    float _947 = _945 + 1.0;
    float _949 = fma(_843, _939, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _951 = _869 * _941;
    float _953 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[10].z, _929);
    float _955 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _675 + _957;
    float _961 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[115].x, _951);
    float _963 = 1.0 / _915;
    float _965 = _953 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _967 = _955 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _969 = fma(_857, _959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _971 = fma(_949, _935, _961);
    float _973 = _965 + _915;
    float _975 = -_151;
    int _977 = _751 ? as_type<int>(_975) : as_type<int>(_151);
    float _979 = _799 + _967;
    bool _981 = _943 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = fma(_969, _917, _971);
    bool _987 = !_713;
    float _989 = _987 ? _151 : as_type<float>(_977);
    bool _991 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _993 = isnan(0.5);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _999 = _995 || _997;
    float _1001 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[118].x, _985);
    float _1003 = _973 * _963;
    float _1005 = _1003 * 0.5;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1009 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1007);
    float _1011 = _967;
    float _1013 = _909;
    float _1015 = _891;
    float _1017 = _921;
    float _1019 = _913;
    if (!_981)
    {
        _1011 = _979;
    }
    float _1021 = _1011;
    bool _1023 = !_981;
    float _1025 = _1021;
    if (!_1023)
    {
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1031 = _943 + _1029;
        float _1033 = rsqrt(_933);
        float _1035 = _1031 * _1027;
        float _1037 = _979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1035 * 0.15915493667125701904296875;
        float _1041 = _1039 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = _1043 + (-1.0);
        float _1051 = fma(_1047, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = _1033 * _1051;
        float _1057 = fma(_979, _1043, _1053);
        float _1059 = fma(_921, _1055, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1061 = fma(_913, _1055, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1013 = _1059;
        _1015 = _1061;
        _1025 = _1057;
    }
    float _1063 = _1013;
    float _1065 = _1015;
    float _1067 = _1025;
    float _1069 = _1067;
    if (_999)
    {
        _1017 = _1063;
    }
    float _1071 = _1017;
    float _1073 = _1071;
    if (_999)
    {
        _1019 = _1065;
    }
    float _1075 = _1019;
    float _1077 = _1075;
    if (!_999)
    {
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1081 = _799 + _1079;
        float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1085 = _797 + _1083;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = -_799;
        float _1091 = _1089 + _1067;
        float _1093 = _1081 * _1081;
        float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1097 = _791 + _1095;
        float _1099 = -_791;
        float _1101 = _1099 + _1065;
        float _1103 = fma(_1085, _1085, _1093);
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = fma(_1097, _1097, _1103);
        float _1109 = sqrt(_1107);
        float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1113 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1115 = _1113 * _1105;
        float _1117 = -_797;
        float _1119 = _1117 + _1063;
        float _1121 = _1111 * _1115;
        float _1123 = fma(_1119, _1121, _797);
        float _1125 = fma(_1091, _1121, _799);
        float _1127 = fma(_1101, _1121, _791);
        _1069 = _1125;
        _1073 = _1123;
        _1077 = _1127;
    }
    float _1129 = _1069;
    float _1131 = _1073;
    float _1133 = _1077;
    float _1135 = 1.0 / _1009;
    bool _1137 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1139 = isnan(0.5);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1145 = _1141 || _1143;
    float _1147 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1149 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1151 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1153 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1155 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1147);
    float _1157 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1149);
    float _1159 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1151);
    float _1161 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1153);
    float _1163 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1155);
    float _1165 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1157);
    float _1167 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1159);
    float _1169 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1161);
    float _1171 = _1161;
    float _1173 = _1133;
    if (_1145)
    {
        _1171 = 1.0;
    }
    float _1175 = _1171;
    float _1177 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1179 = _1175;
    if (_1145)
    {
        _1173 = 1.0;
    }
    float _1181 = _1173;
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1185 = _1135 * _1183;
    float _1187 = _1181;
    if (!_1145)
    {
        float _1189 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = _1189 * 0.15915493667125701904296875;
        float _1193 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1195 = _1191 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1193 * 0.15915493667125701904296875;
        float _1201 = _1191 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = 1.0 / _1197;
        float _1207 = _1199 * 6.283185482025146484375;
        float _1209 = cos(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = _1199 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = _1209 * _1211;
        float _1219 = 1.0 / _1217;
        float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1223 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1221;
        float _1225 = 1.0 / _1223;
        float _1227 = _1215 * _1219;
        float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1231 = fma(_1185, _1227, _1229);
        float _1233 = _1231 * _1225;
        float _1235 = precise::clamp(_1233, 0.0, 1.0);
        _1179 = _1235;
    }
    float _1237 = _1179;
    if (!_1145)
    {
        float _1239 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1239 * 0.15915493667125701904296875;
        float _1245 = _1241 * 0.15915493667125701904296875;
        float _1247 = _1243 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = _1243 * 6.283185482025146484375;
        float _1253 = sin(_1251);
        float _1255 = 1.0 / _1249;
        float _1257 = _1245 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        float _1261 = _1253 * _1255;
        float _1263 = _1245 * 6.283185482025146484375;
        float _1265 = sin(_1263);
        float _1267 = _1259 * _1261;
        float _1269 = 1.0 / _1267;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1273 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1271;
        float _1275 = 1.0 / _1273;
        float _1277 = _1265 * _1269;
        float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1281 = fma(_1185, _1277, _1279);
        float _1283 = _1281 * _1275;
        float _1285 = precise::clamp(_1283, 0.0, 1.0);
        float _1287 = -_1285;
        float _1289 = _1287 + 1.0;
        _1187 = _1289;
    }
    float _1291 = _1187;
    float _1293 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1295 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1297 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1299 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1301 = _1237 > 0.0;
    bool _1303 = isnan(_1237);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    float _1311 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1313 = _771 + 0.5;
    float _1315 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1295);
    float _1317 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1319 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1297);
    float _1321 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    float _1323 = _1237 * _1291;
    bool _1325 = _1291 <= 0.0;
    bool _1327 = !_1309;
    bool _1329 = _1325 || _1327;
    float _1331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1333 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1311);
    float _1335 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1339 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1341 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1343 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1345 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1333);
    float _1347 = _1335 * _983;
    float _1349 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1339);
    float _1351 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1337);
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1355 = -_989;
    float _1357 = _1355 + 0.5;
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1345);
    float _1361 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1363 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1367 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1369 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1371 = _1353 + _1359;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1379 = _1365 * _1331;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1385 = _1371 * 0.5;
    out.m_52.x = _1347;
    out.m_52.y = _1379;
    out.m_54.x = _1373;
    out.m_54.y = _1375;
    out.m_54.z = _1381;
    out.m_54.w = _1377;
    out.m_33.x = _1383;
    out.gl_Position.x = _1351;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1353;
    out.gl_Position.w = _1359;
    out.m_56.z = _1385;
    out.m_56.w = _1359;
    if (!_1329)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1387;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _667 = false;
    bool _493 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _85 = 0;
    if (!_79)
    {
        float _87 = _83 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1443 = as_type<float>(_89);
        out.gl_Position.z = _1443;
    }
    if (!_79)
    {
        return out;
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_75);
        _109 = _111;
    }
    float _113 = _109;
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
        out.m_33.x = 0.0;
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
        float _1512 = as_type<float>(_127);
        out.gl_Position.z = _1512;
    }
    if (_119)
    {
        return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_40.x;
    float _137 = _133 * _131;
    int _139 = as_type<int>(_129) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_129) & 2;
    bool _145 = _143 != 0;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    bool _149 = !_145;
    float _151 = _149 ? (-0.5) : 0.5;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _147 * 6.283185482025146484375;
    float _163 = floor(_147);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_141;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    bool _175 = !_155;
    int _177 = _175 ? 0 : 1;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    bool _183 = !_173;
    int _185 = _183 ? 0 : 1;
    int _187 = abs(_177);
    int _189 = abs(_185);
    float _191 = -_163;
    float _193 = _147 + _191;
    float _195 = float(_187);
    float _197 = -_193;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_159;
    int _205 = _203 ? 0 : 1;
    float _207 = fma(_181, 0.5, 0.5);
    float _209 = abs(_199);
    float _211 = _195 * _209;
    bool _213 = _193 < 0.5;
    float _215 = float(_213);
    int _217 = abs(_205);
    float _219 = -_207;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_189);
    float _225 = -_215;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_217);
    float _231 = fma(_223, _221, _211);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_201;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _257 = float(_75);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = 1.0 / _279;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = 1.0 / _291;
    float _299 = 1.0 / _287;
    float _301 = _267 * _293;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_263);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _283;
    float _333 = _271 * _297;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_263);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _345 * _329;
    float _361 = _275 * _299;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _365 = _263 + _363;
    float _367 = -_357;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_373, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = _365 * _331;
    float _379 = -_345;
    float _381 = _379 + 1.0;
    bool _383 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_263);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = _325 * _369;
    float _405 = -_325;
    float _407 = _405 + 1.0;
    float _409 = fma(_397, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _411 = _357 * _381;
    float _413 = -_393;
    float _415 = _413 + 1.0;
    float _417 = _393 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = fma(_401, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _425;
    float _429 = _409 * _417;
    float _431 = _375 * _417;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    float _439 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _429);
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _431);
    float _443 = fma(_427, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _445 = fma(_437, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _455 = fma(_423, _403, _439);
    float _457 = fma(_433, _403, _441);
    float _459 = fma(_449, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _461 = fma(_453, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _463 = fma(_443, _411, _455);
    float _465 = fma(_445, _411, _457);
    float _467 = fma(_459, _359, _463);
    float _469 = fma(_461, _359, _465);
    float _471 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[147].x, _467);
    float _473 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[147].y, _469);
    bool _475 = !_295;
    float _491;
    if (!_475)
    {
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _479 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_75);
        float _497 = 1.0 / _495;
        float _499 = _107 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_42.x;
    float _505 = in.m_42.y;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = _501 + _507;
    bool _511 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _513 = isnan(_501);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _525;
    bool _545 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _547 = 1.0 / _529;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = _509 * _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _557 = _501 + _555;
    float _559 = _473 * _505;
    bool _561 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _563 = isnan(_501);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -_521;
    float _575 = _573 + 1.0;
    float _577 = fma(_551, _553, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _579 = _471 * _503;
    float _581 = _571 * _575;
    float _583 = -_571;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _591;
    float _595 = _557 * _547;
    float _597 = _541 * _585;
    float _599 = fma(_589, _553, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _601 = fma(_593, _553, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _603 = -_541;
    float _605 = _603 + 1.0;
    float _607 = _599 * _597;
    float _609 = _601 * _597;
    float _611 = _577 * _597;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _625 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].x, _607);
    float _627 = fma(_615, _595, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _629 = fma(_619, _595, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _631 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].y, _609);
    float _633 = fma(_623, _595, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _635 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].z, _611);
    float _637 = fma(_627, _581, _625);
    float _639 = fma(_629, _581, _631);
    float _641 = fma(_633, _581, _635);
    float _643 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].x, _637);
    float _645 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].y, _639);
    float _647 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].z, _641);
    bool _649 = !_545;
    float _665;
    if (!_649)
    {
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _653 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_75);
        float _671 = 1.0 / _669;
        float _673 = _107 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = in.m_30.x;
    float _679 = in.m_30.y;
    float _681 = in.m_30.z;
    bool _683 = _135 > 0.5;
    float _685 = _235 * _579;
    float _687 = in.m_44.x;
    float _689 = in.m_44.y;
    float _691 = in.m_44.z;
    float _693 = in.m_44.w;
    float _695 = _235 * _559;
    float _697 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _699 = in.m_46.x;
    float _701 = in.m_46.y;
    float _703 = in.m_46.z;
    float _705 = in.m_46.w;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = in.m_48.x;
    float _717 = in.m_48.y;
    float _719 = in.m_48.z;
    float _721 = in.m_48.w;
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _725 = in.m_40.y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _679 * _689;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _679 * _701;
    float _743 = fma(_677, _687, _737);
    out.m_50.x = _733;
    out.m_50.y = _735;
    out.m_50.z = _739;
    float _745 = _679 * _717;
    float _747 = fma(_677, _699, _741);
    float _749 = fma(_681, _691, _743);
    bool _751 = _725 > 0.5;
    float _753 = fma(_677, _715, _745);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _759 = -_169;
    int _761 = _683 ? as_type<int>(_759) : as_type<int>(_169);
    float _763 = fma(_681, _703, _747);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _769 = !_709;
    float _771 = _769 ? _169 : as_type<float>(_761);
    float _773 = 1.0 / _757;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _169);
    float _783 = fma(_681, _719, _753);
    float _785 = _779 * _723;
    float _787 = 1.0 / _767;
    float _789 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _791 = _783 + _721;
    float _793 = _785 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _795 = _785 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _749 + _693;
    float _799 = _763 + _705;
    bool _801 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _803 = isnan(_675);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = 1.0 / _777;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _823 = _799 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _825 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _827 = isnan(_675);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = _785 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _839 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _823);
    float _841 = _697 * _781;
    float _843 = _821 * _787;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[11].z, _839);
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _793);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _675 + _853;
    float _857 = _847 * _773;
    float _859 = _817 * _813;
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _863 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _851);
    float _865 = -_811;
    float _867 = _865 + 1.0;
    float _869 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _871 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _861);
    float _873 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _875 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _877 = isnan(_675);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _799 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _889 = _871 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _891 = _791 + _873;
    bool _893 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _895 = isnan(_675);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = -_885;
    float _907 = _905 + 1.0;
    float _909 = _797 + _889;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _891 + _911;
    float _915 = _849 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = _811 * _907;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _921 = _909 + _919;
    float _923 = _913 * _913;
    float _925 = -_835;
    float _927 = _925 + 1.0;
    float _929 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _887);
    float _931 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].x, _837);
    float _933 = fma(_921, _921, _923);
    float _935 = _835 * _867;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _939 = _675 + _937;
    float _941 = _903 * _927;
    float _943 = sqrt(_933);
    float _945 = -_903;
    float _947 = _945 + 1.0;
    float _949 = fma(_843, _939, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _951 = _869 * _941;
    float _953 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[10].z, _929);
    float _955 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _675 + _957;
    float _961 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[115].x, _951);
    float _963 = 1.0 / _915;
    float _965 = _953 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _967 = _955 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _969 = fma(_857, _959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _971 = fma(_949, _935, _961);
    float _973 = _965 + _915;
    float _975 = -_151;
    int _977 = _751 ? as_type<int>(_975) : as_type<int>(_151);
    float _979 = _799 + _967;
    bool _981 = _943 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = fma(_969, _917, _971);
    bool _987 = !_713;
    float _989 = _987 ? _151 : as_type<float>(_977);
    bool _991 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _993 = isnan(0.5);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _999 = _995 || _997;
    float _1001 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[118].x, _985);
    float _1003 = _973 * _963;
    float _1005 = _1003 * 0.5;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1009 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1007);
    float _1011 = _967;
    float _1013 = _909;
    float _1015 = _891;
    float _1017 = _921;
    float _1019 = _913;
    if (!_981)
    {
        _1011 = _979;
    }
    float _1021 = _1011;
    bool _1023 = !_981;
    float _1025 = _1021;
    if (!_1023)
    {
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1031 = _943 + _1029;
        float _1033 = rsqrt(_933);
        float _1035 = _1031 * _1027;
        float _1037 = _979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1035 * 0.15915493667125701904296875;
        float _1041 = _1039 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = _1043 + (-1.0);
        float _1051 = fma(_1047, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = _1033 * _1051;
        float _1057 = fma(_979, _1043, _1053);
        float _1059 = fma(_921, _1055, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1061 = fma(_913, _1055, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1013 = _1059;
        _1015 = _1061;
        _1025 = _1057;
    }
    float _1063 = _1013;
    float _1065 = _1015;
    float _1067 = _1025;
    float _1069 = _1067;
    if (_999)
    {
        _1017 = _1063;
    }
    float _1071 = _1017;
    float _1073 = _1071;
    if (_999)
    {
        _1019 = _1065;
    }
    float _1075 = _1019;
    float _1077 = _1075;
    if (!_999)
    {
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1081 = _799 + _1079;
        float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1085 = _797 + _1083;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = -_799;
        float _1091 = _1089 + _1067;
        float _1093 = _1081 * _1081;
        float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1097 = _791 + _1095;
        float _1099 = -_791;
        float _1101 = _1099 + _1065;
        float _1103 = fma(_1085, _1085, _1093);
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = fma(_1097, _1097, _1103);
        float _1109 = sqrt(_1107);
        float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1113 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1115 = _1113 * _1105;
        float _1117 = -_797;
        float _1119 = _1117 + _1063;
        float _1121 = _1111 * _1115;
        float _1123 = fma(_1119, _1121, _797);
        float _1125 = fma(_1091, _1121, _799);
        float _1127 = fma(_1101, _1121, _791);
        _1069 = _1125;
        _1073 = _1123;
        _1077 = _1127;
    }
    float _1129 = _1069;
    float _1131 = _1073;
    float _1133 = _1077;
    float _1135 = 1.0 / _1009;
    bool _1137 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1139 = isnan(0.5);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1145 = _1141 || _1143;
    float _1147 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1149 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1151 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1153 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1155 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1147);
    float _1157 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1149);
    float _1159 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1151);
    float _1161 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1153);
    float _1163 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1155);
    float _1165 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1157);
    float _1167 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1159);
    float _1169 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1161);
    float _1171 = _1161;
    float _1173 = _1133;
    if (_1145)
    {
        _1171 = 1.0;
    }
    float _1175 = _1171;
    float _1177 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1179 = _1175;
    if (_1145)
    {
        _1173 = 1.0;
    }
    float _1181 = _1173;
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1185 = _1135 * _1183;
    float _1187 = _1181;
    if (!_1145)
    {
        float _1189 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = _1189 * 0.15915493667125701904296875;
        float _1193 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1195 = _1191 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1193 * 0.15915493667125701904296875;
        float _1201 = _1191 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = 1.0 / _1197;
        float _1207 = _1199 * 6.283185482025146484375;
        float _1209 = cos(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = _1199 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = _1209 * _1211;
        float _1219 = 1.0 / _1217;
        float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1223 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1221;
        float _1225 = 1.0 / _1223;
        float _1227 = _1215 * _1219;
        float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1231 = fma(_1185, _1227, _1229);
        float _1233 = _1231 * _1225;
        float _1235 = precise::clamp(_1233, 0.0, 1.0);
        _1179 = _1235;
    }
    float _1237 = _1179;
    if (!_1145)
    {
        float _1239 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1239 * 0.15915493667125701904296875;
        float _1245 = _1241 * 0.15915493667125701904296875;
        float _1247 = _1243 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = _1243 * 6.283185482025146484375;
        float _1253 = sin(_1251);
        float _1255 = 1.0 / _1249;
        float _1257 = _1245 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        float _1261 = _1253 * _1255;
        float _1263 = _1245 * 6.283185482025146484375;
        float _1265 = sin(_1263);
        float _1267 = _1259 * _1261;
        float _1269 = 1.0 / _1267;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1273 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1271;
        float _1275 = 1.0 / _1273;
        float _1277 = _1265 * _1269;
        float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1281 = fma(_1185, _1277, _1279);
        float _1283 = _1281 * _1275;
        float _1285 = precise::clamp(_1283, 0.0, 1.0);
        float _1287 = -_1285;
        float _1289 = _1287 + 1.0;
        _1187 = _1289;
    }
    float _1291 = _1187;
    float _1293 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1295 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1297 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1299 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1301 = _1237 > 0.0;
    bool _1303 = isnan(_1237);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    float _1311 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1313 = _771 + 0.5;
    float _1315 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1295);
    float _1317 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1319 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1297);
    float _1321 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    float _1323 = _1237 * _1291;
    bool _1325 = _1291 <= 0.0;
    bool _1327 = !_1309;
    bool _1329 = _1325 || _1327;
    float _1331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1333 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1311);
    float _1335 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1339 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1341 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1343 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1345 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1333);
    float _1347 = _1335 * _983;
    float _1349 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1339);
    float _1351 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1337);
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1355 = -_989;
    float _1357 = _1355 + 0.5;
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1345);
    float _1361 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1363 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1367 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1369 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1371 = _1353 + _1359;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1379 = _1365 * _1331;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1385 = _1371 * 0.5;
    out.m_52.x = _1347;
    out.m_52.y = _1379;
    out.m_54.x = _1373;
    out.m_54.y = _1375;
    out.m_54.z = _1381;
    out.m_54.w = _1377;
    out.m_33.x = _1383;
    out.gl_Position.x = _1351;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1353;
    out.gl_Position.w = _1359;
    out.m_56.z = _1385;
    out.m_56.w = _1359;
    if (!_1329)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1387;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _667 = false;
    bool _493 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _85 = 0;
    if (!_79)
    {
        float _87 = _83 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1443 = as_type<float>(_89);
        out.gl_Position.z = _1443;
    }
    if (!_79)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_75);
        _109 = _111;
    }
    float _113 = _109;
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
        out.m_33.x = 0.0;
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
        float _1512 = as_type<float>(_127);
        out.gl_Position.z = _1512;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_40.x;
    float _137 = _133 * _131;
    int _139 = as_type<int>(_129) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_129) & 2;
    bool _145 = _143 != 0;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    bool _149 = !_145;
    float _151 = _149 ? (-0.5) : 0.5;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _147 * 6.283185482025146484375;
    float _163 = floor(_147);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_141;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    bool _175 = !_155;
    int _177 = _175 ? 0 : 1;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    bool _183 = !_173;
    int _185 = _183 ? 0 : 1;
    int _187 = abs(_177);
    int _189 = abs(_185);
    float _191 = -_163;
    float _193 = _147 + _191;
    float _195 = float(_187);
    float _197 = -_193;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_159;
    int _205 = _203 ? 0 : 1;
    float _207 = fma(_181, 0.5, 0.5);
    float _209 = abs(_199);
    float _211 = _195 * _209;
    bool _213 = _193 < 0.5;
    float _215 = float(_213);
    int _217 = abs(_205);
    float _219 = -_207;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_189);
    float _225 = -_215;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_217);
    float _231 = fma(_223, _221, _211);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_201;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _257 = float(_75);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = 1.0 / _279;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = 1.0 / _291;
    float _299 = 1.0 / _287;
    float _301 = _267 * _293;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_263);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _283;
    float _333 = _271 * _297;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_263);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _345 * _329;
    float _361 = _275 * _299;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _365 = _263 + _363;
    float _367 = -_357;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_373, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = _365 * _331;
    float _379 = -_345;
    float _381 = _379 + 1.0;
    bool _383 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_263);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = _325 * _369;
    float _405 = -_325;
    float _407 = _405 + 1.0;
    float _409 = fma(_397, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _411 = _357 * _381;
    float _413 = -_393;
    float _415 = _413 + 1.0;
    float _417 = _393 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = fma(_401, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _425;
    float _429 = _409 * _417;
    float _431 = _375 * _417;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _435;
    float _439 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _429);
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _431);
    float _443 = fma(_427, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _445 = fma(_437, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _455 = fma(_423, _403, _439);
    float _457 = fma(_433, _403, _441);
    float _459 = fma(_449, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _461 = fma(_453, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _463 = fma(_443, _411, _455);
    float _465 = fma(_445, _411, _457);
    float _467 = fma(_459, _359, _463);
    float _469 = fma(_461, _359, _465);
    float _471 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[147].x, _467);
    float _473 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[147].y, _469);
    bool _475 = !_295;
    float _491;
    if (!_475)
    {
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _479 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_75);
        float _497 = 1.0 / _495;
        float _499 = _107 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_42.x;
    float _505 = in.m_42.y;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = _501 + _507;
    bool _511 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _513 = isnan(_501);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _525;
    bool _545 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _547 = 1.0 / _529;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = _509 * _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _557 = _501 + _555;
    float _559 = _473 * _505;
    bool _561 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _563 = isnan(_501);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -_521;
    float _575 = _573 + 1.0;
    float _577 = fma(_551, _553, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _579 = _471 * _503;
    float _581 = _571 * _575;
    float _583 = -_571;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _591;
    float _595 = _557 * _547;
    float _597 = _541 * _585;
    float _599 = fma(_589, _553, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _601 = fma(_593, _553, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _603 = -_541;
    float _605 = _603 + 1.0;
    float _607 = _599 * _597;
    float _609 = _601 * _597;
    float _611 = _577 * _597;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _625 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].x, _607);
    float _627 = fma(_615, _595, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _629 = fma(_619, _595, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _631 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].y, _609);
    float _633 = fma(_623, _595, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _635 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[107].z, _611);
    float _637 = fma(_627, _581, _625);
    float _639 = fma(_629, _581, _631);
    float _641 = fma(_633, _581, _635);
    float _643 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].x, _637);
    float _645 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].y, _639);
    float _647 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[109].z, _641);
    bool _649 = !_545;
    float _665;
    if (!_649)
    {
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _653 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_75);
        float _671 = 1.0 / _669;
        float _673 = _107 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = in.m_30.x;
    float _679 = in.m_30.y;
    float _681 = in.m_30.z;
    bool _683 = _135 > 0.5;
    float _685 = _235 * _579;
    float _687 = in.m_44.x;
    float _689 = in.m_44.y;
    float _691 = in.m_44.z;
    float _693 = in.m_44.w;
    float _695 = _235 * _559;
    float _697 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _699 = in.m_46.x;
    float _701 = in.m_46.y;
    float _703 = in.m_46.z;
    float _705 = in.m_46.w;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = in.m_48.x;
    float _717 = in.m_48.y;
    float _719 = in.m_48.z;
    float _721 = in.m_48.w;
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _725 = in.m_40.y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _679 * _689;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _679 * _701;
    float _743 = fma(_677, _687, _737);
    out.m_50.x = _733;
    out.m_50.y = _735;
    out.m_50.z = _739;
    float _745 = _679 * _717;
    float _747 = fma(_677, _699, _741);
    float _749 = fma(_681, _691, _743);
    bool _751 = _725 > 0.5;
    float _753 = fma(_677, _715, _745);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _759 = -_169;
    int _761 = _683 ? as_type<int>(_759) : as_type<int>(_169);
    float _763 = fma(_681, _703, _747);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _769 = !_709;
    float _771 = _769 ? _169 : as_type<float>(_761);
    float _773 = 1.0 / _757;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _169);
    float _783 = fma(_681, _719, _753);
    float _785 = _779 * _723;
    float _787 = 1.0 / _767;
    float _789 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _791 = _783 + _721;
    float _793 = _785 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _795 = _785 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _749 + _693;
    float _799 = _763 + _705;
    bool _801 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _803 = isnan(_675);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = 1.0 / _777;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _823 = _799 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _825 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _827 = isnan(_675);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = _785 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _839 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _823);
    float _841 = _697 * _781;
    float _843 = _821 * _787;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[11].z, _839);
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _793);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _675 + _853;
    float _857 = _847 * _773;
    float _859 = _817 * _813;
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _863 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _851);
    float _865 = -_811;
    float _867 = _865 + 1.0;
    float _869 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _871 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _861);
    float _873 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _875 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _877 = isnan(_675);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _799 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _889 = _871 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _891 = _791 + _873;
    bool _893 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _895 = isnan(_675);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = -_885;
    float _907 = _905 + 1.0;
    float _909 = _797 + _889;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _891 + _911;
    float _915 = _849 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = _811 * _907;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _921 = _909 + _919;
    float _923 = _913 * _913;
    float _925 = -_835;
    float _927 = _925 + 1.0;
    float _929 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _887);
    float _931 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].x, _837);
    float _933 = fma(_921, _921, _923);
    float _935 = _835 * _867;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _939 = _675 + _937;
    float _941 = _903 * _927;
    float _943 = sqrt(_933);
    float _945 = -_903;
    float _947 = _945 + 1.0;
    float _949 = fma(_843, _939, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _951 = _869 * _941;
    float _953 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[10].z, _929);
    float _955 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _675 + _957;
    float _961 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[115].x, _951);
    float _963 = 1.0 / _915;
    float _965 = _953 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _967 = _955 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _969 = fma(_857, _959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _971 = fma(_949, _935, _961);
    float _973 = _965 + _915;
    float _975 = -_151;
    int _977 = _751 ? as_type<int>(_975) : as_type<int>(_151);
    float _979 = _799 + _967;
    bool _981 = _943 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = fma(_969, _917, _971);
    bool _987 = !_713;
    float _989 = _987 ? _151 : as_type<float>(_977);
    bool _991 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _993 = isnan(0.5);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _999 = _995 || _997;
    float _1001 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[118].x, _985);
    float _1003 = _973 * _963;
    float _1005 = _1003 * 0.5;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1009 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1007);
    float _1011 = _967;
    float _1013 = _909;
    float _1015 = _891;
    float _1017 = _921;
    float _1019 = _913;
    if (!_981)
    {
        _1011 = _979;
    }
    float _1021 = _1011;
    bool _1023 = !_981;
    float _1025 = _1021;
    if (!_1023)
    {
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1031 = _943 + _1029;
        float _1033 = rsqrt(_933);
        float _1035 = _1031 * _1027;
        float _1037 = _979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1035 * 0.15915493667125701904296875;
        float _1041 = _1039 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = _1043 + (-1.0);
        float _1051 = fma(_1047, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = _1033 * _1051;
        float _1057 = fma(_979, _1043, _1053);
        float _1059 = fma(_921, _1055, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1061 = fma(_913, _1055, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1013 = _1059;
        _1015 = _1061;
        _1025 = _1057;
    }
    float _1063 = _1013;
    float _1065 = _1015;
    float _1067 = _1025;
    float _1069 = _1067;
    if (_999)
    {
        _1017 = _1063;
    }
    float _1071 = _1017;
    float _1073 = _1071;
    if (_999)
    {
        _1019 = _1065;
    }
    float _1075 = _1019;
    float _1077 = _1075;
    if (!_999)
    {
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1081 = _799 + _1079;
        float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1085 = _797 + _1083;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = -_799;
        float _1091 = _1089 + _1067;
        float _1093 = _1081 * _1081;
        float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1097 = _791 + _1095;
        float _1099 = -_791;
        float _1101 = _1099 + _1065;
        float _1103 = fma(_1085, _1085, _1093);
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = fma(_1097, _1097, _1103);
        float _1109 = sqrt(_1107);
        float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1113 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1115 = _1113 * _1105;
        float _1117 = -_797;
        float _1119 = _1117 + _1063;
        float _1121 = _1111 * _1115;
        float _1123 = fma(_1119, _1121, _797);
        float _1125 = fma(_1091, _1121, _799);
        float _1127 = fma(_1101, _1121, _791);
        _1069 = _1125;
        _1073 = _1123;
        _1077 = _1127;
    }
    float _1129 = _1069;
    float _1131 = _1073;
    float _1133 = _1077;
    float _1135 = 1.0 / _1009;
    bool _1137 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1139 = isnan(0.5);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1145 = _1141 || _1143;
    float _1147 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1149 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1151 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1153 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1155 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1147);
    float _1157 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1149);
    float _1159 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1151);
    float _1161 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1153);
    float _1163 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1155);
    float _1165 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1157);
    float _1167 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1159);
    float _1169 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1161);
    float _1171 = _1161;
    float _1173 = _1133;
    if (_1145)
    {
        _1171 = 1.0;
    }
    float _1175 = _1171;
    float _1177 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1179 = _1175;
    if (_1145)
    {
        _1173 = 1.0;
    }
    float _1181 = _1173;
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1185 = _1135 * _1183;
    float _1187 = _1181;
    if (!_1145)
    {
        float _1189 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = _1189 * 0.15915493667125701904296875;
        float _1193 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1195 = _1191 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1193 * 0.15915493667125701904296875;
        float _1201 = _1191 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = 1.0 / _1197;
        float _1207 = _1199 * 6.283185482025146484375;
        float _1209 = cos(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = _1199 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = _1209 * _1211;
        float _1219 = 1.0 / _1217;
        float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1223 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1221;
        float _1225 = 1.0 / _1223;
        float _1227 = _1215 * _1219;
        float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1231 = fma(_1185, _1227, _1229);
        float _1233 = _1231 * _1225;
        float _1235 = precise::clamp(_1233, 0.0, 1.0);
        _1179 = _1235;
    }
    float _1237 = _1179;
    if (!_1145)
    {
        float _1239 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1239 * 0.15915493667125701904296875;
        float _1245 = _1241 * 0.15915493667125701904296875;
        float _1247 = _1243 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = _1243 * 6.283185482025146484375;
        float _1253 = sin(_1251);
        float _1255 = 1.0 / _1249;
        float _1257 = _1245 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        float _1261 = _1253 * _1255;
        float _1263 = _1245 * 6.283185482025146484375;
        float _1265 = sin(_1263);
        float _1267 = _1259 * _1261;
        float _1269 = 1.0 / _1267;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1273 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1271;
        float _1275 = 1.0 / _1273;
        float _1277 = _1265 * _1269;
        float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1281 = fma(_1185, _1277, _1279);
        float _1283 = _1281 * _1275;
        float _1285 = precise::clamp(_1283, 0.0, 1.0);
        float _1287 = -_1285;
        float _1289 = _1287 + 1.0;
        _1187 = _1289;
    }
    float _1291 = _1187;
    float _1293 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1295 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1297 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1299 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1301 = _1237 > 0.0;
    bool _1303 = isnan(_1237);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    float _1311 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1313 = _771 + 0.5;
    float _1315 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1295);
    float _1317 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1319 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1297);
    float _1321 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    float _1323 = _1237 * _1291;
    bool _1325 = _1291 <= 0.0;
    bool _1327 = !_1309;
    bool _1329 = _1325 || _1327;
    float _1331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1333 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1311);
    float _1335 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1339 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1341 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1343 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1345 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1333);
    float _1347 = _1335 * _983;
    float _1349 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1339);
    float _1351 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1337);
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1355 = -_989;
    float _1357 = _1355 + 0.5;
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1345);
    float _1361 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1363 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1367 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1369 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1371 = _1353 + _1359;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1379 = _1365 * _1331;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1385 = _1371 * 0.5;
    out.m_52.x = _1347;
    out.m_52.y = _1379;
    out.m_54.x = _1373;
    out.m_54.y = _1375;
    out.m_54.z = _1381;
    out.m_54.w = _1377;
    out.m_33.x = _1383;
    out.gl_Position.x = _1351;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1353;
    out.gl_Position.w = _1359;
    out.m_56.z = _1385;
    out.m_56.w = _1359;
    if (!_1329)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1387;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

