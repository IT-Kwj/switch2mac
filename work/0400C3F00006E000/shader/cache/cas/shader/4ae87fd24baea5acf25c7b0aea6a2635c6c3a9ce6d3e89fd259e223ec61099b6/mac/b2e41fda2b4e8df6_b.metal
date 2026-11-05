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
    float4 m_48 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _961 = false;
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
        float _1332 = as_type<float>(_87);
        out.gl_Position.z = _1332;
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
        float _1401 = as_type<float>(_123);
        out.gl_Position.z = _1401;
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
    float _339 = 1.0 / _329;
    float _341 = _325 * _337;
    float _343 = -_325;
    float _345 = _343 + 1.0;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _349 = 1.0 / _333;
    float _351 = _297 * _339;
    bool _353 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_293);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = in.m_42.x;
    float _371 = in.m_42.y;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = fma(_367, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _379 = _363 * _345;
    float _381 = fma(_375, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _313 * _349;
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = _377 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _381 * _379;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _403 = fma(_393, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = fma(_397, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = fma(_403, _341, _401);
    float _411 = fma(_405, _341, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _369;
    float _419 = _415 * _371;
    bool _421 = !_347;
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
    float _451 = in.m_44.x;
    float _453 = in.m_44.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _461;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _481 = _479 != 0;
    float _483 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _485 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_449);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _467);
    float _499 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _483);
    float _501 = 1.0 / _465;
    float _503 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _497);
    bool _505 = _453 > 0.5;
    float _507 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _509 = _471 * _477;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = -_495;
    float _517 = _515 + 1.0;
    float _519 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
    float _521 = fma(_509, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _523 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _525 = isnan(_449);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _537 = _451 > 0.5;
    float _539 = _513 * _501;
    float _541 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
    float _543 = _533 * _517;
    float _545 = -_533;
    float _547 = _545 + 1.0;
    bool _549 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _551 = isnan(_449);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _521 * _543;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _565 = _449 + _563;
    float _567 = -_179;
    int _569 = _537 ? as_type<int>(_567) : as_type<int>(_179);
    float _571 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
    float _573 = -_559;
    float _575 = _573 + 1.0;
    float _577 = fma(_539, _565, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _579 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[115].x, _561);
    float _581 = _503 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _583 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _585 = !_475;
    float _587 = _585 ? _179 : as_type<float>(_569);
    float _589 = _571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _593 = _581 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _597 = _583 + _595;
    float _599 = _495 * _575;
    float _601 = _587 + 0.5;
    float _603 = _593 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _605 = -_183;
    int _607 = _505 ? as_type<int>(_605) : as_type<int>(_183);
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _611 = _589 + _609;
    float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _615 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[28].x, _603);
    float _617 = _601 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _619 = !_481;
    float _621 = _619 ? _183 : as_type<float>(_607);
    float _623 = fma(_577, _599, _579);
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].z, _615);
    float _627 = _617 * _535;
    float _629 = _593 * _593;
    float _631 = -_621;
    float _633 = _631 + 0.5;
    float _635 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[117].x, _623);
    bool _637 = _625 >= 0.0;
    float _639 = fma(_597, _597, _629);
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _643 = fma(_611, _611, _639);
    float _645 = _641 * _613;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = rsqrt(_643);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _657 = _639;
    if (_637)
    {
        _657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _663 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _635 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _679 = as_type<int>(_659);
    if (_637)
    {
        float _681 = _659 * 5.0;
        _679 = as_type<int>(_681);
    }
    int _683 = _679;
    out.m_46.x = _627;
    out.m_46.y = _645;
    float _685 = _593 * _649;
    float _687 = _597 * _649;
    out.m_48.x = _669;
    out.m_48.y = _671;
    out.m_48.z = _673;
    out.m_50.x = _663;
    out.m_50.y = _667;
    out.m_50.z = _675;
    out.m_50.w = _677;
    float _689 = as_type<float>(_683);
    if (_637)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2337 = as_type<float>(_683);
        out.gl_Position.z = _2337;
    }
    if (_637)
    {
        out.m_35.x = 0.0;
    }
    if (_637)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _691 = -_685;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _695 = _611 * _649;
    float _697 = -_687;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _701 = -_685;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _707 = _693 + _705;
    float _709 = -_695;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _699 + _713;
    float _717 = -_687;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _721 = _707 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _725 = _711 + _723;
    float _727 = _703 * _703;
    float _729 = -_695;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _733 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[28].x, _721);
    float _735 = fma(_719, _719, _727);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].z, _733);
    float _739 = fma(_731, _731, _735);
    bool _741 = _737 >= 0.0;
    float _743 = sqrt(_739);
    if (_741)
    {
        _689 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _745 = _689;
    int _747 = as_type<int>(_745);
    if (_741)
    {
        out.m_35.x = 0.0;
    }
    float _749 = _649 * _743;
    if (_741)
    {
        float _751 = _745 * 5.0;
        _747 = as_type<int>(_751);
    }
    int _753 = _747;
    if (_741)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_753);
        out.gl_Position.z = _2468;
    }
    if (_741)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _755 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _763 = _749 * _755;
    float _765 = _749 * _757;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _759 * _763;
    float _773 = _761 * _765;
    float _775 = _771 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _777 = _771 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _779 = _771 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _775);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _777);
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _779);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _789 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _791 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _793 = _787 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _795 = _789 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _797 = _791 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = _583 + _793;
    float _801 = _589 + _795;
    float _803 = _581 + _797;
    float _805 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _807 = _799 + _805;
    float _809 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _811 = _801 + _809;
    float _813 = _807 * _807;
    float _815 = _811 * _811;
    float _817 = _813 + _815;
    float _819 = sqrt(_817);
    bool _821 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _823 = _773;
    float _825 = _797;
    float _827 = _769;
    float _829 = _815;
    float _831 = _799;
    if (!_821)
    {
        _823 = _813;
    }
    float _833 = _823;
    float _835 = _833;
    if (!_821)
    {
        _825 = _801;
    }
    float _837 = _825;
    float _839 = _837;
    if (!_821)
    {
        _827 = _803;
    }
    float _841 = _827;
    bool _843 = !_821;
    float _845 = _841;
    if (!_843)
    {
        float _847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _851 = _819 + _849;
        float _853 = rsqrt(_817);
        float _855 = _851 * _847;
        float _857 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = _855 * 0.15915493667125701904296875;
        float _861 = _859 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 * 6.283185482025146484375;
        float _867 = cos(_865);
        float _869 = fma(_863, _857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _871 = _853 * _869;
        float _873 = _867 + (-1.0);
        float _875 = fma(_807, _871, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _877 = fma(_811, _871, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _879 = _873 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _883 = _875 + _881;
        float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _887 = _877 + _885;
        float _889 = fma(_803, _867, _879);
        float _891 = _883 * _883;
        float _893 = _887 * _887;
        _845 = _889;
        _835 = _891;
        _829 = _893;
        _831 = _875;
        _839 = _877;
    }
    float _895 = _845;
    float _897 = _835;
    float _899 = _829;
    float _901 = _831;
    float _903 = _839;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _907 = _895 + _905;
    float _909 = fma(_907, _907, _897);
    float _911 = _909 + _899;
    float _913 = sqrt(_911);
    bool _915 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _917 = isnan(_913);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _923 = _919 || _921;
    float _925 = _909;
    if (!_923)
    {
        _925 = 1.0;
    }
    float _927 = _925;
    bool _929 = !_923;
    float _931 = _927;
    if (!_929)
    {
        bool _933 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _935 = isnan(_913);
        bool _937 = _933 || _935;
        bool _939 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _941 = _937 || _939;
        if (!_941)
        {
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _945 = _913 + _943;
            float _947 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _949 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _947;
            float _951 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _953 = _951 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _955 = 1.0 / _949;
            float _957 = _945 * _955;
            float _959 = fma(_957, _953, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _931 = _959;
            _961 = true;
        }
        else
        {
            bool _963 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _965 = isnan(_913);
            bool _967 = _963 || _965;
            bool _969 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _971 = _967 || _969;
            if (!_971)
            {
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _975 = _913 + _973;
                float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _979 = _977 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _981 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _983 = _981 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _985 = 1.0 / _979;
                float _987 = _975 * _985;
                float _989 = fma(_987, _983, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _931 = _989;
                _961 = true;
            }
            else
            {
                _931 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _961 = false;
    float _991 = _931;
    float _993 = _693 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _995 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _997 = _901 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1001 = _903 + _999;
    float _1003 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _993);
    bool _1005 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1017 = _895 + _1015;
    float _1019 = _693 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1021 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1003);
    float _1023 = fma(_997, _991, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1025 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1019);
    float _1027 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1029 = -_687;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1033 = fma(_1017, _991, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1035 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1025);
    float _1037 = 1.0 / _1027;
    float _1039 = fma(_1001, _991, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1041 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    float _1051 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1053 = -_685;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1057 = -_695;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _1061 = _1051 + _1027;
    float _1063 = _1051;
    float _1065 = _1055;
    float _1067 = _1059;
    if (_1013)
    {
        _1063 = _1031;
    }
    float _1069 = _1063;
    float _1071 = _1069;
    if (!_1013)
    {
        float _1073 = _707 * _707;
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1077 = -_589;
        float _1079 = _1077 + _1039;
        float _1081 = -_583;
        float _1083 = _1081 + _1023;
        float _1085 = fma(_715, _715, _1073);
        float _1087 = -_581;
        float _1089 = _1087 + _1033;
        float _1091 = fma(_725, _725, _1085);
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1095 = sqrt(_1091);
        float _1097 = 1.0 / _749;
        float _1099 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1101 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1103 = _1101 * _1075;
        float _1105 = _1103 * _1097;
        float _1107 = _1099 * _1105;
        float _1109 = _1079 * _1105;
        float _1111 = fma(_1089, _1107, _693);
        float _1113 = fma(_1083, _1107, _699);
        float _1115 = fma(_1099, _1109, _711);
        _1065 = _1111;
        _1071 = _1113;
        _1067 = _1115;
    }
    float _1117 = _1065;
    float _1119 = _1071;
    float _1121 = _1067;
    float _1123 = _1061 * _1037;
    float _1125 = _1123 * 0.5;
    float _1127 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1135 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1133);
    float _1143 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1135);
    float _1145 = _1135;
    if (_1049)
    {
        _1145 = 1.0;
    }
    float _1147 = _1145;
    float _1149 = _1147;
    if (!_1049)
    {
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1155 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1153);
        float _1157 = _1151 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1165 = _1163 * 0.15915493667125701904296875;
        float _1167 = _1157 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = 1.0 / _1161;
        float _1173 = _1165 * 6.283185482025146484375;
        float _1175 = cos(_1173);
        float _1177 = _1169 * _1171;
        float _1179 = 1.0 / _1155;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1181;
        float _1185 = _1175 * _1177;
        float _1187 = _1165 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = 1.0 / _1185;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1195 = _1179 * _1193;
        float _1197 = 1.0 / _1183;
        float _1199 = _1189 * _1191;
        float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1203 = fma(_1199, _1195, _1201);
        float _1205 = _1203 * _1197;
        float _1207 = precise::clamp(_1205, 0.0, 1.0);
        _1149 = _1207;
    }
    float _1209 = _1149;
    float _1211 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1137);
    float _1213 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1215 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1139);
    float _1217 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1221 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1225 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1227 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1229 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1221);
    float _1231 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1223);
    float _1233 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1235 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1225);
    float _1237 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1229);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1231);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1233);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1235);
    float _1247 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1241);
    bool _1251 = _1209 > 0.0;
    bool _1253 = isnan(_1209);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(0.0);
    bool _1259 = _1255 || _1257;
    float _1261 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1243);
    float _1263 = _1209 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1265 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1245);
    float _1267 = _1247 + _1249;
    float _1269 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1261);
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1273 = _1267 * 0.5;
    out.m_35.x = _1271;
    out.gl_Position.x = _1265;
    out.gl_Position.y = _1269;
    out.gl_Position.z = _1247;
    out.gl_Position.w = _1249;
    out.m_52.z = _1273;
    out.m_52.w = _1249;
    if (_1259)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1275 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1275;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _961 = false;
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
        float _1332 = as_type<float>(_87);
        out.gl_Position.z = _1332;
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
        float _1401 = as_type<float>(_123);
        out.gl_Position.z = _1401;
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
    float _339 = 1.0 / _329;
    float _341 = _325 * _337;
    float _343 = -_325;
    float _345 = _343 + 1.0;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _349 = 1.0 / _333;
    float _351 = _297 * _339;
    bool _353 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_293);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = in.m_42.x;
    float _371 = in.m_42.y;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = fma(_367, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _379 = _363 * _345;
    float _381 = fma(_375, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _313 * _349;
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = _377 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _381 * _379;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _403 = fma(_393, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = fma(_397, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = fma(_403, _341, _401);
    float _411 = fma(_405, _341, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _369;
    float _419 = _415 * _371;
    bool _421 = !_347;
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
    float _451 = in.m_44.x;
    float _453 = in.m_44.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _461;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _481 = _479 != 0;
    float _483 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _485 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_449);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _467);
    float _499 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _483);
    float _501 = 1.0 / _465;
    float _503 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _497);
    bool _505 = _453 > 0.5;
    float _507 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _509 = _471 * _477;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = -_495;
    float _517 = _515 + 1.0;
    float _519 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
    float _521 = fma(_509, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _523 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _525 = isnan(_449);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _537 = _451 > 0.5;
    float _539 = _513 * _501;
    float _541 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
    float _543 = _533 * _517;
    float _545 = -_533;
    float _547 = _545 + 1.0;
    bool _549 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _551 = isnan(_449);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _521 * _543;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _565 = _449 + _563;
    float _567 = -_179;
    int _569 = _537 ? as_type<int>(_567) : as_type<int>(_179);
    float _571 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
    float _573 = -_559;
    float _575 = _573 + 1.0;
    float _577 = fma(_539, _565, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _579 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[115].x, _561);
    float _581 = _503 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _583 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _585 = !_475;
    float _587 = _585 ? _179 : as_type<float>(_569);
    float _589 = _571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _593 = _581 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _597 = _583 + _595;
    float _599 = _495 * _575;
    float _601 = _587 + 0.5;
    float _603 = _593 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _605 = -_183;
    int _607 = _505 ? as_type<int>(_605) : as_type<int>(_183);
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _611 = _589 + _609;
    float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _615 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[28].x, _603);
    float _617 = _601 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _619 = !_481;
    float _621 = _619 ? _183 : as_type<float>(_607);
    float _623 = fma(_577, _599, _579);
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].z, _615);
    float _627 = _617 * _535;
    float _629 = _593 * _593;
    float _631 = -_621;
    float _633 = _631 + 0.5;
    float _635 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[117].x, _623);
    bool _637 = _625 >= 0.0;
    float _639 = fma(_597, _597, _629);
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _643 = fma(_611, _611, _639);
    float _645 = _641 * _613;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = rsqrt(_643);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _657 = _639;
    if (_637)
    {
        _657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _663 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _635 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _679 = as_type<int>(_659);
    if (_637)
    {
        float _681 = _659 * 5.0;
        _679 = as_type<int>(_681);
    }
    int _683 = _679;
    out.m_46.x = _627;
    out.m_46.y = _645;
    float _685 = _593 * _649;
    float _687 = _597 * _649;
    out.m_48.x = _669;
    out.m_48.y = _671;
    out.m_48.z = _673;
    out.m_50.x = _663;
    out.m_50.y = _667;
    out.m_50.z = _675;
    out.m_50.w = _677;
    float _689 = as_type<float>(_683);
    if (_637)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2337 = as_type<float>(_683);
        out.gl_Position.z = _2337;
    }
    if (_637)
    {
        out.m_35.x = 0.0;
    }
    if (_637)
    {
        return out;
    }
    float _691 = -_685;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _695 = _611 * _649;
    float _697 = -_687;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _701 = -_685;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _707 = _693 + _705;
    float _709 = -_695;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _699 + _713;
    float _717 = -_687;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _721 = _707 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _725 = _711 + _723;
    float _727 = _703 * _703;
    float _729 = -_695;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _733 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[28].x, _721);
    float _735 = fma(_719, _719, _727);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].z, _733);
    float _739 = fma(_731, _731, _735);
    bool _741 = _737 >= 0.0;
    float _743 = sqrt(_739);
    if (_741)
    {
        _689 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _745 = _689;
    int _747 = as_type<int>(_745);
    if (_741)
    {
        out.m_35.x = 0.0;
    }
    float _749 = _649 * _743;
    if (_741)
    {
        float _751 = _745 * 5.0;
        _747 = as_type<int>(_751);
    }
    int _753 = _747;
    if (_741)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_753);
        out.gl_Position.z = _2468;
    }
    if (_741)
    {
        return out;
    }
    float _755 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _763 = _749 * _755;
    float _765 = _749 * _757;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _759 * _763;
    float _773 = _761 * _765;
    float _775 = _771 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _777 = _771 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _779 = _771 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _775);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _777);
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _779);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _789 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _791 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _793 = _787 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _795 = _789 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _797 = _791 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = _583 + _793;
    float _801 = _589 + _795;
    float _803 = _581 + _797;
    float _805 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _807 = _799 + _805;
    float _809 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _811 = _801 + _809;
    float _813 = _807 * _807;
    float _815 = _811 * _811;
    float _817 = _813 + _815;
    float _819 = sqrt(_817);
    bool _821 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _823 = _773;
    float _825 = _797;
    float _827 = _769;
    float _829 = _815;
    float _831 = _799;
    if (!_821)
    {
        _823 = _813;
    }
    float _833 = _823;
    float _835 = _833;
    if (!_821)
    {
        _825 = _801;
    }
    float _837 = _825;
    float _839 = _837;
    if (!_821)
    {
        _827 = _803;
    }
    float _841 = _827;
    bool _843 = !_821;
    float _845 = _841;
    if (!_843)
    {
        float _847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _851 = _819 + _849;
        float _853 = rsqrt(_817);
        float _855 = _851 * _847;
        float _857 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = _855 * 0.15915493667125701904296875;
        float _861 = _859 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 * 6.283185482025146484375;
        float _867 = cos(_865);
        float _869 = fma(_863, _857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _871 = _853 * _869;
        float _873 = _867 + (-1.0);
        float _875 = fma(_807, _871, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _877 = fma(_811, _871, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _879 = _873 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _883 = _875 + _881;
        float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _887 = _877 + _885;
        float _889 = fma(_803, _867, _879);
        float _891 = _883 * _883;
        float _893 = _887 * _887;
        _845 = _889;
        _835 = _891;
        _829 = _893;
        _831 = _875;
        _839 = _877;
    }
    float _895 = _845;
    float _897 = _835;
    float _899 = _829;
    float _901 = _831;
    float _903 = _839;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _907 = _895 + _905;
    float _909 = fma(_907, _907, _897);
    float _911 = _909 + _899;
    float _913 = sqrt(_911);
    bool _915 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _917 = isnan(_913);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _923 = _919 || _921;
    float _925 = _909;
    if (!_923)
    {
        _925 = 1.0;
    }
    float _927 = _925;
    bool _929 = !_923;
    float _931 = _927;
    if (!_929)
    {
        bool _933 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _935 = isnan(_913);
        bool _937 = _933 || _935;
        bool _939 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _941 = _937 || _939;
        if (!_941)
        {
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _945 = _913 + _943;
            float _947 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _949 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _947;
            float _951 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _953 = _951 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _955 = 1.0 / _949;
            float _957 = _945 * _955;
            float _959 = fma(_957, _953, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _931 = _959;
            _961 = true;
        }
        else
        {
            bool _963 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _965 = isnan(_913);
            bool _967 = _963 || _965;
            bool _969 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _971 = _967 || _969;
            if (!_971)
            {
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _975 = _913 + _973;
                float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _979 = _977 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _981 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _983 = _981 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _985 = 1.0 / _979;
                float _987 = _975 * _985;
                float _989 = fma(_987, _983, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _931 = _989;
                _961 = true;
            }
            else
            {
                _931 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _961 = false;
    float _991 = _931;
    float _993 = _693 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _995 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _997 = _901 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1001 = _903 + _999;
    float _1003 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _993);
    bool _1005 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1017 = _895 + _1015;
    float _1019 = _693 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1021 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1003);
    float _1023 = fma(_997, _991, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1025 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1019);
    float _1027 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1029 = -_687;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1033 = fma(_1017, _991, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1035 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1025);
    float _1037 = 1.0 / _1027;
    float _1039 = fma(_1001, _991, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1041 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    float _1051 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1053 = -_685;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1057 = -_695;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _1061 = _1051 + _1027;
    float _1063 = _1051;
    float _1065 = _1055;
    float _1067 = _1059;
    if (_1013)
    {
        _1063 = _1031;
    }
    float _1069 = _1063;
    float _1071 = _1069;
    if (!_1013)
    {
        float _1073 = _707 * _707;
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1077 = -_589;
        float _1079 = _1077 + _1039;
        float _1081 = -_583;
        float _1083 = _1081 + _1023;
        float _1085 = fma(_715, _715, _1073);
        float _1087 = -_581;
        float _1089 = _1087 + _1033;
        float _1091 = fma(_725, _725, _1085);
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1095 = sqrt(_1091);
        float _1097 = 1.0 / _749;
        float _1099 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1101 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1103 = _1101 * _1075;
        float _1105 = _1103 * _1097;
        float _1107 = _1099 * _1105;
        float _1109 = _1079 * _1105;
        float _1111 = fma(_1089, _1107, _693);
        float _1113 = fma(_1083, _1107, _699);
        float _1115 = fma(_1099, _1109, _711);
        _1065 = _1111;
        _1071 = _1113;
        _1067 = _1115;
    }
    float _1117 = _1065;
    float _1119 = _1071;
    float _1121 = _1067;
    float _1123 = _1061 * _1037;
    float _1125 = _1123 * 0.5;
    float _1127 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1135 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1133);
    float _1143 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1135);
    float _1145 = _1135;
    if (_1049)
    {
        _1145 = 1.0;
    }
    float _1147 = _1145;
    float _1149 = _1147;
    if (!_1049)
    {
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1155 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1153);
        float _1157 = _1151 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1165 = _1163 * 0.15915493667125701904296875;
        float _1167 = _1157 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = 1.0 / _1161;
        float _1173 = _1165 * 6.283185482025146484375;
        float _1175 = cos(_1173);
        float _1177 = _1169 * _1171;
        float _1179 = 1.0 / _1155;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1181;
        float _1185 = _1175 * _1177;
        float _1187 = _1165 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = 1.0 / _1185;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1195 = _1179 * _1193;
        float _1197 = 1.0 / _1183;
        float _1199 = _1189 * _1191;
        float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1203 = fma(_1199, _1195, _1201);
        float _1205 = _1203 * _1197;
        float _1207 = precise::clamp(_1205, 0.0, 1.0);
        _1149 = _1207;
    }
    float _1209 = _1149;
    float _1211 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1137);
    float _1213 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1215 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1139);
    float _1217 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1221 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1225 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1227 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1229 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1221);
    float _1231 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1223);
    float _1233 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1235 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1225);
    float _1237 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1229);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1231);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1233);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1235);
    float _1247 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1241);
    bool _1251 = _1209 > 0.0;
    bool _1253 = isnan(_1209);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(0.0);
    bool _1259 = _1255 || _1257;
    float _1261 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1243);
    float _1263 = _1209 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1265 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1245);
    float _1267 = _1247 + _1249;
    float _1269 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1261);
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1273 = _1267 * 0.5;
    out.m_35.x = _1271;
    out.gl_Position.x = _1265;
    out.gl_Position.y = _1269;
    out.gl_Position.z = _1247;
    out.gl_Position.w = _1249;
    out.m_52.z = _1273;
    out.m_52.w = _1249;
    if (_1259)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1275 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1275;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _961 = false;
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
        float _1332 = as_type<float>(_87);
        out.gl_Position.z = _1332;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1401 = as_type<float>(_123);
        out.gl_Position.z = _1401;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _339 = 1.0 / _329;
    float _341 = _325 * _337;
    float _343 = -_325;
    float _345 = _343 + 1.0;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _349 = 1.0 / _333;
    float _351 = _297 * _339;
    bool _353 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_293);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = in.m_42.x;
    float _371 = in.m_42.y;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = fma(_367, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _379 = _363 * _345;
    float _381 = fma(_375, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _313 * _349;
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = _377 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _381 * _379;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _403 = fma(_393, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = fma(_397, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = fma(_403, _341, _401);
    float _411 = fma(_405, _341, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _369;
    float _419 = _415 * _371;
    bool _421 = !_347;
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
    float _451 = in.m_44.x;
    float _453 = in.m_44.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _461;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _481 = _479 != 0;
    float _483 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _485 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_449);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _467);
    float _499 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _483);
    float _501 = 1.0 / _465;
    float _503 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _497);
    bool _505 = _453 > 0.5;
    float _507 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _509 = _471 * _477;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = -_495;
    float _517 = _515 + 1.0;
    float _519 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
    float _521 = fma(_509, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _523 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _525 = isnan(_449);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _537 = _451 > 0.5;
    float _539 = _513 * _501;
    float _541 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
    float _543 = _533 * _517;
    float _545 = -_533;
    float _547 = _545 + 1.0;
    bool _549 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _551 = isnan(_449);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _521 * _543;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _565 = _449 + _563;
    float _567 = -_179;
    int _569 = _537 ? as_type<int>(_567) : as_type<int>(_179);
    float _571 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
    float _573 = -_559;
    float _575 = _573 + 1.0;
    float _577 = fma(_539, _565, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _579 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[115].x, _561);
    float _581 = _503 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _583 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _585 = !_475;
    float _587 = _585 ? _179 : as_type<float>(_569);
    float _589 = _571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _593 = _581 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _597 = _583 + _595;
    float _599 = _495 * _575;
    float _601 = _587 + 0.5;
    float _603 = _593 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _605 = -_183;
    int _607 = _505 ? as_type<int>(_605) : as_type<int>(_183);
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _611 = _589 + _609;
    float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _615 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[28].x, _603);
    float _617 = _601 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _619 = !_481;
    float _621 = _619 ? _183 : as_type<float>(_607);
    float _623 = fma(_577, _599, _579);
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].z, _615);
    float _627 = _617 * _535;
    float _629 = _593 * _593;
    float _631 = -_621;
    float _633 = _631 + 0.5;
    float _635 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[117].x, _623);
    bool _637 = _625 >= 0.0;
    float _639 = fma(_597, _597, _629);
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _643 = fma(_611, _611, _639);
    float _645 = _641 * _613;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = rsqrt(_643);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _657 = _639;
    if (_637)
    {
        _657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _663 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _635 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _679 = as_type<int>(_659);
    if (_637)
    {
        float _681 = _659 * 5.0;
        _679 = as_type<int>(_681);
    }
    int _683 = _679;
    out.m_46.x = _627;
    out.m_46.y = _645;
    float _685 = _593 * _649;
    float _687 = _597 * _649;
    out.m_48.x = _669;
    out.m_48.y = _671;
    out.m_48.z = _673;
    out.m_50.x = _663;
    out.m_50.y = _667;
    out.m_50.z = _675;
    out.m_50.w = _677;
    float _689 = as_type<float>(_683);
    if (_637)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2337 = as_type<float>(_683);
        out.gl_Position.z = _2337;
    }
    if (_637)
    {
        out.m_35.x = 0.0;
    }
    if (_637)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _691 = -_685;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _695 = _611 * _649;
    float _697 = -_687;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _701 = -_685;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _707 = _693 + _705;
    float _709 = -_695;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _699 + _713;
    float _717 = -_687;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _721 = _707 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _725 = _711 + _723;
    float _727 = _703 * _703;
    float _729 = -_695;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _733 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[28].x, _721);
    float _735 = fma(_719, _719, _727);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].z, _733);
    float _739 = fma(_731, _731, _735);
    bool _741 = _737 >= 0.0;
    float _743 = sqrt(_739);
    if (_741)
    {
        _689 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _745 = _689;
    int _747 = as_type<int>(_745);
    if (_741)
    {
        out.m_35.x = 0.0;
    }
    float _749 = _649 * _743;
    if (_741)
    {
        float _751 = _745 * 5.0;
        _747 = as_type<int>(_751);
    }
    int _753 = _747;
    if (_741)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_753);
        out.gl_Position.z = _2468;
    }
    if (_741)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _755 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _763 = _749 * _755;
    float _765 = _749 * _757;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _759 * _763;
    float _773 = _761 * _765;
    float _775 = _771 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _777 = _771 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _779 = _771 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _775);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _777);
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _779);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _789 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _791 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _793 = _787 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _795 = _789 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _797 = _791 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = _583 + _793;
    float _801 = _589 + _795;
    float _803 = _581 + _797;
    float _805 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _807 = _799 + _805;
    float _809 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _811 = _801 + _809;
    float _813 = _807 * _807;
    float _815 = _811 * _811;
    float _817 = _813 + _815;
    float _819 = sqrt(_817);
    bool _821 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _823 = _773;
    float _825 = _797;
    float _827 = _769;
    float _829 = _815;
    float _831 = _799;
    if (!_821)
    {
        _823 = _813;
    }
    float _833 = _823;
    float _835 = _833;
    if (!_821)
    {
        _825 = _801;
    }
    float _837 = _825;
    float _839 = _837;
    if (!_821)
    {
        _827 = _803;
    }
    float _841 = _827;
    bool _843 = !_821;
    float _845 = _841;
    if (!_843)
    {
        float _847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _851 = _819 + _849;
        float _853 = rsqrt(_817);
        float _855 = _851 * _847;
        float _857 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = _855 * 0.15915493667125701904296875;
        float _861 = _859 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 * 6.283185482025146484375;
        float _867 = cos(_865);
        float _869 = fma(_863, _857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _871 = _853 * _869;
        float _873 = _867 + (-1.0);
        float _875 = fma(_807, _871, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _877 = fma(_811, _871, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _879 = _873 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _883 = _875 + _881;
        float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _887 = _877 + _885;
        float _889 = fma(_803, _867, _879);
        float _891 = _883 * _883;
        float _893 = _887 * _887;
        _845 = _889;
        _835 = _891;
        _829 = _893;
        _831 = _875;
        _839 = _877;
    }
    float _895 = _845;
    float _897 = _835;
    float _899 = _829;
    float _901 = _831;
    float _903 = _839;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _907 = _895 + _905;
    float _909 = fma(_907, _907, _897);
    float _911 = _909 + _899;
    float _913 = sqrt(_911);
    bool _915 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _917 = isnan(_913);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _923 = _919 || _921;
    float _925 = _909;
    if (!_923)
    {
        _925 = 1.0;
    }
    float _927 = _925;
    bool _929 = !_923;
    float _931 = _927;
    if (!_929)
    {
        bool _933 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _935 = isnan(_913);
        bool _937 = _933 || _935;
        bool _939 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _941 = _937 || _939;
        if (!_941)
        {
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _945 = _913 + _943;
            float _947 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _949 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _947;
            float _951 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _953 = _951 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _955 = 1.0 / _949;
            float _957 = _945 * _955;
            float _959 = fma(_957, _953, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _931 = _959;
            _961 = true;
        }
        else
        {
            bool _963 = _913 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _965 = isnan(_913);
            bool _967 = _963 || _965;
            bool _969 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _971 = _967 || _969;
            if (!_971)
            {
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _975 = _913 + _973;
                float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _979 = _977 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _981 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _983 = _981 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _985 = 1.0 / _979;
                float _987 = _975 * _985;
                float _989 = fma(_987, _983, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _931 = _989;
                _961 = true;
            }
            else
            {
                _931 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _961 = false;
    float _991 = _931;
    float _993 = _693 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _995 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _997 = _901 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1001 = _903 + _999;
    float _1003 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _993);
    bool _1005 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1017 = _895 + _1015;
    float _1019 = _693 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1021 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1003);
    float _1023 = fma(_997, _991, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1025 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1019);
    float _1027 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1029 = -_687;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1033 = fma(_1017, _991, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1035 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1025);
    float _1037 = 1.0 / _1027;
    float _1039 = fma(_1001, _991, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1041 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    float _1051 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1053 = -_685;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1057 = -_695;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _1061 = _1051 + _1027;
    float _1063 = _1051;
    float _1065 = _1055;
    float _1067 = _1059;
    if (_1013)
    {
        _1063 = _1031;
    }
    float _1069 = _1063;
    float _1071 = _1069;
    if (!_1013)
    {
        float _1073 = _707 * _707;
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1077 = -_589;
        float _1079 = _1077 + _1039;
        float _1081 = -_583;
        float _1083 = _1081 + _1023;
        float _1085 = fma(_715, _715, _1073);
        float _1087 = -_581;
        float _1089 = _1087 + _1033;
        float _1091 = fma(_725, _725, _1085);
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1095 = sqrt(_1091);
        float _1097 = 1.0 / _749;
        float _1099 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1101 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1103 = _1101 * _1075;
        float _1105 = _1103 * _1097;
        float _1107 = _1099 * _1105;
        float _1109 = _1079 * _1105;
        float _1111 = fma(_1089, _1107, _693);
        float _1113 = fma(_1083, _1107, _699);
        float _1115 = fma(_1099, _1109, _711);
        _1065 = _1111;
        _1071 = _1113;
        _1067 = _1115;
    }
    float _1117 = _1065;
    float _1119 = _1071;
    float _1121 = _1067;
    float _1123 = _1061 * _1037;
    float _1125 = _1123 * 0.5;
    float _1127 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1135 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1133);
    float _1143 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1135);
    float _1145 = _1135;
    if (_1049)
    {
        _1145 = 1.0;
    }
    float _1147 = _1145;
    float _1149 = _1147;
    if (!_1049)
    {
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1155 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1153);
        float _1157 = _1151 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1165 = _1163 * 0.15915493667125701904296875;
        float _1167 = _1157 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = 1.0 / _1161;
        float _1173 = _1165 * 6.283185482025146484375;
        float _1175 = cos(_1173);
        float _1177 = _1169 * _1171;
        float _1179 = 1.0 / _1155;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1181;
        float _1185 = _1175 * _1177;
        float _1187 = _1165 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = 1.0 / _1185;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1195 = _1179 * _1193;
        float _1197 = 1.0 / _1183;
        float _1199 = _1189 * _1191;
        float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1203 = fma(_1199, _1195, _1201);
        float _1205 = _1203 * _1197;
        float _1207 = precise::clamp(_1205, 0.0, 1.0);
        _1149 = _1207;
    }
    float _1209 = _1149;
    float _1211 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1137);
    float _1213 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1215 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1139);
    float _1217 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1221 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1225 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1227 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1229 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1221);
    float _1231 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1223);
    float _1233 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1235 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1225);
    float _1237 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1229);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1231);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1233);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1235);
    float _1247 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1241);
    bool _1251 = _1209 > 0.0;
    bool _1253 = isnan(_1209);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(0.0);
    bool _1259 = _1255 || _1257;
    float _1261 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1243);
    float _1263 = _1209 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1265 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1245);
    float _1267 = _1247 + _1249;
    float _1269 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1261);
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1273 = _1267 * 0.5;
    out.m_35.x = _1271;
    out.gl_Position.x = _1265;
    out.gl_Position.y = _1269;
    out.gl_Position.z = _1247;
    out.gl_Position.w = _1249;
    out.m_52.z = _1273;
    out.m_52.w = _1249;
    if (_1259)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1275 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1275;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

