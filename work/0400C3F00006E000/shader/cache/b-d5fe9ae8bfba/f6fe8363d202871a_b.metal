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
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_31 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(2)]];
    float4 m_33 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _545 = false;
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _999 = as_type<float>(_77);
        out.gl_Position.z = _999;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1068 = as_type<float>(_115);
        out.gl_Position.z = _1068;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    float _155 = -_141;
    float _157 = _137 + _155;
    bool _159 = !_133;
    int _161 = _159 ? 0 : 1;
    bool _163 = !_129;
    int _165 = _163 ? 0 : 1;
    int _167 = abs(_161);
    int _169 = abs(_165);
    float _171 = -_157;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _175 = float(_149);
    float _177 = fma(_153, 0.5, 0.5);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _181 = _157 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_173);
    float _187 = _175 * _185;
    float _189 = -_177;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_167);
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_169);
    float _201 = fma(_193, _191, _187);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_179;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _95 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_37.x;
    float _383 = in.m_37.y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    bool _389 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _391 = isnan(_379);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _379 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _413 = -_399;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _411;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _407;
    float _423 = _351 * _383;
    bool _425 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_379);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _439 = isnan(_379);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = _403 * _417;
    float _451 = _447 * _415;
    float _453 = -_447;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = _387 * _421;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _467;
    float _471 = _435 * _455;
    float _473 = fma(_459, _461, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = fma(_465, _461, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _477 = fma(_469, _461, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = -_435;
    float _481 = _479 + 1.0;
    float _483 = _473 * _471;
    float _485 = _475 * _471;
    float _487 = _477 * _471;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _501 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].x, _483);
    float _503 = fma(_491, _449, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _505 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].y, _485);
    float _507 = fma(_495, _449, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _509 = fma(_499, _449, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].z, _487);
    float _513 = fma(_503, _451, _505);
    float _515 = fma(_507, _451, _501);
    float _517 = fma(_509, _451, _511);
    float _519 = _349 * _381;
    float _521 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].y, _513);
    float _523 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].x, _515);
    float _525 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].z, _517);
    bool _527 = !_419;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_63);
        float _549 = 1.0 / _547;
        float _551 = _95 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = as_type<float>(int(gl_VertexIndex));
    float _557 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _559 = in.m_28.x;
    float _561 = in.m_28.y;
    float _563 = in.m_28.z;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = 1.0 / _567;
    float _577 = 1.0 / _573;
    int _579 = as_type<int>(_555) & 1;
    bool _581 = _579 != 0;
    int _583 = as_type<int>(_555) & 2;
    bool _585 = _583 != 0;
    float _587 = _561 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _589 = _561 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _591 = _561 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
    float _599 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[5].x, _589);
    float _601 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[6].x, _591);
    float _603 = _595 * _575;
    bool _605 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _607 = isnan(_553);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _553 + _617;
    float _621 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[4].z, _597);
    float _623 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[5].z, _599);
    float _625 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _631 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_553);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -_615;
    float _645 = _643 + 1.0;
    float _647 = fma(_603, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _649 = _629 * _577;
    bool _651 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_553);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_641;
    float _665 = _663 + 1.0;
    bool _667 = !_581;
    float _669 = _667 ? (-0.5) : 0.5;
    float _671 = _623 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _673 = _641 * _645;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _553 + _675;
    float _679 = _661 * _665;
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    bool _683 = !_585;
    float _685 = _683 ? (-0.5) : 0.5;
    float _687 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _689 = _671 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _691 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = _569 * _681;
    float _695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _685);
    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _689);
    float _699 = fma(_649, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _701 = _647 * _679;
    float _703 = _557 * _695;
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].z, _697);
    float _707 = -_661;
    float _709 = _707 + 1.0;
    float _711 = _671 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _715 = _705 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _717 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _723 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _711);
    float _725 = 1.0 / _715;
    float _727 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _729 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[25].x, _713);
    float _731 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _733 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[26].x, _719);
    float _735 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].z, _723);
    float _737 = fma(_699, _673, _721);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].z, _733);
    bool _745 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _747 = isnan(0.5);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _753 = _749 || _751;
    float _755 = _735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _757 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[117].x, _737);
    float _759 = _739 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _761 = _741 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + _715;
    float _765 = _743 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _767 = _671 + _759;
    float _769 = _687 + _761;
    float _771 = _763 * _725;
    float _773 = _771 * 0.5;
    float _775 = _691 + _765;
    float _777 = _767 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _779 = _767 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _781 = _767 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _783 = _767 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[0].x, _777);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[1].x, _779);
    float _789 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[2].x, _781);
    float _791 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[3].x, _783);
    float _793 = _777;
    if (_753)
    {
        _793 = 1.0;
    }
    float _795 = _793;
    float _797 = _795;
    if (!_753)
    {
        float _799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _801 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _803 = _799 * 0.15915493667125701904296875;
        float _805 = _801 * 0.15915493667125701904296875;
        float _807 = _803 * 6.283185482025146484375;
        float _809 = cos(_807);
        float _811 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _813 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _811);
        float _815 = _803 * 6.283185482025146484375;
        float _817 = sin(_815);
        float _819 = 1.0 / _809;
        float _821 = _805 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = _817 * _819;
        float _827 = _805 * 6.283185482025146484375;
        float _829 = sin(_827);
        float _831 = _823 * _825;
        float _833 = 1.0 / _813;
        float _835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _837 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _835;
        float _839 = 1.0 / _831;
        float _841 = 1.0 / _837;
        float _843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _845 = _833 * _843;
        float _847 = _829 * _839;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _851 = fma(_847, _845, _849);
        float _853 = _851 * _841;
        float _855 = precise::clamp(_853, 0.0, 1.0);
        float _857 = -_855;
        float _859 = _857 + 1.0;
        _797 = _859;
    }
    float _861 = _797;
    float _863 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _787);
    float _865 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _785);
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _869 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _789);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _791);
    float _875 = _865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _877 = _205 * _867;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _887 = _869 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[6].x, _879);
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[7].x, _881);
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[4].x, _883);
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[5].x, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].z, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _891);
    float _901 = _873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _893);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _895);
    float _907 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _909 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _897);
    float _911 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _899);
    bool _913 = _861 > 0.0;
    bool _915 = isnan(_861);
    bool _917 = _913 || _915;
    bool _919 = isnan(0.0);
    bool _921 = _917 || _919;
    float _923 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _925 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _927 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _903);
    float _929 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _905);
    float _931 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _909 + _911;
    float _935 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _941 = _933 * 0.5;
    out.m_31.x = _877;
    out.m_42.x = _931;
    out.m_42.y = _935;
    out.m_42.z = _937;
    out.m_42.w = _939;
    out.gl_Position.x = _927;
    out.gl_Position.y = _929;
    out.gl_Position.z = _909;
    out.gl_Position.w = _911;
    out.m_44.z = _941;
    out.m_44.w = _911;
    if (_921)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _943;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _545 = false;
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _999 = as_type<float>(_77);
        out.gl_Position.z = _999;
    }
    if (!_67)
    {
        return out;
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1068 = as_type<float>(_115);
        out.gl_Position.z = _1068;
    }
    if (_107)
    {
        return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    float _155 = -_141;
    float _157 = _137 + _155;
    bool _159 = !_133;
    int _161 = _159 ? 0 : 1;
    bool _163 = !_129;
    int _165 = _163 ? 0 : 1;
    int _167 = abs(_161);
    int _169 = abs(_165);
    float _171 = -_157;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _175 = float(_149);
    float _177 = fma(_153, 0.5, 0.5);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _181 = _157 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_173);
    float _187 = _175 * _185;
    float _189 = -_177;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_167);
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_169);
    float _201 = fma(_193, _191, _187);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_179;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _95 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_37.x;
    float _383 = in.m_37.y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    bool _389 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _391 = isnan(_379);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _379 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _413 = -_399;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _411;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _407;
    float _423 = _351 * _383;
    bool _425 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_379);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _439 = isnan(_379);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = _403 * _417;
    float _451 = _447 * _415;
    float _453 = -_447;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = _387 * _421;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _467;
    float _471 = _435 * _455;
    float _473 = fma(_459, _461, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = fma(_465, _461, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _477 = fma(_469, _461, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = -_435;
    float _481 = _479 + 1.0;
    float _483 = _473 * _471;
    float _485 = _475 * _471;
    float _487 = _477 * _471;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _501 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].x, _483);
    float _503 = fma(_491, _449, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _505 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].y, _485);
    float _507 = fma(_495, _449, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _509 = fma(_499, _449, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].z, _487);
    float _513 = fma(_503, _451, _505);
    float _515 = fma(_507, _451, _501);
    float _517 = fma(_509, _451, _511);
    float _519 = _349 * _381;
    float _521 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].y, _513);
    float _523 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].x, _515);
    float _525 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].z, _517);
    bool _527 = !_419;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_63);
        float _549 = 1.0 / _547;
        float _551 = _95 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = as_type<float>(int(gl_VertexIndex));
    float _557 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _559 = in.m_28.x;
    float _561 = in.m_28.y;
    float _563 = in.m_28.z;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = 1.0 / _567;
    float _577 = 1.0 / _573;
    int _579 = as_type<int>(_555) & 1;
    bool _581 = _579 != 0;
    int _583 = as_type<int>(_555) & 2;
    bool _585 = _583 != 0;
    float _587 = _561 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _589 = _561 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _591 = _561 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
    float _599 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[5].x, _589);
    float _601 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[6].x, _591);
    float _603 = _595 * _575;
    bool _605 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _607 = isnan(_553);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _553 + _617;
    float _621 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[4].z, _597);
    float _623 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[5].z, _599);
    float _625 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _631 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_553);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -_615;
    float _645 = _643 + 1.0;
    float _647 = fma(_603, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _649 = _629 * _577;
    bool _651 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_553);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_641;
    float _665 = _663 + 1.0;
    bool _667 = !_581;
    float _669 = _667 ? (-0.5) : 0.5;
    float _671 = _623 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _673 = _641 * _645;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _553 + _675;
    float _679 = _661 * _665;
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    bool _683 = !_585;
    float _685 = _683 ? (-0.5) : 0.5;
    float _687 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _689 = _671 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _691 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = _569 * _681;
    float _695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _685);
    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _689);
    float _699 = fma(_649, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _701 = _647 * _679;
    float _703 = _557 * _695;
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].z, _697);
    float _707 = -_661;
    float _709 = _707 + 1.0;
    float _711 = _671 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _715 = _705 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _717 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _723 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _711);
    float _725 = 1.0 / _715;
    float _727 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _729 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[25].x, _713);
    float _731 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _733 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[26].x, _719);
    float _735 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].z, _723);
    float _737 = fma(_699, _673, _721);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].z, _733);
    bool _745 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _747 = isnan(0.5);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _753 = _749 || _751;
    float _755 = _735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _757 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[117].x, _737);
    float _759 = _739 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _761 = _741 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + _715;
    float _765 = _743 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _767 = _671 + _759;
    float _769 = _687 + _761;
    float _771 = _763 * _725;
    float _773 = _771 * 0.5;
    float _775 = _691 + _765;
    float _777 = _767 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _779 = _767 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _781 = _767 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _783 = _767 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[0].x, _777);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[1].x, _779);
    float _789 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[2].x, _781);
    float _791 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[3].x, _783);
    float _793 = _777;
    if (_753)
    {
        _793 = 1.0;
    }
    float _795 = _793;
    float _797 = _795;
    if (!_753)
    {
        float _799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _801 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _803 = _799 * 0.15915493667125701904296875;
        float _805 = _801 * 0.15915493667125701904296875;
        float _807 = _803 * 6.283185482025146484375;
        float _809 = cos(_807);
        float _811 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _813 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _811);
        float _815 = _803 * 6.283185482025146484375;
        float _817 = sin(_815);
        float _819 = 1.0 / _809;
        float _821 = _805 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = _817 * _819;
        float _827 = _805 * 6.283185482025146484375;
        float _829 = sin(_827);
        float _831 = _823 * _825;
        float _833 = 1.0 / _813;
        float _835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _837 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _835;
        float _839 = 1.0 / _831;
        float _841 = 1.0 / _837;
        float _843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _845 = _833 * _843;
        float _847 = _829 * _839;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _851 = fma(_847, _845, _849);
        float _853 = _851 * _841;
        float _855 = precise::clamp(_853, 0.0, 1.0);
        float _857 = -_855;
        float _859 = _857 + 1.0;
        _797 = _859;
    }
    float _861 = _797;
    float _863 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _787);
    float _865 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _785);
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _869 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _789);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _791);
    float _875 = _865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _877 = _205 * _867;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _887 = _869 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[6].x, _879);
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[7].x, _881);
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[4].x, _883);
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[5].x, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].z, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _891);
    float _901 = _873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _893);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _895);
    float _907 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _909 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _897);
    float _911 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _899);
    bool _913 = _861 > 0.0;
    bool _915 = isnan(_861);
    bool _917 = _913 || _915;
    bool _919 = isnan(0.0);
    bool _921 = _917 || _919;
    float _923 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _925 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _927 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _903);
    float _929 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _905);
    float _931 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _909 + _911;
    float _935 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _941 = _933 * 0.5;
    out.m_31.x = _877;
    out.m_42.x = _931;
    out.m_42.y = _935;
    out.m_42.z = _937;
    out.m_42.w = _939;
    out.gl_Position.x = _927;
    out.gl_Position.y = _929;
    out.gl_Position.z = _909;
    out.gl_Position.w = _911;
    out.m_44.z = _941;
    out.m_44.w = _911;
    if (_921)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _943;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _545 = false;
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _999 = as_type<float>(_77);
        out.gl_Position.z = _999;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1068 = as_type<float>(_115);
        out.gl_Position.z = _1068;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    float _155 = -_141;
    float _157 = _137 + _155;
    bool _159 = !_133;
    int _161 = _159 ? 0 : 1;
    bool _163 = !_129;
    int _165 = _163 ? 0 : 1;
    int _167 = abs(_161);
    int _169 = abs(_165);
    float _171 = -_157;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _175 = float(_149);
    float _177 = fma(_153, 0.5, 0.5);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _181 = _157 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_173);
    float _187 = _175 * _185;
    float _189 = -_177;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_167);
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_169);
    float _201 = fma(_193, _191, _187);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_179;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _95 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_37.x;
    float _383 = in.m_37.y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    bool _389 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _391 = isnan(_379);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _379 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _413 = -_399;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _411;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _407;
    float _423 = _351 * _383;
    bool _425 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_379);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _439 = isnan(_379);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = _403 * _417;
    float _451 = _447 * _415;
    float _453 = -_447;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = _387 * _421;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _467;
    float _471 = _435 * _455;
    float _473 = fma(_459, _461, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = fma(_465, _461, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _477 = fma(_469, _461, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = -_435;
    float _481 = _479 + 1.0;
    float _483 = _473 * _471;
    float _485 = _475 * _471;
    float _487 = _477 * _471;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _501 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].x, _483);
    float _503 = fma(_491, _449, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _505 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].y, _485);
    float _507 = fma(_495, _449, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _509 = fma(_499, _449, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[107].z, _487);
    float _513 = fma(_503, _451, _505);
    float _515 = fma(_507, _451, _501);
    float _517 = fma(_509, _451, _511);
    float _519 = _349 * _381;
    float _521 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].y, _513);
    float _523 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].x, _515);
    float _525 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].z, _517);
    bool _527 = !_419;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_63);
        float _549 = 1.0 / _547;
        float _551 = _95 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = as_type<float>(int(gl_VertexIndex));
    float _557 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _559 = in.m_28.x;
    float _561 = in.m_28.y;
    float _563 = in.m_28.z;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = 1.0 / _567;
    float _577 = 1.0 / _573;
    int _579 = as_type<int>(_555) & 1;
    bool _581 = _579 != 0;
    int _583 = as_type<int>(_555) & 2;
    bool _585 = _583 != 0;
    float _587 = _561 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _589 = _561 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _591 = _561 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
    float _599 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[5].x, _589);
    float _601 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[6].x, _591);
    float _603 = _595 * _575;
    bool _605 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _607 = isnan(_553);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _553 + _617;
    float _621 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[4].z, _597);
    float _623 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[5].z, _599);
    float _625 = fma(_563, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _631 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_553);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -_615;
    float _645 = _643 + 1.0;
    float _647 = fma(_603, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _649 = _629 * _577;
    bool _651 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_553);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_641;
    float _665 = _663 + 1.0;
    bool _667 = !_581;
    float _669 = _667 ? (-0.5) : 0.5;
    float _671 = _623 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _673 = _641 * _645;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _553 + _675;
    float _679 = _661 * _665;
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    bool _683 = !_585;
    float _685 = _683 ? (-0.5) : 0.5;
    float _687 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _689 = _671 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _691 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = _569 * _681;
    float _695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _685);
    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _689);
    float _699 = fma(_649, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _701 = _647 * _679;
    float _703 = _557 * _695;
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].z, _697);
    float _707 = -_661;
    float _709 = _707 + 1.0;
    float _711 = _671 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _715 = _705 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _717 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _723 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _711);
    float _725 = 1.0 / _715;
    float _727 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _729 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[25].x, _713);
    float _731 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _733 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[26].x, _719);
    float _735 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].z, _723);
    float _737 = fma(_699, _673, _721);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].z, _733);
    bool _745 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _747 = isnan(0.5);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _753 = _749 || _751;
    float _755 = _735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _757 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[117].x, _737);
    float _759 = _739 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _761 = _741 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + _715;
    float _765 = _743 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _767 = _671 + _759;
    float _769 = _687 + _761;
    float _771 = _763 * _725;
    float _773 = _771 * 0.5;
    float _775 = _691 + _765;
    float _777 = _767 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _779 = _767 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _781 = _767 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _783 = _767 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[0].x, _777);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[1].x, _779);
    float _789 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[2].x, _781);
    float _791 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[3].x, _783);
    float _793 = _777;
    if (_753)
    {
        _793 = 1.0;
    }
    float _795 = _793;
    float _797 = _795;
    if (!_753)
    {
        float _799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _801 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _803 = _799 * 0.15915493667125701904296875;
        float _805 = _801 * 0.15915493667125701904296875;
        float _807 = _803 * 6.283185482025146484375;
        float _809 = cos(_807);
        float _811 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _813 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _811);
        float _815 = _803 * 6.283185482025146484375;
        float _817 = sin(_815);
        float _819 = 1.0 / _809;
        float _821 = _805 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = _817 * _819;
        float _827 = _805 * 6.283185482025146484375;
        float _829 = sin(_827);
        float _831 = _823 * _825;
        float _833 = 1.0 / _813;
        float _835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _837 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _835;
        float _839 = 1.0 / _831;
        float _841 = 1.0 / _837;
        float _843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _845 = _833 * _843;
        float _847 = _829 * _839;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _851 = fma(_847, _845, _849);
        float _853 = _851 * _841;
        float _855 = precise::clamp(_853, 0.0, 1.0);
        float _857 = -_855;
        float _859 = _857 + 1.0;
        _797 = _859;
    }
    float _861 = _797;
    float _863 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _787);
    float _865 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _785);
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _869 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _789);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _791);
    float _875 = _865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _877 = _205 * _867;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _887 = _869 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[6].x, _879);
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[7].x, _881);
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[4].x, _883);
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[5].x, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].z, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _891);
    float _901 = _873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _893);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _895);
    float _907 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _909 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _897);
    float _911 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _899);
    bool _913 = _861 > 0.0;
    bool _915 = isnan(_861);
    bool _917 = _913 || _915;
    bool _919 = isnan(0.0);
    bool _921 = _917 || _919;
    float _923 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _925 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _927 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _903);
    float _929 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _905);
    float _931 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _909 + _911;
    float _935 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _941 = _933 * 0.5;
    out.m_31.x = _877;
    out.m_42.x = _931;
    out.m_42.y = _935;
    out.m_42.z = _937;
    out.m_42.w = _939;
    out.gl_Position.x = _927;
    out.gl_Position.y = _929;
    out.gl_Position.z = _909;
    out.gl_Position.w = _911;
    out.m_44.z = _941;
    out.m_44.w = _911;
    if (_921)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _943;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

