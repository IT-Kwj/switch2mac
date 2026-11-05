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
    bool _325 = false;
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
    float _73 = _71;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _992 = as_type<float>(_79);
        out.gl_Position.z = _992;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    if (_93)
    {
        float _101 = float(_63);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _73;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1060 = as_type<float>(_115);
        out.gl_Position.z = _1060;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
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
        float _231 = _97 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -_249;
    float _257 = _255 + 1.0;
    bool _259 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_233);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _277 = 1.0 / _253;
    float _279 = _269 * _257;
    float _281 = -_269;
    float _283 = _281 + 1.0;
    float _285 = _237 * _277;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = fma(_273, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_289, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _279;
    float _297 = _293 * _279;
    float _299 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].x, _295);
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].y, _297);
    float _303 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[144].x, _299);
    float _305 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[144].y, _301);
    bool _307 = !_275;
    float _323;
    if (!_307)
    {
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _311 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_63);
        float _329 = 1.0 / _327;
        float _331 = _97 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = in.m_37.x;
    float _337 = in.m_37.y;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _341 = _333 + _339;
    float _343 = in.m_28.x;
    float _345 = in.m_28.y;
    float _347 = in.m_28.z;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _365 = 1.0 / _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _367;
    float _371 = as_type<float>(int(gl_VertexIndex));
    bool _373 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _375 = isnan(_333);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = 1.0 / _355;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _387;
    float _391 = _303 * _335;
    float _393 = _305 * _337;
    float _395 = 1.0 / _359;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _397;
    float _401 = _205 * _391;
    float _403 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _409 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _411 = 1.0 / _363;
    float _413 = _205 * _393;
    float _415 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _417 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _419 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = _333 + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _427 = _333 + _425;
    float _429 = 1.0 / _369;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _433 = _333 + _431;
    float _435 = _423 * _365;
    float _437 = _427 * _385;
    float _439 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _441 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _443 = _433 * _395;
    float _445 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _333 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _459 = _449 * _411;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = _341 * _429;
    float _479 = fma(_471, _459, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _481 = fma(_457, _459, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _483 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _485 = fma(_463, _443, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_453, _443, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_467, _443, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _491 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _493 = isnan(_333);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _511;
    bool _515 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _517 = isnan(_333);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = fma(_505, _435, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _529 = fma(_509, _435, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _531 = fma(_513, _435, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _533 = -_501;
    float _535 = _533 + 1.0;
    bool _537 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _539 = isnan(_333);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_525;
    float _551 = _549 + 1.0;
    int _553 = as_type<int>(_371) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_371) & 2;
    bool _559 = _557 != 0;
    float _561 = _525 * _535;
    bool _563 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _565 = isnan(_333);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _547 * _551;
    float _577 = -_547;
    float _579 = _577 + 1.0;
    bool _581 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _583 = isnan(_333);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    bool _597 = !_555;
    float _599 = _597 ? (-0.5) : 0.5;
    float _601 = _573 * _579;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _611 = -_573;
    float _613 = _611 + 1.0;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _599);
    float _617 = fma(_595, _437, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _619 = fma(_605, _437, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _621 = fma(_609, _437, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _623 = -_591;
    float _625 = _623 + 1.0;
    float _627 = _591 * _613;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _629;
    float _633 = fma(_389, _477, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _635 = _407 * _615;
    float _637 = _383 * _625;
    float _639 = fma(_631, _477, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    bool _641 = !_559;
    float _643 = _641 ? (-0.5) : 0.5;
    float _645 = -_383;
    float _647 = _645 + 1.0;
    float _649 = _485 * _637;
    float _651 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _653 = _489 * _637;
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _643);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].x, _649);
    float _659 = _441 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _663 = _651 * _655;
    float _665 = fma(_479, _627, _657);
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _669 = _487 * _637;
    float _671 = _663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = _663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = _663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _677 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[11].x, _667);
    float _681 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].y, _669);
    float _683 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].z, _653);
    float _685 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _679);
    float _689 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _691 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[26].x, _675);
    float _693 = fma(_481, _627, _681);
    float _695 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _697 = fma(_483, _627, _683);
    float _699 = _659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _701 = _687 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _703 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[24].z, _685);
    float _705 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[25].z, _689);
    float _707 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[26].z, _691);
    float _709 = fma(_529, _601, _693);
    float _711 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[10].x, _699);
    float _713 = 1.0 / _701;
    float _715 = fma(_527, _601, _665);
    float _717 = fma(_531, _601, _697);
    float _719 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _721 = _705 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    float _733 = _703 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _735 = _719 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _737 = _659 + _721;
    float _739 = fma(_399, _477, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _741 = fma(_617, _575, _715);
    float _743 = _735 + _701;
    float _745 = fma(_619, _575, _709);
    float _747 = fma(_621, _575, _717);
    float _749 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = _661 + _733;
    float _753 = _743 * _713;
    float _755 = _753 * 0.5;
    float _757 = _737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _759 = _677 + _749;
    float _761 = fma(_639, _561, _741);
    float _763 = fma(_633, _561, _745);
    float _765 = fma(_739, _561, _747);
    float _767 = _737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _769 = _737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _771 = _737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _757);
    float _775 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].x, _761);
    float _777 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].y, _763);
    float _779 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].z, _765);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _767);
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _769);
    float _785 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _771);
    float _787 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _773);
    float _789 = _767;
    if (_731)
    {
        _789 = 1.0;
    }
    float _791 = _789;
    float _793 = _791;
    if (!_731)
    {
        float _795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _797 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _799 = _795 * 0.15915493667125701904296875;
        float _801 = _797 * 0.15915493667125701904296875;
        float _803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _805 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[30].w, _803);
        float _807 = _799 * 6.283185482025146484375;
        float _809 = cos(_807);
        float _811 = _799 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = 1.0 / _809;
        float _817 = _801 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = _813 * _815;
        float _823 = _801 * 6.283185482025146484375;
        float _825 = sin(_823);
        float _827 = _819 * _821;
        float _829 = 1.0 / _805;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _833 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _831;
        float _835 = 1.0 / _827;
        float _837 = 1.0 / _833;
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _841 = _829 * _839;
        float _843 = _825 * _835;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _847 = fma(_843, _841, _845);
        float _849 = _847 * _837;
        float _851 = precise::clamp(_849, 0.0, 1.0);
        float _853 = -_851;
        float _855 = _853 + 1.0;
        _793 = _855;
    }
    float _857 = _793;
    float _859 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _781);
    float _861 = _787 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _863 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _783);
    float _865 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _785);
    float _867 = _859 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _869 = _861 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _871 = _861 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _873 = _861 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _875 = _861 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _877 = _863 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[4].x, _869);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[5].x, _871);
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[6].x, _873);
    float _885 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[7].x, _875);
    float _887 = _865 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].z, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].z, _881);
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].z, _883);
    float _895 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].z, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].w, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].w, _891);
    float _901 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].w, _893);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].w, _895);
    bool _907 = _857 > 0.0;
    bool _909 = isnan(_857);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _919 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _921 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = _903 + _905;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _925 * 0.5;
    out.gl_Position.x = _897;
    out.gl_Position.y = _899;
    out.gl_Position.z = _903;
    out.gl_Position.w = _905;
    out.m_42.x = _921;
    out.m_42.y = _927;
    out.m_42.z = _931;
    out.m_42.w = _917;
    out.m_31.x = _929;
    out.m_44.z = _933;
    out.m_44.w = _905;
    if (_915)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _935 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _935;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _325 = false;
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
    float _73 = _71;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _992 = as_type<float>(_79);
        out.gl_Position.z = _992;
    }
    if (!_67)
    {
        return out;
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    if (_93)
    {
        float _101 = float(_63);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _73;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1060 = as_type<float>(_115);
        out.gl_Position.z = _1060;
    }
    if (_109)
    {
        return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
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
        float _231 = _97 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -_249;
    float _257 = _255 + 1.0;
    bool _259 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_233);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _277 = 1.0 / _253;
    float _279 = _269 * _257;
    float _281 = -_269;
    float _283 = _281 + 1.0;
    float _285 = _237 * _277;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = fma(_273, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_289, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _279;
    float _297 = _293 * _279;
    float _299 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].x, _295);
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].y, _297);
    float _303 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[144].x, _299);
    float _305 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[144].y, _301);
    bool _307 = !_275;
    float _323;
    if (!_307)
    {
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _311 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_63);
        float _329 = 1.0 / _327;
        float _331 = _97 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = in.m_37.x;
    float _337 = in.m_37.y;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _341 = _333 + _339;
    float _343 = in.m_28.x;
    float _345 = in.m_28.y;
    float _347 = in.m_28.z;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _365 = 1.0 / _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _367;
    float _371 = as_type<float>(int(gl_VertexIndex));
    bool _373 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _375 = isnan(_333);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = 1.0 / _355;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _387;
    float _391 = _303 * _335;
    float _393 = _305 * _337;
    float _395 = 1.0 / _359;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _397;
    float _401 = _205 * _391;
    float _403 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _409 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _411 = 1.0 / _363;
    float _413 = _205 * _393;
    float _415 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _417 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _419 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = _333 + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _427 = _333 + _425;
    float _429 = 1.0 / _369;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _433 = _333 + _431;
    float _435 = _423 * _365;
    float _437 = _427 * _385;
    float _439 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _441 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _443 = _433 * _395;
    float _445 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _333 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _459 = _449 * _411;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = _341 * _429;
    float _479 = fma(_471, _459, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _481 = fma(_457, _459, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _483 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _485 = fma(_463, _443, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_453, _443, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_467, _443, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _491 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _493 = isnan(_333);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _511;
    bool _515 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _517 = isnan(_333);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = fma(_505, _435, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _529 = fma(_509, _435, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _531 = fma(_513, _435, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _533 = -_501;
    float _535 = _533 + 1.0;
    bool _537 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _539 = isnan(_333);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_525;
    float _551 = _549 + 1.0;
    int _553 = as_type<int>(_371) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_371) & 2;
    bool _559 = _557 != 0;
    float _561 = _525 * _535;
    bool _563 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _565 = isnan(_333);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _547 * _551;
    float _577 = -_547;
    float _579 = _577 + 1.0;
    bool _581 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _583 = isnan(_333);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    bool _597 = !_555;
    float _599 = _597 ? (-0.5) : 0.5;
    float _601 = _573 * _579;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _611 = -_573;
    float _613 = _611 + 1.0;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _599);
    float _617 = fma(_595, _437, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _619 = fma(_605, _437, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _621 = fma(_609, _437, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _623 = -_591;
    float _625 = _623 + 1.0;
    float _627 = _591 * _613;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _629;
    float _633 = fma(_389, _477, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _635 = _407 * _615;
    float _637 = _383 * _625;
    float _639 = fma(_631, _477, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    bool _641 = !_559;
    float _643 = _641 ? (-0.5) : 0.5;
    float _645 = -_383;
    float _647 = _645 + 1.0;
    float _649 = _485 * _637;
    float _651 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _653 = _489 * _637;
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _643);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].x, _649);
    float _659 = _441 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _663 = _651 * _655;
    float _665 = fma(_479, _627, _657);
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _669 = _487 * _637;
    float _671 = _663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = _663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = _663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _677 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[11].x, _667);
    float _681 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].y, _669);
    float _683 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].z, _653);
    float _685 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _679);
    float _689 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _691 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[26].x, _675);
    float _693 = fma(_481, _627, _681);
    float _695 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _697 = fma(_483, _627, _683);
    float _699 = _659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _701 = _687 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _703 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[24].z, _685);
    float _705 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[25].z, _689);
    float _707 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[26].z, _691);
    float _709 = fma(_529, _601, _693);
    float _711 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[10].x, _699);
    float _713 = 1.0 / _701;
    float _715 = fma(_527, _601, _665);
    float _717 = fma(_531, _601, _697);
    float _719 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _721 = _705 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    float _733 = _703 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _735 = _719 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _737 = _659 + _721;
    float _739 = fma(_399, _477, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _741 = fma(_617, _575, _715);
    float _743 = _735 + _701;
    float _745 = fma(_619, _575, _709);
    float _747 = fma(_621, _575, _717);
    float _749 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = _661 + _733;
    float _753 = _743 * _713;
    float _755 = _753 * 0.5;
    float _757 = _737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _759 = _677 + _749;
    float _761 = fma(_639, _561, _741);
    float _763 = fma(_633, _561, _745);
    float _765 = fma(_739, _561, _747);
    float _767 = _737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _769 = _737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _771 = _737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _757);
    float _775 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].x, _761);
    float _777 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].y, _763);
    float _779 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].z, _765);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _767);
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _769);
    float _785 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _771);
    float _787 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _773);
    float _789 = _767;
    if (_731)
    {
        _789 = 1.0;
    }
    float _791 = _789;
    float _793 = _791;
    if (!_731)
    {
        float _795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _797 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _799 = _795 * 0.15915493667125701904296875;
        float _801 = _797 * 0.15915493667125701904296875;
        float _803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _805 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[30].w, _803);
        float _807 = _799 * 6.283185482025146484375;
        float _809 = cos(_807);
        float _811 = _799 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = 1.0 / _809;
        float _817 = _801 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = _813 * _815;
        float _823 = _801 * 6.283185482025146484375;
        float _825 = sin(_823);
        float _827 = _819 * _821;
        float _829 = 1.0 / _805;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _833 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _831;
        float _835 = 1.0 / _827;
        float _837 = 1.0 / _833;
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _841 = _829 * _839;
        float _843 = _825 * _835;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _847 = fma(_843, _841, _845);
        float _849 = _847 * _837;
        float _851 = precise::clamp(_849, 0.0, 1.0);
        float _853 = -_851;
        float _855 = _853 + 1.0;
        _793 = _855;
    }
    float _857 = _793;
    float _859 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _781);
    float _861 = _787 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _863 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _783);
    float _865 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _785);
    float _867 = _859 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _869 = _861 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _871 = _861 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _873 = _861 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _875 = _861 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _877 = _863 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[4].x, _869);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[5].x, _871);
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[6].x, _873);
    float _885 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[7].x, _875);
    float _887 = _865 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].z, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].z, _881);
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].z, _883);
    float _895 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].z, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].w, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].w, _891);
    float _901 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].w, _893);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].w, _895);
    bool _907 = _857 > 0.0;
    bool _909 = isnan(_857);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _919 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _921 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = _903 + _905;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _925 * 0.5;
    out.gl_Position.x = _897;
    out.gl_Position.y = _899;
    out.gl_Position.z = _903;
    out.gl_Position.w = _905;
    out.m_42.x = _921;
    out.m_42.y = _927;
    out.m_42.z = _931;
    out.m_42.w = _917;
    out.m_31.x = _929;
    out.m_44.z = _933;
    out.m_44.w = _905;
    if (_915)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _935 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _935;
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
    bool _325 = false;
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
    float _73 = _71;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _992 = as_type<float>(_79);
        out.gl_Position.z = _992;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    if (_93)
    {
        float _101 = float(_63);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _73;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1060 = as_type<float>(_115);
        out.gl_Position.z = _1060;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
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
        float _231 = _97 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -_249;
    float _257 = _255 + 1.0;
    bool _259 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_233);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _277 = 1.0 / _253;
    float _279 = _269 * _257;
    float _281 = -_269;
    float _283 = _281 + 1.0;
    float _285 = _237 * _277;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = fma(_273, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_289, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _279;
    float _297 = _293 * _279;
    float _299 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].x, _295);
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].y, _297);
    float _303 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[144].x, _299);
    float _305 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[144].y, _301);
    bool _307 = !_275;
    float _323;
    if (!_307)
    {
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _311 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_63);
        float _329 = 1.0 / _327;
        float _331 = _97 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = in.m_37.x;
    float _337 = in.m_37.y;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _341 = _333 + _339;
    float _343 = in.m_28.x;
    float _345 = in.m_28.y;
    float _347 = in.m_28.z;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _365 = 1.0 / _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _367;
    float _371 = as_type<float>(int(gl_VertexIndex));
    bool _373 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _375 = isnan(_333);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = 1.0 / _355;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _387;
    float _391 = _303 * _335;
    float _393 = _305 * _337;
    float _395 = 1.0 / _359;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _397;
    float _401 = _205 * _391;
    float _403 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _409 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _411 = 1.0 / _363;
    float _413 = _205 * _393;
    float _415 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _417 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _419 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = _333 + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _427 = _333 + _425;
    float _429 = 1.0 / _369;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _433 = _333 + _431;
    float _435 = _423 * _365;
    float _437 = _427 * _385;
    float _439 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _441 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _443 = _433 * _395;
    float _445 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _333 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _459 = _449 * _411;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = _341 * _429;
    float _479 = fma(_471, _459, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _481 = fma(_457, _459, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _483 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _485 = fma(_463, _443, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_453, _443, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_467, _443, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _491 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _493 = isnan(_333);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _511;
    bool _515 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _517 = isnan(_333);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = fma(_505, _435, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _529 = fma(_509, _435, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _531 = fma(_513, _435, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _533 = -_501;
    float _535 = _533 + 1.0;
    bool _537 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _539 = isnan(_333);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_525;
    float _551 = _549 + 1.0;
    int _553 = as_type<int>(_371) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_371) & 2;
    bool _559 = _557 != 0;
    float _561 = _525 * _535;
    bool _563 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _565 = isnan(_333);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _547 * _551;
    float _577 = -_547;
    float _579 = _577 + 1.0;
    bool _581 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _583 = isnan(_333);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    bool _597 = !_555;
    float _599 = _597 ? (-0.5) : 0.5;
    float _601 = _573 * _579;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _611 = -_573;
    float _613 = _611 + 1.0;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _599);
    float _617 = fma(_595, _437, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _619 = fma(_605, _437, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _621 = fma(_609, _437, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _623 = -_591;
    float _625 = _623 + 1.0;
    float _627 = _591 * _613;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _629;
    float _633 = fma(_389, _477, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _635 = _407 * _615;
    float _637 = _383 * _625;
    float _639 = fma(_631, _477, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    bool _641 = !_559;
    float _643 = _641 ? (-0.5) : 0.5;
    float _645 = -_383;
    float _647 = _645 + 1.0;
    float _649 = _485 * _637;
    float _651 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _653 = _489 * _637;
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _643);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].x, _649);
    float _659 = _441 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _663 = _651 * _655;
    float _665 = fma(_479, _627, _657);
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _669 = _487 * _637;
    float _671 = _663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = _663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = _663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _677 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[11].x, _667);
    float _681 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].y, _669);
    float _683 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].z, _653);
    float _685 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _679);
    float _689 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _691 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[26].x, _675);
    float _693 = fma(_481, _627, _681);
    float _695 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _697 = fma(_483, _627, _683);
    float _699 = _659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _701 = _687 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _703 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[24].z, _685);
    float _705 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[25].z, _689);
    float _707 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[26].z, _691);
    float _709 = fma(_529, _601, _693);
    float _711 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[10].x, _699);
    float _713 = 1.0 / _701;
    float _715 = fma(_527, _601, _665);
    float _717 = fma(_531, _601, _697);
    float _719 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _721 = _705 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    float _733 = _703 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _735 = _719 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _737 = _659 + _721;
    float _739 = fma(_399, _477, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _741 = fma(_617, _575, _715);
    float _743 = _735 + _701;
    float _745 = fma(_619, _575, _709);
    float _747 = fma(_621, _575, _717);
    float _749 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = _661 + _733;
    float _753 = _743 * _713;
    float _755 = _753 * 0.5;
    float _757 = _737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _759 = _677 + _749;
    float _761 = fma(_639, _561, _741);
    float _763 = fma(_633, _561, _745);
    float _765 = fma(_739, _561, _747);
    float _767 = _737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _769 = _737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _771 = _737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _757);
    float _775 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].x, _761);
    float _777 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].y, _763);
    float _779 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[112].z, _765);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _767);
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _769);
    float _785 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _771);
    float _787 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _773);
    float _789 = _767;
    if (_731)
    {
        _789 = 1.0;
    }
    float _791 = _789;
    float _793 = _791;
    if (!_731)
    {
        float _795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _797 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _799 = _795 * 0.15915493667125701904296875;
        float _801 = _797 * 0.15915493667125701904296875;
        float _803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _805 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[30].w, _803);
        float _807 = _799 * 6.283185482025146484375;
        float _809 = cos(_807);
        float _811 = _799 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = 1.0 / _809;
        float _817 = _801 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = _813 * _815;
        float _823 = _801 * 6.283185482025146484375;
        float _825 = sin(_823);
        float _827 = _819 * _821;
        float _829 = 1.0 / _805;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _833 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _831;
        float _835 = 1.0 / _827;
        float _837 = 1.0 / _833;
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _841 = _829 * _839;
        float _843 = _825 * _835;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _847 = fma(_843, _841, _845);
        float _849 = _847 * _837;
        float _851 = precise::clamp(_849, 0.0, 1.0);
        float _853 = -_851;
        float _855 = _853 + 1.0;
        _793 = _855;
    }
    float _857 = _793;
    float _859 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _781);
    float _861 = _787 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _863 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _783);
    float _865 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _785);
    float _867 = _859 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _869 = _861 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _871 = _861 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _873 = _861 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _875 = _861 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _877 = _863 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[4].x, _869);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[5].x, _871);
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[6].x, _873);
    float _885 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[7].x, _875);
    float _887 = _865 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].z, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].z, _881);
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].z, _883);
    float _895 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].z, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].w, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].w, _891);
    float _901 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].w, _893);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].w, _895);
    bool _907 = _857 > 0.0;
    bool _909 = isnan(_857);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _919 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _921 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = _903 + _905;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _925 * 0.5;
    out.gl_Position.x = _897;
    out.gl_Position.y = _899;
    out.gl_Position.z = _903;
    out.gl_Position.w = _905;
    out.m_42.x = _921;
    out.m_42.y = _927;
    out.m_42.z = _931;
    out.m_42.w = _917;
    out.m_31.x = _929;
    out.m_44.z = _933;
    out.m_44.w = _905;
    if (_915)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _935 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _935;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

