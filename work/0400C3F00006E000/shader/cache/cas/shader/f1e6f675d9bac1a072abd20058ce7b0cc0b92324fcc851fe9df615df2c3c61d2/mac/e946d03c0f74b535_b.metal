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
    float4 m_46 [[user(locn1)]];
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1097 = false;
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
        float _1278 = as_type<float>(_87);
        out.gl_Position.z = _1278;
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
        float _1347 = as_type<float>(_123);
        out.gl_Position.z = _1347;
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
    float _451 = in.m_44.x;
    float _453 = in.m_44.y;
    float _455 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _457 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _455);
    float _469 = 1.0 / _461;
    float _471 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _473 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    float _479 = 1.0 / _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _485 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _487 = isnan(_449);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    bool _501 = _451 > 0.5;
    float _503 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _505 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _507 = isnan(_449);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = 1.0 / _483;
    bool _519 = _453 > 0.5;
    float _521 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _523;
    float _527 = -_515;
    float _529 = _527 + 1.0;
    bool _531 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_449);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _545 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _547 = _495 * _529;
    float _549 = _525 * _469;
    float _551 = -_495;
    float _553 = _551 + 1.0;
    bool _555 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _557 = isnan(_449);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _449 + _567;
    float _571 = -_541;
    float _573 = _571 + 1.0;
    float _575 = _541 * _553;
    float _577 = fma(_549, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _583 = _565 * _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _585;
    float _589 = _545 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _591 = _581 * _479;
    float _593 = _577 * _583;
    float _595 = _587 * _517;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _449 + _597;
    float _601 = _543 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _589 + _603;
    float _607 = -_565;
    float _609 = _607 + 1.0;
    float _611 = fma(_591, _599, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _615 = _601 + _613;
    float _617 = _605 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _619 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _593);
    float _621 = -_179;
    int _623 = _501 ? as_type<int>(_621) : as_type<int>(_179);
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].x, _617);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _631 = _449 + _629;
    float _633 = _473 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _635 = !_477;
    float _637 = _635 ? _179 : as_type<float>(_623);
    float _639 = fma(_611, _575, _619);
    float _641 = -_183;
    int _643 = _519 ? as_type<int>(_641) : as_type<int>(_183);
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _647 = _633 + _645;
    float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _651 = _637 + 0.5;
    bool _653 = !_499;
    float _655 = _653 ? _183 : as_type<float>(_643);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[28].z, _627);
    float _659 = fma(_595, _631, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _661 = _651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _663 = -_655;
    float _665 = _663 + 0.5;
    bool _667 = _657 >= 0.0;
    float _669 = _661 * _625;
    float _671 = fma(_659, _547, _639);
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _675 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[118].x, _671);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _683 = _659;
    float _685 = _547;
    float _687 = _595;
    float _689 = _589;
    if (_667)
    {
        _683 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _691 = _683;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = _673 * _649;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _703 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _717 = as_type<int>(_691);
    float _719 = _649;
    int _721 = as_type<int>(_707);
    if (_667)
    {
        float _723 = _691 * 5.0;
        _717 = as_type<int>(_723);
    }
    int _725 = _717;
    out.m_46.x = _703;
    out.m_46.y = _705;
    out.m_46.z = _707;
    out.m_46.w = _701;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _729 = _727 != 0;
    out.m_48.x = _669;
    out.m_48.y = _699;
    out.m_50.x = _709;
    out.m_50.y = _711;
    out.m_50.z = _713;
    out.m_50.w = _715;
    if (_667)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2342 = as_type<float>(_725);
        out.gl_Position.z = _2342;
    }
    if (!_729)
    {
        _685 = 0.0;
    }
    float _731 = _685;
    float _733 = _731;
    if (!_729)
    {
        _687 = 0.0;
    }
    float _735 = _687;
    float _737 = _735;
    if (!_729)
    {
        _719 = 0.0;
    }
    float _739 = _719;
    bool _741 = !_729;
    float _743 = _739;
    if (!_741)
    {
        float _745 = -_589;
        float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _749 = -_601;
        float _751 = _749 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _753 = -_633;
        float _755 = _753 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _757 = _747 * _747;
        float _759 = fma(_751, _751, _757);
        float _761 = fma(_755, _755, _759);
        float _763 = rsqrt(_761);
        float _765 = _763 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _767 = _751 * _765;
        float _769 = _747 * _765;
        float _771 = _755 * _765;
        _737 = _769;
        _733 = _767;
        _743 = _771;
    }
    float _773 = _737;
    float _775 = _733;
    float _777 = _743;
    if (_667)
    {
        out.m_35.x = 0.0;
    }
    if (_667)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _779 = _589 + _773;
    float _781 = _601 + _775;
    float _783 = _633 + _777;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = _779 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _791 = _781 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _795 = _783 + _793;
    float _797 = _787 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _799 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[28].x, _797);
    float _801 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[28].z, _799);
    bool _803 = _801 >= 0.0;
    float _805 = _791;
    if (_803)
    {
        _805 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _807 = _805;
    if (_803)
    {
        out.m_35.x = 0.0;
    }
    if (_803)
    {
        float _809 = _807 * 5.0;
        _721 = as_type<int>(_809);
    }
    int _811 = _721;
    if (_803)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2494 = as_type<float>(_811);
        out.gl_Position.z = _2494;
    }
    if (_803)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _813 = -_589;
    float _815 = _813 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = -_601;
    float _819 = _817 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _821 = -_633;
    float _823 = _821 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = _815 * _815;
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _831 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _833 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _835 = fma(_819, _819, _827);
    float _837 = _829 * _825;
    float _839 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _841 = fma(_823, _823, _835);
    float _843 = _831 * _839;
    float _845 = rsqrt(_841);
    float _847 = _819 * _845;
    float _849 = _823 * _845;
    float _851 = _815 * _845;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _855 = _847 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _849 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _863 = -_855;
    float _865 = fma(_849, _861, _863);
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _869 = _851 * _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _873 = -_859;
    float _875 = fma(_851, _871, _873);
    float _877 = _865 * _865;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _881 = -_869;
    float _883 = fma(_847, _879, _881);
    float _885 = fma(_875, _875, _877);
    float _887 = fma(_883, _883, _885);
    float _889 = rsqrt(_887);
    float _891 = _865 * _889;
    float _893 = _875 * _889;
    float _895 = _883 * _889;
    float _897 = _891 * _849;
    float _899 = _893 * _851;
    float _901 = -_897;
    float _903 = fma(_895, _851, _901);
    float _905 = -_899;
    float _907 = fma(_891, _847, _905);
    float _909 = _837 * _903;
    float _911 = _837 * _907;
    float _913 = _895 * _847;
    float _915 = fma(_843, _893, _909);
    float _917 = fma(_843, _895, _911);
    float _919 = -_913;
    float _921 = fma(_893, _849, _919);
    float _923 = fma(_833, _847, _915);
    float _925 = fma(_833, _849, _917);
    float _927 = _837 * _921;
    float _929 = _601 + _923;
    float _931 = _633 + _925;
    float _933 = fma(_843, _891, _927);
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _929 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _941 = _931 + _939;
    float _943 = fma(_833, _851, _933);
    float _945 = _937 * _937;
    float _947 = _941 * _941;
    float _949 = _589 + _943;
    float _951 = _945 + _947;
    float _953 = sqrt(_951);
    bool _955 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _957 = _893;
    float _959 = _943;
    float _961 = _843;
    float _963 = _945;
    if (!_955)
    {
        _957 = _947;
    }
    float _965 = _957;
    float _967 = _965;
    if (!_955)
    {
        _959 = _929;
    }
    float _969 = _959;
    float _971 = _969;
    if (!_955)
    {
        _961 = _931;
    }
    float _973 = _961;
    float _975 = _973;
    if (!_955)
    {
        _689 = _949;
    }
    float _977 = _689;
    bool _979 = !_955;
    float _981 = _977;
    if (!_979)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _987 = _953 + _985;
        float _989 = _949 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _991 = rsqrt(_951);
        float _993 = _987 * _983;
        float _995 = _993 * 0.15915493667125701904296875;
        float _997 = _995 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        float _1005 = fma(_999, _989, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1007 = _991 * _1005;
        float _1009 = _1003 + (-1.0);
        float _1011 = fma(_937, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1013 = fma(_941, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1015 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1019 = _1011 + _1017;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1023 = _1013 + _1021;
        float _1025 = fma(_949, _1003, _1015);
        float _1027 = _1019 * _1019;
        float _1029 = _1023 * _1023;
        _981 = _1025;
        _963 = _1027;
        _967 = _1029;
        _971 = _1011;
        _975 = _1013;
    }
    float _1031 = _981;
    float _1033 = _963;
    float _1035 = _967;
    float _1037 = _971;
    float _1039 = _975;
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1043 = _1031 + _1041;
    float _1045 = fma(_1043, _1043, _1033);
    float _1047 = _1045 + _1035;
    float _1049 = sqrt(_1047);
    bool _1051 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1053 = isnan(_1049);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1059 = _1055 || _1057;
    float _1061 = _1033;
    if (!_1059)
    {
        _1061 = 1.0;
    }
    float _1063 = _1061;
    bool _1065 = !_1059;
    float _1067 = _1063;
    if (!_1065)
    {
        bool _1069 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1071 = isnan(_1049);
        bool _1073 = _1069 || _1071;
        bool _1075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1077 = _1073 || _1075;
        if (!_1077)
        {
            float _1079 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1081 = _1049 + _1079;
            float _1083 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1085 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1083;
            float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1089 = _1087 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1091 = 1.0 / _1085;
            float _1093 = _1081 * _1091;
            float _1095 = fma(_1093, _1089, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1067 = _1095;
            _1097 = true;
        }
        else
        {
            bool _1099 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1101 = isnan(_1049);
            bool _1103 = _1099 || _1101;
            bool _1105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1107 = _1103 || _1105;
            if (!_1107)
            {
                float _1109 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1111 = _1049 + _1109;
                float _1113 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1115 = _1113 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1119 = _1117 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1121 = 1.0 / _1115;
                float _1123 = _1111 * _1121;
                float _1125 = fma(_1123, _1119, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1067 = _1125;
                _1097 = true;
            }
            else
            {
                _1067 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1097 = false;
    float _1127 = _1067;
    float _1129 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1131 = _1031 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1135 = _1037 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1139 = _1039 + _1137;
    float _1141 = fma(_1131, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1143 = fma(_1135, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1145 = fma(_1139, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1147 = _1141 + _773;
    float _1149 = _1143 + _775;
    float _1151 = _1145 + _777;
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1159 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1161 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1153);
    float _1163 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    float _1165 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1157);
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1159);
    float _1169 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1161);
    float _1171 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1163);
    float _1173 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1165);
    float _1175 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1167);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1185 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1187 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1189 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1191 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1185);
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1187);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1189);
    float _1199 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1201 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1193);
    float _1203 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1195);
    float _1205 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1197);
    float _1207 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1199);
    float _1209 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1201);
    float _1211 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1203);
    float _1213 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1205);
    float _1215 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1217 = _1209 + _1211;
    float _1219 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1221 = _1217 * 0.5;
    out.m_35.x = _1219;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1215;
    out.gl_Position.z = _1209;
    out.gl_Position.w = _1211;
    out.m_52.z = _1221;
    out.m_52.w = _1211;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1097 = false;
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
        float _1278 = as_type<float>(_87);
        out.gl_Position.z = _1278;
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
        float _1347 = as_type<float>(_123);
        out.gl_Position.z = _1347;
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
    float _451 = in.m_44.x;
    float _453 = in.m_44.y;
    float _455 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _457 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _455);
    float _469 = 1.0 / _461;
    float _471 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _473 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    float _479 = 1.0 / _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _485 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _487 = isnan(_449);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    bool _501 = _451 > 0.5;
    float _503 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _505 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _507 = isnan(_449);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = 1.0 / _483;
    bool _519 = _453 > 0.5;
    float _521 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _523;
    float _527 = -_515;
    float _529 = _527 + 1.0;
    bool _531 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_449);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _545 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _547 = _495 * _529;
    float _549 = _525 * _469;
    float _551 = -_495;
    float _553 = _551 + 1.0;
    bool _555 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _557 = isnan(_449);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _449 + _567;
    float _571 = -_541;
    float _573 = _571 + 1.0;
    float _575 = _541 * _553;
    float _577 = fma(_549, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _583 = _565 * _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _585;
    float _589 = _545 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _591 = _581 * _479;
    float _593 = _577 * _583;
    float _595 = _587 * _517;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _449 + _597;
    float _601 = _543 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _589 + _603;
    float _607 = -_565;
    float _609 = _607 + 1.0;
    float _611 = fma(_591, _599, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _615 = _601 + _613;
    float _617 = _605 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _619 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _593);
    float _621 = -_179;
    int _623 = _501 ? as_type<int>(_621) : as_type<int>(_179);
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].x, _617);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _631 = _449 + _629;
    float _633 = _473 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _635 = !_477;
    float _637 = _635 ? _179 : as_type<float>(_623);
    float _639 = fma(_611, _575, _619);
    float _641 = -_183;
    int _643 = _519 ? as_type<int>(_641) : as_type<int>(_183);
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _647 = _633 + _645;
    float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _651 = _637 + 0.5;
    bool _653 = !_499;
    float _655 = _653 ? _183 : as_type<float>(_643);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[28].z, _627);
    float _659 = fma(_595, _631, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _661 = _651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _663 = -_655;
    float _665 = _663 + 0.5;
    bool _667 = _657 >= 0.0;
    float _669 = _661 * _625;
    float _671 = fma(_659, _547, _639);
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _675 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[118].x, _671);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _683 = _659;
    float _685 = _547;
    float _687 = _595;
    float _689 = _589;
    if (_667)
    {
        _683 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _691 = _683;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = _673 * _649;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _703 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _717 = as_type<int>(_691);
    float _719 = _649;
    int _721 = as_type<int>(_707);
    if (_667)
    {
        float _723 = _691 * 5.0;
        _717 = as_type<int>(_723);
    }
    int _725 = _717;
    out.m_46.x = _703;
    out.m_46.y = _705;
    out.m_46.z = _707;
    out.m_46.w = _701;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _729 = _727 != 0;
    out.m_48.x = _669;
    out.m_48.y = _699;
    out.m_50.x = _709;
    out.m_50.y = _711;
    out.m_50.z = _713;
    out.m_50.w = _715;
    if (_667)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2342 = as_type<float>(_725);
        out.gl_Position.z = _2342;
    }
    if (!_729)
    {
        _685 = 0.0;
    }
    float _731 = _685;
    float _733 = _731;
    if (!_729)
    {
        _687 = 0.0;
    }
    float _735 = _687;
    float _737 = _735;
    if (!_729)
    {
        _719 = 0.0;
    }
    float _739 = _719;
    bool _741 = !_729;
    float _743 = _739;
    if (!_741)
    {
        float _745 = -_589;
        float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _749 = -_601;
        float _751 = _749 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _753 = -_633;
        float _755 = _753 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _757 = _747 * _747;
        float _759 = fma(_751, _751, _757);
        float _761 = fma(_755, _755, _759);
        float _763 = rsqrt(_761);
        float _765 = _763 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _767 = _751 * _765;
        float _769 = _747 * _765;
        float _771 = _755 * _765;
        _737 = _769;
        _733 = _767;
        _743 = _771;
    }
    float _773 = _737;
    float _775 = _733;
    float _777 = _743;
    if (_667)
    {
        out.m_35.x = 0.0;
    }
    if (_667)
    {
        return out;
    }
    float _779 = _589 + _773;
    float _781 = _601 + _775;
    float _783 = _633 + _777;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = _779 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _791 = _781 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _795 = _783 + _793;
    float _797 = _787 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _799 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[28].x, _797);
    float _801 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[28].z, _799);
    bool _803 = _801 >= 0.0;
    float _805 = _791;
    if (_803)
    {
        _805 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _807 = _805;
    if (_803)
    {
        out.m_35.x = 0.0;
    }
    if (_803)
    {
        float _809 = _807 * 5.0;
        _721 = as_type<int>(_809);
    }
    int _811 = _721;
    if (_803)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2494 = as_type<float>(_811);
        out.gl_Position.z = _2494;
    }
    if (_803)
    {
        return out;
    }
    float _813 = -_589;
    float _815 = _813 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = -_601;
    float _819 = _817 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _821 = -_633;
    float _823 = _821 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = _815 * _815;
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _831 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _833 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _835 = fma(_819, _819, _827);
    float _837 = _829 * _825;
    float _839 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _841 = fma(_823, _823, _835);
    float _843 = _831 * _839;
    float _845 = rsqrt(_841);
    float _847 = _819 * _845;
    float _849 = _823 * _845;
    float _851 = _815 * _845;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _855 = _847 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _849 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _863 = -_855;
    float _865 = fma(_849, _861, _863);
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _869 = _851 * _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _873 = -_859;
    float _875 = fma(_851, _871, _873);
    float _877 = _865 * _865;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _881 = -_869;
    float _883 = fma(_847, _879, _881);
    float _885 = fma(_875, _875, _877);
    float _887 = fma(_883, _883, _885);
    float _889 = rsqrt(_887);
    float _891 = _865 * _889;
    float _893 = _875 * _889;
    float _895 = _883 * _889;
    float _897 = _891 * _849;
    float _899 = _893 * _851;
    float _901 = -_897;
    float _903 = fma(_895, _851, _901);
    float _905 = -_899;
    float _907 = fma(_891, _847, _905);
    float _909 = _837 * _903;
    float _911 = _837 * _907;
    float _913 = _895 * _847;
    float _915 = fma(_843, _893, _909);
    float _917 = fma(_843, _895, _911);
    float _919 = -_913;
    float _921 = fma(_893, _849, _919);
    float _923 = fma(_833, _847, _915);
    float _925 = fma(_833, _849, _917);
    float _927 = _837 * _921;
    float _929 = _601 + _923;
    float _931 = _633 + _925;
    float _933 = fma(_843, _891, _927);
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _929 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _941 = _931 + _939;
    float _943 = fma(_833, _851, _933);
    float _945 = _937 * _937;
    float _947 = _941 * _941;
    float _949 = _589 + _943;
    float _951 = _945 + _947;
    float _953 = sqrt(_951);
    bool _955 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _957 = _893;
    float _959 = _943;
    float _961 = _843;
    float _963 = _945;
    if (!_955)
    {
        _957 = _947;
    }
    float _965 = _957;
    float _967 = _965;
    if (!_955)
    {
        _959 = _929;
    }
    float _969 = _959;
    float _971 = _969;
    if (!_955)
    {
        _961 = _931;
    }
    float _973 = _961;
    float _975 = _973;
    if (!_955)
    {
        _689 = _949;
    }
    float _977 = _689;
    bool _979 = !_955;
    float _981 = _977;
    if (!_979)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _987 = _953 + _985;
        float _989 = _949 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _991 = rsqrt(_951);
        float _993 = _987 * _983;
        float _995 = _993 * 0.15915493667125701904296875;
        float _997 = _995 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        float _1005 = fma(_999, _989, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1007 = _991 * _1005;
        float _1009 = _1003 + (-1.0);
        float _1011 = fma(_937, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1013 = fma(_941, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1015 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1019 = _1011 + _1017;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1023 = _1013 + _1021;
        float _1025 = fma(_949, _1003, _1015);
        float _1027 = _1019 * _1019;
        float _1029 = _1023 * _1023;
        _981 = _1025;
        _963 = _1027;
        _967 = _1029;
        _971 = _1011;
        _975 = _1013;
    }
    float _1031 = _981;
    float _1033 = _963;
    float _1035 = _967;
    float _1037 = _971;
    float _1039 = _975;
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1043 = _1031 + _1041;
    float _1045 = fma(_1043, _1043, _1033);
    float _1047 = _1045 + _1035;
    float _1049 = sqrt(_1047);
    bool _1051 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1053 = isnan(_1049);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1059 = _1055 || _1057;
    float _1061 = _1033;
    if (!_1059)
    {
        _1061 = 1.0;
    }
    float _1063 = _1061;
    bool _1065 = !_1059;
    float _1067 = _1063;
    if (!_1065)
    {
        bool _1069 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1071 = isnan(_1049);
        bool _1073 = _1069 || _1071;
        bool _1075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1077 = _1073 || _1075;
        if (!_1077)
        {
            float _1079 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1081 = _1049 + _1079;
            float _1083 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1085 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1083;
            float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1089 = _1087 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1091 = 1.0 / _1085;
            float _1093 = _1081 * _1091;
            float _1095 = fma(_1093, _1089, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1067 = _1095;
            _1097 = true;
        }
        else
        {
            bool _1099 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1101 = isnan(_1049);
            bool _1103 = _1099 || _1101;
            bool _1105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1107 = _1103 || _1105;
            if (!_1107)
            {
                float _1109 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1111 = _1049 + _1109;
                float _1113 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1115 = _1113 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1119 = _1117 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1121 = 1.0 / _1115;
                float _1123 = _1111 * _1121;
                float _1125 = fma(_1123, _1119, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1067 = _1125;
                _1097 = true;
            }
            else
            {
                _1067 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1097 = false;
    float _1127 = _1067;
    float _1129 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1131 = _1031 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1135 = _1037 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1139 = _1039 + _1137;
    float _1141 = fma(_1131, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1143 = fma(_1135, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1145 = fma(_1139, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1147 = _1141 + _773;
    float _1149 = _1143 + _775;
    float _1151 = _1145 + _777;
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1159 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1161 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1153);
    float _1163 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    float _1165 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1157);
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1159);
    float _1169 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1161);
    float _1171 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1163);
    float _1173 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1165);
    float _1175 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1167);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1185 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1187 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1189 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1191 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1185);
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1187);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1189);
    float _1199 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1201 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1193);
    float _1203 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1195);
    float _1205 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1197);
    float _1207 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1199);
    float _1209 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1201);
    float _1211 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1203);
    float _1213 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1205);
    float _1215 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1217 = _1209 + _1211;
    float _1219 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1221 = _1217 * 0.5;
    out.m_35.x = _1219;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1215;
    out.gl_Position.z = _1209;
    out.gl_Position.w = _1211;
    out.m_52.z = _1221;
    out.m_52.w = _1211;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1097 = false;
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
        float _1278 = as_type<float>(_87);
        out.gl_Position.z = _1278;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1347 = as_type<float>(_123);
        out.gl_Position.z = _1347;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _451 = in.m_44.x;
    float _453 = in.m_44.y;
    float _455 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _457 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _455);
    float _469 = 1.0 / _461;
    float _471 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _473 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    float _479 = 1.0 / _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _485 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _487 = isnan(_449);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    bool _501 = _451 > 0.5;
    float _503 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _505 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _507 = isnan(_449);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = 1.0 / _483;
    bool _519 = _453 > 0.5;
    float _521 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _523;
    float _527 = -_515;
    float _529 = _527 + 1.0;
    bool _531 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_449);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _545 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _547 = _495 * _529;
    float _549 = _525 * _469;
    float _551 = -_495;
    float _553 = _551 + 1.0;
    bool _555 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _557 = isnan(_449);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _449 + _567;
    float _571 = -_541;
    float _573 = _571 + 1.0;
    float _575 = _541 * _553;
    float _577 = fma(_549, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _583 = _565 * _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _585;
    float _589 = _545 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _591 = _581 * _479;
    float _593 = _577 * _583;
    float _595 = _587 * _517;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _449 + _597;
    float _601 = _543 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _589 + _603;
    float _607 = -_565;
    float _609 = _607 + 1.0;
    float _611 = fma(_591, _599, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _615 = _601 + _613;
    float _617 = _605 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _619 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _593);
    float _621 = -_179;
    int _623 = _501 ? as_type<int>(_621) : as_type<int>(_179);
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].x, _617);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _631 = _449 + _629;
    float _633 = _473 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _635 = !_477;
    float _637 = _635 ? _179 : as_type<float>(_623);
    float _639 = fma(_611, _575, _619);
    float _641 = -_183;
    int _643 = _519 ? as_type<int>(_641) : as_type<int>(_183);
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _647 = _633 + _645;
    float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _651 = _637 + 0.5;
    bool _653 = !_499;
    float _655 = _653 ? _183 : as_type<float>(_643);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[28].z, _627);
    float _659 = fma(_595, _631, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _661 = _651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _663 = -_655;
    float _665 = _663 + 0.5;
    bool _667 = _657 >= 0.0;
    float _669 = _661 * _625;
    float _671 = fma(_659, _547, _639);
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _675 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[118].x, _671);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _683 = _659;
    float _685 = _547;
    float _687 = _595;
    float _689 = _589;
    if (_667)
    {
        _683 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _691 = _683;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = _673 * _649;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _703 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _675 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _717 = as_type<int>(_691);
    float _719 = _649;
    int _721 = as_type<int>(_707);
    if (_667)
    {
        float _723 = _691 * 5.0;
        _717 = as_type<int>(_723);
    }
    int _725 = _717;
    out.m_46.x = _703;
    out.m_46.y = _705;
    out.m_46.z = _707;
    out.m_46.w = _701;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _729 = _727 != 0;
    out.m_48.x = _669;
    out.m_48.y = _699;
    out.m_50.x = _709;
    out.m_50.y = _711;
    out.m_50.z = _713;
    out.m_50.w = _715;
    if (_667)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2342 = as_type<float>(_725);
        out.gl_Position.z = _2342;
    }
    if (!_729)
    {
        _685 = 0.0;
    }
    float _731 = _685;
    float _733 = _731;
    if (!_729)
    {
        _687 = 0.0;
    }
    float _735 = _687;
    float _737 = _735;
    if (!_729)
    {
        _719 = 0.0;
    }
    float _739 = _719;
    bool _741 = !_729;
    float _743 = _739;
    if (!_741)
    {
        float _745 = -_589;
        float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _749 = -_601;
        float _751 = _749 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _753 = -_633;
        float _755 = _753 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _757 = _747 * _747;
        float _759 = fma(_751, _751, _757);
        float _761 = fma(_755, _755, _759);
        float _763 = rsqrt(_761);
        float _765 = _763 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _767 = _751 * _765;
        float _769 = _747 * _765;
        float _771 = _755 * _765;
        _737 = _769;
        _733 = _767;
        _743 = _771;
    }
    float _773 = _737;
    float _775 = _733;
    float _777 = _743;
    if (_667)
    {
        out.m_35.x = 0.0;
    }
    if (_667)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _779 = _589 + _773;
    float _781 = _601 + _775;
    float _783 = _633 + _777;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = _779 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _791 = _781 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _795 = _783 + _793;
    float _797 = _787 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _799 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[28].x, _797);
    float _801 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[28].z, _799);
    bool _803 = _801 >= 0.0;
    float _805 = _791;
    if (_803)
    {
        _805 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _807 = _805;
    if (_803)
    {
        out.m_35.x = 0.0;
    }
    if (_803)
    {
        float _809 = _807 * 5.0;
        _721 = as_type<int>(_809);
    }
    int _811 = _721;
    if (_803)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2494 = as_type<float>(_811);
        out.gl_Position.z = _2494;
    }
    if (_803)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _813 = -_589;
    float _815 = _813 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = -_601;
    float _819 = _817 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _821 = -_633;
    float _823 = _821 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = _815 * _815;
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _831 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _833 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _835 = fma(_819, _819, _827);
    float _837 = _829 * _825;
    float _839 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _841 = fma(_823, _823, _835);
    float _843 = _831 * _839;
    float _845 = rsqrt(_841);
    float _847 = _819 * _845;
    float _849 = _823 * _845;
    float _851 = _815 * _845;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _855 = _847 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _849 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _863 = -_855;
    float _865 = fma(_849, _861, _863);
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _869 = _851 * _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _873 = -_859;
    float _875 = fma(_851, _871, _873);
    float _877 = _865 * _865;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _881 = -_869;
    float _883 = fma(_847, _879, _881);
    float _885 = fma(_875, _875, _877);
    float _887 = fma(_883, _883, _885);
    float _889 = rsqrt(_887);
    float _891 = _865 * _889;
    float _893 = _875 * _889;
    float _895 = _883 * _889;
    float _897 = _891 * _849;
    float _899 = _893 * _851;
    float _901 = -_897;
    float _903 = fma(_895, _851, _901);
    float _905 = -_899;
    float _907 = fma(_891, _847, _905);
    float _909 = _837 * _903;
    float _911 = _837 * _907;
    float _913 = _895 * _847;
    float _915 = fma(_843, _893, _909);
    float _917 = fma(_843, _895, _911);
    float _919 = -_913;
    float _921 = fma(_893, _849, _919);
    float _923 = fma(_833, _847, _915);
    float _925 = fma(_833, _849, _917);
    float _927 = _837 * _921;
    float _929 = _601 + _923;
    float _931 = _633 + _925;
    float _933 = fma(_843, _891, _927);
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _929 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _941 = _931 + _939;
    float _943 = fma(_833, _851, _933);
    float _945 = _937 * _937;
    float _947 = _941 * _941;
    float _949 = _589 + _943;
    float _951 = _945 + _947;
    float _953 = sqrt(_951);
    bool _955 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _957 = _893;
    float _959 = _943;
    float _961 = _843;
    float _963 = _945;
    if (!_955)
    {
        _957 = _947;
    }
    float _965 = _957;
    float _967 = _965;
    if (!_955)
    {
        _959 = _929;
    }
    float _969 = _959;
    float _971 = _969;
    if (!_955)
    {
        _961 = _931;
    }
    float _973 = _961;
    float _975 = _973;
    if (!_955)
    {
        _689 = _949;
    }
    float _977 = _689;
    bool _979 = !_955;
    float _981 = _977;
    if (!_979)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _987 = _953 + _985;
        float _989 = _949 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _991 = rsqrt(_951);
        float _993 = _987 * _983;
        float _995 = _993 * 0.15915493667125701904296875;
        float _997 = _995 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        float _1005 = fma(_999, _989, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1007 = _991 * _1005;
        float _1009 = _1003 + (-1.0);
        float _1011 = fma(_937, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1013 = fma(_941, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1015 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1019 = _1011 + _1017;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1023 = _1013 + _1021;
        float _1025 = fma(_949, _1003, _1015);
        float _1027 = _1019 * _1019;
        float _1029 = _1023 * _1023;
        _981 = _1025;
        _963 = _1027;
        _967 = _1029;
        _971 = _1011;
        _975 = _1013;
    }
    float _1031 = _981;
    float _1033 = _963;
    float _1035 = _967;
    float _1037 = _971;
    float _1039 = _975;
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1043 = _1031 + _1041;
    float _1045 = fma(_1043, _1043, _1033);
    float _1047 = _1045 + _1035;
    float _1049 = sqrt(_1047);
    bool _1051 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1053 = isnan(_1049);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1059 = _1055 || _1057;
    float _1061 = _1033;
    if (!_1059)
    {
        _1061 = 1.0;
    }
    float _1063 = _1061;
    bool _1065 = !_1059;
    float _1067 = _1063;
    if (!_1065)
    {
        bool _1069 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1071 = isnan(_1049);
        bool _1073 = _1069 || _1071;
        bool _1075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1077 = _1073 || _1075;
        if (!_1077)
        {
            float _1079 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1081 = _1049 + _1079;
            float _1083 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1085 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1083;
            float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1089 = _1087 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1091 = 1.0 / _1085;
            float _1093 = _1081 * _1091;
            float _1095 = fma(_1093, _1089, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1067 = _1095;
            _1097 = true;
        }
        else
        {
            bool _1099 = _1049 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1101 = isnan(_1049);
            bool _1103 = _1099 || _1101;
            bool _1105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1107 = _1103 || _1105;
            if (!_1107)
            {
                float _1109 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1111 = _1049 + _1109;
                float _1113 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1115 = _1113 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1119 = _1117 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1121 = 1.0 / _1115;
                float _1123 = _1111 * _1121;
                float _1125 = fma(_1123, _1119, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1067 = _1125;
                _1097 = true;
            }
            else
            {
                _1067 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1097 = false;
    float _1127 = _1067;
    float _1129 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1131 = _1031 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1135 = _1037 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1139 = _1039 + _1137;
    float _1141 = fma(_1131, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1143 = fma(_1135, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1145 = fma(_1139, _1127, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1147 = _1141 + _773;
    float _1149 = _1143 + _775;
    float _1151 = _1145 + _777;
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1159 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1161 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1153);
    float _1163 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    float _1165 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1157);
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1159);
    float _1169 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1161);
    float _1171 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1163);
    float _1173 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1165);
    float _1175 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1167);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1185 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1187 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1189 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1191 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1185);
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1187);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1189);
    float _1199 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1201 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1193);
    float _1203 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1195);
    float _1205 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1197);
    float _1207 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1199);
    float _1209 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1201);
    float _1211 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1203);
    float _1213 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1205);
    float _1215 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1217 = _1209 + _1211;
    float _1219 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1221 = _1217 * 0.5;
    out.m_35.x = _1219;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1215;
    out.gl_Position.z = _1209;
    out.gl_Position.w = _1211;
    out.m_52.z = _1221;
    out.m_52.w = _1211;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

