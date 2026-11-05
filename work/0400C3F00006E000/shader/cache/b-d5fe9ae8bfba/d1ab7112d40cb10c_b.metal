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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_60 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_56 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
    float4 m_46 [[user(locn9)]];
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _617 = false;
    bool _449 = false;
    bool _293 = false;
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
        float _1392 = as_type<float>(_95);
        out.gl_Position.z = _1392;
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
    float _115 = 0.0;
    if (_109)
    {
        float _117 = float(_79);
        _115 = _117;
    }
    float _119 = _115;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
    bool _125 = _121 || _123;
    if (_125)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _89;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1460 = as_type<float>(_131);
        out.gl_Position.z = _1460;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _137 = in.m_42.w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_37.x;
    float _151 = in.m_37.y;
    float _153 = in.m_37.z;
    float _155 = in.m_32.x;
    float _157 = in.m_32.y;
    float _159 = in.m_32.z;
    float _161 = 0.0;
    float _163 = _135;
    if (!_147)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = _169;
    if (!_147)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_147;
    float _195 = _175;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _135 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _135);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_147;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _135 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _163 = _249;
    }
    float _251 = _163;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _149, _255);
    float _263 = fma(_251, _151, _257);
    float _265 = fma(_251, _153, _259);
    float _267 = fma(_261, _137, _155);
    float _269 = fma(_263, _137, _157);
    float _271 = fma(_265, _137, _159);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_44.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_79);
        float _297 = 1.0 / _295;
        float _299 = _113 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    bool _307 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_301);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _301 + _319;
    bool _323 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_301);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -_317;
    float _345 = _343 + 1.0;
    float _347 = 1.0 / _341;
    bool _349 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_301);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _333 * _345;
    float _363 = -_333;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _373 = _359 * _365;
    float _375 = 1.0 / _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -_359;
    float _383 = _381 + 1.0;
    float _385 = _321 * _347;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = fma(_369, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _305 * _375;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _397;
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = fma(_379, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = fma(_399, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = _407 * _373;
    float _411 = _405 * _373;
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _417 = fma(_393, _361, _413);
    float _419 = fma(_391, _361, _415);
    float _421 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _417);
    float _423 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _419);
    float _425 = _421 * _401;
    float _427 = _423 * _403;
    bool _429 = !_371;
    float _447;
    if (!_429)
    {
        float _431 = in.m_44.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        float _451 = float(_79);
        float _453 = 1.0 / _451;
        float _455 = _113 * _453;
        _447 = _455;
    }
    _449 = false;
    float _457 = _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = _457 + _459;
    bool _463 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_457);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _477 = _457 + _475;
    bool _479 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _481 = isnan(_457);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _499 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _501 = isnan(_457);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -_473;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _493;
    float _517 = _509 * _513;
    float _519 = -_509;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    bool _527 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _529 = 1.0 / _497;
    float _531 = _489 * _521;
    float _533 = -_489;
    float _535 = _533 + 1.0;
    float _537 = _461 * _515;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _543;
    float _547 = fma(_525, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _549 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = fma(_545, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _553 = _477 * _529;
    float _555 = _547 * _531;
    float _557 = _549 * _531;
    float _559 = _551 * _531;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _573 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].x, _555);
    float _575 = fma(_563, _553, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _577 = fma(_567, _553, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _579 = fma(_571, _553, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _581 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _583 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].z, _559);
    float _585 = fma(_575, _517, _573);
    float _587 = fma(_577, _517, _581);
    float _589 = fma(_579, _517, _583);
    float _591 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].x, _585);
    float _593 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].y, _587);
    float _595 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].z, _589);
    bool _597 = !_527;
    float _615;
    if (!_597)
    {
        float _599 = in.m_44.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_79);
        float _621 = 1.0 / _619;
        float _623 = _113 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _629 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _631 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _633 = in.m_44.x;
    float _635 = in.m_44.y;
    float _637 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _627);
    float _639 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _641 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    float _643 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _645 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    float _649 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _651 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _653 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _655 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _657 = _643 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _651 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _665 = _653 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _669 = _655 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = _661 * _661;
    bool _677 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_625);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = fma(_665, _665, _675);
    float _691 = -_687;
    float _693 = _691 + 1.0;
    bool _695 = _633 > 0.5;
    float _697 = fma(_669, _669, _689);
    bool _699 = _635 > 0.5;
    float _701 = rsqrt(_697);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = sqrt(_697);
    float _709 = 1.0 / _705;
    float _711 = _661 * _701;
    float _713 = _665 * _701;
    float _715 = -_711;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _719 = _707 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _721 = -_713;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _725 = _717 * _717;
    float _727 = precise::min(_657, _719);
    float _729 = fma(_723, _723, _725);
    float _731 = _669 * _701;
    float _733 = _673 * _709;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _741 = _739 != 0;
    float _743 = -_731;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _749 = _747 != 0;
    float _751 = _711 * _727;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _755 = _625 + _753;
    float _757 = fma(_745, _745, _729);
    float _759 = _713 * _727;
    float _761 = -_751;
    float _763 = _661 + _761;
    float _765 = fma(_733, _755, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _767 = 1.0 / _737;
    float _769 = -_759;
    float _771 = _665 + _769;
    float _773 = _763 * _763;
    bool _775 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _777 = isnan(_625);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = _661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_46.w = _727;
    float _789 = fma(_771, _771, _773);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _795 = _785 * _693;
    float _797 = _731 * _727;
    bool _799 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _801 = isnan(_625);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _813 = _765 * _795;
    float _815 = -_797;
    float _817 = _669 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _821 = _625 + _819;
    float _823 = -_785;
    float _825 = _823 + 1.0;
    float _827 = _793 * _767;
    float _829 = fma(_817, _817, _789);
    float _831 = -_809;
    float _833 = _831 + 1.0;
    float _835 = sqrt(_757);
    float _837 = fma(_827, _821, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[115].x, _813);
    float _841 = _687 * _833;
    float _843 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[28].x, _787);
    float _845 = -_187;
    int _847 = _695 ? as_type<int>(_845) : as_type<int>(_187);
    float _849 = -_191;
    int _851 = _699 ? as_type<int>(_849) : as_type<int>(_191);
    float _853 = sqrt(_829);
    bool _855 = !_741;
    float _857 = _855 ? _187 : as_type<float>(_847);
    float _859 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[28].z, _843);
    float _861 = fma(_837, _841, _839);
    bool _863 = !_749;
    float _865 = _863 ? _191 : as_type<float>(_851);
    float _867 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _869 = _857 + 0.5;
    bool _871 = _859 >= 0.0;
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _875 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[117].x, _861);
    float _877 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _879 = _701 * _835;
    float _881 = -_865;
    float _883 = _881 + 0.5;
    float _885 = _877 * _811;
    float _887 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = _701 * _853;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _893 = _889 * _879;
    float _895 = _665;
    if (_871)
    {
        _895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _895;
    float _899 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _907 = _891 * _873;
    float _909 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _923 = as_type<int>(_897);
    if (_871)
    {
        float _925 = _897 * 5.0;
        _923 = as_type<int>(_925);
    }
    int _927 = _923;
    float _929 = _643 * _893;
    out.m_48.x = _911;
    out.m_48.y = _913;
    out.m_48.z = _915;
    out.m_50.x = _885;
    out.m_50.y = _907;
    out.m_52.x = _909;
    out.m_52.y = _917;
    out.m_52.z = _919;
    out.m_52.w = _921;
    if (_871)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2771 = as_type<float>(_927);
        out.gl_Position.z = _2771;
    }
    if (_871)
    {
        out.m_35.x = 0.0;
    }
    out.m_54.x = _929;
    if (_871)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _931 = -_711;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _935 = -_713;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _939 = -_731;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _933 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _941 + _951;
    float _955 = _945 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[28].x, _955);
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].z, _957);
    bool _961 = _959 >= 0.0;
    float _963 = _953;
    if (_961)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _965 = _963;
    int _967 = as_type<int>(_965);
    if (_961)
    {
        out.m_35.x = 0.0;
    }
    if (_961)
    {
        float _969 = _965 * 5.0;
        _967 = as_type<int>(_969);
    }
    int _971 = _967;
    if (_961)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2864 = as_type<float>(_971);
        out.gl_Position.z = _2864;
    }
    if (_961)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _973 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _979 = -_797;
    float _981 = _655 + _979;
    float _983 = _973 * _893;
    float _985 = _893 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _987 = _985 * 0.5;
    float _989 = _929 * _977;
    float _991 = -_731;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _995 = _983 * _975;
    float _997 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _999);
    float _1005 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1001);
    float _1007 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1003);
    float _1009 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1011 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1013 = _655 + _1009;
    float _1015 = _653 + _1011;
    float _1017 = -_751;
    float _1019 = _651 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1023 = _1013 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1027 = _1015 + _1025;
    float _1029 = -_711;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1033 = _1023 * _1023;
    float _1035 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1037 = fma(_1027, _1027, _1033);
    float _1039 = -_759;
    float _1041 = _653 + _1039;
    float _1043 = sqrt(_1037);
    float _1045 = -_713;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1041);
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1035);
    float _1051 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1049);
    float _1055 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1057 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1059 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1055);
    bool _1061 = _1043 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = 1.0 / _1057;
    float _1065 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1067 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1069 = _651 + _1065;
    float _1071 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1067);
    float _1073 = _1065;
    float _1075 = _1067;
    float _1077 = _1015;
    float _1079 = _1043;
    if (!_1061)
    {
        _1073 = _1013;
    }
    float _1081 = _1073;
    float _1083 = _1081;
    if (!_1061)
    {
        _1075 = _1069;
    }
    float _1085 = _1075;
    bool _1087 = !_1061;
    float _1089 = _1085;
    if (!_1087)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1095 = _1043 + _1093;
        float _1097 = rsqrt(_1037);
        float _1099 = _1095 * _1091;
        float _1101 = _1069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = _1099 * 0.15915493667125701904296875;
        float _1105 = _1103 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1103 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 + (-1.0);
        float _1115 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1119 = fma(_1069, _1107, _1115);
        float _1121 = _1097 * _1117;
        float _1123 = fma(_1027, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1023, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1089 = _1119;
        _1077 = _1123;
        _1083 = _1125;
        _1079 = _1121;
    }
    float _1127 = _1089;
    float _1129 = _1077;
    float _1131 = _1083;
    float _1133 = _1079;
    out.m_56.x = _1047;
    out.m_56.y = _1031;
    out.m_56.z = _993;
    bool _1135 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1071);
    float _1147 = -_751;
    float _1149 = _1147 + _1127;
    float _1151 = -_759;
    float _1153 = _1151 + _1129;
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1157 = -_711;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1149);
    float _1161 = _1155 + _1057;
    float _1163 = -_797;
    float _1165 = _1163 + _1131;
    float _1167 = _1161 * _1063;
    float _1169 = _1167 * 0.5;
    float _1171 = _1133;
    if (_1143)
    {
        _1171 = 1.0;
    }
    float _1173 = _1171;
    float _1175 = _1173;
    if (!_1143)
    {
        float _1177 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1179 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = _1177 * 0.15915493667125701904296875;
        float _1183 = _1179 * 0.15915493667125701904296875;
        float _1185 = _1181 * 6.283185482025146484375;
        float _1187 = cos(_1185);
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1191 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1189);
        float _1193 = _1181 * 6.283185482025146484375;
        float _1195 = sin(_1193);
        float _1197 = 1.0 / _1187;
        float _1199 = _1183 * 6.283185482025146484375;
        float _1201 = cos(_1199);
        float _1203 = _1195 * _1197;
        float _1205 = _1183 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = _1201 * _1203;
        float _1211 = 1.0 / _1191;
        float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1215 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1213;
        float _1217 = 1.0 / _1209;
        float _1219 = 1.0 / _1215;
        float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1223 = _1211 * _1221;
        float _1225 = _1207 * _1217;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1229 = fma(_1225, _1223, _1227);
        float _1231 = _1229 * _1219;
        float _1233 = precise::clamp(_1231, 0.0, 1.0);
        _1175 = _1233;
    }
    float _1235 = _1175;
    float _1237 = -_713;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1241 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1243 = -_731;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1165);
    float _1247 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1249 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1241);
    float _1253 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1255 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1247);
    float _1257 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1253);
    float _1263 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1255);
    float _1265 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1269 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1261);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1275 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1279 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1277);
    float _1287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1279);
    float _1289 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1281);
    float _1291 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1293 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1283);
    float _1295 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1285);
    float _1297 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1287);
    float _1299 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1289);
    bool _1301 = _1235 > 0.0;
    bool _1303 = isnan(_1235);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    float _1311 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1313 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1293);
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1295);
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1299);
    float _1319 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1297);
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1323 = _1315 + _1317;
    float _1325 = _1319 + _1317;
    float _1327 = _1317 * 0.5;
    float _1329 = _1323 * 0.5;
    float _1331 = _1325 * 0.5;
    float _1333 = fma(_1313, -0.5, _1327);
    out.m_58.x = _1239;
    out.m_58.y = _1159;
    out.m_58.z = _1245;
    out.m_35.x = _1321;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1313;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1317;
    out.m_60.x = _1329;
    out.m_60.y = _1333;
    out.m_60.z = _1331;
    out.m_60.w = _1317;
    if (_1309)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1335;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _617 = false;
    bool _449 = false;
    bool _293 = false;
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
        float _1392 = as_type<float>(_95);
        out.gl_Position.z = _1392;
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
    float _115 = 0.0;
    if (_109)
    {
        float _117 = float(_79);
        _115 = _117;
    }
    float _119 = _115;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
    bool _125 = _121 || _123;
    if (_125)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _89;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1460 = as_type<float>(_131);
        out.gl_Position.z = _1460;
    }
    if (_125)
    {
        return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _137 = in.m_42.w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_37.x;
    float _151 = in.m_37.y;
    float _153 = in.m_37.z;
    float _155 = in.m_32.x;
    float _157 = in.m_32.y;
    float _159 = in.m_32.z;
    float _161 = 0.0;
    float _163 = _135;
    if (!_147)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = _169;
    if (!_147)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_147;
    float _195 = _175;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _135 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _135);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_147;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _135 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _163 = _249;
    }
    float _251 = _163;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _149, _255);
    float _263 = fma(_251, _151, _257);
    float _265 = fma(_251, _153, _259);
    float _267 = fma(_261, _137, _155);
    float _269 = fma(_263, _137, _157);
    float _271 = fma(_265, _137, _159);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_44.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_79);
        float _297 = 1.0 / _295;
        float _299 = _113 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    bool _307 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_301);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _301 + _319;
    bool _323 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_301);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -_317;
    float _345 = _343 + 1.0;
    float _347 = 1.0 / _341;
    bool _349 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_301);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _333 * _345;
    float _363 = -_333;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _373 = _359 * _365;
    float _375 = 1.0 / _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -_359;
    float _383 = _381 + 1.0;
    float _385 = _321 * _347;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = fma(_369, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _305 * _375;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _397;
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = fma(_379, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = fma(_399, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = _407 * _373;
    float _411 = _405 * _373;
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _417 = fma(_393, _361, _413);
    float _419 = fma(_391, _361, _415);
    float _421 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _417);
    float _423 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _419);
    float _425 = _421 * _401;
    float _427 = _423 * _403;
    bool _429 = !_371;
    float _447;
    if (!_429)
    {
        float _431 = in.m_44.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        float _451 = float(_79);
        float _453 = 1.0 / _451;
        float _455 = _113 * _453;
        _447 = _455;
    }
    _449 = false;
    float _457 = _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = _457 + _459;
    bool _463 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_457);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _477 = _457 + _475;
    bool _479 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _481 = isnan(_457);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _499 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _501 = isnan(_457);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -_473;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _493;
    float _517 = _509 * _513;
    float _519 = -_509;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    bool _527 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _529 = 1.0 / _497;
    float _531 = _489 * _521;
    float _533 = -_489;
    float _535 = _533 + 1.0;
    float _537 = _461 * _515;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _543;
    float _547 = fma(_525, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _549 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = fma(_545, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _553 = _477 * _529;
    float _555 = _547 * _531;
    float _557 = _549 * _531;
    float _559 = _551 * _531;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _573 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].x, _555);
    float _575 = fma(_563, _553, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _577 = fma(_567, _553, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _579 = fma(_571, _553, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _581 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _583 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].z, _559);
    float _585 = fma(_575, _517, _573);
    float _587 = fma(_577, _517, _581);
    float _589 = fma(_579, _517, _583);
    float _591 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].x, _585);
    float _593 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].y, _587);
    float _595 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].z, _589);
    bool _597 = !_527;
    float _615;
    if (!_597)
    {
        float _599 = in.m_44.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_79);
        float _621 = 1.0 / _619;
        float _623 = _113 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _629 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _631 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _633 = in.m_44.x;
    float _635 = in.m_44.y;
    float _637 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _627);
    float _639 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _641 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    float _643 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _645 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    float _649 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _651 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _653 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _655 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _657 = _643 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _651 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _665 = _653 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _669 = _655 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = _661 * _661;
    bool _677 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_625);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = fma(_665, _665, _675);
    float _691 = -_687;
    float _693 = _691 + 1.0;
    bool _695 = _633 > 0.5;
    float _697 = fma(_669, _669, _689);
    bool _699 = _635 > 0.5;
    float _701 = rsqrt(_697);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = sqrt(_697);
    float _709 = 1.0 / _705;
    float _711 = _661 * _701;
    float _713 = _665 * _701;
    float _715 = -_711;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _719 = _707 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _721 = -_713;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _725 = _717 * _717;
    float _727 = precise::min(_657, _719);
    float _729 = fma(_723, _723, _725);
    float _731 = _669 * _701;
    float _733 = _673 * _709;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _741 = _739 != 0;
    float _743 = -_731;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _749 = _747 != 0;
    float _751 = _711 * _727;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _755 = _625 + _753;
    float _757 = fma(_745, _745, _729);
    float _759 = _713 * _727;
    float _761 = -_751;
    float _763 = _661 + _761;
    float _765 = fma(_733, _755, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _767 = 1.0 / _737;
    float _769 = -_759;
    float _771 = _665 + _769;
    float _773 = _763 * _763;
    bool _775 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _777 = isnan(_625);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = _661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_46.w = _727;
    float _789 = fma(_771, _771, _773);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _795 = _785 * _693;
    float _797 = _731 * _727;
    bool _799 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _801 = isnan(_625);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _813 = _765 * _795;
    float _815 = -_797;
    float _817 = _669 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _821 = _625 + _819;
    float _823 = -_785;
    float _825 = _823 + 1.0;
    float _827 = _793 * _767;
    float _829 = fma(_817, _817, _789);
    float _831 = -_809;
    float _833 = _831 + 1.0;
    float _835 = sqrt(_757);
    float _837 = fma(_827, _821, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[115].x, _813);
    float _841 = _687 * _833;
    float _843 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[28].x, _787);
    float _845 = -_187;
    int _847 = _695 ? as_type<int>(_845) : as_type<int>(_187);
    float _849 = -_191;
    int _851 = _699 ? as_type<int>(_849) : as_type<int>(_191);
    float _853 = sqrt(_829);
    bool _855 = !_741;
    float _857 = _855 ? _187 : as_type<float>(_847);
    float _859 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[28].z, _843);
    float _861 = fma(_837, _841, _839);
    bool _863 = !_749;
    float _865 = _863 ? _191 : as_type<float>(_851);
    float _867 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _869 = _857 + 0.5;
    bool _871 = _859 >= 0.0;
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _875 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[117].x, _861);
    float _877 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _879 = _701 * _835;
    float _881 = -_865;
    float _883 = _881 + 0.5;
    float _885 = _877 * _811;
    float _887 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = _701 * _853;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _893 = _889 * _879;
    float _895 = _665;
    if (_871)
    {
        _895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _895;
    float _899 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _907 = _891 * _873;
    float _909 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _923 = as_type<int>(_897);
    if (_871)
    {
        float _925 = _897 * 5.0;
        _923 = as_type<int>(_925);
    }
    int _927 = _923;
    float _929 = _643 * _893;
    out.m_48.x = _911;
    out.m_48.y = _913;
    out.m_48.z = _915;
    out.m_50.x = _885;
    out.m_50.y = _907;
    out.m_52.x = _909;
    out.m_52.y = _917;
    out.m_52.z = _919;
    out.m_52.w = _921;
    if (_871)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2771 = as_type<float>(_927);
        out.gl_Position.z = _2771;
    }
    if (_871)
    {
        out.m_35.x = 0.0;
    }
    out.m_54.x = _929;
    if (_871)
    {
        return out;
    }
    float _931 = -_711;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _935 = -_713;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _939 = -_731;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _933 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _941 + _951;
    float _955 = _945 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[28].x, _955);
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].z, _957);
    bool _961 = _959 >= 0.0;
    float _963 = _953;
    if (_961)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _965 = _963;
    int _967 = as_type<int>(_965);
    if (_961)
    {
        out.m_35.x = 0.0;
    }
    if (_961)
    {
        float _969 = _965 * 5.0;
        _967 = as_type<int>(_969);
    }
    int _971 = _967;
    if (_961)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2864 = as_type<float>(_971);
        out.gl_Position.z = _2864;
    }
    if (_961)
    {
        return out;
    }
    float _973 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _979 = -_797;
    float _981 = _655 + _979;
    float _983 = _973 * _893;
    float _985 = _893 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _987 = _985 * 0.5;
    float _989 = _929 * _977;
    float _991 = -_731;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _995 = _983 * _975;
    float _997 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _999);
    float _1005 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1001);
    float _1007 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1003);
    float _1009 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1011 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1013 = _655 + _1009;
    float _1015 = _653 + _1011;
    float _1017 = -_751;
    float _1019 = _651 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1023 = _1013 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1027 = _1015 + _1025;
    float _1029 = -_711;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1033 = _1023 * _1023;
    float _1035 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1037 = fma(_1027, _1027, _1033);
    float _1039 = -_759;
    float _1041 = _653 + _1039;
    float _1043 = sqrt(_1037);
    float _1045 = -_713;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1041);
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1035);
    float _1051 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1049);
    float _1055 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1057 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1059 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1055);
    bool _1061 = _1043 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = 1.0 / _1057;
    float _1065 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1067 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1069 = _651 + _1065;
    float _1071 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1067);
    float _1073 = _1065;
    float _1075 = _1067;
    float _1077 = _1015;
    float _1079 = _1043;
    if (!_1061)
    {
        _1073 = _1013;
    }
    float _1081 = _1073;
    float _1083 = _1081;
    if (!_1061)
    {
        _1075 = _1069;
    }
    float _1085 = _1075;
    bool _1087 = !_1061;
    float _1089 = _1085;
    if (!_1087)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1095 = _1043 + _1093;
        float _1097 = rsqrt(_1037);
        float _1099 = _1095 * _1091;
        float _1101 = _1069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = _1099 * 0.15915493667125701904296875;
        float _1105 = _1103 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1103 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 + (-1.0);
        float _1115 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1119 = fma(_1069, _1107, _1115);
        float _1121 = _1097 * _1117;
        float _1123 = fma(_1027, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1023, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1089 = _1119;
        _1077 = _1123;
        _1083 = _1125;
        _1079 = _1121;
    }
    float _1127 = _1089;
    float _1129 = _1077;
    float _1131 = _1083;
    float _1133 = _1079;
    out.m_56.x = _1047;
    out.m_56.y = _1031;
    out.m_56.z = _993;
    bool _1135 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1071);
    float _1147 = -_751;
    float _1149 = _1147 + _1127;
    float _1151 = -_759;
    float _1153 = _1151 + _1129;
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1157 = -_711;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1149);
    float _1161 = _1155 + _1057;
    float _1163 = -_797;
    float _1165 = _1163 + _1131;
    float _1167 = _1161 * _1063;
    float _1169 = _1167 * 0.5;
    float _1171 = _1133;
    if (_1143)
    {
        _1171 = 1.0;
    }
    float _1173 = _1171;
    float _1175 = _1173;
    if (!_1143)
    {
        float _1177 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1179 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = _1177 * 0.15915493667125701904296875;
        float _1183 = _1179 * 0.15915493667125701904296875;
        float _1185 = _1181 * 6.283185482025146484375;
        float _1187 = cos(_1185);
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1191 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1189);
        float _1193 = _1181 * 6.283185482025146484375;
        float _1195 = sin(_1193);
        float _1197 = 1.0 / _1187;
        float _1199 = _1183 * 6.283185482025146484375;
        float _1201 = cos(_1199);
        float _1203 = _1195 * _1197;
        float _1205 = _1183 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = _1201 * _1203;
        float _1211 = 1.0 / _1191;
        float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1215 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1213;
        float _1217 = 1.0 / _1209;
        float _1219 = 1.0 / _1215;
        float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1223 = _1211 * _1221;
        float _1225 = _1207 * _1217;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1229 = fma(_1225, _1223, _1227);
        float _1231 = _1229 * _1219;
        float _1233 = precise::clamp(_1231, 0.0, 1.0);
        _1175 = _1233;
    }
    float _1235 = _1175;
    float _1237 = -_713;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1241 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1243 = -_731;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1165);
    float _1247 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1249 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1241);
    float _1253 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1255 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1247);
    float _1257 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1253);
    float _1263 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1255);
    float _1265 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1269 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1261);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1275 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1279 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1277);
    float _1287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1279);
    float _1289 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1281);
    float _1291 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1293 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1283);
    float _1295 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1285);
    float _1297 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1287);
    float _1299 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1289);
    bool _1301 = _1235 > 0.0;
    bool _1303 = isnan(_1235);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    float _1311 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1313 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1293);
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1295);
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1299);
    float _1319 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1297);
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1323 = _1315 + _1317;
    float _1325 = _1319 + _1317;
    float _1327 = _1317 * 0.5;
    float _1329 = _1323 * 0.5;
    float _1331 = _1325 * 0.5;
    float _1333 = fma(_1313, -0.5, _1327);
    out.m_58.x = _1239;
    out.m_58.y = _1159;
    out.m_58.z = _1245;
    out.m_35.x = _1321;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1313;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1317;
    out.m_60.x = _1329;
    out.m_60.y = _1333;
    out.m_60.z = _1331;
    out.m_60.w = _1317;
    if (_1309)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1335;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _617 = false;
    bool _449 = false;
    bool _293 = false;
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
        float _1392 = as_type<float>(_95);
        out.gl_Position.z = _1392;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _115 = 0.0;
    if (_109)
    {
        float _117 = float(_79);
        _115 = _117;
    }
    float _119 = _115;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
    bool _125 = _121 || _123;
    if (_125)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _89;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _97 = as_type<int>(_129);
    }
    int _131 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1460 = as_type<float>(_131);
        out.gl_Position.z = _1460;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _137 = in.m_42.w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_37.x;
    float _151 = in.m_37.y;
    float _153 = in.m_37.z;
    float _155 = in.m_32.x;
    float _157 = in.m_32.y;
    float _159 = in.m_32.z;
    float _161 = 0.0;
    float _163 = _135;
    if (!_147)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = _169;
    if (!_147)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_147;
    float _195 = _175;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _135 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _135);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_147;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _135 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _163 = _249;
    }
    float _251 = _163;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _149, _255);
    float _263 = fma(_251, _151, _257);
    float _265 = fma(_251, _153, _259);
    float _267 = fma(_261, _137, _155);
    float _269 = fma(_263, _137, _157);
    float _271 = fma(_265, _137, _159);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_44.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_79);
        float _297 = 1.0 / _295;
        float _299 = _113 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    bool _307 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_301);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _301 + _319;
    bool _323 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_301);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -_317;
    float _345 = _343 + 1.0;
    float _347 = 1.0 / _341;
    bool _349 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_301);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _333 * _345;
    float _363 = -_333;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _373 = _359 * _365;
    float _375 = 1.0 / _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -_359;
    float _383 = _381 + 1.0;
    float _385 = _321 * _347;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = fma(_369, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _305 * _375;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _397;
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = fma(_379, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = fma(_399, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = _407 * _373;
    float _411 = _405 * _373;
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _417 = fma(_393, _361, _413);
    float _419 = fma(_391, _361, _415);
    float _421 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _417);
    float _423 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _419);
    float _425 = _421 * _401;
    float _427 = _423 * _403;
    bool _429 = !_371;
    float _447;
    if (!_429)
    {
        float _431 = in.m_44.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        float _451 = float(_79);
        float _453 = 1.0 / _451;
        float _455 = _113 * _453;
        _447 = _455;
    }
    _449 = false;
    float _457 = _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = _457 + _459;
    bool _463 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_457);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _477 = _457 + _475;
    bool _479 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _481 = isnan(_457);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _499 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _501 = isnan(_457);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -_473;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _493;
    float _517 = _509 * _513;
    float _519 = -_509;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    bool _527 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _529 = 1.0 / _497;
    float _531 = _489 * _521;
    float _533 = -_489;
    float _535 = _533 + 1.0;
    float _537 = _461 * _515;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _543;
    float _547 = fma(_525, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _549 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = fma(_545, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _553 = _477 * _529;
    float _555 = _547 * _531;
    float _557 = _549 * _531;
    float _559 = _551 * _531;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _573 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].x, _555);
    float _575 = fma(_563, _553, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _577 = fma(_567, _553, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _579 = fma(_571, _553, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _581 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _583 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[107].z, _559);
    float _585 = fma(_575, _517, _573);
    float _587 = fma(_577, _517, _581);
    float _589 = fma(_579, _517, _583);
    float _591 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].x, _585);
    float _593 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].y, _587);
    float _595 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].z, _589);
    bool _597 = !_527;
    float _615;
    if (!_597)
    {
        float _599 = in.m_44.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_79);
        float _621 = 1.0 / _619;
        float _623 = _113 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _629 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _631 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _633 = in.m_44.x;
    float _635 = in.m_44.y;
    float _637 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _627);
    float _639 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _641 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    float _643 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _645 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    float _649 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _651 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _653 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _655 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _657 = _643 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _651 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _665 = _653 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _669 = _655 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = _661 * _661;
    bool _677 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_625);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = fma(_665, _665, _675);
    float _691 = -_687;
    float _693 = _691 + 1.0;
    bool _695 = _633 > 0.5;
    float _697 = fma(_669, _669, _689);
    bool _699 = _635 > 0.5;
    float _701 = rsqrt(_697);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = sqrt(_697);
    float _709 = 1.0 / _705;
    float _711 = _661 * _701;
    float _713 = _665 * _701;
    float _715 = -_711;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _719 = _707 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _721 = -_713;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _725 = _717 * _717;
    float _727 = precise::min(_657, _719);
    float _729 = fma(_723, _723, _725);
    float _731 = _669 * _701;
    float _733 = _673 * _709;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _741 = _739 != 0;
    float _743 = -_731;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _749 = _747 != 0;
    float _751 = _711 * _727;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _755 = _625 + _753;
    float _757 = fma(_745, _745, _729);
    float _759 = _713 * _727;
    float _761 = -_751;
    float _763 = _661 + _761;
    float _765 = fma(_733, _755, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _767 = 1.0 / _737;
    float _769 = -_759;
    float _771 = _665 + _769;
    float _773 = _763 * _763;
    bool _775 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _777 = isnan(_625);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = _661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_46.w = _727;
    float _789 = fma(_771, _771, _773);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _795 = _785 * _693;
    float _797 = _731 * _727;
    bool _799 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _801 = isnan(_625);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _813 = _765 * _795;
    float _815 = -_797;
    float _817 = _669 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _821 = _625 + _819;
    float _823 = -_785;
    float _825 = _823 + 1.0;
    float _827 = _793 * _767;
    float _829 = fma(_817, _817, _789);
    float _831 = -_809;
    float _833 = _831 + 1.0;
    float _835 = sqrt(_757);
    float _837 = fma(_827, _821, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[115].x, _813);
    float _841 = _687 * _833;
    float _843 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[28].x, _787);
    float _845 = -_187;
    int _847 = _695 ? as_type<int>(_845) : as_type<int>(_187);
    float _849 = -_191;
    int _851 = _699 ? as_type<int>(_849) : as_type<int>(_191);
    float _853 = sqrt(_829);
    bool _855 = !_741;
    float _857 = _855 ? _187 : as_type<float>(_847);
    float _859 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[28].z, _843);
    float _861 = fma(_837, _841, _839);
    bool _863 = !_749;
    float _865 = _863 ? _191 : as_type<float>(_851);
    float _867 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _869 = _857 + 0.5;
    bool _871 = _859 >= 0.0;
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _875 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[117].x, _861);
    float _877 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _879 = _701 * _835;
    float _881 = -_865;
    float _883 = _881 + 0.5;
    float _885 = _877 * _811;
    float _887 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = _701 * _853;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _893 = _889 * _879;
    float _895 = _665;
    if (_871)
    {
        _895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _895;
    float _899 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _907 = _891 * _873;
    float _909 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _923 = as_type<int>(_897);
    if (_871)
    {
        float _925 = _897 * 5.0;
        _923 = as_type<int>(_925);
    }
    int _927 = _923;
    float _929 = _643 * _893;
    out.m_48.x = _911;
    out.m_48.y = _913;
    out.m_48.z = _915;
    out.m_50.x = _885;
    out.m_50.y = _907;
    out.m_52.x = _909;
    out.m_52.y = _917;
    out.m_52.z = _919;
    out.m_52.w = _921;
    if (_871)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2771 = as_type<float>(_927);
        out.gl_Position.z = _2771;
    }
    if (_871)
    {
        out.m_35.x = 0.0;
    }
    out.m_54.x = _929;
    if (_871)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _931 = -_711;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _935 = -_713;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _939 = -_731;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _933 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _941 + _951;
    float _955 = _945 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[28].x, _955);
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].z, _957);
    bool _961 = _959 >= 0.0;
    float _963 = _953;
    if (_961)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _965 = _963;
    int _967 = as_type<int>(_965);
    if (_961)
    {
        out.m_35.x = 0.0;
    }
    if (_961)
    {
        float _969 = _965 * 5.0;
        _967 = as_type<int>(_969);
    }
    int _971 = _967;
    if (_961)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2864 = as_type<float>(_971);
        out.gl_Position.z = _2864;
    }
    if (_961)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _973 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _979 = -_797;
    float _981 = _655 + _979;
    float _983 = _973 * _893;
    float _985 = _893 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _987 = _985 * 0.5;
    float _989 = _929 * _977;
    float _991 = -_731;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _995 = _983 * _975;
    float _997 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _999 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _997);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _999);
    float _1005 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1001);
    float _1007 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1003);
    float _1009 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1011 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1013 = _655 + _1009;
    float _1015 = _653 + _1011;
    float _1017 = -_751;
    float _1019 = _651 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1023 = _1013 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1027 = _1015 + _1025;
    float _1029 = -_711;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1033 = _1023 * _1023;
    float _1035 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1037 = fma(_1027, _1027, _1033);
    float _1039 = -_759;
    float _1041 = _653 + _1039;
    float _1043 = sqrt(_1037);
    float _1045 = -_713;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1041);
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1035);
    float _1051 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1049);
    float _1055 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1057 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1059 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1055);
    bool _1061 = _1043 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = 1.0 / _1057;
    float _1065 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1067 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1069 = _651 + _1065;
    float _1071 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1067);
    float _1073 = _1065;
    float _1075 = _1067;
    float _1077 = _1015;
    float _1079 = _1043;
    if (!_1061)
    {
        _1073 = _1013;
    }
    float _1081 = _1073;
    float _1083 = _1081;
    if (!_1061)
    {
        _1075 = _1069;
    }
    float _1085 = _1075;
    bool _1087 = !_1061;
    float _1089 = _1085;
    if (!_1087)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1095 = _1043 + _1093;
        float _1097 = rsqrt(_1037);
        float _1099 = _1095 * _1091;
        float _1101 = _1069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = _1099 * 0.15915493667125701904296875;
        float _1105 = _1103 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1103 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 + (-1.0);
        float _1115 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1119 = fma(_1069, _1107, _1115);
        float _1121 = _1097 * _1117;
        float _1123 = fma(_1027, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1023, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1089 = _1119;
        _1077 = _1123;
        _1083 = _1125;
        _1079 = _1121;
    }
    float _1127 = _1089;
    float _1129 = _1077;
    float _1131 = _1083;
    float _1133 = _1079;
    out.m_56.x = _1047;
    out.m_56.y = _1031;
    out.m_56.z = _993;
    bool _1135 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1071);
    float _1147 = -_751;
    float _1149 = _1147 + _1127;
    float _1151 = -_759;
    float _1153 = _1151 + _1129;
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1157 = -_711;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1149);
    float _1161 = _1155 + _1057;
    float _1163 = -_797;
    float _1165 = _1163 + _1131;
    float _1167 = _1161 * _1063;
    float _1169 = _1167 * 0.5;
    float _1171 = _1133;
    if (_1143)
    {
        _1171 = 1.0;
    }
    float _1173 = _1171;
    float _1175 = _1173;
    if (!_1143)
    {
        float _1177 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1179 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = _1177 * 0.15915493667125701904296875;
        float _1183 = _1179 * 0.15915493667125701904296875;
        float _1185 = _1181 * 6.283185482025146484375;
        float _1187 = cos(_1185);
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1191 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1189);
        float _1193 = _1181 * 6.283185482025146484375;
        float _1195 = sin(_1193);
        float _1197 = 1.0 / _1187;
        float _1199 = _1183 * 6.283185482025146484375;
        float _1201 = cos(_1199);
        float _1203 = _1195 * _1197;
        float _1205 = _1183 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = _1201 * _1203;
        float _1211 = 1.0 / _1191;
        float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1215 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1213;
        float _1217 = 1.0 / _1209;
        float _1219 = 1.0 / _1215;
        float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1223 = _1211 * _1221;
        float _1225 = _1207 * _1217;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1229 = fma(_1225, _1223, _1227);
        float _1231 = _1229 * _1219;
        float _1233 = precise::clamp(_1231, 0.0, 1.0);
        _1175 = _1233;
    }
    float _1235 = _1175;
    float _1237 = -_713;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1241 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1243 = -_731;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1165);
    float _1247 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1249 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1251 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1241);
    float _1253 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1255 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1247);
    float _1257 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1249);
    float _1259 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1253);
    float _1263 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1255);
    float _1265 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1257);
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1269 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1261);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1275 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1279 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1277);
    float _1287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1279);
    float _1289 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1281);
    float _1291 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1293 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1283);
    float _1295 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1285);
    float _1297 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1287);
    float _1299 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1289);
    bool _1301 = _1235 > 0.0;
    bool _1303 = isnan(_1235);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    float _1311 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1313 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1293);
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1295);
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1299);
    float _1319 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1297);
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1323 = _1315 + _1317;
    float _1325 = _1319 + _1317;
    float _1327 = _1317 * 0.5;
    float _1329 = _1323 * 0.5;
    float _1331 = _1325 * 0.5;
    float _1333 = fma(_1313, -0.5, _1327);
    out.m_58.x = _1239;
    out.m_58.y = _1159;
    out.m_58.z = _1245;
    out.m_35.x = _1321;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1313;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1317;
    out.m_60.x = _1329;
    out.m_60.y = _1333;
    out.m_60.z = _1331;
    out.m_60.w = _1317;
    if (_1309)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1335;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

