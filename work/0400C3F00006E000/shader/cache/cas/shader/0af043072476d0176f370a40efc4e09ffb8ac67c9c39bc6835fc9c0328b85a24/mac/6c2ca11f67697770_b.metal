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
    bool _365 = false;
    bool _243 = false;
    bool _141 = false;
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
    if (!_69)
    {
        out.m_33.x = 0.0;
    }
    int _75 = 0;
    if (!_69)
    {
        float _77 = _73 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _923 = as_type<float>(_79);
        out.gl_Position.z = _923;
    }
    if (!_69)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_35.w;
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
        float _101 = float(_65);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_33.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _992 = as_type<float>(_117);
        out.gl_Position.z = _992;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_37.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_65);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _153 = _149 + _151;
    bool _155 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _157 = isnan(_149);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _163 = _159 || _161;
    float _165 = float(_163);
    float _167 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _169 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _167;
    float _171 = -_165;
    float _173 = _171 + 1.0;
    bool _175 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _177 = isnan(_149);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _183 = _179 || _181;
    float _185 = float(_183);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _187;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _193 = 1.0 / _169;
    float _195 = _185 * _173;
    float _197 = -_185;
    float _199 = _197 + 1.0;
    float _201 = _153 * _193;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _203;
    float _207 = fma(_189, _201, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _209 = fma(_205, _201, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _211 = _207 * _195;
    float _213 = _209 * _195;
    float _215 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[143].x, _211);
    float _217 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[143].y, _213);
    float _219 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[144].x, _215);
    float _221 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[144].y, _217);
    bool _223 = !_191;
    float _241;
    if (!_223)
    {
        float _225 = in.m_37.x;
        float _227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _233 = _231 * _227;
        float _235 = floor(_233);
        float _237 = -_235;
        float _239 = _233 + _237;
        _241 = _239;
        _243 = true;
    }
    else
    {
        float _245 = float(_65);
        float _247 = 1.0 / _245;
        float _249 = _97 * _247;
        _241 = _249;
    }
    _243 = false;
    float _251 = _241;
    float _253 = in.m_39.x;
    float _255 = in.m_39.y;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _259 = _251 + _257;
    bool _261 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _263 = isnan(_251);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = -_271;
    float _281 = _279 + 1.0;
    float _283 = 1.0 / _275;
    float _285 = _221 * _255;
    float _287 = _259 * _283;
    bool _289 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _291 = isnan(_251);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _309;
    float _313 = _219 * _253;
    float _315 = _299 * _281;
    float _317 = fma(_303, _287, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _319 = fma(_311, _287, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _321 = fma(_307, _287, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _323 = -_299;
    float _325 = _323 + 1.0;
    float _327 = _317 * _315;
    float _329 = _319 * _315;
    float _331 = _321 * _315;
    float _333 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].x, _327);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].y, _329);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].z, _331);
    float _339 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].x, _333);
    float _341 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].y, _335);
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].z, _337);
    bool _345 = !_277;
    float _363;
    if (!_345)
    {
        float _347 = in.m_37.x;
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _351 = _347 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_65);
        float _369 = 1.0 / _367;
        float _371 = _97 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = as_type<float>(int(gl_VertexIndex));
    float _377 = _285 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _379 = in.m_30.x;
    float _381 = in.m_30.y;
    float _383 = in.m_30.z;
    int _385 = as_type<int>(_375) & 1;
    bool _387 = _385 != 0;
    int _389 = as_type<int>(_375) & 2;
    bool _391 = _389 != 0;
    float _393 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _395 = !_391;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _403 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _397);
    bool _405 = !_387;
    float _407 = _405 ? (-0.5) : 0.5;
    float _409 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].z, _401);
    float _411 = _377 * _403;
    float _413 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _407);
    float _417 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = _413 * _415;
    float _423 = _411 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _427 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _429 = _411 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _431 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[26].x, _423);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _435 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _429);
    float _439 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[26].z, _431);
    float _441 = _433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _443 = _435 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _445 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[24].z, _437);
    float _447 = _439 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _445 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _457 = _443 + _447;
    float _459 = 1.0 / _451;
    float _461 = _441 + _455;
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _465 = _457 + _463;
    float _467 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _469 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _471 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _473 = _461 + _471;
    float _475 = _465 * _465;
    float _477 = _411 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _467);
    float _485 = fma(_473, _473, _475);
    bool _487 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = isnan(_373);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _469);
    float _501 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    float _503 = sqrt(_485);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _507 = _373 + _505;
    float _509 = _481 * _459;
    float _511 = _501 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _513 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_373);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_497;
    float _527 = _525 + 1.0;
    float _529 = fma(_509, _507, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[25].x, _477);
    float _533 = 1.0 / _511;
    float _535 = _523 * _527;
    float _537 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[10].z, _499);
    float _539 = -_523;
    float _541 = _539 + 1.0;
    float _543 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[25].z, _531);
    float _545 = _529 * _535;
    float _547 = _537 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _549 = _503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _553 = _543 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _555 = _547 + _511;
    float _557 = _453 + _553;
    float _559 = _555 * _533;
    float _561 = _559 * 0.5;
    float _563 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[116].x, _551);
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _567 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[30].w, _565);
    float _569 = _535;
    float _571 = _551;
    float _573 = _497;
    float _575 = _473;
    if (!_549)
    {
        _569 = _461;
    }
    float _577 = _569;
    float _579 = _577;
    if (!_549)
    {
        _571 = _457;
    }
    float _581 = _571;
    float _583 = _581;
    if (!_549)
    {
        _573 = _557;
    }
    float _585 = _573;
    bool _587 = !_549;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _595 = _503 + _593;
        float _597 = _557 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _599 = rsqrt(_485);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _617 = fma(_611, _597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _619 = fma(_557, _607, _615);
        float _621 = _599 * _617;
        float _623 = fma(_473, _621, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _625 = fma(_465, _621, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _589 = _619;
        _579 = _623;
        _583 = _625;
    }
    float _627 = _589;
    float _629 = _579;
    float _631 = _583;
    float _633 = 1.0 / _567;
    bool _635 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _637 = isnan(0.5);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _643 = _639 || _641;
    float _645 = _627 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _647 = _627 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _649 = _627 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _651 = _627 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[1].x, _645);
    float _655 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[0].x, _647);
    float _657 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[2].x, _649);
    float _659 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[3].x, _651);
    float _661 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[1].z, _653);
    float _663 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[0].z, _655);
    float _665 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[2].z, _657);
    float _667 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[3].z, _659);
    float _669 = _655;
    if (_643)
    {
        _669 = 1.0;
    }
    float _671 = _669;
    float _673 = _661 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _675 = _671;
    if (_643)
    {
        _575 = 1.0;
    }
    float _677 = _575;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _681 = _633 * _679;
    float _683 = _677;
    if (!_643)
    {
        float _685 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _687 = _685 * 0.15915493667125701904296875;
        float _689 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _691 = _687 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = _689 * 0.15915493667125701904296875;
        float _697 = _687 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = 1.0 / _693;
        float _703 = _695 * 6.283185482025146484375;
        float _705 = cos(_703);
        float _707 = _699 * _701;
        float _709 = _695 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _715 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _713;
        float _717 = _705 * _707;
        float _719 = 1.0 / _715;
        float _721 = 1.0 / _717;
        float _723 = _711 * _721;
        float _725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _727 = fma(_681, _723, _725);
        float _729 = _727 * _719;
        float _731 = precise::clamp(_729, 0.0, 1.0);
        _675 = _731;
    }
    float _733 = _675;
    if (!_643)
    {
        float _735 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _739 = _735 * 0.15915493667125701904296875;
        float _741 = _737 * 0.15915493667125701904296875;
        float _743 = _739 * 6.283185482025146484375;
        float _745 = cos(_743);
        float _747 = _739 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = 1.0 / _745;
        float _753 = _741 * 6.283185482025146484375;
        float _755 = cos(_753);
        float _757 = _749 * _751;
        float _759 = _741 * 6.283185482025146484375;
        float _761 = sin(_759);
        float _763 = _755 * _757;
        float _765 = 1.0 / _763;
        float _767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _767;
        float _771 = 1.0 / _769;
        float _773 = _761 * _765;
        float _775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _777 = fma(_681, _773, _775);
        float _779 = _777 * _771;
        float _781 = precise::clamp(_779, 0.0, 1.0);
        float _783 = -_781;
        float _785 = _783 + 1.0;
        _683 = _785;
    }
    float _787 = _683;
    float _789 = _663 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _791 = _673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _793 = _673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _795 = _665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _797 = _673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _791);
    float _801 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _793);
    float _803 = _673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _805 = _667 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[6].z, _799);
    float _809 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[7].z, _801);
    bool _811 = _733 > 0.0;
    bool _813 = isnan(_733);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    float _821 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _797);
    float _823 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _803);
    float _825 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[6].w, _807);
    float _827 = _733 * _787;
    float _829 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[7].w, _809);
    bool _831 = _787 <= 0.0;
    bool _833 = !_819;
    bool _835 = _831 || _833;
    float _837 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[4].z, _821);
    float _839 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[5].z, _823);
    float _841 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _843 = _339 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = _341 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _847 = _343 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _849 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _851 = _825 + _829;
    float _853 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[4].w, _837);
    float _855 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[5].w, _839);
    float _857 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _849 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _865 = _851 * 0.5;
    out.m_44.x = _857;
    out.m_44.y = _859;
    out.m_44.z = _861;
    out.m_44.w = _841;
    out.m_33.x = _863;
    out.gl_Position.x = _853;
    out.gl_Position.y = _855;
    out.gl_Position.z = _825;
    out.gl_Position.w = _829;
    out.m_46.z = _865;
    out.m_46.w = _829;
    if (!_835)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _867 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _867;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _365 = false;
    bool _243 = false;
    bool _141 = false;
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
    if (!_69)
    {
        out.m_33.x = 0.0;
    }
    int _75 = 0;
    if (!_69)
    {
        float _77 = _73 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _923 = as_type<float>(_79);
        out.gl_Position.z = _923;
    }
    if (!_69)
    {
        return out;
    }
    float _83 = in.m_35.w;
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
        float _101 = float(_65);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_33.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _992 = as_type<float>(_117);
        out.gl_Position.z = _992;
    }
    if (_109)
    {
        return out;
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_37.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_65);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _153 = _149 + _151;
    bool _155 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _157 = isnan(_149);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _163 = _159 || _161;
    float _165 = float(_163);
    float _167 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _169 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _167;
    float _171 = -_165;
    float _173 = _171 + 1.0;
    bool _175 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _177 = isnan(_149);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _183 = _179 || _181;
    float _185 = float(_183);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _187;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _193 = 1.0 / _169;
    float _195 = _185 * _173;
    float _197 = -_185;
    float _199 = _197 + 1.0;
    float _201 = _153 * _193;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _203;
    float _207 = fma(_189, _201, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _209 = fma(_205, _201, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _211 = _207 * _195;
    float _213 = _209 * _195;
    float _215 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[143].x, _211);
    float _217 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[143].y, _213);
    float _219 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[144].x, _215);
    float _221 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[144].y, _217);
    bool _223 = !_191;
    float _241;
    if (!_223)
    {
        float _225 = in.m_37.x;
        float _227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _233 = _231 * _227;
        float _235 = floor(_233);
        float _237 = -_235;
        float _239 = _233 + _237;
        _241 = _239;
        _243 = true;
    }
    else
    {
        float _245 = float(_65);
        float _247 = 1.0 / _245;
        float _249 = _97 * _247;
        _241 = _249;
    }
    _243 = false;
    float _251 = _241;
    float _253 = in.m_39.x;
    float _255 = in.m_39.y;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _259 = _251 + _257;
    bool _261 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _263 = isnan(_251);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = -_271;
    float _281 = _279 + 1.0;
    float _283 = 1.0 / _275;
    float _285 = _221 * _255;
    float _287 = _259 * _283;
    bool _289 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _291 = isnan(_251);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _309;
    float _313 = _219 * _253;
    float _315 = _299 * _281;
    float _317 = fma(_303, _287, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _319 = fma(_311, _287, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _321 = fma(_307, _287, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _323 = -_299;
    float _325 = _323 + 1.0;
    float _327 = _317 * _315;
    float _329 = _319 * _315;
    float _331 = _321 * _315;
    float _333 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].x, _327);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].y, _329);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].z, _331);
    float _339 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].x, _333);
    float _341 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].y, _335);
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].z, _337);
    bool _345 = !_277;
    float _363;
    if (!_345)
    {
        float _347 = in.m_37.x;
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _351 = _347 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_65);
        float _369 = 1.0 / _367;
        float _371 = _97 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = as_type<float>(int(gl_VertexIndex));
    float _377 = _285 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _379 = in.m_30.x;
    float _381 = in.m_30.y;
    float _383 = in.m_30.z;
    int _385 = as_type<int>(_375) & 1;
    bool _387 = _385 != 0;
    int _389 = as_type<int>(_375) & 2;
    bool _391 = _389 != 0;
    float _393 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _395 = !_391;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _403 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _397);
    bool _405 = !_387;
    float _407 = _405 ? (-0.5) : 0.5;
    float _409 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].z, _401);
    float _411 = _377 * _403;
    float _413 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _407);
    float _417 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = _413 * _415;
    float _423 = _411 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _427 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _429 = _411 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _431 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[26].x, _423);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _435 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _429);
    float _439 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[26].z, _431);
    float _441 = _433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _443 = _435 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _445 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[24].z, _437);
    float _447 = _439 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _445 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _457 = _443 + _447;
    float _459 = 1.0 / _451;
    float _461 = _441 + _455;
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _465 = _457 + _463;
    float _467 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _469 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _471 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _473 = _461 + _471;
    float _475 = _465 * _465;
    float _477 = _411 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _467);
    float _485 = fma(_473, _473, _475);
    bool _487 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = isnan(_373);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _469);
    float _501 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    float _503 = sqrt(_485);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _507 = _373 + _505;
    float _509 = _481 * _459;
    float _511 = _501 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _513 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_373);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_497;
    float _527 = _525 + 1.0;
    float _529 = fma(_509, _507, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[25].x, _477);
    float _533 = 1.0 / _511;
    float _535 = _523 * _527;
    float _537 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[10].z, _499);
    float _539 = -_523;
    float _541 = _539 + 1.0;
    float _543 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[25].z, _531);
    float _545 = _529 * _535;
    float _547 = _537 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _549 = _503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _553 = _543 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _555 = _547 + _511;
    float _557 = _453 + _553;
    float _559 = _555 * _533;
    float _561 = _559 * 0.5;
    float _563 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[116].x, _551);
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _567 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[30].w, _565);
    float _569 = _535;
    float _571 = _551;
    float _573 = _497;
    float _575 = _473;
    if (!_549)
    {
        _569 = _461;
    }
    float _577 = _569;
    float _579 = _577;
    if (!_549)
    {
        _571 = _457;
    }
    float _581 = _571;
    float _583 = _581;
    if (!_549)
    {
        _573 = _557;
    }
    float _585 = _573;
    bool _587 = !_549;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _595 = _503 + _593;
        float _597 = _557 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _599 = rsqrt(_485);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _617 = fma(_611, _597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _619 = fma(_557, _607, _615);
        float _621 = _599 * _617;
        float _623 = fma(_473, _621, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _625 = fma(_465, _621, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _589 = _619;
        _579 = _623;
        _583 = _625;
    }
    float _627 = _589;
    float _629 = _579;
    float _631 = _583;
    float _633 = 1.0 / _567;
    bool _635 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _637 = isnan(0.5);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _643 = _639 || _641;
    float _645 = _627 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _647 = _627 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _649 = _627 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _651 = _627 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[1].x, _645);
    float _655 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[0].x, _647);
    float _657 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[2].x, _649);
    float _659 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[3].x, _651);
    float _661 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[1].z, _653);
    float _663 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[0].z, _655);
    float _665 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[2].z, _657);
    float _667 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[3].z, _659);
    float _669 = _655;
    if (_643)
    {
        _669 = 1.0;
    }
    float _671 = _669;
    float _673 = _661 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _675 = _671;
    if (_643)
    {
        _575 = 1.0;
    }
    float _677 = _575;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _681 = _633 * _679;
    float _683 = _677;
    if (!_643)
    {
        float _685 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _687 = _685 * 0.15915493667125701904296875;
        float _689 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _691 = _687 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = _689 * 0.15915493667125701904296875;
        float _697 = _687 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = 1.0 / _693;
        float _703 = _695 * 6.283185482025146484375;
        float _705 = cos(_703);
        float _707 = _699 * _701;
        float _709 = _695 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _715 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _713;
        float _717 = _705 * _707;
        float _719 = 1.0 / _715;
        float _721 = 1.0 / _717;
        float _723 = _711 * _721;
        float _725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _727 = fma(_681, _723, _725);
        float _729 = _727 * _719;
        float _731 = precise::clamp(_729, 0.0, 1.0);
        _675 = _731;
    }
    float _733 = _675;
    if (!_643)
    {
        float _735 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _739 = _735 * 0.15915493667125701904296875;
        float _741 = _737 * 0.15915493667125701904296875;
        float _743 = _739 * 6.283185482025146484375;
        float _745 = cos(_743);
        float _747 = _739 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = 1.0 / _745;
        float _753 = _741 * 6.283185482025146484375;
        float _755 = cos(_753);
        float _757 = _749 * _751;
        float _759 = _741 * 6.283185482025146484375;
        float _761 = sin(_759);
        float _763 = _755 * _757;
        float _765 = 1.0 / _763;
        float _767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _767;
        float _771 = 1.0 / _769;
        float _773 = _761 * _765;
        float _775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _777 = fma(_681, _773, _775);
        float _779 = _777 * _771;
        float _781 = precise::clamp(_779, 0.0, 1.0);
        float _783 = -_781;
        float _785 = _783 + 1.0;
        _683 = _785;
    }
    float _787 = _683;
    float _789 = _663 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _791 = _673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _793 = _673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _795 = _665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _797 = _673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _791);
    float _801 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _793);
    float _803 = _673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _805 = _667 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[6].z, _799);
    float _809 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[7].z, _801);
    bool _811 = _733 > 0.0;
    bool _813 = isnan(_733);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    float _821 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _797);
    float _823 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _803);
    float _825 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[6].w, _807);
    float _827 = _733 * _787;
    float _829 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[7].w, _809);
    bool _831 = _787 <= 0.0;
    bool _833 = !_819;
    bool _835 = _831 || _833;
    float _837 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[4].z, _821);
    float _839 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[5].z, _823);
    float _841 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _843 = _339 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = _341 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _847 = _343 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _849 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _851 = _825 + _829;
    float _853 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[4].w, _837);
    float _855 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[5].w, _839);
    float _857 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _849 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _865 = _851 * 0.5;
    out.m_44.x = _857;
    out.m_44.y = _859;
    out.m_44.z = _861;
    out.m_44.w = _841;
    out.m_33.x = _863;
    out.gl_Position.x = _853;
    out.gl_Position.y = _855;
    out.gl_Position.z = _825;
    out.gl_Position.w = _829;
    out.m_46.z = _865;
    out.m_46.w = _829;
    if (!_835)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _867 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _867;
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
    bool _365 = false;
    bool _243 = false;
    bool _141 = false;
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
    if (!_69)
    {
        out.m_33.x = 0.0;
    }
    int _75 = 0;
    if (!_69)
    {
        float _77 = _73 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _923 = as_type<float>(_79);
        out.gl_Position.z = _923;
    }
    if (!_69)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_35.w;
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
        float _101 = float(_65);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_33.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _992 = as_type<float>(_117);
        out.gl_Position.z = _992;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_37.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_65);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _153 = _149 + _151;
    bool _155 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _157 = isnan(_149);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _163 = _159 || _161;
    float _165 = float(_163);
    float _167 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _169 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _167;
    float _171 = -_165;
    float _173 = _171 + 1.0;
    bool _175 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _177 = isnan(_149);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _183 = _179 || _181;
    float _185 = float(_183);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _187;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _193 = 1.0 / _169;
    float _195 = _185 * _173;
    float _197 = -_185;
    float _199 = _197 + 1.0;
    float _201 = _153 * _193;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _203;
    float _207 = fma(_189, _201, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _209 = fma(_205, _201, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _211 = _207 * _195;
    float _213 = _209 * _195;
    float _215 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[143].x, _211);
    float _217 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[143].y, _213);
    float _219 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[144].x, _215);
    float _221 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[144].y, _217);
    bool _223 = !_191;
    float _241;
    if (!_223)
    {
        float _225 = in.m_37.x;
        float _227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _233 = _231 * _227;
        float _235 = floor(_233);
        float _237 = -_235;
        float _239 = _233 + _237;
        _241 = _239;
        _243 = true;
    }
    else
    {
        float _245 = float(_65);
        float _247 = 1.0 / _245;
        float _249 = _97 * _247;
        _241 = _249;
    }
    _243 = false;
    float _251 = _241;
    float _253 = in.m_39.x;
    float _255 = in.m_39.y;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _259 = _251 + _257;
    bool _261 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _263 = isnan(_251);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = -_271;
    float _281 = _279 + 1.0;
    float _283 = 1.0 / _275;
    float _285 = _221 * _255;
    float _287 = _259 * _283;
    bool _289 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _291 = isnan(_251);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _309;
    float _313 = _219 * _253;
    float _315 = _299 * _281;
    float _317 = fma(_303, _287, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _319 = fma(_311, _287, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _321 = fma(_307, _287, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _323 = -_299;
    float _325 = _323 + 1.0;
    float _327 = _317 * _315;
    float _329 = _319 * _315;
    float _331 = _321 * _315;
    float _333 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].x, _327);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].y, _329);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[107].z, _331);
    float _339 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].x, _333);
    float _341 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].y, _335);
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[108].z, _337);
    bool _345 = !_277;
    float _363;
    if (!_345)
    {
        float _347 = in.m_37.x;
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _351 = _347 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_65);
        float _369 = 1.0 / _367;
        float _371 = _97 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = as_type<float>(int(gl_VertexIndex));
    float _377 = _285 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _379 = in.m_30.x;
    float _381 = in.m_30.y;
    float _383 = in.m_30.z;
    int _385 = as_type<int>(_375) & 1;
    bool _387 = _385 != 0;
    int _389 = as_type<int>(_375) & 2;
    bool _391 = _389 != 0;
    float _393 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _395 = !_391;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _403 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _397);
    bool _405 = !_387;
    float _407 = _405 ? (-0.5) : 0.5;
    float _409 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].z, _401);
    float _411 = _377 * _403;
    float _413 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _407);
    float _417 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = _413 * _415;
    float _423 = _411 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _427 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _429 = _411 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _431 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[26].x, _423);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _435 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _429);
    float _439 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[26].z, _431);
    float _441 = _433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _443 = _435 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _445 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[24].z, _437);
    float _447 = _439 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _445 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _457 = _443 + _447;
    float _459 = 1.0 / _451;
    float _461 = _441 + _455;
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _465 = _457 + _463;
    float _467 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _469 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _471 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _473 = _461 + _471;
    float _475 = _465 * _465;
    float _477 = _411 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _467);
    float _485 = fma(_473, _473, _475);
    bool _487 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = isnan(_373);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _469);
    float _501 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    float _503 = sqrt(_485);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _507 = _373 + _505;
    float _509 = _481 * _459;
    float _511 = _501 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _513 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_373);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_497;
    float _527 = _525 + 1.0;
    float _529 = fma(_509, _507, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[25].x, _477);
    float _533 = 1.0 / _511;
    float _535 = _523 * _527;
    float _537 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[10].z, _499);
    float _539 = -_523;
    float _541 = _539 + 1.0;
    float _543 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[25].z, _531);
    float _545 = _529 * _535;
    float _547 = _537 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _549 = _503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _553 = _543 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _555 = _547 + _511;
    float _557 = _453 + _553;
    float _559 = _555 * _533;
    float _561 = _559 * 0.5;
    float _563 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[116].x, _551);
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _567 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[30].w, _565);
    float _569 = _535;
    float _571 = _551;
    float _573 = _497;
    float _575 = _473;
    if (!_549)
    {
        _569 = _461;
    }
    float _577 = _569;
    float _579 = _577;
    if (!_549)
    {
        _571 = _457;
    }
    float _581 = _571;
    float _583 = _581;
    if (!_549)
    {
        _573 = _557;
    }
    float _585 = _573;
    bool _587 = !_549;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _595 = _503 + _593;
        float _597 = _557 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _599 = rsqrt(_485);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _617 = fma(_611, _597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _619 = fma(_557, _607, _615);
        float _621 = _599 * _617;
        float _623 = fma(_473, _621, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _625 = fma(_465, _621, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _589 = _619;
        _579 = _623;
        _583 = _625;
    }
    float _627 = _589;
    float _629 = _579;
    float _631 = _583;
    float _633 = 1.0 / _567;
    bool _635 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _637 = isnan(0.5);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _643 = _639 || _641;
    float _645 = _627 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _647 = _627 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _649 = _627 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _651 = _627 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[1].x, _645);
    float _655 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[0].x, _647);
    float _657 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[2].x, _649);
    float _659 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[3].x, _651);
    float _661 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[1].z, _653);
    float _663 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[0].z, _655);
    float _665 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[2].z, _657);
    float _667 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[3].z, _659);
    float _669 = _655;
    if (_643)
    {
        _669 = 1.0;
    }
    float _671 = _669;
    float _673 = _661 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _675 = _671;
    if (_643)
    {
        _575 = 1.0;
    }
    float _677 = _575;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _681 = _633 * _679;
    float _683 = _677;
    if (!_643)
    {
        float _685 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _687 = _685 * 0.15915493667125701904296875;
        float _689 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _691 = _687 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = _689 * 0.15915493667125701904296875;
        float _697 = _687 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = 1.0 / _693;
        float _703 = _695 * 6.283185482025146484375;
        float _705 = cos(_703);
        float _707 = _699 * _701;
        float _709 = _695 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _715 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _713;
        float _717 = _705 * _707;
        float _719 = 1.0 / _715;
        float _721 = 1.0 / _717;
        float _723 = _711 * _721;
        float _725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _727 = fma(_681, _723, _725);
        float _729 = _727 * _719;
        float _731 = precise::clamp(_729, 0.0, 1.0);
        _675 = _731;
    }
    float _733 = _675;
    if (!_643)
    {
        float _735 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _739 = _735 * 0.15915493667125701904296875;
        float _741 = _737 * 0.15915493667125701904296875;
        float _743 = _739 * 6.283185482025146484375;
        float _745 = cos(_743);
        float _747 = _739 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = 1.0 / _745;
        float _753 = _741 * 6.283185482025146484375;
        float _755 = cos(_753);
        float _757 = _749 * _751;
        float _759 = _741 * 6.283185482025146484375;
        float _761 = sin(_759);
        float _763 = _755 * _757;
        float _765 = 1.0 / _763;
        float _767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _767;
        float _771 = 1.0 / _769;
        float _773 = _761 * _765;
        float _775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _777 = fma(_681, _773, _775);
        float _779 = _777 * _771;
        float _781 = precise::clamp(_779, 0.0, 1.0);
        float _783 = -_781;
        float _785 = _783 + 1.0;
        _683 = _785;
    }
    float _787 = _683;
    float _789 = _663 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _791 = _673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _793 = _673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _795 = _665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _797 = _673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _791);
    float _801 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _793);
    float _803 = _673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _805 = _667 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[6].z, _799);
    float _809 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[7].z, _801);
    bool _811 = _733 > 0.0;
    bool _813 = isnan(_733);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    float _821 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _797);
    float _823 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _803);
    float _825 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[6].w, _807);
    float _827 = _733 * _787;
    float _829 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[7].w, _809);
    bool _831 = _787 <= 0.0;
    bool _833 = !_819;
    bool _835 = _831 || _833;
    float _837 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[4].z, _821);
    float _839 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[5].z, _823);
    float _841 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _843 = _339 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = _341 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _847 = _343 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _849 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _851 = _825 + _829;
    float _853 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[4].w, _837);
    float _855 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[5].w, _839);
    float _857 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _849 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _865 = _851 * 0.5;
    out.m_44.x = _857;
    out.m_44.y = _859;
    out.m_44.z = _861;
    out.m_44.w = _841;
    out.m_33.x = _863;
    out.gl_Position.x = _853;
    out.gl_Position.y = _855;
    out.gl_Position.z = _825;
    out.gl_Position.w = _829;
    out.m_46.z = _865;
    out.m_46.w = _829;
    if (!_835)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _867 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _867;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

