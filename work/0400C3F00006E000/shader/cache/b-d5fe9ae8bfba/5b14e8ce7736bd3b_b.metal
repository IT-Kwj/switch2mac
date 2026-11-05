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
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1225 = false;
    bool _583 = false;
    bool _441 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1406 = as_type<float>(_87);
        out.gl_Position.z = _1406;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1475 = as_type<float>(_123);
        out.gl_Position.z = _1475;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _155 = _241;
    }
    float _243 = _155;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_44.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_71);
        float _445 = 1.0 / _443;
        float _447 = _105 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _449 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_449);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_449);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    bool _491 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_449);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _457;
    float _505 = -_469;
    float _507 = _505 + 1.0;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _511 = _485 * _507;
    float _513 = -_485;
    float _515 = _513 + 1.0;
    float _517 = 1.0 / _473;
    float _519 = _489 * _503;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _527 = _523 * _517;
    float _529 = _525 * _511;
    float _531 = -_501;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _449 + _535;
    float _539 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _529);
    float _541 = _469 * _533;
    float _543 = fma(_527, _537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = fma(_543, _541, _539);
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[117].x, _547);
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _555;
    out.m_46.y = _557;
    out.m_46.z = _559;
    out.m_46.w = _561;
    bool _563 = !_509;
    float _581;
    if (!_563)
    {
        float _565 = in.m_44.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        float _585 = float(_71);
        float _587 = 1.0 / _585;
        float _589 = _105 * _587;
        _581 = _589;
    }
    _583 = false;
    float _591 = _581;
    float _593 = in.m_44.x;
    float _595 = in.m_44.y;
    float _597 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _599 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _601 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _611 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _597);
    float _613 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _599);
    float _615 = 1.0 / _605;
    float _617 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _621 = _591 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _625 = _591 + _623;
    float _627 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _611);
    float _629 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _617);
    bool _631 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _633 = isnan(_591);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _609;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _647 = _645 != 0;
    bool _649 = _595 > 0.5;
    float _651 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _613);
    float _653 = _621 * _615;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _655;
    bool _659 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _661 = isnan(_591);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _593 > 0.5;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _673;
    float _677 = _625 * _643;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _679;
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = fma(_657, _653, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _689 = fma(_675, _653, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _691 = fma(_681, _653, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _693 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _695 = isnan(_591);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -_641;
    float _707 = _705 + 1.0;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _713 = _641 * _685;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _719 = _703 * _707;
    float _721 = fma(_711, _677, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _723 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _725 = fma(_717, _677, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _727 = _687 * _719;
    float _729 = _689 * _719;
    float _731 = _627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _735 = _723 + _733;
    float _737 = -_703;
    float _739 = _737 + 1.0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _745 = _691 * _719;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _749 = _731 + _747;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].x, _727);
    float _755 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _757 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].y, _745);
    float _759 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _751);
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].z, _729);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _765 = _755 + _763;
    float _767 = -_183;
    int _769 = _649 ? as_type<int>(_767) : as_type<int>(_183);
    float _771 = fma(_743, _677, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _773 = -_179;
    int _775 = _671 ? as_type<int>(_773) : as_type<int>(_179);
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[28].z, _759);
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _783 = _781 != 0;
    float _785 = fma(_721, _713, _753);
    bool _787 = !_647;
    float _789 = _787 ? _179 : as_type<float>(_775);
    float _791 = fma(_725, _713, _757);
    bool _793 = _777 >= 0.0;
    float _795 = fma(_771, _713, _761);
    bool _797 = !_783;
    float _799 = _797 ? _183 : as_type<float>(_769);
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _803 = _789 + 0.5;
    float _805 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].x, _785);
    float _807 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].y, _791);
    float _809 = -_799;
    float _811 = _809 + 0.5;
    float _813 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].z, _795);
    float _815 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _817 = _805 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = _811 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _821 = _807 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _823 = _757;
    float _825 = _721;
    float _827 = _761;
    float _829 = _723;
    if (_793)
    {
        _823 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _823;
    float _833 = _813 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _835 = _815 * _779;
    float _837 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _819 * _801;
    float _843 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _845 = as_type<int>(_831);
    float _847 = _833;
    int _849 = as_type<int>(_843);
    if (_793)
    {
        float _851 = _831 * 5.0;
        _845 = as_type<int>(_851);
    }
    int _853 = _845;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _857 = _855 != 0;
    out.m_48.x = _835;
    out.m_48.y = _841;
    out.m_50.x = _837;
    out.m_50.y = _839;
    out.m_50.z = _843;
    if (_793)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2674 = as_type<float>(_853);
        out.gl_Position.z = _2674;
    }
    if (!_857)
    {
        _825 = 0.0;
    }
    float _859 = _825;
    float _861 = _859;
    if (!_857)
    {
        _847 = 0.0;
    }
    float _863 = _847;
    float _865 = _863;
    if (!_857)
    {
        _827 = 0.0;
    }
    float _867 = _827;
    bool _869 = !_857;
    float _871 = _867;
    if (!_869)
    {
        float _873 = -_723;
        float _875 = _873 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _877 = -_731;
        float _879 = _877 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _881 = -_755;
        float _883 = _881 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _885 = _875 * _875;
        float _887 = fma(_879, _879, _885);
        float _889 = fma(_883, _883, _887);
        float _891 = rsqrt(_889);
        float _893 = _891 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _895 = _879 * _893;
        float _897 = _875 * _893;
        float _899 = _883 * _893;
        _865 = _897;
        _861 = _895;
        _871 = _899;
    }
    float _901 = _865;
    float _903 = _861;
    float _905 = _871;
    if (_793)
    {
        out.m_35.x = 0.0;
    }
    if (_793)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _907 = _723 + _901;
    float _909 = _731 + _903;
    float _911 = _755 + _905;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _907 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _909 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _923 = _911 + _921;
    float _925 = _915 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _927 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _925);
    float _929 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[28].z, _927);
    bool _931 = _929 >= 0.0;
    float _933 = _919;
    if (_931)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _933;
    if (_931)
    {
        out.m_35.x = 0.0;
    }
    if (_931)
    {
        float _937 = _935 * 5.0;
        _849 = as_type<int>(_937);
    }
    int _939 = _849;
    if (_931)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2826 = as_type<float>(_939);
        out.gl_Position.z = _2826;
    }
    if (_931)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _941 = -_723;
    float _943 = _941 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = -_731;
    float _947 = _945 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = -_755;
    float _951 = _949 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = _943 * _943;
    float _957 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = fma(_947, _947, _955);
    float _965 = _957 * _953;
    float _967 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = fma(_951, _951, _963);
    float _971 = _959 * _967;
    float _973 = rsqrt(_969);
    float _975 = _947 * _973;
    float _977 = _951 * _973;
    float _979 = _943 * _973;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _983 = _975 * _981;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _987 = _977 * _985;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _991 = -_983;
    float _993 = fma(_977, _989, _991);
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _997 = _979 * _995;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1001 = -_987;
    float _1003 = fma(_979, _999, _1001);
    float _1005 = _993 * _993;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1009 = -_997;
    float _1011 = fma(_975, _1007, _1009);
    float _1013 = fma(_1003, _1003, _1005);
    float _1015 = fma(_1011, _1011, _1013);
    float _1017 = rsqrt(_1015);
    float _1019 = _993 * _1017;
    float _1021 = _1003 * _1017;
    float _1023 = _1011 * _1017;
    float _1025 = _1019 * _977;
    float _1027 = _1021 * _979;
    float _1029 = -_1025;
    float _1031 = fma(_1023, _979, _1029);
    float _1033 = -_1027;
    float _1035 = fma(_1019, _975, _1033);
    float _1037 = _965 * _1031;
    float _1039 = _965 * _1035;
    float _1041 = _1023 * _975;
    float _1043 = fma(_971, _1021, _1037);
    float _1045 = fma(_971, _1023, _1039);
    float _1047 = -_1041;
    float _1049 = fma(_1021, _977, _1047);
    float _1051 = fma(_961, _975, _1043);
    float _1053 = fma(_961, _977, _1045);
    float _1055 = _965 * _1049;
    float _1057 = _731 + _1051;
    float _1059 = _755 + _1053;
    float _1061 = fma(_971, _1019, _1055);
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1065 = _1057 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1069 = _1059 + _1067;
    float _1071 = fma(_961, _979, _1061);
    float _1073 = _1065 * _1065;
    float _1075 = _1069 * _1069;
    float _1077 = _723 + _1071;
    float _1079 = _1073 + _1075;
    float _1081 = sqrt(_1079);
    bool _1083 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1021;
    float _1087 = _1071;
    float _1089 = _971;
    float _1091 = _1073;
    if (!_1083)
    {
        _1085 = _1075;
    }
    float _1093 = _1085;
    float _1095 = _1093;
    if (!_1083)
    {
        _1087 = _1057;
    }
    float _1097 = _1087;
    float _1099 = _1097;
    if (!_1083)
    {
        _1089 = _1059;
    }
    float _1101 = _1089;
    float _1103 = _1101;
    if (!_1083)
    {
        _829 = _1077;
    }
    float _1105 = _829;
    bool _1107 = !_1083;
    float _1109 = _1105;
    if (!_1107)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1115 = _1081 + _1113;
        float _1117 = _1077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = rsqrt(_1079);
        float _1121 = _1115 * _1111;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1123 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = _1123 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = fma(_1127, _1117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1135 = _1119 * _1133;
        float _1137 = _1131 + (-1.0);
        float _1139 = fma(_1065, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1141 = fma(_1069, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1143 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1147 = _1139 + _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1151 = _1141 + _1149;
        float _1153 = fma(_1077, _1131, _1143);
        float _1155 = _1147 * _1147;
        float _1157 = _1151 * _1151;
        _1109 = _1153;
        _1091 = _1155;
        _1095 = _1157;
        _1099 = _1139;
        _1103 = _1141;
    }
    float _1159 = _1109;
    float _1161 = _1091;
    float _1163 = _1095;
    float _1165 = _1099;
    float _1167 = _1103;
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1171 = _1159 + _1169;
    float _1173 = fma(_1171, _1171, _1161);
    float _1175 = _1173 + _1163;
    float _1177 = sqrt(_1175);
    bool _1179 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1181 = isnan(_1177);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1187 = _1183 || _1185;
    float _1189 = _1161;
    if (!_1187)
    {
        _1189 = 1.0;
    }
    float _1191 = _1189;
    bool _1193 = !_1187;
    float _1195 = _1191;
    if (!_1193)
    {
        bool _1197 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1199 = isnan(_1177);
        bool _1201 = _1197 || _1199;
        bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1205 = _1201 || _1203;
        if (!_1205)
        {
            float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1209 = _1177 + _1207;
            float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1213 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1211;
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1219 = 1.0 / _1213;
            float _1221 = _1209 * _1219;
            float _1223 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1195 = _1223;
            _1225 = true;
        }
        else
        {
            bool _1227 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1229 = isnan(_1177);
            bool _1231 = _1227 || _1229;
            bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1235 = _1231 || _1233;
            if (!_1235)
            {
                float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1239 = _1177 + _1237;
                float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1249 = 1.0 / _1243;
                float _1251 = _1239 * _1249;
                float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1195 = _1253;
                _1225 = true;
            }
            else
            {
                _1195 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1225 = false;
    float _1255 = _1195;
    float _1257 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1259 = _1159 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1263 = _1165 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _1167 + _1265;
    float _1269 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1271 = fma(_1263, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1273 = fma(_1267, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1275 = _1269 + _901;
    float _1277 = _1271 + _903;
    float _1279 = _1273 + _905;
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1287);
    float _1297 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1301 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1293);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1295);
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1319 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1321 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1325 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1317);
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1319);
    float _1329 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1331 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1323);
    float _1333 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1325);
    float _1335 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1327);
    float _1337 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1329);
    float _1339 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1331);
    float _1341 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1333);
    float _1343 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1335);
    float _1345 = _1337 + _1339;
    float _1347 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1349 = _1345 * 0.5;
    out.m_35.x = _1347;
    out.gl_Position.x = _1341;
    out.gl_Position.y = _1343;
    out.gl_Position.z = _1337;
    out.gl_Position.w = _1339;
    out.m_52.z = _1349;
    out.m_52.w = _1339;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1225 = false;
    bool _583 = false;
    bool _441 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1406 = as_type<float>(_87);
        out.gl_Position.z = _1406;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1475 = as_type<float>(_123);
        out.gl_Position.z = _1475;
    }
    if (_115)
    {
        return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _155 = _241;
    }
    float _243 = _155;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_44.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_71);
        float _445 = 1.0 / _443;
        float _447 = _105 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _449 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_449);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_449);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    bool _491 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_449);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _457;
    float _505 = -_469;
    float _507 = _505 + 1.0;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _511 = _485 * _507;
    float _513 = -_485;
    float _515 = _513 + 1.0;
    float _517 = 1.0 / _473;
    float _519 = _489 * _503;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _527 = _523 * _517;
    float _529 = _525 * _511;
    float _531 = -_501;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _449 + _535;
    float _539 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _529);
    float _541 = _469 * _533;
    float _543 = fma(_527, _537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = fma(_543, _541, _539);
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[117].x, _547);
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _555;
    out.m_46.y = _557;
    out.m_46.z = _559;
    out.m_46.w = _561;
    bool _563 = !_509;
    float _581;
    if (!_563)
    {
        float _565 = in.m_44.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        float _585 = float(_71);
        float _587 = 1.0 / _585;
        float _589 = _105 * _587;
        _581 = _589;
    }
    _583 = false;
    float _591 = _581;
    float _593 = in.m_44.x;
    float _595 = in.m_44.y;
    float _597 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _599 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _601 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _611 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _597);
    float _613 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _599);
    float _615 = 1.0 / _605;
    float _617 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _621 = _591 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _625 = _591 + _623;
    float _627 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _611);
    float _629 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _617);
    bool _631 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _633 = isnan(_591);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _609;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _647 = _645 != 0;
    bool _649 = _595 > 0.5;
    float _651 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _613);
    float _653 = _621 * _615;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _655;
    bool _659 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _661 = isnan(_591);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _593 > 0.5;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _673;
    float _677 = _625 * _643;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _679;
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = fma(_657, _653, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _689 = fma(_675, _653, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _691 = fma(_681, _653, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _693 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _695 = isnan(_591);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -_641;
    float _707 = _705 + 1.0;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _713 = _641 * _685;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _719 = _703 * _707;
    float _721 = fma(_711, _677, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _723 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _725 = fma(_717, _677, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _727 = _687 * _719;
    float _729 = _689 * _719;
    float _731 = _627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _735 = _723 + _733;
    float _737 = -_703;
    float _739 = _737 + 1.0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _745 = _691 * _719;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _749 = _731 + _747;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].x, _727);
    float _755 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _757 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].y, _745);
    float _759 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _751);
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].z, _729);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _765 = _755 + _763;
    float _767 = -_183;
    int _769 = _649 ? as_type<int>(_767) : as_type<int>(_183);
    float _771 = fma(_743, _677, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _773 = -_179;
    int _775 = _671 ? as_type<int>(_773) : as_type<int>(_179);
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[28].z, _759);
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _783 = _781 != 0;
    float _785 = fma(_721, _713, _753);
    bool _787 = !_647;
    float _789 = _787 ? _179 : as_type<float>(_775);
    float _791 = fma(_725, _713, _757);
    bool _793 = _777 >= 0.0;
    float _795 = fma(_771, _713, _761);
    bool _797 = !_783;
    float _799 = _797 ? _183 : as_type<float>(_769);
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _803 = _789 + 0.5;
    float _805 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].x, _785);
    float _807 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].y, _791);
    float _809 = -_799;
    float _811 = _809 + 0.5;
    float _813 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].z, _795);
    float _815 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _817 = _805 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = _811 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _821 = _807 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _823 = _757;
    float _825 = _721;
    float _827 = _761;
    float _829 = _723;
    if (_793)
    {
        _823 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _823;
    float _833 = _813 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _835 = _815 * _779;
    float _837 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _819 * _801;
    float _843 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _845 = as_type<int>(_831);
    float _847 = _833;
    int _849 = as_type<int>(_843);
    if (_793)
    {
        float _851 = _831 * 5.0;
        _845 = as_type<int>(_851);
    }
    int _853 = _845;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _857 = _855 != 0;
    out.m_48.x = _835;
    out.m_48.y = _841;
    out.m_50.x = _837;
    out.m_50.y = _839;
    out.m_50.z = _843;
    if (_793)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2674 = as_type<float>(_853);
        out.gl_Position.z = _2674;
    }
    if (!_857)
    {
        _825 = 0.0;
    }
    float _859 = _825;
    float _861 = _859;
    if (!_857)
    {
        _847 = 0.0;
    }
    float _863 = _847;
    float _865 = _863;
    if (!_857)
    {
        _827 = 0.0;
    }
    float _867 = _827;
    bool _869 = !_857;
    float _871 = _867;
    if (!_869)
    {
        float _873 = -_723;
        float _875 = _873 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _877 = -_731;
        float _879 = _877 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _881 = -_755;
        float _883 = _881 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _885 = _875 * _875;
        float _887 = fma(_879, _879, _885);
        float _889 = fma(_883, _883, _887);
        float _891 = rsqrt(_889);
        float _893 = _891 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _895 = _879 * _893;
        float _897 = _875 * _893;
        float _899 = _883 * _893;
        _865 = _897;
        _861 = _895;
        _871 = _899;
    }
    float _901 = _865;
    float _903 = _861;
    float _905 = _871;
    if (_793)
    {
        out.m_35.x = 0.0;
    }
    if (_793)
    {
        return out;
    }
    float _907 = _723 + _901;
    float _909 = _731 + _903;
    float _911 = _755 + _905;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _907 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _909 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _923 = _911 + _921;
    float _925 = _915 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _927 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _925);
    float _929 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[28].z, _927);
    bool _931 = _929 >= 0.0;
    float _933 = _919;
    if (_931)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _933;
    if (_931)
    {
        out.m_35.x = 0.0;
    }
    if (_931)
    {
        float _937 = _935 * 5.0;
        _849 = as_type<int>(_937);
    }
    int _939 = _849;
    if (_931)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2826 = as_type<float>(_939);
        out.gl_Position.z = _2826;
    }
    if (_931)
    {
        return out;
    }
    float _941 = -_723;
    float _943 = _941 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = -_731;
    float _947 = _945 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = -_755;
    float _951 = _949 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = _943 * _943;
    float _957 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = fma(_947, _947, _955);
    float _965 = _957 * _953;
    float _967 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = fma(_951, _951, _963);
    float _971 = _959 * _967;
    float _973 = rsqrt(_969);
    float _975 = _947 * _973;
    float _977 = _951 * _973;
    float _979 = _943 * _973;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _983 = _975 * _981;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _987 = _977 * _985;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _991 = -_983;
    float _993 = fma(_977, _989, _991);
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _997 = _979 * _995;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1001 = -_987;
    float _1003 = fma(_979, _999, _1001);
    float _1005 = _993 * _993;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1009 = -_997;
    float _1011 = fma(_975, _1007, _1009);
    float _1013 = fma(_1003, _1003, _1005);
    float _1015 = fma(_1011, _1011, _1013);
    float _1017 = rsqrt(_1015);
    float _1019 = _993 * _1017;
    float _1021 = _1003 * _1017;
    float _1023 = _1011 * _1017;
    float _1025 = _1019 * _977;
    float _1027 = _1021 * _979;
    float _1029 = -_1025;
    float _1031 = fma(_1023, _979, _1029);
    float _1033 = -_1027;
    float _1035 = fma(_1019, _975, _1033);
    float _1037 = _965 * _1031;
    float _1039 = _965 * _1035;
    float _1041 = _1023 * _975;
    float _1043 = fma(_971, _1021, _1037);
    float _1045 = fma(_971, _1023, _1039);
    float _1047 = -_1041;
    float _1049 = fma(_1021, _977, _1047);
    float _1051 = fma(_961, _975, _1043);
    float _1053 = fma(_961, _977, _1045);
    float _1055 = _965 * _1049;
    float _1057 = _731 + _1051;
    float _1059 = _755 + _1053;
    float _1061 = fma(_971, _1019, _1055);
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1065 = _1057 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1069 = _1059 + _1067;
    float _1071 = fma(_961, _979, _1061);
    float _1073 = _1065 * _1065;
    float _1075 = _1069 * _1069;
    float _1077 = _723 + _1071;
    float _1079 = _1073 + _1075;
    float _1081 = sqrt(_1079);
    bool _1083 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1021;
    float _1087 = _1071;
    float _1089 = _971;
    float _1091 = _1073;
    if (!_1083)
    {
        _1085 = _1075;
    }
    float _1093 = _1085;
    float _1095 = _1093;
    if (!_1083)
    {
        _1087 = _1057;
    }
    float _1097 = _1087;
    float _1099 = _1097;
    if (!_1083)
    {
        _1089 = _1059;
    }
    float _1101 = _1089;
    float _1103 = _1101;
    if (!_1083)
    {
        _829 = _1077;
    }
    float _1105 = _829;
    bool _1107 = !_1083;
    float _1109 = _1105;
    if (!_1107)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1115 = _1081 + _1113;
        float _1117 = _1077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = rsqrt(_1079);
        float _1121 = _1115 * _1111;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1123 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = _1123 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = fma(_1127, _1117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1135 = _1119 * _1133;
        float _1137 = _1131 + (-1.0);
        float _1139 = fma(_1065, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1141 = fma(_1069, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1143 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1147 = _1139 + _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1151 = _1141 + _1149;
        float _1153 = fma(_1077, _1131, _1143);
        float _1155 = _1147 * _1147;
        float _1157 = _1151 * _1151;
        _1109 = _1153;
        _1091 = _1155;
        _1095 = _1157;
        _1099 = _1139;
        _1103 = _1141;
    }
    float _1159 = _1109;
    float _1161 = _1091;
    float _1163 = _1095;
    float _1165 = _1099;
    float _1167 = _1103;
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1171 = _1159 + _1169;
    float _1173 = fma(_1171, _1171, _1161);
    float _1175 = _1173 + _1163;
    float _1177 = sqrt(_1175);
    bool _1179 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1181 = isnan(_1177);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1187 = _1183 || _1185;
    float _1189 = _1161;
    if (!_1187)
    {
        _1189 = 1.0;
    }
    float _1191 = _1189;
    bool _1193 = !_1187;
    float _1195 = _1191;
    if (!_1193)
    {
        bool _1197 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1199 = isnan(_1177);
        bool _1201 = _1197 || _1199;
        bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1205 = _1201 || _1203;
        if (!_1205)
        {
            float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1209 = _1177 + _1207;
            float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1213 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1211;
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1219 = 1.0 / _1213;
            float _1221 = _1209 * _1219;
            float _1223 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1195 = _1223;
            _1225 = true;
        }
        else
        {
            bool _1227 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1229 = isnan(_1177);
            bool _1231 = _1227 || _1229;
            bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1235 = _1231 || _1233;
            if (!_1235)
            {
                float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1239 = _1177 + _1237;
                float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1249 = 1.0 / _1243;
                float _1251 = _1239 * _1249;
                float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1195 = _1253;
                _1225 = true;
            }
            else
            {
                _1195 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1225 = false;
    float _1255 = _1195;
    float _1257 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1259 = _1159 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1263 = _1165 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _1167 + _1265;
    float _1269 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1271 = fma(_1263, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1273 = fma(_1267, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1275 = _1269 + _901;
    float _1277 = _1271 + _903;
    float _1279 = _1273 + _905;
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1287);
    float _1297 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1301 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1293);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1295);
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1319 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1321 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1325 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1317);
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1319);
    float _1329 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1331 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1323);
    float _1333 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1325);
    float _1335 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1327);
    float _1337 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1329);
    float _1339 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1331);
    float _1341 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1333);
    float _1343 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1335);
    float _1345 = _1337 + _1339;
    float _1347 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1349 = _1345 * 0.5;
    out.m_35.x = _1347;
    out.gl_Position.x = _1341;
    out.gl_Position.y = _1343;
    out.gl_Position.z = _1337;
    out.gl_Position.w = _1339;
    out.m_52.z = _1349;
    out.m_52.w = _1339;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1225 = false;
    bool _583 = false;
    bool _441 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1406 = as_type<float>(_87);
        out.gl_Position.z = _1406;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1475 = as_type<float>(_123);
        out.gl_Position.z = _1475;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _155 = _241;
    }
    float _243 = _155;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_44.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_71);
        float _445 = 1.0 / _443;
        float _447 = _105 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _449 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_449);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_449);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    bool _491 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_449);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _457;
    float _505 = -_469;
    float _507 = _505 + 1.0;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _511 = _485 * _507;
    float _513 = -_485;
    float _515 = _513 + 1.0;
    float _517 = 1.0 / _473;
    float _519 = _489 * _503;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _527 = _523 * _517;
    float _529 = _525 * _511;
    float _531 = -_501;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _449 + _535;
    float _539 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _529);
    float _541 = _469 * _533;
    float _543 = fma(_527, _537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = fma(_543, _541, _539);
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[117].x, _547);
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _555;
    out.m_46.y = _557;
    out.m_46.z = _559;
    out.m_46.w = _561;
    bool _563 = !_509;
    float _581;
    if (!_563)
    {
        float _565 = in.m_44.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        float _585 = float(_71);
        float _587 = 1.0 / _585;
        float _589 = _105 * _587;
        _581 = _589;
    }
    _583 = false;
    float _591 = _581;
    float _593 = in.m_44.x;
    float _595 = in.m_44.y;
    float _597 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _599 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _601 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _611 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _597);
    float _613 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _599);
    float _615 = 1.0 / _605;
    float _617 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _621 = _591 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _625 = _591 + _623;
    float _627 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _611);
    float _629 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _617);
    bool _631 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _633 = isnan(_591);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _609;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _647 = _645 != 0;
    bool _649 = _595 > 0.5;
    float _651 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _613);
    float _653 = _621 * _615;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _655;
    bool _659 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _661 = isnan(_591);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _593 > 0.5;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _673;
    float _677 = _625 * _643;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _679;
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = fma(_657, _653, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _689 = fma(_675, _653, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _691 = fma(_681, _653, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _693 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _695 = isnan(_591);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -_641;
    float _707 = _705 + 1.0;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _713 = _641 * _685;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _719 = _703 * _707;
    float _721 = fma(_711, _677, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _723 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _725 = fma(_717, _677, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _727 = _687 * _719;
    float _729 = _689 * _719;
    float _731 = _627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _735 = _723 + _733;
    float _737 = -_703;
    float _739 = _737 + 1.0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _745 = _691 * _719;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _749 = _731 + _747;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].x, _727);
    float _755 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _757 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].y, _745);
    float _759 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _751);
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[123].z, _729);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _765 = _755 + _763;
    float _767 = -_183;
    int _769 = _649 ? as_type<int>(_767) : as_type<int>(_183);
    float _771 = fma(_743, _677, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _773 = -_179;
    int _775 = _671 ? as_type<int>(_773) : as_type<int>(_179);
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[28].z, _759);
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _783 = _781 != 0;
    float _785 = fma(_721, _713, _753);
    bool _787 = !_647;
    float _789 = _787 ? _179 : as_type<float>(_775);
    float _791 = fma(_725, _713, _757);
    bool _793 = _777 >= 0.0;
    float _795 = fma(_771, _713, _761);
    bool _797 = !_783;
    float _799 = _797 ? _183 : as_type<float>(_769);
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _803 = _789 + 0.5;
    float _805 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].x, _785);
    float _807 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].y, _791);
    float _809 = -_799;
    float _811 = _809 + 0.5;
    float _813 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[125].z, _795);
    float _815 = _803 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _817 = _805 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = _811 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _821 = _807 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _823 = _757;
    float _825 = _721;
    float _827 = _761;
    float _829 = _723;
    if (_793)
    {
        _823 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _823;
    float _833 = _813 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _835 = _815 * _779;
    float _837 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _819 * _801;
    float _843 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _845 = as_type<int>(_831);
    float _847 = _833;
    int _849 = as_type<int>(_843);
    if (_793)
    {
        float _851 = _831 * 5.0;
        _845 = as_type<int>(_851);
    }
    int _853 = _845;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _857 = _855 != 0;
    out.m_48.x = _835;
    out.m_48.y = _841;
    out.m_50.x = _837;
    out.m_50.y = _839;
    out.m_50.z = _843;
    if (_793)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2674 = as_type<float>(_853);
        out.gl_Position.z = _2674;
    }
    if (!_857)
    {
        _825 = 0.0;
    }
    float _859 = _825;
    float _861 = _859;
    if (!_857)
    {
        _847 = 0.0;
    }
    float _863 = _847;
    float _865 = _863;
    if (!_857)
    {
        _827 = 0.0;
    }
    float _867 = _827;
    bool _869 = !_857;
    float _871 = _867;
    if (!_869)
    {
        float _873 = -_723;
        float _875 = _873 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _877 = -_731;
        float _879 = _877 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _881 = -_755;
        float _883 = _881 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _885 = _875 * _875;
        float _887 = fma(_879, _879, _885);
        float _889 = fma(_883, _883, _887);
        float _891 = rsqrt(_889);
        float _893 = _891 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _895 = _879 * _893;
        float _897 = _875 * _893;
        float _899 = _883 * _893;
        _865 = _897;
        _861 = _895;
        _871 = _899;
    }
    float _901 = _865;
    float _903 = _861;
    float _905 = _871;
    if (_793)
    {
        out.m_35.x = 0.0;
    }
    if (_793)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _907 = _723 + _901;
    float _909 = _731 + _903;
    float _911 = _755 + _905;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _907 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _909 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _923 = _911 + _921;
    float _925 = _915 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _927 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _925);
    float _929 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[28].z, _927);
    bool _931 = _929 >= 0.0;
    float _933 = _919;
    if (_931)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _933;
    if (_931)
    {
        out.m_35.x = 0.0;
    }
    if (_931)
    {
        float _937 = _935 * 5.0;
        _849 = as_type<int>(_937);
    }
    int _939 = _849;
    if (_931)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2826 = as_type<float>(_939);
        out.gl_Position.z = _2826;
    }
    if (_931)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _941 = -_723;
    float _943 = _941 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = -_731;
    float _947 = _945 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = -_755;
    float _951 = _949 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = _943 * _943;
    float _957 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = fma(_947, _947, _955);
    float _965 = _957 * _953;
    float _967 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = fma(_951, _951, _963);
    float _971 = _959 * _967;
    float _973 = rsqrt(_969);
    float _975 = _947 * _973;
    float _977 = _951 * _973;
    float _979 = _943 * _973;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _983 = _975 * _981;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _987 = _977 * _985;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _991 = -_983;
    float _993 = fma(_977, _989, _991);
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _997 = _979 * _995;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1001 = -_987;
    float _1003 = fma(_979, _999, _1001);
    float _1005 = _993 * _993;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1009 = -_997;
    float _1011 = fma(_975, _1007, _1009);
    float _1013 = fma(_1003, _1003, _1005);
    float _1015 = fma(_1011, _1011, _1013);
    float _1017 = rsqrt(_1015);
    float _1019 = _993 * _1017;
    float _1021 = _1003 * _1017;
    float _1023 = _1011 * _1017;
    float _1025 = _1019 * _977;
    float _1027 = _1021 * _979;
    float _1029 = -_1025;
    float _1031 = fma(_1023, _979, _1029);
    float _1033 = -_1027;
    float _1035 = fma(_1019, _975, _1033);
    float _1037 = _965 * _1031;
    float _1039 = _965 * _1035;
    float _1041 = _1023 * _975;
    float _1043 = fma(_971, _1021, _1037);
    float _1045 = fma(_971, _1023, _1039);
    float _1047 = -_1041;
    float _1049 = fma(_1021, _977, _1047);
    float _1051 = fma(_961, _975, _1043);
    float _1053 = fma(_961, _977, _1045);
    float _1055 = _965 * _1049;
    float _1057 = _731 + _1051;
    float _1059 = _755 + _1053;
    float _1061 = fma(_971, _1019, _1055);
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1065 = _1057 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1069 = _1059 + _1067;
    float _1071 = fma(_961, _979, _1061);
    float _1073 = _1065 * _1065;
    float _1075 = _1069 * _1069;
    float _1077 = _723 + _1071;
    float _1079 = _1073 + _1075;
    float _1081 = sqrt(_1079);
    bool _1083 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1021;
    float _1087 = _1071;
    float _1089 = _971;
    float _1091 = _1073;
    if (!_1083)
    {
        _1085 = _1075;
    }
    float _1093 = _1085;
    float _1095 = _1093;
    if (!_1083)
    {
        _1087 = _1057;
    }
    float _1097 = _1087;
    float _1099 = _1097;
    if (!_1083)
    {
        _1089 = _1059;
    }
    float _1101 = _1089;
    float _1103 = _1101;
    if (!_1083)
    {
        _829 = _1077;
    }
    float _1105 = _829;
    bool _1107 = !_1083;
    float _1109 = _1105;
    if (!_1107)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1115 = _1081 + _1113;
        float _1117 = _1077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = rsqrt(_1079);
        float _1121 = _1115 * _1111;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1123 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = _1123 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = fma(_1127, _1117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1135 = _1119 * _1133;
        float _1137 = _1131 + (-1.0);
        float _1139 = fma(_1065, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1141 = fma(_1069, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1143 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1147 = _1139 + _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1151 = _1141 + _1149;
        float _1153 = fma(_1077, _1131, _1143);
        float _1155 = _1147 * _1147;
        float _1157 = _1151 * _1151;
        _1109 = _1153;
        _1091 = _1155;
        _1095 = _1157;
        _1099 = _1139;
        _1103 = _1141;
    }
    float _1159 = _1109;
    float _1161 = _1091;
    float _1163 = _1095;
    float _1165 = _1099;
    float _1167 = _1103;
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1171 = _1159 + _1169;
    float _1173 = fma(_1171, _1171, _1161);
    float _1175 = _1173 + _1163;
    float _1177 = sqrt(_1175);
    bool _1179 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1181 = isnan(_1177);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1187 = _1183 || _1185;
    float _1189 = _1161;
    if (!_1187)
    {
        _1189 = 1.0;
    }
    float _1191 = _1189;
    bool _1193 = !_1187;
    float _1195 = _1191;
    if (!_1193)
    {
        bool _1197 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1199 = isnan(_1177);
        bool _1201 = _1197 || _1199;
        bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1205 = _1201 || _1203;
        if (!_1205)
        {
            float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1209 = _1177 + _1207;
            float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1213 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1211;
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1219 = 1.0 / _1213;
            float _1221 = _1209 * _1219;
            float _1223 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1195 = _1223;
            _1225 = true;
        }
        else
        {
            bool _1227 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1229 = isnan(_1177);
            bool _1231 = _1227 || _1229;
            bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1235 = _1231 || _1233;
            if (!_1235)
            {
                float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1239 = _1177 + _1237;
                float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1249 = 1.0 / _1243;
                float _1251 = _1239 * _1249;
                float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1195 = _1253;
                _1225 = true;
            }
            else
            {
                _1195 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1225 = false;
    float _1255 = _1195;
    float _1257 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1259 = _1159 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1263 = _1165 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _1167 + _1265;
    float _1269 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1271 = fma(_1263, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1273 = fma(_1267, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1275 = _1269 + _901;
    float _1277 = _1271 + _903;
    float _1279 = _1273 + _905;
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1287);
    float _1297 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1301 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1293);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1295);
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1319 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1321 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1325 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1317);
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1319);
    float _1329 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1331 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1323);
    float _1333 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1325);
    float _1335 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1327);
    float _1337 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1329);
    float _1339 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1331);
    float _1341 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1333);
    float _1343 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1335);
    float _1345 = _1337 + _1339;
    float _1347 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1349 = _1345 * 0.5;
    out.m_35.x = _1347;
    out.gl_Position.x = _1341;
    out.gl_Position.y = _1343;
    out.gl_Position.z = _1337;
    out.gl_Position.w = _1339;
    out.m_52.z = _1349;
    out.m_52.w = _1339;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

