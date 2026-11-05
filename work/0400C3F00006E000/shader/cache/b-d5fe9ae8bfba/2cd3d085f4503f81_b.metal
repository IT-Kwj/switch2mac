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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_60 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_32 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_52 [[attribute(8)]];
    float4 m_54 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _991 = false;
    bool _979 = false;
    bool _639 = false;
    bool _471 = false;
    bool _321 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1668 = as_type<float>(_95);
        out.gl_Position.z = _1668;
    }
    if (!_83)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_109)
    {
        float _115 = float(_79);
        _89 = _115;
    }
    float _117 = _89;
    bool _119 = _113 >= _117;
    bool _121 = !_109;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1737 = as_type<float>(_131);
        out.gl_Position.z = _1737;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = in.m_42.x;
    float _137 = in.m_42.y;
    float _139 = in.m_42.z;
    float _141 = in.m_44.x;
    float _143 = in.m_44.y;
    float _145 = in.m_44.z;
    float _147 = in.m_46.x;
    float _149 = in.m_46.y;
    float _151 = in.m_46.z;
    float _153 = in.m_48.x;
    float _155 = in.m_48.y;
    float _157 = in.m_48.z;
    int _159 = as_type<int>(_133) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_133) & 2;
    bool _165 = _163 != 0;
    bool _167 = !_161;
    int _169 = _167 ? (-1090519040) : 1056964608;
    bool _171 = !_165;
    int _173 = _171 ? (-1090519040) : 1056964608;
    float _175 = _137 * _143;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_50.x = as_type<float>(_169);
    out.m_50.y = as_type<float>(_173);
    float _179 = _137 * _149;
    float _181 = fma(_135, _141, _175);
    float _183 = _137 * _155;
    float _185 = fma(_135, _147, _179);
    float _187 = fma(_139, _145, _181);
    float _189 = fma(_135, _153, _183);
    float _191 = fma(_139, _151, _185);
    float _193 = fma(_139, _157, _189);
    bool _195 = !_177;
    float _197 = _191;
    float _199 = _187;
    float _217;
    if (!_195)
    {
        float _201 = in.m_52.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_79);
        float _223 = 1.0 / _221;
        float _225 = _113 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = _227 + _229;
    bool _233 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_227);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -_243;
    float _251 = _249 + 1.0;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _247;
    float _257 = _231 * _255;
    bool _259 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_227);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = _269 * _251;
    float _281 = fma(_273, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_277, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = -_269;
    float _287 = _285 + 1.0;
    float _289 = _281 * _279;
    float _291 = _283 * _279;
    float _293 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].x, _289);
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].y, _291);
    float _297 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[144].x, _293);
    float _299 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[144].y, _295);
    bool _301 = !_253;
    float _319;
    if (!_301)
    {
        float _303 = in.m_52.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_79);
        float _325 = 1.0 / _323;
        float _327 = _113 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _329 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_329);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _355 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_329);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    bool _371 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _373 = isnan(_329);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _337;
    float _385 = -_349;
    float _387 = _385 + 1.0;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _391 = _365 * _387;
    float _393 = -_365;
    float _395 = _393 + 1.0;
    float _397 = 1.0 / _353;
    float _399 = _369 * _383;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _405 = fma(_399, _333, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = _403 * _397;
    float _409 = _405 * _391;
    float _411 = -_381;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _329 + _415;
    float _419 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[115].x, _409);
    float _421 = _349 * _413;
    float _423 = fma(_407, _417, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _425 = in.m_54.x;
    float _427 = in.m_54.y;
    float _429 = fma(_423, _421, _419);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _435 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[117].x, _429);
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _439 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = _437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _439;
    out.m_56.y = _441;
    out.m_56.z = _445;
    out.m_56.w = _443;
    float _447 = _299 * _427;
    float _449 = _297 * _425;
    bool _451 = !_389;
    float _469;
    if (!_451)
    {
        float _453 = in.m_52.x;
        float _455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _461 = _459 * _455;
        float _463 = floor(_461);
        float _465 = -_463;
        float _467 = _461 + _465;
        _469 = _467;
        _471 = true;
    }
    else
    {
        float _473 = float(_79);
        float _475 = 1.0 / _473;
        float _477 = _113 * _475;
        _469 = _477;
    }
    _471 = false;
    float _479 = _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _483 = _479 + _481;
    bool _485 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _487 = isnan(_479);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _499 = _479 + _497;
    bool _501 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _503 = isnan(_479);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _521 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _523 = isnan(_479);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_495;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _519;
    float _539 = _531 * _535;
    float _541 = -_531;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _545;
    bool _549 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _551 = 1.0 / _515;
    float _553 = _511 * _543;
    float _555 = -_511;
    float _557 = _555 + 1.0;
    float _559 = _499 * _537;
    float _561 = _483 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _567;
    float _571 = fma(_547, _561, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _573 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _575 = fma(_569, _561, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _577 = _571 * _553;
    float _579 = _573 * _553;
    float _581 = _575 * _553;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _595 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].x, _577);
    float _597 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].y, _579);
    float _599 = fma(_585, _559, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _601 = fma(_589, _559, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _603 = fma(_593, _559, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _605 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].z, _581);
    float _607 = fma(_599, _539, _595);
    float _609 = fma(_601, _539, _597);
    float _611 = fma(_603, _539, _605);
    float _613 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].x, _607);
    float _615 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].y, _609);
    float _617 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].z, _611);
    bool _619 = !_549;
    float _637;
    if (!_619)
    {
        float _621 = in.m_52.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].w, _113);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_79);
        float _643 = 1.0 / _641;
        float _645 = _113 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_32.x;
    float _651 = in.m_32.y;
    float _653 = in.m_32.z;
    float _655 = _449 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = in.m_46.w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_169));
    float _665 = in.m_44.w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _671 = 1.0 / _661;
    float _673 = _655 * _663;
    float _675 = in.m_48.w;
    float _677 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _679 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_173));
    float _681 = 1.0 / _669;
    float _683 = _677 * _679;
    float _685 = _149 * _651;
    float _687 = _143 * _651;
    float _689 = _155 * _651;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _691;
    float _695 = fma(_147, _649, _685);
    float _697 = fma(_141, _649, _687);
    float _699 = fma(_153, _649, _689);
    float _701 = _693 * _671;
    float _703 = fma(_151, _653, _695);
    float _705 = fma(_145, _653, _697);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _647 + _707;
    float _711 = fma(_157, _653, _699);
    float _713 = _703 + _657;
    float _715 = _705 + _665;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _721 = fma(_701, _709, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _723 = _713 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _725 = _711 + _675;
    float _727 = _715 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _729 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _731 = isnan(_647);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _745 = _719 * _681;
    float _747 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    bool _749 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _751 = isnan(_647);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _725 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _763 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].x, _741);
    float _765 = -_739;
    float _767 = _765 + 1.0;
    float _769 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].y, _747);
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].x, _763);
    bool _775 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _777 = isnan(_647);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = _759 * _767;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _795 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].y, _769);
    float _797 = _773 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _799 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _801 = _785 * _791;
    float _803 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].z, _793);
    float _805 = _795 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _807 = _797 * _743;
    float _809 = _721 * _801;
    float _811 = -_785;
    float _813 = _811 + 1.0;
    float _815 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].z, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _819 = _647 + _817;
    float _821 = _805 * _771;
    float _823 = fma(_807, 0.5, 0.5);
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[131].x, _809);
    float _827 = _815 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _829 = fma(_821, 0.5, 0.5);
    float _831 = fma(_745, _819, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _833 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _835 = floor(_823);
    float _837 = _827 * _799;
    float _839 = fma(_831, _787, _825);
    float _841 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _843 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _845 = fma(_837, 0.5, 0.5);
    float _847 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].x, _833);
    float _849 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _851 = floor(_829);
    float _853 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[133].x, _839);
    float _855 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _857 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _847);
    float _859 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].x, _841);
    float _861 = _853 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _863 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].x, _843);
    float _865 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _867 = floor(_845);
    float _869 = -_835;
    float _871 = _823 + _869;
    float _873 = _617 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _875 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _877 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _863);
    float _879 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = fma(_871, 2.0, -1.0);
    float _883 = -_851;
    float _885 = _829 + _883;
    float _887 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _881 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _893 = fma(_885, 2.0, -1.0);
    float _895 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _897 = _877 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    out.m_58.x = _879;
    out.m_58.y = _887;
    out.m_58.z = _889;
    out.m_58.w = _861;
    float _899 = -_867;
    float _901 = _845 + _899;
    float _903 = _893 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _905 = fma(_901, 2.0, -1.0);
    float _907 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _909 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _911 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _913 = _905 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _915 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].y, _907);
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].x, _909);
    float _919 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].z, _911);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].y, _915);
    bool _923 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _925 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _927 = _923 || _925;
    bool _929 = isnan(1.0);
    bool _931 = _927 || _929;
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].x, _917);
    float _935 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].z, _919);
    float _937 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _939 = _921 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _941 = _933 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _943 = _935 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _945 = _937 + _939;
    float _947 = _895 + _941;
    float _949 = _897 + _943;
    float _951 = _887;
    float _953 = _879;
    float _955 = _889;
    float _957 = _937;
    float _959 = _937;
    float _961 = _879;
    float _963 = _889;
    float _965 = _881;
    float _967 = _893;
    float _969 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _971 = _905;
    float _973 = _895;
    float _983;
    float _985;
    float _987;
    float _989;
    if (!_931)
    {
        bool _975 = _939 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _977 = !_975;
        _979 = _977;
        if (!_979)
        {
            float _981 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _983 = _981;
            _985 = 0.0;
            _987 = 0.0;
            _989 = 0.0;
            _991 = true;
        }
    }
    if ((!_991) || _979)
    {
        bool _1027;
        if (!_979)
        {
            bool _993 = _939 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _995 = isnan(_939);
            bool _997 = _993 || _995;
            bool _999 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1001 = _997 || _999;
            bool _1003 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1005 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1007 = !_1001;
            bool _1009 = _1005 && _1007;
            if (_1009)
            {
                _951 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1011 = _951;
            float _1013 = _1011;
            if (_1009)
            {
                _953 = 0.0;
            }
            float _1015 = _953;
            _961 = _1015;
            _985 = _1015;
            if (_1009)
            {
                _955 = 0.0;
            }
            float _1017 = _955;
            _963 = _1017;
            _987 = _1017;
            if (_1009)
            {
                float _1019 = _1011 * 5.0;
                _1013 = _1019;
            }
            float _1021 = _1013;
            _983 = _1021;
            if (_1009)
            {
                _957 = 0.0;
            }
            float _1023 = _957;
            bool _1025 = !_1001;
            _1027 = _1025 && _1003;
            _959 = _1023;
            _989 = _1023;
        }
        if ((!_1027) || _979)
        {
            _979 = false;
            float _1029 = _959;
            float _1031 = _961;
            float _1033 = _963;
            bool _1035 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1037 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1039 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1041 = _1029;
            _983 = _949;
            if (_1035)
            {
                float _1043 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1041 = _1043;
            }
            float _1045 = _1041;
            if (_1035)
            {
                float _1047 = abs(_881);
                float _1049 = -_1047;
                float _1051 = _1049 + 1.0;
                _965 = _1051;
            }
            float _1053 = _965;
            if (_1037)
            {
                float _1055 = abs(_893);
                float _1057 = -_1055;
                float _1059 = _1057 + 1.0;
                _967 = _1059;
            }
            float _1061 = _967;
            if (!_1035)
            {
                _969 = 1.0;
            }
            float _1063 = _969;
            float _1065 = _1063;
            if (_1039)
            {
                float _1067 = abs(_905);
                float _1069 = -_1067;
                float _1071 = _1069 + 1.0;
                _971 = _1071;
            }
            float _1073 = _971;
            if (!_1037)
            {
                _973 = 1.0;
            }
            float _1075 = _973;
            float _1077 = _1031;
            float _1079 = _1075;
            if (_1037)
            {
                float _1081 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1077 = _1081;
            }
            float _1083 = _1077;
            float _1085 = _1033;
            if (_1039)
            {
                float _1087 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1085 = _1087;
            }
            float _1089 = _1085;
            float _1091 = _1045;
            if (_1035)
            {
                float _1093 = _1053 * _1045;
                float _1095 = precise::clamp(_1093, 0.0, 1.0);
                _1065 = _1095;
            }
            float _1097 = _1065;
            if (!_1039)
            {
                _1091 = 1.0;
            }
            float _1099 = _1091;
            float _1101 = _1099;
            if (_1037)
            {
                float _1103 = _1061 * _1083;
                float _1105 = precise::clamp(_1103, 0.0, 1.0);
                _1079 = _1105;
            }
            float _1107 = _1079;
            float _1109 = _1097 * _1107;
            _985 = _947;
            if (_1039)
            {
                float _1111 = _1073 * _1089;
                float _1113 = precise::clamp(_1111, 0.0, 1.0);
                _1101 = _1113;
            }
            float _1115 = _1101;
            float _1117 = _1109 * _1115;
            _987 = _945;
            _989 = _1117;
        }
    }
    _991 = false;
    float _1119 = _983;
    float _1121 = _985;
    float _1123 = _987;
    float _1125 = _989;
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1119 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1133 = _1121 + _1131;
    float _1135 = _939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1129 * _1129;
    float _1139 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1141 = fma(_1133, _1133, _1137);
    float _1143 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1139);
    float _1145 = sqrt(_1141);
    bool _1147 = _1145 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1149 = !_1147;
    float _1151 = _1123;
    float _1153 = _1121;
    float _1155 = _1119;
    if (!_1149)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1145 + _1159;
        float _1163 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1141);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = cos(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = _1173 + (-1.0);
        float _1181 = _1179 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = fma(_1177, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1185 = fma(_1173, _1123, _1181);
        float _1187 = _1165 * _1183;
        float _1189 = fma(_1133, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1191 = fma(_1129, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1151 = _1185;
        _1153 = _1189;
        _1155 = _1191;
    }
    float _1193 = _1151;
    float _1195 = _1153;
    float _1197 = _1155;
    float _1199 = -_939;
    float _1201 = _1199 + _1193;
    float _1203 = -_941;
    float _1205 = _1203 + _1195;
    float _1207 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1209 = -_943;
    float _1211 = _1209 + _1197;
    float _1213 = _1201 * _1201;
    float _1215 = _939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1217 = 1.0 / _1207;
    float _1219 = fma(_1205, _1205, _1213);
    float _1221 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1215);
    float _1223 = fma(_1211, _1211, _1219);
    float _1225 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    float _1227 = sqrt(_1223);
    float _1229 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = _1229 + _1207;
    float _1233 = _1231 * _1217;
    float _1235 = _1233 * 0.5;
    bool _1237 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan(0.5);
    bool _1245 = _1241 || _1243;
    bool _1247 = _1227 > 0.0;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1249);
    bool _1253 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    float _1263 = 1.0 / _1251;
    bool _1265 = !_1247;
    float _1267 = _1193;
    float _1269 = _1197;
    float _1271 = _1195;
    if (!_1265)
    {
        float _1273 = _191 * _191;
        float _1275 = fma(_187, _187, _1273);
        float _1277 = fma(_193, _193, _1275);
        float _1279 = rsqrt(_1223);
        float _1281 = sqrt(_1277);
        float _1283 = _1205 * _1279;
        float _1285 = _1211 * _1279;
        bool _1287 = _1281 > 0.0;
        float _1289 = _1201 * _1279;
        bool _1291 = !_1287;
        if (!_1291)
        {
            float _1293 = rsqrt(_1277);
            float _1295 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1297 = _191 * _1293;
            float _1299 = _187 * _1293;
            float _1301 = _1289 * _1297;
            float _1303 = _193 * _1293;
            float _1305 = fma(_1283, _1299, _1301);
            float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1309 = fma(_1285, _1303, _1305);
            float _1311 = _1309 * _1307;
            float _1313 = fma(_187, _1311, _1195);
            float _1315 = fma(_191, _1311, _1193);
            float _1317 = fma(_193, _1311, _1197);
            _1267 = _1315;
            _1269 = _1317;
            _1271 = _1313;
        }
    }
    float _1319 = _1267;
    float _1321 = _1269;
    float _1323 = _1271;
    float _1325 = _1323;
    if (_1245)
    {
        _197 = _1319;
    }
    float _1327 = _197;
    float _1329 = _1327;
    if (_1245)
    {
        _199 = _1321;
    }
    float _1331 = _199;
    float _1333 = _1331;
    if (!_1245)
    {
        float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1337 = _939 + _1335;
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1341 = _941 + _1339;
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1345 = -_939;
        float _1347 = _1345 + _1319;
        float _1349 = _1337 * _1337;
        float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1353 = _943 + _1351;
        float _1355 = -_943;
        float _1357 = _1355 + _1321;
        float _1359 = fma(_1341, _1341, _1349);
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1363 = fma(_1353, _1353, _1359);
        float _1365 = sqrt(_1363);
        float _1367 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1371 = _1369 * _1361;
        float _1373 = -_941;
        float _1375 = _1373 + _1323;
        float _1377 = _1367 * _1371;
        float _1379 = fma(_1375, _1377, _941);
        float _1381 = fma(_1347, _1377, _939);
        float _1383 = fma(_1357, _1377, _943);
        _1329 = _1381;
        _1325 = _1379;
        _1333 = _1383;
    }
    float _1385 = _1329;
    float _1387 = _1325;
    float _1389 = _1333;
    float _1391 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1395 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1397 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1391);
    float _1401 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1393);
    float _1403 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1395);
    float _1405 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1407 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1409 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1401);
    float _1411 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1413 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1405);
    float _1415 = _1393;
    float _1417 = _1401;
    if (_1261)
    {
        _1415 = 1.0;
    }
    float _1419 = _1415;
    float _1421 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1423 = _1419;
    if (_1261)
    {
        _1417 = 1.0;
    }
    float _1425 = _1417;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1429 = _1263 * _1427;
    float _1431 = _1425;
    if (!_1261)
    {
        float _1433 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1435 = _1433 * 0.15915493667125701904296875;
        float _1437 = _1435 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        float _1441 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1435 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = 1.0 / _1439;
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = _1443 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1463 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1461;
        float _1465 = _1453 * _1455;
        float _1467 = 1.0 / _1463;
        float _1469 = 1.0 / _1465;
        float _1471 = _1459 * _1469;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1475 = fma(_1429, _1471, _1473);
        float _1477 = _1475 * _1467;
        float _1479 = precise::clamp(_1477, 0.0, 1.0);
        _1423 = _1479;
    }
    float _1481 = _1423;
    if (!_1261)
    {
        float _1483 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1485 = _1483 * 0.15915493667125701904296875;
        float _1487 = _1485 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1493 = _1491 * 0.15915493667125701904296875;
        float _1495 = _1485 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = 1.0 / _1489;
        float _1501 = _1493 * 6.283185482025146484375;
        float _1503 = cos(_1501);
        float _1505 = _1497 * _1499;
        float _1507 = _1493 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = _1503 * _1505;
        float _1513 = 1.0 / _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1517 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1515;
        float _1519 = 1.0 / _1517;
        float _1521 = _1509 * _1513;
        float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1525 = fma(_1429, _1521, _1523);
        float _1527 = _1525 * _1519;
        float _1529 = precise::clamp(_1527, 0.0, 1.0);
        float _1531 = -_1529;
        float _1533 = _1531 + 1.0;
        _1431 = _1533;
    }
    float _1535 = _1431;
    float _1537 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1539 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1541 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1543 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1545 = _1481 > 0.0;
    bool _1547 = isnan(_1481);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan(0.0);
    bool _1553 = _1549 || _1551;
    float _1555 = _1481 * _1535;
    float _1557 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1539);
    float _1559 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1561 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1563 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1565 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1567 = _1555 * _1125;
    float _1569 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1557);
    float _1573 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1561);
    float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1563);
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    bool _1579 = _1535 <= 0.0;
    bool _1581 = !_1553;
    bool _1583 = _1579 || _1581;
    float _1585 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1587 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1571);
    float _1589 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1593 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1575);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1597 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1599 = _1587 + _1591;
    float _1601 = _1593 + _1591;
    float _1603 = _1591 * 0.5;
    float _1605 = _1599 * 0.5;
    float _1607 = _1601 * 0.5;
    float _1609 = fma(_1597, -0.5, _1603);
    out.gl_Position.x = _1587;
    out.gl_Position.y = _1597;
    out.gl_Position.z = _1593;
    out.gl_Position.w = _1591;
    out.m_35.x = _1595;
    out.m_60.x = _1605;
    out.m_60.y = _1609;
    out.m_60.z = _1607;
    out.m_60.w = _1591;
    if (!_1583)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1611 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_35.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1611;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _991 = false;
    bool _979 = false;
    bool _639 = false;
    bool _471 = false;
    bool _321 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1668 = as_type<float>(_95);
        out.gl_Position.z = _1668;
    }
    if (!_83)
    {
        return out;
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_109)
    {
        float _115 = float(_79);
        _89 = _115;
    }
    float _117 = _89;
    bool _119 = _113 >= _117;
    bool _121 = !_109;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1737 = as_type<float>(_131);
        out.gl_Position.z = _1737;
    }
    if (_123)
    {
        return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = in.m_42.x;
    float _137 = in.m_42.y;
    float _139 = in.m_42.z;
    float _141 = in.m_44.x;
    float _143 = in.m_44.y;
    float _145 = in.m_44.z;
    float _147 = in.m_46.x;
    float _149 = in.m_46.y;
    float _151 = in.m_46.z;
    float _153 = in.m_48.x;
    float _155 = in.m_48.y;
    float _157 = in.m_48.z;
    int _159 = as_type<int>(_133) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_133) & 2;
    bool _165 = _163 != 0;
    bool _167 = !_161;
    int _169 = _167 ? (-1090519040) : 1056964608;
    bool _171 = !_165;
    int _173 = _171 ? (-1090519040) : 1056964608;
    float _175 = _137 * _143;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_50.x = as_type<float>(_169);
    out.m_50.y = as_type<float>(_173);
    float _179 = _137 * _149;
    float _181 = fma(_135, _141, _175);
    float _183 = _137 * _155;
    float _185 = fma(_135, _147, _179);
    float _187 = fma(_139, _145, _181);
    float _189 = fma(_135, _153, _183);
    float _191 = fma(_139, _151, _185);
    float _193 = fma(_139, _157, _189);
    bool _195 = !_177;
    float _197 = _191;
    float _199 = _187;
    float _217;
    if (!_195)
    {
        float _201 = in.m_52.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_79);
        float _223 = 1.0 / _221;
        float _225 = _113 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = _227 + _229;
    bool _233 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_227);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -_243;
    float _251 = _249 + 1.0;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _247;
    float _257 = _231 * _255;
    bool _259 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_227);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = _269 * _251;
    float _281 = fma(_273, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_277, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = -_269;
    float _287 = _285 + 1.0;
    float _289 = _281 * _279;
    float _291 = _283 * _279;
    float _293 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].x, _289);
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].y, _291);
    float _297 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[144].x, _293);
    float _299 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[144].y, _295);
    bool _301 = !_253;
    float _319;
    if (!_301)
    {
        float _303 = in.m_52.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_79);
        float _325 = 1.0 / _323;
        float _327 = _113 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _329 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_329);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _355 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_329);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    bool _371 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _373 = isnan(_329);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _337;
    float _385 = -_349;
    float _387 = _385 + 1.0;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _391 = _365 * _387;
    float _393 = -_365;
    float _395 = _393 + 1.0;
    float _397 = 1.0 / _353;
    float _399 = _369 * _383;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _405 = fma(_399, _333, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = _403 * _397;
    float _409 = _405 * _391;
    float _411 = -_381;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _329 + _415;
    float _419 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[115].x, _409);
    float _421 = _349 * _413;
    float _423 = fma(_407, _417, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _425 = in.m_54.x;
    float _427 = in.m_54.y;
    float _429 = fma(_423, _421, _419);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _435 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[117].x, _429);
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _439 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = _437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _439;
    out.m_56.y = _441;
    out.m_56.z = _445;
    out.m_56.w = _443;
    float _447 = _299 * _427;
    float _449 = _297 * _425;
    bool _451 = !_389;
    float _469;
    if (!_451)
    {
        float _453 = in.m_52.x;
        float _455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _461 = _459 * _455;
        float _463 = floor(_461);
        float _465 = -_463;
        float _467 = _461 + _465;
        _469 = _467;
        _471 = true;
    }
    else
    {
        float _473 = float(_79);
        float _475 = 1.0 / _473;
        float _477 = _113 * _475;
        _469 = _477;
    }
    _471 = false;
    float _479 = _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _483 = _479 + _481;
    bool _485 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _487 = isnan(_479);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _499 = _479 + _497;
    bool _501 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _503 = isnan(_479);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _521 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _523 = isnan(_479);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_495;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _519;
    float _539 = _531 * _535;
    float _541 = -_531;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _545;
    bool _549 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _551 = 1.0 / _515;
    float _553 = _511 * _543;
    float _555 = -_511;
    float _557 = _555 + 1.0;
    float _559 = _499 * _537;
    float _561 = _483 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _567;
    float _571 = fma(_547, _561, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _573 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _575 = fma(_569, _561, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _577 = _571 * _553;
    float _579 = _573 * _553;
    float _581 = _575 * _553;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _595 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].x, _577);
    float _597 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].y, _579);
    float _599 = fma(_585, _559, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _601 = fma(_589, _559, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _603 = fma(_593, _559, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _605 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].z, _581);
    float _607 = fma(_599, _539, _595);
    float _609 = fma(_601, _539, _597);
    float _611 = fma(_603, _539, _605);
    float _613 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].x, _607);
    float _615 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].y, _609);
    float _617 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].z, _611);
    bool _619 = !_549;
    float _637;
    if (!_619)
    {
        float _621 = in.m_52.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].w, _113);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_79);
        float _643 = 1.0 / _641;
        float _645 = _113 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_32.x;
    float _651 = in.m_32.y;
    float _653 = in.m_32.z;
    float _655 = _449 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = in.m_46.w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_169));
    float _665 = in.m_44.w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _671 = 1.0 / _661;
    float _673 = _655 * _663;
    float _675 = in.m_48.w;
    float _677 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _679 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_173));
    float _681 = 1.0 / _669;
    float _683 = _677 * _679;
    float _685 = _149 * _651;
    float _687 = _143 * _651;
    float _689 = _155 * _651;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _691;
    float _695 = fma(_147, _649, _685);
    float _697 = fma(_141, _649, _687);
    float _699 = fma(_153, _649, _689);
    float _701 = _693 * _671;
    float _703 = fma(_151, _653, _695);
    float _705 = fma(_145, _653, _697);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _647 + _707;
    float _711 = fma(_157, _653, _699);
    float _713 = _703 + _657;
    float _715 = _705 + _665;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _721 = fma(_701, _709, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _723 = _713 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _725 = _711 + _675;
    float _727 = _715 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _729 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _731 = isnan(_647);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _745 = _719 * _681;
    float _747 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    bool _749 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _751 = isnan(_647);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _725 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _763 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].x, _741);
    float _765 = -_739;
    float _767 = _765 + 1.0;
    float _769 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].y, _747);
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].x, _763);
    bool _775 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _777 = isnan(_647);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = _759 * _767;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _795 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].y, _769);
    float _797 = _773 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _799 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _801 = _785 * _791;
    float _803 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].z, _793);
    float _805 = _795 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _807 = _797 * _743;
    float _809 = _721 * _801;
    float _811 = -_785;
    float _813 = _811 + 1.0;
    float _815 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].z, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _819 = _647 + _817;
    float _821 = _805 * _771;
    float _823 = fma(_807, 0.5, 0.5);
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[131].x, _809);
    float _827 = _815 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _829 = fma(_821, 0.5, 0.5);
    float _831 = fma(_745, _819, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _833 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _835 = floor(_823);
    float _837 = _827 * _799;
    float _839 = fma(_831, _787, _825);
    float _841 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _843 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _845 = fma(_837, 0.5, 0.5);
    float _847 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].x, _833);
    float _849 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _851 = floor(_829);
    float _853 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[133].x, _839);
    float _855 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _857 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _847);
    float _859 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].x, _841);
    float _861 = _853 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _863 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].x, _843);
    float _865 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _867 = floor(_845);
    float _869 = -_835;
    float _871 = _823 + _869;
    float _873 = _617 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _875 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _877 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _863);
    float _879 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = fma(_871, 2.0, -1.0);
    float _883 = -_851;
    float _885 = _829 + _883;
    float _887 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _881 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _893 = fma(_885, 2.0, -1.0);
    float _895 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _897 = _877 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    out.m_58.x = _879;
    out.m_58.y = _887;
    out.m_58.z = _889;
    out.m_58.w = _861;
    float _899 = -_867;
    float _901 = _845 + _899;
    float _903 = _893 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _905 = fma(_901, 2.0, -1.0);
    float _907 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _909 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _911 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _913 = _905 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _915 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].y, _907);
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].x, _909);
    float _919 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].z, _911);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].y, _915);
    bool _923 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _925 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _927 = _923 || _925;
    bool _929 = isnan(1.0);
    bool _931 = _927 || _929;
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].x, _917);
    float _935 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].z, _919);
    float _937 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _939 = _921 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _941 = _933 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _943 = _935 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _945 = _937 + _939;
    float _947 = _895 + _941;
    float _949 = _897 + _943;
    float _951 = _887;
    float _953 = _879;
    float _955 = _889;
    float _957 = _937;
    float _959 = _937;
    float _961 = _879;
    float _963 = _889;
    float _965 = _881;
    float _967 = _893;
    float _969 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _971 = _905;
    float _973 = _895;
    float _983;
    float _985;
    float _987;
    float _989;
    if (!_931)
    {
        bool _975 = _939 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _977 = !_975;
        _979 = _977;
        if (!_979)
        {
            float _981 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _983 = _981;
            _985 = 0.0;
            _987 = 0.0;
            _989 = 0.0;
            _991 = true;
        }
    }
    if ((!_991) || _979)
    {
        bool _1027;
        if (!_979)
        {
            bool _993 = _939 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _995 = isnan(_939);
            bool _997 = _993 || _995;
            bool _999 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1001 = _997 || _999;
            bool _1003 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1005 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1007 = !_1001;
            bool _1009 = _1005 && _1007;
            if (_1009)
            {
                _951 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1011 = _951;
            float _1013 = _1011;
            if (_1009)
            {
                _953 = 0.0;
            }
            float _1015 = _953;
            _961 = _1015;
            _985 = _1015;
            if (_1009)
            {
                _955 = 0.0;
            }
            float _1017 = _955;
            _963 = _1017;
            _987 = _1017;
            if (_1009)
            {
                float _1019 = _1011 * 5.0;
                _1013 = _1019;
            }
            float _1021 = _1013;
            _983 = _1021;
            if (_1009)
            {
                _957 = 0.0;
            }
            float _1023 = _957;
            bool _1025 = !_1001;
            _1027 = _1025 && _1003;
            _959 = _1023;
            _989 = _1023;
        }
        if ((!_1027) || _979)
        {
            _979 = false;
            float _1029 = _959;
            float _1031 = _961;
            float _1033 = _963;
            bool _1035 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1037 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1039 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1041 = _1029;
            _983 = _949;
            if (_1035)
            {
                float _1043 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1041 = _1043;
            }
            float _1045 = _1041;
            if (_1035)
            {
                float _1047 = abs(_881);
                float _1049 = -_1047;
                float _1051 = _1049 + 1.0;
                _965 = _1051;
            }
            float _1053 = _965;
            if (_1037)
            {
                float _1055 = abs(_893);
                float _1057 = -_1055;
                float _1059 = _1057 + 1.0;
                _967 = _1059;
            }
            float _1061 = _967;
            if (!_1035)
            {
                _969 = 1.0;
            }
            float _1063 = _969;
            float _1065 = _1063;
            if (_1039)
            {
                float _1067 = abs(_905);
                float _1069 = -_1067;
                float _1071 = _1069 + 1.0;
                _971 = _1071;
            }
            float _1073 = _971;
            if (!_1037)
            {
                _973 = 1.0;
            }
            float _1075 = _973;
            float _1077 = _1031;
            float _1079 = _1075;
            if (_1037)
            {
                float _1081 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1077 = _1081;
            }
            float _1083 = _1077;
            float _1085 = _1033;
            if (_1039)
            {
                float _1087 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1085 = _1087;
            }
            float _1089 = _1085;
            float _1091 = _1045;
            if (_1035)
            {
                float _1093 = _1053 * _1045;
                float _1095 = precise::clamp(_1093, 0.0, 1.0);
                _1065 = _1095;
            }
            float _1097 = _1065;
            if (!_1039)
            {
                _1091 = 1.0;
            }
            float _1099 = _1091;
            float _1101 = _1099;
            if (_1037)
            {
                float _1103 = _1061 * _1083;
                float _1105 = precise::clamp(_1103, 0.0, 1.0);
                _1079 = _1105;
            }
            float _1107 = _1079;
            float _1109 = _1097 * _1107;
            _985 = _947;
            if (_1039)
            {
                float _1111 = _1073 * _1089;
                float _1113 = precise::clamp(_1111, 0.0, 1.0);
                _1101 = _1113;
            }
            float _1115 = _1101;
            float _1117 = _1109 * _1115;
            _987 = _945;
            _989 = _1117;
        }
    }
    _991 = false;
    float _1119 = _983;
    float _1121 = _985;
    float _1123 = _987;
    float _1125 = _989;
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1119 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1133 = _1121 + _1131;
    float _1135 = _939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1129 * _1129;
    float _1139 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1141 = fma(_1133, _1133, _1137);
    float _1143 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1139);
    float _1145 = sqrt(_1141);
    bool _1147 = _1145 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1149 = !_1147;
    float _1151 = _1123;
    float _1153 = _1121;
    float _1155 = _1119;
    if (!_1149)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1145 + _1159;
        float _1163 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1141);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = cos(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = _1173 + (-1.0);
        float _1181 = _1179 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = fma(_1177, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1185 = fma(_1173, _1123, _1181);
        float _1187 = _1165 * _1183;
        float _1189 = fma(_1133, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1191 = fma(_1129, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1151 = _1185;
        _1153 = _1189;
        _1155 = _1191;
    }
    float _1193 = _1151;
    float _1195 = _1153;
    float _1197 = _1155;
    float _1199 = -_939;
    float _1201 = _1199 + _1193;
    float _1203 = -_941;
    float _1205 = _1203 + _1195;
    float _1207 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1209 = -_943;
    float _1211 = _1209 + _1197;
    float _1213 = _1201 * _1201;
    float _1215 = _939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1217 = 1.0 / _1207;
    float _1219 = fma(_1205, _1205, _1213);
    float _1221 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1215);
    float _1223 = fma(_1211, _1211, _1219);
    float _1225 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    float _1227 = sqrt(_1223);
    float _1229 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = _1229 + _1207;
    float _1233 = _1231 * _1217;
    float _1235 = _1233 * 0.5;
    bool _1237 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan(0.5);
    bool _1245 = _1241 || _1243;
    bool _1247 = _1227 > 0.0;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1249);
    bool _1253 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    float _1263 = 1.0 / _1251;
    bool _1265 = !_1247;
    float _1267 = _1193;
    float _1269 = _1197;
    float _1271 = _1195;
    if (!_1265)
    {
        float _1273 = _191 * _191;
        float _1275 = fma(_187, _187, _1273);
        float _1277 = fma(_193, _193, _1275);
        float _1279 = rsqrt(_1223);
        float _1281 = sqrt(_1277);
        float _1283 = _1205 * _1279;
        float _1285 = _1211 * _1279;
        bool _1287 = _1281 > 0.0;
        float _1289 = _1201 * _1279;
        bool _1291 = !_1287;
        if (!_1291)
        {
            float _1293 = rsqrt(_1277);
            float _1295 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1297 = _191 * _1293;
            float _1299 = _187 * _1293;
            float _1301 = _1289 * _1297;
            float _1303 = _193 * _1293;
            float _1305 = fma(_1283, _1299, _1301);
            float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1309 = fma(_1285, _1303, _1305);
            float _1311 = _1309 * _1307;
            float _1313 = fma(_187, _1311, _1195);
            float _1315 = fma(_191, _1311, _1193);
            float _1317 = fma(_193, _1311, _1197);
            _1267 = _1315;
            _1269 = _1317;
            _1271 = _1313;
        }
    }
    float _1319 = _1267;
    float _1321 = _1269;
    float _1323 = _1271;
    float _1325 = _1323;
    if (_1245)
    {
        _197 = _1319;
    }
    float _1327 = _197;
    float _1329 = _1327;
    if (_1245)
    {
        _199 = _1321;
    }
    float _1331 = _199;
    float _1333 = _1331;
    if (!_1245)
    {
        float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1337 = _939 + _1335;
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1341 = _941 + _1339;
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1345 = -_939;
        float _1347 = _1345 + _1319;
        float _1349 = _1337 * _1337;
        float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1353 = _943 + _1351;
        float _1355 = -_943;
        float _1357 = _1355 + _1321;
        float _1359 = fma(_1341, _1341, _1349);
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1363 = fma(_1353, _1353, _1359);
        float _1365 = sqrt(_1363);
        float _1367 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1371 = _1369 * _1361;
        float _1373 = -_941;
        float _1375 = _1373 + _1323;
        float _1377 = _1367 * _1371;
        float _1379 = fma(_1375, _1377, _941);
        float _1381 = fma(_1347, _1377, _939);
        float _1383 = fma(_1357, _1377, _943);
        _1329 = _1381;
        _1325 = _1379;
        _1333 = _1383;
    }
    float _1385 = _1329;
    float _1387 = _1325;
    float _1389 = _1333;
    float _1391 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1395 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1397 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1391);
    float _1401 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1393);
    float _1403 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1395);
    float _1405 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1407 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1409 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1401);
    float _1411 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1413 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1405);
    float _1415 = _1393;
    float _1417 = _1401;
    if (_1261)
    {
        _1415 = 1.0;
    }
    float _1419 = _1415;
    float _1421 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1423 = _1419;
    if (_1261)
    {
        _1417 = 1.0;
    }
    float _1425 = _1417;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1429 = _1263 * _1427;
    float _1431 = _1425;
    if (!_1261)
    {
        float _1433 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1435 = _1433 * 0.15915493667125701904296875;
        float _1437 = _1435 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        float _1441 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1435 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = 1.0 / _1439;
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = _1443 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1463 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1461;
        float _1465 = _1453 * _1455;
        float _1467 = 1.0 / _1463;
        float _1469 = 1.0 / _1465;
        float _1471 = _1459 * _1469;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1475 = fma(_1429, _1471, _1473);
        float _1477 = _1475 * _1467;
        float _1479 = precise::clamp(_1477, 0.0, 1.0);
        _1423 = _1479;
    }
    float _1481 = _1423;
    if (!_1261)
    {
        float _1483 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1485 = _1483 * 0.15915493667125701904296875;
        float _1487 = _1485 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1493 = _1491 * 0.15915493667125701904296875;
        float _1495 = _1485 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = 1.0 / _1489;
        float _1501 = _1493 * 6.283185482025146484375;
        float _1503 = cos(_1501);
        float _1505 = _1497 * _1499;
        float _1507 = _1493 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = _1503 * _1505;
        float _1513 = 1.0 / _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1517 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1515;
        float _1519 = 1.0 / _1517;
        float _1521 = _1509 * _1513;
        float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1525 = fma(_1429, _1521, _1523);
        float _1527 = _1525 * _1519;
        float _1529 = precise::clamp(_1527, 0.0, 1.0);
        float _1531 = -_1529;
        float _1533 = _1531 + 1.0;
        _1431 = _1533;
    }
    float _1535 = _1431;
    float _1537 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1539 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1541 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1543 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1545 = _1481 > 0.0;
    bool _1547 = isnan(_1481);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan(0.0);
    bool _1553 = _1549 || _1551;
    float _1555 = _1481 * _1535;
    float _1557 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1539);
    float _1559 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1561 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1563 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1565 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1567 = _1555 * _1125;
    float _1569 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1557);
    float _1573 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1561);
    float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1563);
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    bool _1579 = _1535 <= 0.0;
    bool _1581 = !_1553;
    bool _1583 = _1579 || _1581;
    float _1585 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1587 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1571);
    float _1589 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1593 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1575);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1597 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1599 = _1587 + _1591;
    float _1601 = _1593 + _1591;
    float _1603 = _1591 * 0.5;
    float _1605 = _1599 * 0.5;
    float _1607 = _1601 * 0.5;
    float _1609 = fma(_1597, -0.5, _1603);
    out.gl_Position.x = _1587;
    out.gl_Position.y = _1597;
    out.gl_Position.z = _1593;
    out.gl_Position.w = _1591;
    out.m_35.x = _1595;
    out.m_60.x = _1605;
    out.m_60.y = _1609;
    out.m_60.z = _1607;
    out.m_60.w = _1591;
    if (!_1583)
    {
        return out;
    }
    float _1611 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_35.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1611;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _991 = false;
    bool _979 = false;
    bool _639 = false;
    bool _471 = false;
    bool _321 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1668 = as_type<float>(_95);
        out.gl_Position.z = _1668;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_109)
    {
        float _115 = float(_79);
        _89 = _115;
    }
    float _117 = _89;
    bool _119 = _113 >= _117;
    bool _121 = !_109;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1737 = as_type<float>(_131);
        out.gl_Position.z = _1737;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = in.m_42.x;
    float _137 = in.m_42.y;
    float _139 = in.m_42.z;
    float _141 = in.m_44.x;
    float _143 = in.m_44.y;
    float _145 = in.m_44.z;
    float _147 = in.m_46.x;
    float _149 = in.m_46.y;
    float _151 = in.m_46.z;
    float _153 = in.m_48.x;
    float _155 = in.m_48.y;
    float _157 = in.m_48.z;
    int _159 = as_type<int>(_133) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_133) & 2;
    bool _165 = _163 != 0;
    bool _167 = !_161;
    int _169 = _167 ? (-1090519040) : 1056964608;
    bool _171 = !_165;
    int _173 = _171 ? (-1090519040) : 1056964608;
    float _175 = _137 * _143;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_50.x = as_type<float>(_169);
    out.m_50.y = as_type<float>(_173);
    float _179 = _137 * _149;
    float _181 = fma(_135, _141, _175);
    float _183 = _137 * _155;
    float _185 = fma(_135, _147, _179);
    float _187 = fma(_139, _145, _181);
    float _189 = fma(_135, _153, _183);
    float _191 = fma(_139, _151, _185);
    float _193 = fma(_139, _157, _189);
    bool _195 = !_177;
    float _197 = _191;
    float _199 = _187;
    float _217;
    if (!_195)
    {
        float _201 = in.m_52.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_79);
        float _223 = 1.0 / _221;
        float _225 = _113 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = _227 + _229;
    bool _233 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_227);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -_243;
    float _251 = _249 + 1.0;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _247;
    float _257 = _231 * _255;
    bool _259 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_227);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = _269 * _251;
    float _281 = fma(_273, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_277, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = -_269;
    float _287 = _285 + 1.0;
    float _289 = _281 * _279;
    float _291 = _283 * _279;
    float _293 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].x, _289);
    float _295 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].y, _291);
    float _297 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[144].x, _293);
    float _299 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[144].y, _295);
    bool _301 = !_253;
    float _319;
    if (!_301)
    {
        float _303 = in.m_52.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_79);
        float _325 = 1.0 / _323;
        float _327 = _113 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _329 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_329);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _355 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_329);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    bool _371 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _373 = isnan(_329);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _337;
    float _385 = -_349;
    float _387 = _385 + 1.0;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _391 = _365 * _387;
    float _393 = -_365;
    float _395 = _393 + 1.0;
    float _397 = 1.0 / _353;
    float _399 = _369 * _383;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _405 = fma(_399, _333, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = _403 * _397;
    float _409 = _405 * _391;
    float _411 = -_381;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _329 + _415;
    float _419 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[115].x, _409);
    float _421 = _349 * _413;
    float _423 = fma(_407, _417, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _425 = in.m_54.x;
    float _427 = in.m_54.y;
    float _429 = fma(_423, _421, _419);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _435 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[117].x, _429);
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _439 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = _437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _439;
    out.m_56.y = _441;
    out.m_56.z = _445;
    out.m_56.w = _443;
    float _447 = _299 * _427;
    float _449 = _297 * _425;
    bool _451 = !_389;
    float _469;
    if (!_451)
    {
        float _453 = in.m_52.x;
        float _455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _461 = _459 * _455;
        float _463 = floor(_461);
        float _465 = -_463;
        float _467 = _461 + _465;
        _469 = _467;
        _471 = true;
    }
    else
    {
        float _473 = float(_79);
        float _475 = 1.0 / _473;
        float _477 = _113 * _475;
        _469 = _477;
    }
    _471 = false;
    float _479 = _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _483 = _479 + _481;
    bool _485 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _487 = isnan(_479);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _499 = _479 + _497;
    bool _501 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _503 = isnan(_479);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _521 = _479 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _523 = isnan(_479);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_495;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _519;
    float _539 = _531 * _535;
    float _541 = -_531;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _545;
    bool _549 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _551 = 1.0 / _515;
    float _553 = _511 * _543;
    float _555 = -_511;
    float _557 = _555 + 1.0;
    float _559 = _499 * _537;
    float _561 = _483 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _567;
    float _571 = fma(_547, _561, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _573 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _575 = fma(_569, _561, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _577 = _571 * _553;
    float _579 = _573 * _553;
    float _581 = _575 * _553;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _595 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].x, _577);
    float _597 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].y, _579);
    float _599 = fma(_585, _559, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _601 = fma(_589, _559, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _603 = fma(_593, _559, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _605 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[123].z, _581);
    float _607 = fma(_599, _539, _595);
    float _609 = fma(_601, _539, _597);
    float _611 = fma(_603, _539, _605);
    float _613 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].x, _607);
    float _615 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].y, _609);
    float _617 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[125].z, _611);
    bool _619 = !_549;
    float _637;
    if (!_619)
    {
        float _621 = in.m_52.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].w, _113);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_79);
        float _643 = 1.0 / _641;
        float _645 = _113 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_32.x;
    float _651 = in.m_32.y;
    float _653 = in.m_32.z;
    float _655 = _449 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = in.m_46.w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_169));
    float _665 = in.m_44.w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _671 = 1.0 / _661;
    float _673 = _655 * _663;
    float _675 = in.m_48.w;
    float _677 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _679 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_173));
    float _681 = 1.0 / _669;
    float _683 = _677 * _679;
    float _685 = _149 * _651;
    float _687 = _143 * _651;
    float _689 = _155 * _651;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _691;
    float _695 = fma(_147, _649, _685);
    float _697 = fma(_141, _649, _687);
    float _699 = fma(_153, _649, _689);
    float _701 = _693 * _671;
    float _703 = fma(_151, _653, _695);
    float _705 = fma(_145, _653, _697);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _647 + _707;
    float _711 = fma(_157, _653, _699);
    float _713 = _703 + _657;
    float _715 = _705 + _665;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _721 = fma(_701, _709, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _723 = _713 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _725 = _711 + _675;
    float _727 = _715 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _729 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _731 = isnan(_647);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _745 = _719 * _681;
    float _747 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    bool _749 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _751 = isnan(_647);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _725 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _763 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].x, _741);
    float _765 = -_739;
    float _767 = _765 + 1.0;
    float _769 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].y, _747);
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].x, _763);
    bool _775 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _777 = isnan(_647);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = _759 * _767;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = _723 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _795 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].y, _769);
    float _797 = _773 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _799 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _801 = _785 * _791;
    float _803 = fma(_727, (*spvDescriptorSet0.vp_c12)._m0[6].z, _793);
    float _805 = _795 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _807 = _797 * _743;
    float _809 = _721 * _801;
    float _811 = -_785;
    float _813 = _811 + 1.0;
    float _815 = fma(_761, (*spvDescriptorSet0.vp_c12)._m0[8].z, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _819 = _647 + _817;
    float _821 = _805 * _771;
    float _823 = fma(_807, 0.5, 0.5);
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[131].x, _809);
    float _827 = _815 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _829 = fma(_821, 0.5, 0.5);
    float _831 = fma(_745, _819, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _833 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _835 = floor(_823);
    float _837 = _827 * _799;
    float _839 = fma(_831, _787, _825);
    float _841 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _843 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _845 = fma(_837, 0.5, 0.5);
    float _847 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].x, _833);
    float _849 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _851 = floor(_829);
    float _853 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[133].x, _839);
    float _855 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _857 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _847);
    float _859 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].x, _841);
    float _861 = _853 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _863 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].x, _843);
    float _865 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _867 = floor(_845);
    float _869 = -_835;
    float _871 = _823 + _869;
    float _873 = _617 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _875 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _877 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _863);
    float _879 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = fma(_871, 2.0, -1.0);
    float _883 = -_851;
    float _885 = _829 + _883;
    float _887 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _881 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _893 = fma(_885, 2.0, -1.0);
    float _895 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _897 = _877 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    out.m_58.x = _879;
    out.m_58.y = _887;
    out.m_58.z = _889;
    out.m_58.w = _861;
    float _899 = -_867;
    float _901 = _845 + _899;
    float _903 = _893 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _905 = fma(_901, 2.0, -1.0);
    float _907 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _909 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _911 = _903 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _913 = _905 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _915 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].y, _907);
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].x, _909);
    float _919 = fma(_891, (*spvDescriptorSet0.vp_c12)._m0[2].z, _911);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].y, _915);
    bool _923 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _925 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _927 = _923 || _925;
    bool _929 = isnan(1.0);
    bool _931 = _927 || _929;
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].x, _917);
    float _935 = fma(_913, (*spvDescriptorSet0.vp_c12)._m0[4].z, _919);
    float _937 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _939 = _921 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _941 = _933 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _943 = _935 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _945 = _937 + _939;
    float _947 = _895 + _941;
    float _949 = _897 + _943;
    float _951 = _887;
    float _953 = _879;
    float _955 = _889;
    float _957 = _937;
    float _959 = _937;
    float _961 = _879;
    float _963 = _889;
    float _965 = _881;
    float _967 = _893;
    float _969 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _971 = _905;
    float _973 = _895;
    float _983;
    float _985;
    float _987;
    float _989;
    if (!_931)
    {
        bool _975 = _939 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _977 = !_975;
        _979 = _977;
        if (!_979)
        {
            float _981 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _983 = _981;
            _985 = 0.0;
            _987 = 0.0;
            _989 = 0.0;
            _991 = true;
        }
    }
    if ((!_991) || _979)
    {
        bool _1027;
        if (!_979)
        {
            bool _993 = _939 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _995 = isnan(_939);
            bool _997 = _993 || _995;
            bool _999 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1001 = _997 || _999;
            bool _1003 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1005 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1007 = !_1001;
            bool _1009 = _1005 && _1007;
            if (_1009)
            {
                _951 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1011 = _951;
            float _1013 = _1011;
            if (_1009)
            {
                _953 = 0.0;
            }
            float _1015 = _953;
            _961 = _1015;
            _985 = _1015;
            if (_1009)
            {
                _955 = 0.0;
            }
            float _1017 = _955;
            _963 = _1017;
            _987 = _1017;
            if (_1009)
            {
                float _1019 = _1011 * 5.0;
                _1013 = _1019;
            }
            float _1021 = _1013;
            _983 = _1021;
            if (_1009)
            {
                _957 = 0.0;
            }
            float _1023 = _957;
            bool _1025 = !_1001;
            _1027 = _1025 && _1003;
            _959 = _1023;
            _989 = _1023;
        }
        if ((!_1027) || _979)
        {
            _979 = false;
            float _1029 = _959;
            float _1031 = _961;
            float _1033 = _963;
            bool _1035 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1037 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1039 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1041 = _1029;
            _983 = _949;
            if (_1035)
            {
                float _1043 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1041 = _1043;
            }
            float _1045 = _1041;
            if (_1035)
            {
                float _1047 = abs(_881);
                float _1049 = -_1047;
                float _1051 = _1049 + 1.0;
                _965 = _1051;
            }
            float _1053 = _965;
            if (_1037)
            {
                float _1055 = abs(_893);
                float _1057 = -_1055;
                float _1059 = _1057 + 1.0;
                _967 = _1059;
            }
            float _1061 = _967;
            if (!_1035)
            {
                _969 = 1.0;
            }
            float _1063 = _969;
            float _1065 = _1063;
            if (_1039)
            {
                float _1067 = abs(_905);
                float _1069 = -_1067;
                float _1071 = _1069 + 1.0;
                _971 = _1071;
            }
            float _1073 = _971;
            if (!_1037)
            {
                _973 = 1.0;
            }
            float _1075 = _973;
            float _1077 = _1031;
            float _1079 = _1075;
            if (_1037)
            {
                float _1081 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1077 = _1081;
            }
            float _1083 = _1077;
            float _1085 = _1033;
            if (_1039)
            {
                float _1087 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1085 = _1087;
            }
            float _1089 = _1085;
            float _1091 = _1045;
            if (_1035)
            {
                float _1093 = _1053 * _1045;
                float _1095 = precise::clamp(_1093, 0.0, 1.0);
                _1065 = _1095;
            }
            float _1097 = _1065;
            if (!_1039)
            {
                _1091 = 1.0;
            }
            float _1099 = _1091;
            float _1101 = _1099;
            if (_1037)
            {
                float _1103 = _1061 * _1083;
                float _1105 = precise::clamp(_1103, 0.0, 1.0);
                _1079 = _1105;
            }
            float _1107 = _1079;
            float _1109 = _1097 * _1107;
            _985 = _947;
            if (_1039)
            {
                float _1111 = _1073 * _1089;
                float _1113 = precise::clamp(_1111, 0.0, 1.0);
                _1101 = _1113;
            }
            float _1115 = _1101;
            float _1117 = _1109 * _1115;
            _987 = _945;
            _989 = _1117;
        }
    }
    _991 = false;
    float _1119 = _983;
    float _1121 = _985;
    float _1123 = _987;
    float _1125 = _989;
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1119 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1133 = _1121 + _1131;
    float _1135 = _939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1129 * _1129;
    float _1139 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1141 = fma(_1133, _1133, _1137);
    float _1143 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1139);
    float _1145 = sqrt(_1141);
    bool _1147 = _1145 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1149 = !_1147;
    float _1151 = _1123;
    float _1153 = _1121;
    float _1155 = _1119;
    if (!_1149)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1145 + _1159;
        float _1163 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1141);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = cos(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = _1173 + (-1.0);
        float _1181 = _1179 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = fma(_1177, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1185 = fma(_1173, _1123, _1181);
        float _1187 = _1165 * _1183;
        float _1189 = fma(_1133, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1191 = fma(_1129, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1151 = _1185;
        _1153 = _1189;
        _1155 = _1191;
    }
    float _1193 = _1151;
    float _1195 = _1153;
    float _1197 = _1155;
    float _1199 = -_939;
    float _1201 = _1199 + _1193;
    float _1203 = -_941;
    float _1205 = _1203 + _1195;
    float _1207 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1209 = -_943;
    float _1211 = _1209 + _1197;
    float _1213 = _1201 * _1201;
    float _1215 = _939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1217 = 1.0 / _1207;
    float _1219 = fma(_1205, _1205, _1213);
    float _1221 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1215);
    float _1223 = fma(_1211, _1211, _1219);
    float _1225 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    float _1227 = sqrt(_1223);
    float _1229 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = _1229 + _1207;
    float _1233 = _1231 * _1217;
    float _1235 = _1233 * 0.5;
    bool _1237 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan(0.5);
    bool _1245 = _1241 || _1243;
    bool _1247 = _1227 > 0.0;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1249);
    bool _1253 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    float _1263 = 1.0 / _1251;
    bool _1265 = !_1247;
    float _1267 = _1193;
    float _1269 = _1197;
    float _1271 = _1195;
    if (!_1265)
    {
        float _1273 = _191 * _191;
        float _1275 = fma(_187, _187, _1273);
        float _1277 = fma(_193, _193, _1275);
        float _1279 = rsqrt(_1223);
        float _1281 = sqrt(_1277);
        float _1283 = _1205 * _1279;
        float _1285 = _1211 * _1279;
        bool _1287 = _1281 > 0.0;
        float _1289 = _1201 * _1279;
        bool _1291 = !_1287;
        if (!_1291)
        {
            float _1293 = rsqrt(_1277);
            float _1295 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1297 = _191 * _1293;
            float _1299 = _187 * _1293;
            float _1301 = _1289 * _1297;
            float _1303 = _193 * _1293;
            float _1305 = fma(_1283, _1299, _1301);
            float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1309 = fma(_1285, _1303, _1305);
            float _1311 = _1309 * _1307;
            float _1313 = fma(_187, _1311, _1195);
            float _1315 = fma(_191, _1311, _1193);
            float _1317 = fma(_193, _1311, _1197);
            _1267 = _1315;
            _1269 = _1317;
            _1271 = _1313;
        }
    }
    float _1319 = _1267;
    float _1321 = _1269;
    float _1323 = _1271;
    float _1325 = _1323;
    if (_1245)
    {
        _197 = _1319;
    }
    float _1327 = _197;
    float _1329 = _1327;
    if (_1245)
    {
        _199 = _1321;
    }
    float _1331 = _199;
    float _1333 = _1331;
    if (!_1245)
    {
        float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1337 = _939 + _1335;
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1341 = _941 + _1339;
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1345 = -_939;
        float _1347 = _1345 + _1319;
        float _1349 = _1337 * _1337;
        float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1353 = _943 + _1351;
        float _1355 = -_943;
        float _1357 = _1355 + _1321;
        float _1359 = fma(_1341, _1341, _1349);
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1363 = fma(_1353, _1353, _1359);
        float _1365 = sqrt(_1363);
        float _1367 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1371 = _1369 * _1361;
        float _1373 = -_941;
        float _1375 = _1373 + _1323;
        float _1377 = _1367 * _1371;
        float _1379 = fma(_1375, _1377, _941);
        float _1381 = fma(_1347, _1377, _939);
        float _1383 = fma(_1357, _1377, _943);
        _1329 = _1381;
        _1325 = _1379;
        _1333 = _1383;
    }
    float _1385 = _1329;
    float _1387 = _1325;
    float _1389 = _1333;
    float _1391 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1395 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1397 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1391);
    float _1401 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1393);
    float _1403 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1395);
    float _1405 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1407 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1409 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1401);
    float _1411 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1413 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1405);
    float _1415 = _1393;
    float _1417 = _1401;
    if (_1261)
    {
        _1415 = 1.0;
    }
    float _1419 = _1415;
    float _1421 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1423 = _1419;
    if (_1261)
    {
        _1417 = 1.0;
    }
    float _1425 = _1417;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1429 = _1263 * _1427;
    float _1431 = _1425;
    if (!_1261)
    {
        float _1433 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1435 = _1433 * 0.15915493667125701904296875;
        float _1437 = _1435 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        float _1441 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1435 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = 1.0 / _1439;
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = _1443 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1463 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1461;
        float _1465 = _1453 * _1455;
        float _1467 = 1.0 / _1463;
        float _1469 = 1.0 / _1465;
        float _1471 = _1459 * _1469;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1475 = fma(_1429, _1471, _1473);
        float _1477 = _1475 * _1467;
        float _1479 = precise::clamp(_1477, 0.0, 1.0);
        _1423 = _1479;
    }
    float _1481 = _1423;
    if (!_1261)
    {
        float _1483 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1485 = _1483 * 0.15915493667125701904296875;
        float _1487 = _1485 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1493 = _1491 * 0.15915493667125701904296875;
        float _1495 = _1485 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = 1.0 / _1489;
        float _1501 = _1493 * 6.283185482025146484375;
        float _1503 = cos(_1501);
        float _1505 = _1497 * _1499;
        float _1507 = _1493 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = _1503 * _1505;
        float _1513 = 1.0 / _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1517 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1515;
        float _1519 = 1.0 / _1517;
        float _1521 = _1509 * _1513;
        float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1525 = fma(_1429, _1521, _1523);
        float _1527 = _1525 * _1519;
        float _1529 = precise::clamp(_1527, 0.0, 1.0);
        float _1531 = -_1529;
        float _1533 = _1531 + 1.0;
        _1431 = _1533;
    }
    float _1535 = _1431;
    float _1537 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1539 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1541 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1543 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1545 = _1481 > 0.0;
    bool _1547 = isnan(_1481);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan(0.0);
    bool _1553 = _1549 || _1551;
    float _1555 = _1481 * _1535;
    float _1557 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1539);
    float _1559 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1561 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1563 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1565 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1567 = _1555 * _1125;
    float _1569 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1557);
    float _1573 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1561);
    float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1563);
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    bool _1579 = _1535 <= 0.0;
    bool _1581 = !_1553;
    bool _1583 = _1579 || _1581;
    float _1585 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1587 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1571);
    float _1589 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1593 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1575);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1597 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1599 = _1587 + _1591;
    float _1601 = _1593 + _1591;
    float _1603 = _1591 * 0.5;
    float _1605 = _1599 * 0.5;
    float _1607 = _1601 * 0.5;
    float _1609 = fma(_1597, -0.5, _1603);
    out.gl_Position.x = _1587;
    out.gl_Position.y = _1597;
    out.gl_Position.z = _1593;
    out.gl_Position.w = _1591;
    out.m_35.x = _1595;
    out.m_60.x = _1605;
    out.m_60.y = _1609;
    out.m_60.z = _1607;
    out.m_60.w = _1591;
    if (!_1583)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1611 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_35.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1611;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

