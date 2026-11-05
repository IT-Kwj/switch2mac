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
    float4 m_52 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_50 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1703 = false;
    bool _675 = false;
    bool _289 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2078 = as_type<float>(_89);
        out.gl_Position.z = _2078;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = _107;
    if (_103)
    {
        float _113 = float(_73);
        _83 = _113;
    }
    float _115 = _83;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _91 = as_type<int>(_127);
    }
    int _129 = _91;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2148 = as_type<float>(_129);
        out.gl_Position.z = _2148;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = _133;
    if (!_145)
    {
        float _161 = _133 * _133;
        float _163 = _161 * 0.5;
        _109 = _163;
    }
    float _165 = _109;
    float _167 = _165;
    if (!_145)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_131) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_131) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_145;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _133 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _133);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_145;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _133 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _147, _251);
    float _259 = fma(_247, _149, _253);
    float _261 = fma(_247, _151, _255);
    float _263 = fma(_257, _135, _153);
    float _265 = fma(_259, _135, _155);
    float _267 = fma(_261, _135, _157);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = 1.0 / _301;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _325 = 1.0 / _305;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = _297 + _327;
    bool _331 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_297);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = 1.0 / _309;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _297 + _345;
    float _349 = _329 * _315;
    bool _351 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _353 = isnan(_297);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    bool _363 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _365 = isnan(_297);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _377 = 1.0 / _313;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _379;
    float _383 = _347 * _325;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _297 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _297 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = _297 + _393;
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = 1.0 / _319;
    float _403 = _387 * _343;
    float _405 = -_361;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = _373 * _407;
    bool _415 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _417 = isnan(_297);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = 1.0 / _323;
    float _429 = _391 * _377;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _433 = _297 + _431;
    float _435 = fma(_411, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _437 = -_425;
    float _439 = _437 + 1.0;
    float _441 = 1.0 / _381;
    float _443 = _395 * _401;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _447 = _297 + _445;
    bool _449 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _451 = isnan(_297);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _447 * _427;
    bool _463 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_297);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -_473;
    float _477 = _475 + 1.0;
    float _479 = _433 * _441;
    float _481 = _459 * _399;
    float _483 = -_459;
    float _485 = _483 + 1.0;
    float _487 = _341 * _477;
    float _489 = -_341;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = _425 * _485;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    float _503 = _473 * _439;
    bool _505 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _507 = isnan(_297);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_495, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_501, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _521 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_297);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = -_515;
    float _539 = _537 + 1.0;
    float _541 = _515 * _491;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _547;
    float _551 = _531 * _539;
    float _553 = fma(_535, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _555 = fma(_545, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _557 = fma(_549, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _559 = _435 * _551;
    float _561 = _519 * _551;
    float _563 = -_531;
    float _565 = _563 + 1.0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _577 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _579 = fma(_569, _429, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _581 = fma(_573, _429, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _583;
    float _587 = fma(_553, _541, _575);
    float _589 = fma(_555, _541, _577);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _591;
    float _595 = fma(_585, _443, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _597 = fma(_557, _487, _587);
    float _599 = fma(_517, _487, _589);
    float _601 = in.m_42.x;
    float _603 = in.m_42.y;
    float _605 = fma(_593, _443, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _615 = fma(_579, _503, _597);
    float _617 = fma(_581, _503, _599);
    float _619 = fma(_609, _461, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _621 = fma(_613, _461, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _627;
    float _631 = fma(_595, _497, _615);
    float _633 = fma(_605, _497, _617);
    float _635 = fma(_625, _479, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _637 = fma(_629, _479, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _639 = fma(_619, _481, _631);
    float _641 = fma(_621, _481, _633);
    float _643 = fma(_635, _413, _639);
    float _645 = fma(_637, _413, _641);
    float _647 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[150].x, _643);
    float _649 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[150].y, _645);
    float _651 = _647 * _601;
    float _653 = _649 * _603;
    bool _655 = !_375;
    float _673;
    if (!_655)
    {
        float _657 = in.m_44.x;
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _661 = _657 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_73);
        float _679 = 1.0 / _677;
        float _681 = _107 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _687 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _695 = _693 != 0;
    float _697 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _687);
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _701 = _699 != 0;
    float _703 = 1.0 / _691;
    float _705 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _711 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _685);
    float _713 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _719 = 1.0 / _709;
    float _721 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _713);
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _733 = _731 != 0;
    float _735 = in.m_44.z;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _741 = 1.0 / _717;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = 1.0 / _739;
    float _755 = in.m_44.x;
    float _757 = in.m_44.y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _771 = log2(_769);
    float _773 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _711);
    out.m_46.x = _751;
    out.m_46.y = _761;
    out.m_46.z = _767;
    float _775 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _697);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _789 = 1.0 / _747;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _791;
    float _795 = _779 * _703;
    float _797 = _787 * _741;
    float _799 = _793 * _719;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _805 = 1.0 / _783;
    float _807 = _771 * _107;
    bool _809 = _755 > 0.5;
    float _811 = _735 * 2.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _813;
    float _817 = _755 * 2.0;
    float _819 = _803 * _753;
    bool _821 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _829 = _825 || _827;
    float _831 = 1.0 / _765;
    bool _833 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _835 = isnan(_683);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _773 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _847 = _721 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _849 = _757 * 2.0;
    float _851 = _775 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _853 = exp2(_807);
    float _855 = _815 * _805;
    float _857 = -_183;
    int _859 = _809 ? as_type<int>(_857) : as_type<int>(_183);
    bool _861 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(1.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    bool _879 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _881 = isnan(_683);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = floor(_811);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _895 = 1.0 + _893;
    float _897 = _873 * _789;
    bool _899 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _901 = isnan(_683);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_889;
    float _913 = _911 + 1.0;
    float _915 = _877 * _831;
    bool _917 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _919 = isnan(_683);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = -_853;
    float _931 = _929 + 1.0;
    float _933 = 1.0 / _895;
    float _935 = _843 * _913;
    float _937 = -_843;
    float _939 = _937 + 1.0;
    float _941 = _757 + _755;
    bool _943 = !_695;
    float _945 = _943 ? _183 : as_type<float>(_859);
    float _947 = _909 * _939;
    float _949 = -_909;
    float _951 = _949 + 1.0;
    float _953 = floor(_817);
    bool _955 = _757 > 0.5;
    float _957 = _941 + (-1.0);
    float _959 = _829 ? _931 : 0.0;
    float _961 = _927 * _951;
    bool _963 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _965 = isnan(_683);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -_927;
    float _977 = _975 + 1.0;
    bool _979 = _891 >= 0.0;
    bool _981 = isnan(_891);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    if (_869)
    {
        float _989 = _959 * _933;
        _111 = _989;
    }
    float _991 = _111;
    bool _993 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _995 = isnan(_683);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = _973 * _977;
    float _1007 = -_187;
    int _1009 = _955 ? as_type<int>(_1007) : as_type<int>(_187);
    float _1011 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1013 = _891 > 0.0;
    float _1015 = -_973;
    float _1017 = _1015 + 1.0;
    int _1019 = _987 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1023 = _683 + _1021;
    bool _1025 = _953 > 0.0;
    float _1027 = _1003 * _1017;
    bool _1029 = _953 >= 0.0;
    bool _1031 = isnan(_953);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = -_1003;
    float _1041 = _1039 + 1.0;
    bool _1043 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1045 = isnan(_683);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_795, _1023, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1057 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1059 = isnan(_683);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1071 = _683 + _1069;
    int _1073 = ~_1019;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    float _1079 = _1053 * _1041;
    float _1081 = -_1053;
    float _1083 = _1081 + 1.0;
    int _1085 = _1077;
    if (!_1013)
    {
        int _1087 = ~_1019;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1095 = _683 + _1093;
    float _1097 = fma(_799, _1071, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1099 = _1067 * _1083;
    float _1101 = -_1067;
    float _1103 = _1101 + 1.0;
    float _1105 = fma(_797, _1095, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1109 = _683 + _1107;
    float _1111 = _1055 * _1099;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1115 = _683 + _1113;
    float _1117 = _945 + 0.5;
    float _1119 = fma(_897, _1109, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1121 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1111);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1125 = _683 + _1123;
    float _1127 = fma(_819, _1115, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _1129 = !_701;
    float _1131 = _1129 ? _187 : as_type<float>(_1009);
    float _1133 = fma(_1105, _1079, _1121);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1137 = _683 + _1135;
    float _1139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1141 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = fma(_1097, _1027, _1133);
    float _1145 = fma(_915, _1137, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1147 = fma(_855, _1125, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1151 = _847 + _1149;
    float _1153 = fma(_1127, _1005, _1143);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1157 = _845 + _1155;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1161 = !_725;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1167 = _851 + _1165;
    float _1169 = _1157 * _1157;
    float _1171 = fma(_1119, _961, _1153);
    int _1173 = abs(_1163);
    float _1175 = fma(_1151, _1151, _1169);
    float _1177 = floor(_849);
    float _1179 = -_1131;
    float _1181 = _1179 + 0.5;
    float _1183 = _1141 * _1139;
    float _1185 = fma(_1167, _1167, _1175);
    bool _1187 = !_729;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1193 = _1037 ? 0 : 1;
    float _1195 = rsqrt(_1185);
    float _1197 = _1191 * _1159;
    float _1199 = float(_1173);
    float _1201 = float(_1091);
    int _1203 = abs(_1189);
    out.m_48.x = _1183;
    out.m_48.y = _1197;
    bool _1205 = _1177 > 0.0;
    float _1207 = _1199 * _1201;
    float _1209 = fma(_1145, _947, _1171);
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1213 = _1177 >= 0.0;
    bool _1215 = isnan(_1177);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.0);
    bool _1221 = _1217 || _1219;
    float _1223 = in.m_50.x;
    float _1225 = in.m_50.y;
    float _1227 = in.m_50.z;
    int _1229 = ~_1193;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    float _1235 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1211);
    int _1237 = _1221 ? 0 : 1;
    float _1239 = _1157 * _1195;
    float _1241 = _1151 * _1195;
    float _1243 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1235);
    int _1245 = ~_1237;
    int _1247 = _1245 + 1;
    int _1249 = _1247 + 1;
    float _1251 = -_1239;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1157);
    int _1255 = _1249;
    int _1257 = _1233;
    if (!_1205)
    {
        int _1259 = ~_1237;
        int _1261 = _1259 + 1;
        _1255 = _1261;
    }
    int _1263 = _1255;
    float _1265 = -_1241;
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    bool _1269 = _1243 >= 0.0;
    float _1271 = _1253 * _1253;
    if (!_1025)
    {
        int _1273 = ~_1193;
        int _1275 = _1273 + 1;
        _1257 = _1275;
    }
    int _1277 = _1257;
    float _1279 = fma(_1147, _935, _1209);
    float _1281 = fma(_1267, _1267, _1271);
    float _1283 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[122].x, _1279);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1287 = float(_1203);
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1291 = float(_1277);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1295 = _1279;
    if (_1269)
    {
        _1295 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1297 = _1295;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1287 * _1291;
    float _1305 = _1207 * (-2.0);
    float _1307 = _1167 * _1195;
    float _1309 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1311 = as_type<int>(_1297);
    if (_1269)
    {
        float _1313 = _1297 * 5.0;
        _1311 = as_type<int>(_1313);
    }
    int _1315 = _1311;
    float _1317 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _755 + (-0.5);
    float _1321 = fma(_1305, _1223, _1223);
    float _1323 = -_1307;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    if (_1269)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4020 = as_type<float>(_1315);
        out.gl_Position.z = _4020;
    }
    float _1327 = fma(_1011, _1305, _1011);
    float _1329 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1321);
    float _1331 = fma(_1325, _1325, _1281);
    out.m_52.x = _1299;
    out.m_52.y = _1301;
    out.m_52.z = _1309;
    out.m_52.w = _1317;
    bool _1333 = !_733;
    int _1335 = _1333 ? 0 : 1;
    if (_1269)
    {
        out.m_35.x = 0.0;
    }
    if (_1269)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1337 = -_1239;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[18].w, _845);
    float _1341 = -_1241;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    int _1345 = abs(_1335);
    float _1347 = -_1307;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _851);
    float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1353 = _1339 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1357 = _1343 + _1355;
    float _1359 = _757 + _735;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1363 = _1349 + _1361;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1367 = float(_1263);
    float _1369 = _1359 + (-1.0);
    float _1371 = float(_1345);
    float _1373 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1365);
    float _1375 = _1303 * (-2.0);
    float _1377 = _735 + _755;
    float _1379 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1373);
    float _1381 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1383 = _757 + (-0.5);
    float _1385 = fma(_1375, _1225, _1225);
    float _1387 = _1371 * _1367;
    float _1389 = fma(_1381, _1375, _1381);
    bool _1391 = _1379 >= 0.0;
    float _1393 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1385);
    float _1395 = _1387 * (-2.0);
    float _1397 = _1377 + (-1.0);
    float _1399 = _735 + (-0.5);
    float _1401 = fma(_1327, _991, _1329);
    float _1403 = fma(_1395, _1227, _1227);
    float _1405 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1407 = fma(_1389, _991, _1393);
    float _1409 = _1401 * 0.15915493667125701904296875;
    float _1411 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1403);
    float _1413 = fma(_1405, _1395, _1405);
    float _1415 = _1407 * 0.15915493667125701904296875;
    float _1417 = _1387;
    int _1419 = as_type<int>(_1403);
    if (_1391)
    {
        _1417 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1421 = _1417;
    float _1423 = sqrt(_1331);
    float _1425 = fma(_1413, _991, _1411);
    if (_1391)
    {
        out.m_35.x = 0.0;
    }
    if (_1391)
    {
        float _1427 = _1421 * 5.0;
        _1419 = as_type<int>(_1427);
    }
    int _1429 = _1419;
    float _1431 = _1425 * 0.15915493667125701904296875;
    float _1433 = _1409 * 6.283185482025146484375;
    float _1435 = sin(_1433);
    if (_1391)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4228 = as_type<float>(_1429);
        out.gl_Position.z = _4228;
    }
    float _1437 = _1409 * 6.283185482025146484375;
    float _1439 = cos(_1437);
    float _1441 = _1415 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = _1415 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    if (_1391)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1449 = _1431 * 6.283185482025146484375;
    float _1451 = cos(_1449);
    float _1453 = _1195 * _1423;
    float _1455 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1459 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1463 = _1453 * _1455;
    float _1465 = _1435 * _1443;
    float _1467 = _1431 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    float _1471 = _1439 * _1447;
    float _1473 = _1457 * _1463;
    float _1475 = _1453 * _1459;
    float _1477 = _1461 * _1475;
    float _1479 = _1451 * _1473;
    float _1481 = _1443 * _1451;
    float _1483 = _1447 * _1451;
    float _1485 = _1439 * _1443;
    float _1487 = _1439 * _1479;
    float _1489 = _1435 * _1447;
    float _1491 = _1435 * _1479;
    float _1493 = fma(_1469, _1471, _1465);
    float _1495 = -_1473;
    float _1497 = _1469 * _1495;
    float _1499 = -_1489;
    float _1501 = fma(_1469, _1485, _1499);
    float _1503 = -_1485;
    float _1505 = fma(_1469, _1489, _1503);
    float _1507 = fma(_1493, _1477, _1487);
    float _1509 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1511 = _1509 * 0.5;
    float _1513 = fma(_1483, _1477, _1497);
    float _1515 = fma(_1469, _1465, _1471);
    float _1517 = fma(_1505, _1477, _1491);
    float _1519 = fma(_1501, _1511, _1507);
    float _1521 = fma(_1481, _1511, _1513);
    float _1523 = fma(_1515, _1511, _1517);
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1531 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1525);
    float _1533 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1527);
    float _1535 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1529);
    float _1537 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1531);
    float _1539 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1533);
    float _1541 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1535);
    float _1543 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1545 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1547 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1549 = _847 + _1543;
    float _1551 = _851 + _1545;
    float _1553 = _845 + _1547;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1557 = _1549 + _1555;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1561 = _1551 + _1559;
    float _1563 = _1557 * _1557;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 + _1565;
    float _1569 = sqrt(_1567);
    bool _1571 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1573 = _1545;
    float _1575 = _1563;
    float _1577 = _1565;
    float _1579 = _1549;
    float _1581 = _1551;
    if (!_1571)
    {
        _1573 = _1553;
    }
    float _1583 = _1573;
    bool _1585 = !_1571;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1593 = _1569 + _1591;
        float _1595 = rsqrt(_1567);
        float _1597 = _1593 * _1589;
        float _1599 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = _1597 * 0.15915493667125701904296875;
        float _1603 = _1601 * 6.283185482025146484375;
        float _1605 = sin(_1603);
        float _1607 = _1601 * 6.283185482025146484375;
        float _1609 = cos(_1607);
        float _1611 = fma(_1605, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1613 = _1595 * _1611;
        float _1615 = _1609 + (-1.0);
        float _1617 = fma(_1557, _1613, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1619 = fma(_1561, _1613, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1621 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1625 = _1617 + _1623;
        float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1629 = _1619 + _1627;
        float _1631 = fma(_1553, _1609, _1621);
        float _1633 = _1625 * _1625;
        float _1635 = _1629 * _1629;
        _1587 = _1631;
        _1575 = _1633;
        _1577 = _1635;
        _1579 = _1617;
        _1581 = _1619;
    }
    float _1637 = _1587;
    float _1639 = _1575;
    float _1641 = _1577;
    float _1643 = _1579;
    float _1645 = _1581;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1649 = _1637 + _1647;
    float _1651 = fma(_1649, _1649, _1639);
    float _1653 = _1651 + _1641;
    float _1655 = sqrt(_1653);
    bool _1657 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1659 = isnan(_1655);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1665 = _1661 || _1663;
    float _1667 = _1639;
    if (!_1665)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    bool _1671 = !_1665;
    float _1673 = _1669;
    if (!_1671)
    {
        bool _1675 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1677 = isnan(_1655);
        bool _1679 = _1675 || _1677;
        bool _1681 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1683 = _1679 || _1681;
        if (!_1683)
        {
            float _1685 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1687 = _1655 + _1685;
            float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1691 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1697 = 1.0 / _1691;
            float _1699 = _1687 * _1697;
            float _1701 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1673 = _1701;
            _1703 = true;
        }
        else
        {
            bool _1705 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1707 = isnan(_1655);
            bool _1709 = _1705 || _1707;
            bool _1711 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1713 = _1709 || _1711;
            if (!_1713)
            {
                float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1717 = _1655 + _1715;
                float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1721 = _1719 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1725 = _1723 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1727 = 1.0 / _1721;
                float _1729 = _1717 * _1727;
                float _1731 = fma(_1729, _1725, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1673 = _1731;
                _1703 = true;
            }
            else
            {
                _1673 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1703 = false;
    float _1733 = _1673;
    float _1735 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1737 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1739 = _1643 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1743 = _1645 + _1741;
    float _1745 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1735);
    bool _1747 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1759 = _1637 + _1757;
    float _1761 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1763 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1745);
    float _1765 = fma(_1739, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1767 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1761);
    float _1769 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1771 = fma(_1759, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1773 = fma(_1743, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1775 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1767);
    float _1777 = 1.0 / _1769;
    bool _1779 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan(0.5);
    bool _1787 = _1783 || _1785;
    float _1789 = -_1241;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1765);
    float _1793 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = -_1239;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1771);
    float _1799 = -_1307;
    float _1801 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1773);
    float _1803 = _1793 + _1769;
    float _1805 = _1797;
    float _1807 = _1791;
    float _1809 = _1801;
    if (!_1755)
    {
        float _1811 = _1353 * _1353;
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1815 = -_851;
        float _1817 = _1815 + _1773;
        float _1819 = -_847;
        float _1821 = _1819 + _1765;
        float _1823 = fma(_1357, _1357, _1811);
        float _1825 = -_845;
        float _1827 = _1825 + _1771;
        float _1829 = fma(_1363, _1363, _1823);
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1833 = sqrt(_1829);
        float _1835 = 1.0 / _1453;
        float _1837 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1841 = _1839 * _1813;
        float _1843 = _1841 * _1835;
        float _1845 = _1837 * _1843;
        float _1847 = _1817 * _1843;
        float _1849 = fma(_1821, _1845, _1343);
        float _1851 = fma(_1827, _1845, _1339);
        float _1853 = fma(_1837, _1847, _1349);
        _1805 = _1851;
        _1807 = _1849;
        _1809 = _1853;
    }
    float _1855 = _1805;
    float _1857 = _1807;
    float _1859 = _1809;
    float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1863 = _1803 * _1777;
    float _1865 = _1863 * 0.5;
    float _1867 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1869 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1871 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1861);
    float _1875 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1867);
    float _1877 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1869);
    float _1879 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = _1873;
    if (_1787)
    {
        _1883 = 1.0;
    }
    float _1885 = _1883;
    float _1887 = _1885;
    if (!_1787)
    {
        float _1889 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1893 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1891);
        float _1895 = _1889 * 0.15915493667125701904296875;
        float _1897 = _1895 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1903 = _1901 * 0.15915493667125701904296875;
        float _1905 = _1895 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        float _1909 = 1.0 / _1899;
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1907 * _1909;
        float _1917 = 1.0 / _1893;
        float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1921 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1919;
        float _1923 = _1913 * _1915;
        float _1925 = _1903 * 6.283185482025146484375;
        float _1927 = sin(_1925);
        float _1929 = 1.0 / _1923;
        float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1933 = _1917 * _1931;
        float _1935 = 1.0 / _1921;
        float _1937 = _1927 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1941 = fma(_1937, _1933, _1939);
        float _1943 = _1941 * _1935;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1887 = _1945;
    }
    float _1947 = _1887;
    float _1949 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1951 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1953 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1955 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    float _1957 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1959 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1961 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1965 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1967 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1969 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1959);
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1961);
    float _1973 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1963);
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1965);
    float _1977 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1969);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1971);
    float _1983 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1985 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1975);
    bool _1987 = _1947 > 0.0;
    bool _1989 = isnan(_1947);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1999 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1979);
    float _2001 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1981);
    float _2003 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1985);
    float _2005 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1983);
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2009 = _1999 + _2003;
    float _2011 = _2005 + _2003;
    float _2013 = _2003 * 0.5;
    float _2015 = _2009 * 0.5;
    float _2017 = _2011 * 0.5;
    float _2019 = fma(_2001, -0.5, _2013);
    out.m_35.x = _2007;
    out.gl_Position.x = _1999;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2005;
    out.gl_Position.w = _2003;
    out.m_54.x = _2015;
    out.m_54.y = _2019;
    out.m_54.z = _2017;
    out.m_54.w = _2003;
    if (_1995)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2021;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1703 = false;
    bool _675 = false;
    bool _289 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2078 = as_type<float>(_89);
        out.gl_Position.z = _2078;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = _107;
    if (_103)
    {
        float _113 = float(_73);
        _83 = _113;
    }
    float _115 = _83;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _91 = as_type<int>(_127);
    }
    int _129 = _91;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2148 = as_type<float>(_129);
        out.gl_Position.z = _2148;
    }
    if (_121)
    {
        return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = _133;
    if (!_145)
    {
        float _161 = _133 * _133;
        float _163 = _161 * 0.5;
        _109 = _163;
    }
    float _165 = _109;
    float _167 = _165;
    if (!_145)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_131) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_131) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_145;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _133 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _133);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_145;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _133 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _147, _251);
    float _259 = fma(_247, _149, _253);
    float _261 = fma(_247, _151, _255);
    float _263 = fma(_257, _135, _153);
    float _265 = fma(_259, _135, _155);
    float _267 = fma(_261, _135, _157);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = 1.0 / _301;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _325 = 1.0 / _305;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = _297 + _327;
    bool _331 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_297);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = 1.0 / _309;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _297 + _345;
    float _349 = _329 * _315;
    bool _351 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _353 = isnan(_297);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    bool _363 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _365 = isnan(_297);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _377 = 1.0 / _313;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _379;
    float _383 = _347 * _325;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _297 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _297 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = _297 + _393;
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = 1.0 / _319;
    float _403 = _387 * _343;
    float _405 = -_361;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = _373 * _407;
    bool _415 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _417 = isnan(_297);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = 1.0 / _323;
    float _429 = _391 * _377;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _433 = _297 + _431;
    float _435 = fma(_411, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _437 = -_425;
    float _439 = _437 + 1.0;
    float _441 = 1.0 / _381;
    float _443 = _395 * _401;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _447 = _297 + _445;
    bool _449 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _451 = isnan(_297);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _447 * _427;
    bool _463 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_297);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -_473;
    float _477 = _475 + 1.0;
    float _479 = _433 * _441;
    float _481 = _459 * _399;
    float _483 = -_459;
    float _485 = _483 + 1.0;
    float _487 = _341 * _477;
    float _489 = -_341;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = _425 * _485;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    float _503 = _473 * _439;
    bool _505 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _507 = isnan(_297);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_495, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_501, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _521 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_297);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = -_515;
    float _539 = _537 + 1.0;
    float _541 = _515 * _491;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _547;
    float _551 = _531 * _539;
    float _553 = fma(_535, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _555 = fma(_545, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _557 = fma(_549, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _559 = _435 * _551;
    float _561 = _519 * _551;
    float _563 = -_531;
    float _565 = _563 + 1.0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _577 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _579 = fma(_569, _429, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _581 = fma(_573, _429, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _583;
    float _587 = fma(_553, _541, _575);
    float _589 = fma(_555, _541, _577);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _591;
    float _595 = fma(_585, _443, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _597 = fma(_557, _487, _587);
    float _599 = fma(_517, _487, _589);
    float _601 = in.m_42.x;
    float _603 = in.m_42.y;
    float _605 = fma(_593, _443, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _615 = fma(_579, _503, _597);
    float _617 = fma(_581, _503, _599);
    float _619 = fma(_609, _461, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _621 = fma(_613, _461, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _627;
    float _631 = fma(_595, _497, _615);
    float _633 = fma(_605, _497, _617);
    float _635 = fma(_625, _479, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _637 = fma(_629, _479, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _639 = fma(_619, _481, _631);
    float _641 = fma(_621, _481, _633);
    float _643 = fma(_635, _413, _639);
    float _645 = fma(_637, _413, _641);
    float _647 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[150].x, _643);
    float _649 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[150].y, _645);
    float _651 = _647 * _601;
    float _653 = _649 * _603;
    bool _655 = !_375;
    float _673;
    if (!_655)
    {
        float _657 = in.m_44.x;
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _661 = _657 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_73);
        float _679 = 1.0 / _677;
        float _681 = _107 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _687 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _695 = _693 != 0;
    float _697 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _687);
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _701 = _699 != 0;
    float _703 = 1.0 / _691;
    float _705 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _711 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _685);
    float _713 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _719 = 1.0 / _709;
    float _721 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _713);
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _733 = _731 != 0;
    float _735 = in.m_44.z;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _741 = 1.0 / _717;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = 1.0 / _739;
    float _755 = in.m_44.x;
    float _757 = in.m_44.y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _771 = log2(_769);
    float _773 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _711);
    out.m_46.x = _751;
    out.m_46.y = _761;
    out.m_46.z = _767;
    float _775 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _697);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _789 = 1.0 / _747;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _791;
    float _795 = _779 * _703;
    float _797 = _787 * _741;
    float _799 = _793 * _719;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _805 = 1.0 / _783;
    float _807 = _771 * _107;
    bool _809 = _755 > 0.5;
    float _811 = _735 * 2.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _813;
    float _817 = _755 * 2.0;
    float _819 = _803 * _753;
    bool _821 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _829 = _825 || _827;
    float _831 = 1.0 / _765;
    bool _833 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _835 = isnan(_683);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _773 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _847 = _721 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _849 = _757 * 2.0;
    float _851 = _775 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _853 = exp2(_807);
    float _855 = _815 * _805;
    float _857 = -_183;
    int _859 = _809 ? as_type<int>(_857) : as_type<int>(_183);
    bool _861 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(1.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    bool _879 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _881 = isnan(_683);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = floor(_811);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _895 = 1.0 + _893;
    float _897 = _873 * _789;
    bool _899 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _901 = isnan(_683);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_889;
    float _913 = _911 + 1.0;
    float _915 = _877 * _831;
    bool _917 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _919 = isnan(_683);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = -_853;
    float _931 = _929 + 1.0;
    float _933 = 1.0 / _895;
    float _935 = _843 * _913;
    float _937 = -_843;
    float _939 = _937 + 1.0;
    float _941 = _757 + _755;
    bool _943 = !_695;
    float _945 = _943 ? _183 : as_type<float>(_859);
    float _947 = _909 * _939;
    float _949 = -_909;
    float _951 = _949 + 1.0;
    float _953 = floor(_817);
    bool _955 = _757 > 0.5;
    float _957 = _941 + (-1.0);
    float _959 = _829 ? _931 : 0.0;
    float _961 = _927 * _951;
    bool _963 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _965 = isnan(_683);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -_927;
    float _977 = _975 + 1.0;
    bool _979 = _891 >= 0.0;
    bool _981 = isnan(_891);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    if (_869)
    {
        float _989 = _959 * _933;
        _111 = _989;
    }
    float _991 = _111;
    bool _993 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _995 = isnan(_683);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = _973 * _977;
    float _1007 = -_187;
    int _1009 = _955 ? as_type<int>(_1007) : as_type<int>(_187);
    float _1011 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1013 = _891 > 0.0;
    float _1015 = -_973;
    float _1017 = _1015 + 1.0;
    int _1019 = _987 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1023 = _683 + _1021;
    bool _1025 = _953 > 0.0;
    float _1027 = _1003 * _1017;
    bool _1029 = _953 >= 0.0;
    bool _1031 = isnan(_953);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = -_1003;
    float _1041 = _1039 + 1.0;
    bool _1043 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1045 = isnan(_683);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_795, _1023, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1057 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1059 = isnan(_683);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1071 = _683 + _1069;
    int _1073 = ~_1019;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    float _1079 = _1053 * _1041;
    float _1081 = -_1053;
    float _1083 = _1081 + 1.0;
    int _1085 = _1077;
    if (!_1013)
    {
        int _1087 = ~_1019;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1095 = _683 + _1093;
    float _1097 = fma(_799, _1071, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1099 = _1067 * _1083;
    float _1101 = -_1067;
    float _1103 = _1101 + 1.0;
    float _1105 = fma(_797, _1095, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1109 = _683 + _1107;
    float _1111 = _1055 * _1099;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1115 = _683 + _1113;
    float _1117 = _945 + 0.5;
    float _1119 = fma(_897, _1109, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1121 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1111);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1125 = _683 + _1123;
    float _1127 = fma(_819, _1115, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _1129 = !_701;
    float _1131 = _1129 ? _187 : as_type<float>(_1009);
    float _1133 = fma(_1105, _1079, _1121);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1137 = _683 + _1135;
    float _1139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1141 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = fma(_1097, _1027, _1133);
    float _1145 = fma(_915, _1137, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1147 = fma(_855, _1125, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1151 = _847 + _1149;
    float _1153 = fma(_1127, _1005, _1143);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1157 = _845 + _1155;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1161 = !_725;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1167 = _851 + _1165;
    float _1169 = _1157 * _1157;
    float _1171 = fma(_1119, _961, _1153);
    int _1173 = abs(_1163);
    float _1175 = fma(_1151, _1151, _1169);
    float _1177 = floor(_849);
    float _1179 = -_1131;
    float _1181 = _1179 + 0.5;
    float _1183 = _1141 * _1139;
    float _1185 = fma(_1167, _1167, _1175);
    bool _1187 = !_729;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1193 = _1037 ? 0 : 1;
    float _1195 = rsqrt(_1185);
    float _1197 = _1191 * _1159;
    float _1199 = float(_1173);
    float _1201 = float(_1091);
    int _1203 = abs(_1189);
    out.m_48.x = _1183;
    out.m_48.y = _1197;
    bool _1205 = _1177 > 0.0;
    float _1207 = _1199 * _1201;
    float _1209 = fma(_1145, _947, _1171);
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1213 = _1177 >= 0.0;
    bool _1215 = isnan(_1177);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.0);
    bool _1221 = _1217 || _1219;
    float _1223 = in.m_50.x;
    float _1225 = in.m_50.y;
    float _1227 = in.m_50.z;
    int _1229 = ~_1193;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    float _1235 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1211);
    int _1237 = _1221 ? 0 : 1;
    float _1239 = _1157 * _1195;
    float _1241 = _1151 * _1195;
    float _1243 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1235);
    int _1245 = ~_1237;
    int _1247 = _1245 + 1;
    int _1249 = _1247 + 1;
    float _1251 = -_1239;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1157);
    int _1255 = _1249;
    int _1257 = _1233;
    if (!_1205)
    {
        int _1259 = ~_1237;
        int _1261 = _1259 + 1;
        _1255 = _1261;
    }
    int _1263 = _1255;
    float _1265 = -_1241;
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    bool _1269 = _1243 >= 0.0;
    float _1271 = _1253 * _1253;
    if (!_1025)
    {
        int _1273 = ~_1193;
        int _1275 = _1273 + 1;
        _1257 = _1275;
    }
    int _1277 = _1257;
    float _1279 = fma(_1147, _935, _1209);
    float _1281 = fma(_1267, _1267, _1271);
    float _1283 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[122].x, _1279);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1287 = float(_1203);
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1291 = float(_1277);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1295 = _1279;
    if (_1269)
    {
        _1295 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1297 = _1295;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1287 * _1291;
    float _1305 = _1207 * (-2.0);
    float _1307 = _1167 * _1195;
    float _1309 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1311 = as_type<int>(_1297);
    if (_1269)
    {
        float _1313 = _1297 * 5.0;
        _1311 = as_type<int>(_1313);
    }
    int _1315 = _1311;
    float _1317 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _755 + (-0.5);
    float _1321 = fma(_1305, _1223, _1223);
    float _1323 = -_1307;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    if (_1269)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4020 = as_type<float>(_1315);
        out.gl_Position.z = _4020;
    }
    float _1327 = fma(_1011, _1305, _1011);
    float _1329 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1321);
    float _1331 = fma(_1325, _1325, _1281);
    out.m_52.x = _1299;
    out.m_52.y = _1301;
    out.m_52.z = _1309;
    out.m_52.w = _1317;
    bool _1333 = !_733;
    int _1335 = _1333 ? 0 : 1;
    if (_1269)
    {
        out.m_35.x = 0.0;
    }
    if (_1269)
    {
        return out;
    }
    float _1337 = -_1239;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[18].w, _845);
    float _1341 = -_1241;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    int _1345 = abs(_1335);
    float _1347 = -_1307;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _851);
    float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1353 = _1339 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1357 = _1343 + _1355;
    float _1359 = _757 + _735;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1363 = _1349 + _1361;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1367 = float(_1263);
    float _1369 = _1359 + (-1.0);
    float _1371 = float(_1345);
    float _1373 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1365);
    float _1375 = _1303 * (-2.0);
    float _1377 = _735 + _755;
    float _1379 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1373);
    float _1381 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1383 = _757 + (-0.5);
    float _1385 = fma(_1375, _1225, _1225);
    float _1387 = _1371 * _1367;
    float _1389 = fma(_1381, _1375, _1381);
    bool _1391 = _1379 >= 0.0;
    float _1393 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1385);
    float _1395 = _1387 * (-2.0);
    float _1397 = _1377 + (-1.0);
    float _1399 = _735 + (-0.5);
    float _1401 = fma(_1327, _991, _1329);
    float _1403 = fma(_1395, _1227, _1227);
    float _1405 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1407 = fma(_1389, _991, _1393);
    float _1409 = _1401 * 0.15915493667125701904296875;
    float _1411 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1403);
    float _1413 = fma(_1405, _1395, _1405);
    float _1415 = _1407 * 0.15915493667125701904296875;
    float _1417 = _1387;
    int _1419 = as_type<int>(_1403);
    if (_1391)
    {
        _1417 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1421 = _1417;
    float _1423 = sqrt(_1331);
    float _1425 = fma(_1413, _991, _1411);
    if (_1391)
    {
        out.m_35.x = 0.0;
    }
    if (_1391)
    {
        float _1427 = _1421 * 5.0;
        _1419 = as_type<int>(_1427);
    }
    int _1429 = _1419;
    float _1431 = _1425 * 0.15915493667125701904296875;
    float _1433 = _1409 * 6.283185482025146484375;
    float _1435 = sin(_1433);
    if (_1391)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4228 = as_type<float>(_1429);
        out.gl_Position.z = _4228;
    }
    float _1437 = _1409 * 6.283185482025146484375;
    float _1439 = cos(_1437);
    float _1441 = _1415 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = _1415 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    if (_1391)
    {
        return out;
    }
    float _1449 = _1431 * 6.283185482025146484375;
    float _1451 = cos(_1449);
    float _1453 = _1195 * _1423;
    float _1455 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1459 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1463 = _1453 * _1455;
    float _1465 = _1435 * _1443;
    float _1467 = _1431 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    float _1471 = _1439 * _1447;
    float _1473 = _1457 * _1463;
    float _1475 = _1453 * _1459;
    float _1477 = _1461 * _1475;
    float _1479 = _1451 * _1473;
    float _1481 = _1443 * _1451;
    float _1483 = _1447 * _1451;
    float _1485 = _1439 * _1443;
    float _1487 = _1439 * _1479;
    float _1489 = _1435 * _1447;
    float _1491 = _1435 * _1479;
    float _1493 = fma(_1469, _1471, _1465);
    float _1495 = -_1473;
    float _1497 = _1469 * _1495;
    float _1499 = -_1489;
    float _1501 = fma(_1469, _1485, _1499);
    float _1503 = -_1485;
    float _1505 = fma(_1469, _1489, _1503);
    float _1507 = fma(_1493, _1477, _1487);
    float _1509 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1511 = _1509 * 0.5;
    float _1513 = fma(_1483, _1477, _1497);
    float _1515 = fma(_1469, _1465, _1471);
    float _1517 = fma(_1505, _1477, _1491);
    float _1519 = fma(_1501, _1511, _1507);
    float _1521 = fma(_1481, _1511, _1513);
    float _1523 = fma(_1515, _1511, _1517);
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1531 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1525);
    float _1533 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1527);
    float _1535 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1529);
    float _1537 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1531);
    float _1539 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1533);
    float _1541 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1535);
    float _1543 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1545 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1547 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1549 = _847 + _1543;
    float _1551 = _851 + _1545;
    float _1553 = _845 + _1547;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1557 = _1549 + _1555;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1561 = _1551 + _1559;
    float _1563 = _1557 * _1557;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 + _1565;
    float _1569 = sqrt(_1567);
    bool _1571 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1573 = _1545;
    float _1575 = _1563;
    float _1577 = _1565;
    float _1579 = _1549;
    float _1581 = _1551;
    if (!_1571)
    {
        _1573 = _1553;
    }
    float _1583 = _1573;
    bool _1585 = !_1571;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1593 = _1569 + _1591;
        float _1595 = rsqrt(_1567);
        float _1597 = _1593 * _1589;
        float _1599 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = _1597 * 0.15915493667125701904296875;
        float _1603 = _1601 * 6.283185482025146484375;
        float _1605 = sin(_1603);
        float _1607 = _1601 * 6.283185482025146484375;
        float _1609 = cos(_1607);
        float _1611 = fma(_1605, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1613 = _1595 * _1611;
        float _1615 = _1609 + (-1.0);
        float _1617 = fma(_1557, _1613, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1619 = fma(_1561, _1613, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1621 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1625 = _1617 + _1623;
        float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1629 = _1619 + _1627;
        float _1631 = fma(_1553, _1609, _1621);
        float _1633 = _1625 * _1625;
        float _1635 = _1629 * _1629;
        _1587 = _1631;
        _1575 = _1633;
        _1577 = _1635;
        _1579 = _1617;
        _1581 = _1619;
    }
    float _1637 = _1587;
    float _1639 = _1575;
    float _1641 = _1577;
    float _1643 = _1579;
    float _1645 = _1581;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1649 = _1637 + _1647;
    float _1651 = fma(_1649, _1649, _1639);
    float _1653 = _1651 + _1641;
    float _1655 = sqrt(_1653);
    bool _1657 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1659 = isnan(_1655);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1665 = _1661 || _1663;
    float _1667 = _1639;
    if (!_1665)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    bool _1671 = !_1665;
    float _1673 = _1669;
    if (!_1671)
    {
        bool _1675 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1677 = isnan(_1655);
        bool _1679 = _1675 || _1677;
        bool _1681 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1683 = _1679 || _1681;
        if (!_1683)
        {
            float _1685 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1687 = _1655 + _1685;
            float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1691 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1697 = 1.0 / _1691;
            float _1699 = _1687 * _1697;
            float _1701 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1673 = _1701;
            _1703 = true;
        }
        else
        {
            bool _1705 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1707 = isnan(_1655);
            bool _1709 = _1705 || _1707;
            bool _1711 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1713 = _1709 || _1711;
            if (!_1713)
            {
                float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1717 = _1655 + _1715;
                float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1721 = _1719 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1725 = _1723 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1727 = 1.0 / _1721;
                float _1729 = _1717 * _1727;
                float _1731 = fma(_1729, _1725, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1673 = _1731;
                _1703 = true;
            }
            else
            {
                _1673 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1703 = false;
    float _1733 = _1673;
    float _1735 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1737 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1739 = _1643 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1743 = _1645 + _1741;
    float _1745 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1735);
    bool _1747 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1759 = _1637 + _1757;
    float _1761 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1763 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1745);
    float _1765 = fma(_1739, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1767 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1761);
    float _1769 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1771 = fma(_1759, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1773 = fma(_1743, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1775 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1767);
    float _1777 = 1.0 / _1769;
    bool _1779 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan(0.5);
    bool _1787 = _1783 || _1785;
    float _1789 = -_1241;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1765);
    float _1793 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = -_1239;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1771);
    float _1799 = -_1307;
    float _1801 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1773);
    float _1803 = _1793 + _1769;
    float _1805 = _1797;
    float _1807 = _1791;
    float _1809 = _1801;
    if (!_1755)
    {
        float _1811 = _1353 * _1353;
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1815 = -_851;
        float _1817 = _1815 + _1773;
        float _1819 = -_847;
        float _1821 = _1819 + _1765;
        float _1823 = fma(_1357, _1357, _1811);
        float _1825 = -_845;
        float _1827 = _1825 + _1771;
        float _1829 = fma(_1363, _1363, _1823);
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1833 = sqrt(_1829);
        float _1835 = 1.0 / _1453;
        float _1837 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1841 = _1839 * _1813;
        float _1843 = _1841 * _1835;
        float _1845 = _1837 * _1843;
        float _1847 = _1817 * _1843;
        float _1849 = fma(_1821, _1845, _1343);
        float _1851 = fma(_1827, _1845, _1339);
        float _1853 = fma(_1837, _1847, _1349);
        _1805 = _1851;
        _1807 = _1849;
        _1809 = _1853;
    }
    float _1855 = _1805;
    float _1857 = _1807;
    float _1859 = _1809;
    float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1863 = _1803 * _1777;
    float _1865 = _1863 * 0.5;
    float _1867 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1869 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1871 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1861);
    float _1875 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1867);
    float _1877 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1869);
    float _1879 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = _1873;
    if (_1787)
    {
        _1883 = 1.0;
    }
    float _1885 = _1883;
    float _1887 = _1885;
    if (!_1787)
    {
        float _1889 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1893 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1891);
        float _1895 = _1889 * 0.15915493667125701904296875;
        float _1897 = _1895 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1903 = _1901 * 0.15915493667125701904296875;
        float _1905 = _1895 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        float _1909 = 1.0 / _1899;
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1907 * _1909;
        float _1917 = 1.0 / _1893;
        float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1921 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1919;
        float _1923 = _1913 * _1915;
        float _1925 = _1903 * 6.283185482025146484375;
        float _1927 = sin(_1925);
        float _1929 = 1.0 / _1923;
        float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1933 = _1917 * _1931;
        float _1935 = 1.0 / _1921;
        float _1937 = _1927 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1941 = fma(_1937, _1933, _1939);
        float _1943 = _1941 * _1935;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1887 = _1945;
    }
    float _1947 = _1887;
    float _1949 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1951 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1953 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1955 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    float _1957 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1959 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1961 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1965 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1967 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1969 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1959);
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1961);
    float _1973 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1963);
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1965);
    float _1977 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1969);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1971);
    float _1983 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1985 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1975);
    bool _1987 = _1947 > 0.0;
    bool _1989 = isnan(_1947);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1999 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1979);
    float _2001 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1981);
    float _2003 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1985);
    float _2005 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1983);
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2009 = _1999 + _2003;
    float _2011 = _2005 + _2003;
    float _2013 = _2003 * 0.5;
    float _2015 = _2009 * 0.5;
    float _2017 = _2011 * 0.5;
    float _2019 = fma(_2001, -0.5, _2013);
    out.m_35.x = _2007;
    out.gl_Position.x = _1999;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2005;
    out.gl_Position.w = _2003;
    out.m_54.x = _2015;
    out.m_54.y = _2019;
    out.m_54.z = _2017;
    out.m_54.w = _2003;
    if (_1995)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2021;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1703 = false;
    bool _675 = false;
    bool _289 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2078 = as_type<float>(_89);
        out.gl_Position.z = _2078;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = _107;
    if (_103)
    {
        float _113 = float(_73);
        _83 = _113;
    }
    float _115 = _83;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _91 = as_type<int>(_127);
    }
    int _129 = _91;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2148 = as_type<float>(_129);
        out.gl_Position.z = _2148;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = _133;
    if (!_145)
    {
        float _161 = _133 * _133;
        float _163 = _161 * 0.5;
        _109 = _163;
    }
    float _165 = _109;
    float _167 = _165;
    if (!_145)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_131) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_131) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_145;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _133 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _133);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_145;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _133 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _147, _251);
    float _259 = fma(_247, _149, _253);
    float _261 = fma(_247, _151, _255);
    float _263 = fma(_257, _135, _153);
    float _265 = fma(_259, _135, _155);
    float _267 = fma(_261, _135, _157);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = 1.0 / _301;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _325 = 1.0 / _305;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = _297 + _327;
    bool _331 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_297);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = 1.0 / _309;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _297 + _345;
    float _349 = _329 * _315;
    bool _351 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _353 = isnan(_297);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    bool _363 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _365 = isnan(_297);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _377 = 1.0 / _313;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _379;
    float _383 = _347 * _325;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _297 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _297 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = _297 + _393;
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = 1.0 / _319;
    float _403 = _387 * _343;
    float _405 = -_361;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = _373 * _407;
    bool _415 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _417 = isnan(_297);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = 1.0 / _323;
    float _429 = _391 * _377;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _433 = _297 + _431;
    float _435 = fma(_411, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _437 = -_425;
    float _439 = _437 + 1.0;
    float _441 = 1.0 / _381;
    float _443 = _395 * _401;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _447 = _297 + _445;
    bool _449 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _451 = isnan(_297);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _447 * _427;
    bool _463 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_297);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -_473;
    float _477 = _475 + 1.0;
    float _479 = _433 * _441;
    float _481 = _459 * _399;
    float _483 = -_459;
    float _485 = _483 + 1.0;
    float _487 = _341 * _477;
    float _489 = -_341;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = _425 * _485;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    float _503 = _473 * _439;
    bool _505 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _507 = isnan(_297);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_495, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_501, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _521 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_297);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = -_515;
    float _539 = _537 + 1.0;
    float _541 = _515 * _491;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _547;
    float _551 = _531 * _539;
    float _553 = fma(_535, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _555 = fma(_545, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _557 = fma(_549, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _559 = _435 * _551;
    float _561 = _519 * _551;
    float _563 = -_531;
    float _565 = _563 + 1.0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _577 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _579 = fma(_569, _429, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _581 = fma(_573, _429, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _583;
    float _587 = fma(_553, _541, _575);
    float _589 = fma(_555, _541, _577);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _591;
    float _595 = fma(_585, _443, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _597 = fma(_557, _487, _587);
    float _599 = fma(_517, _487, _589);
    float _601 = in.m_42.x;
    float _603 = in.m_42.y;
    float _605 = fma(_593, _443, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _615 = fma(_579, _503, _597);
    float _617 = fma(_581, _503, _599);
    float _619 = fma(_609, _461, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _621 = fma(_613, _461, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _627;
    float _631 = fma(_595, _497, _615);
    float _633 = fma(_605, _497, _617);
    float _635 = fma(_625, _479, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _637 = fma(_629, _479, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _639 = fma(_619, _481, _631);
    float _641 = fma(_621, _481, _633);
    float _643 = fma(_635, _413, _639);
    float _645 = fma(_637, _413, _641);
    float _647 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[150].x, _643);
    float _649 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[150].y, _645);
    float _651 = _647 * _601;
    float _653 = _649 * _603;
    bool _655 = !_375;
    float _673;
    if (!_655)
    {
        float _657 = in.m_44.x;
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _661 = _657 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_73);
        float _679 = 1.0 / _677;
        float _681 = _107 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _687 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _695 = _693 != 0;
    float _697 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _687);
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _701 = _699 != 0;
    float _703 = 1.0 / _691;
    float _705 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _711 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _685);
    float _713 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _719 = 1.0 / _709;
    float _721 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _713);
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _733 = _731 != 0;
    float _735 = in.m_44.z;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _741 = 1.0 / _717;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = 1.0 / _739;
    float _755 = in.m_44.x;
    float _757 = in.m_44.y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _771 = log2(_769);
    float _773 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _711);
    out.m_46.x = _751;
    out.m_46.y = _761;
    out.m_46.z = _767;
    float _775 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _697);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _789 = 1.0 / _747;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _791;
    float _795 = _779 * _703;
    float _797 = _787 * _741;
    float _799 = _793 * _719;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _805 = 1.0 / _783;
    float _807 = _771 * _107;
    bool _809 = _755 > 0.5;
    float _811 = _735 * 2.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _813;
    float _817 = _755 * 2.0;
    float _819 = _803 * _753;
    bool _821 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _829 = _825 || _827;
    float _831 = 1.0 / _765;
    bool _833 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _835 = isnan(_683);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _773 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _847 = _721 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _849 = _757 * 2.0;
    float _851 = _775 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _853 = exp2(_807);
    float _855 = _815 * _805;
    float _857 = -_183;
    int _859 = _809 ? as_type<int>(_857) : as_type<int>(_183);
    bool _861 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(1.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    bool _879 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _881 = isnan(_683);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = floor(_811);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _895 = 1.0 + _893;
    float _897 = _873 * _789;
    bool _899 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _901 = isnan(_683);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_889;
    float _913 = _911 + 1.0;
    float _915 = _877 * _831;
    bool _917 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _919 = isnan(_683);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = -_853;
    float _931 = _929 + 1.0;
    float _933 = 1.0 / _895;
    float _935 = _843 * _913;
    float _937 = -_843;
    float _939 = _937 + 1.0;
    float _941 = _757 + _755;
    bool _943 = !_695;
    float _945 = _943 ? _183 : as_type<float>(_859);
    float _947 = _909 * _939;
    float _949 = -_909;
    float _951 = _949 + 1.0;
    float _953 = floor(_817);
    bool _955 = _757 > 0.5;
    float _957 = _941 + (-1.0);
    float _959 = _829 ? _931 : 0.0;
    float _961 = _927 * _951;
    bool _963 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _965 = isnan(_683);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -_927;
    float _977 = _975 + 1.0;
    bool _979 = _891 >= 0.0;
    bool _981 = isnan(_891);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    if (_869)
    {
        float _989 = _959 * _933;
        _111 = _989;
    }
    float _991 = _111;
    bool _993 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _995 = isnan(_683);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = _973 * _977;
    float _1007 = -_187;
    int _1009 = _955 ? as_type<int>(_1007) : as_type<int>(_187);
    float _1011 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1013 = _891 > 0.0;
    float _1015 = -_973;
    float _1017 = _1015 + 1.0;
    int _1019 = _987 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1023 = _683 + _1021;
    bool _1025 = _953 > 0.0;
    float _1027 = _1003 * _1017;
    bool _1029 = _953 >= 0.0;
    bool _1031 = isnan(_953);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = -_1003;
    float _1041 = _1039 + 1.0;
    bool _1043 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1045 = isnan(_683);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_795, _1023, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1057 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1059 = isnan(_683);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1071 = _683 + _1069;
    int _1073 = ~_1019;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    float _1079 = _1053 * _1041;
    float _1081 = -_1053;
    float _1083 = _1081 + 1.0;
    int _1085 = _1077;
    if (!_1013)
    {
        int _1087 = ~_1019;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1095 = _683 + _1093;
    float _1097 = fma(_799, _1071, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1099 = _1067 * _1083;
    float _1101 = -_1067;
    float _1103 = _1101 + 1.0;
    float _1105 = fma(_797, _1095, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1109 = _683 + _1107;
    float _1111 = _1055 * _1099;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1115 = _683 + _1113;
    float _1117 = _945 + 0.5;
    float _1119 = fma(_897, _1109, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1121 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1111);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1125 = _683 + _1123;
    float _1127 = fma(_819, _1115, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _1129 = !_701;
    float _1131 = _1129 ? _187 : as_type<float>(_1009);
    float _1133 = fma(_1105, _1079, _1121);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1137 = _683 + _1135;
    float _1139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1141 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = fma(_1097, _1027, _1133);
    float _1145 = fma(_915, _1137, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1147 = fma(_855, _1125, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1151 = _847 + _1149;
    float _1153 = fma(_1127, _1005, _1143);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1157 = _845 + _1155;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1161 = !_725;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1167 = _851 + _1165;
    float _1169 = _1157 * _1157;
    float _1171 = fma(_1119, _961, _1153);
    int _1173 = abs(_1163);
    float _1175 = fma(_1151, _1151, _1169);
    float _1177 = floor(_849);
    float _1179 = -_1131;
    float _1181 = _1179 + 0.5;
    float _1183 = _1141 * _1139;
    float _1185 = fma(_1167, _1167, _1175);
    bool _1187 = !_729;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1193 = _1037 ? 0 : 1;
    float _1195 = rsqrt(_1185);
    float _1197 = _1191 * _1159;
    float _1199 = float(_1173);
    float _1201 = float(_1091);
    int _1203 = abs(_1189);
    out.m_48.x = _1183;
    out.m_48.y = _1197;
    bool _1205 = _1177 > 0.0;
    float _1207 = _1199 * _1201;
    float _1209 = fma(_1145, _947, _1171);
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1213 = _1177 >= 0.0;
    bool _1215 = isnan(_1177);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.0);
    bool _1221 = _1217 || _1219;
    float _1223 = in.m_50.x;
    float _1225 = in.m_50.y;
    float _1227 = in.m_50.z;
    int _1229 = ~_1193;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    float _1235 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1211);
    int _1237 = _1221 ? 0 : 1;
    float _1239 = _1157 * _1195;
    float _1241 = _1151 * _1195;
    float _1243 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1235);
    int _1245 = ~_1237;
    int _1247 = _1245 + 1;
    int _1249 = _1247 + 1;
    float _1251 = -_1239;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1157);
    int _1255 = _1249;
    int _1257 = _1233;
    if (!_1205)
    {
        int _1259 = ~_1237;
        int _1261 = _1259 + 1;
        _1255 = _1261;
    }
    int _1263 = _1255;
    float _1265 = -_1241;
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    bool _1269 = _1243 >= 0.0;
    float _1271 = _1253 * _1253;
    if (!_1025)
    {
        int _1273 = ~_1193;
        int _1275 = _1273 + 1;
        _1257 = _1275;
    }
    int _1277 = _1257;
    float _1279 = fma(_1147, _935, _1209);
    float _1281 = fma(_1267, _1267, _1271);
    float _1283 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[122].x, _1279);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1287 = float(_1203);
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1291 = float(_1277);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1295 = _1279;
    if (_1269)
    {
        _1295 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1297 = _1295;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1287 * _1291;
    float _1305 = _1207 * (-2.0);
    float _1307 = _1167 * _1195;
    float _1309 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1311 = as_type<int>(_1297);
    if (_1269)
    {
        float _1313 = _1297 * 5.0;
        _1311 = as_type<int>(_1313);
    }
    int _1315 = _1311;
    float _1317 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _755 + (-0.5);
    float _1321 = fma(_1305, _1223, _1223);
    float _1323 = -_1307;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    if (_1269)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4020 = as_type<float>(_1315);
        out.gl_Position.z = _4020;
    }
    float _1327 = fma(_1011, _1305, _1011);
    float _1329 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1321);
    float _1331 = fma(_1325, _1325, _1281);
    out.m_52.x = _1299;
    out.m_52.y = _1301;
    out.m_52.z = _1309;
    out.m_52.w = _1317;
    bool _1333 = !_733;
    int _1335 = _1333 ? 0 : 1;
    if (_1269)
    {
        out.m_35.x = 0.0;
    }
    if (_1269)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1337 = -_1239;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[18].w, _845);
    float _1341 = -_1241;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    int _1345 = abs(_1335);
    float _1347 = -_1307;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _851);
    float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1353 = _1339 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1357 = _1343 + _1355;
    float _1359 = _757 + _735;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1363 = _1349 + _1361;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1367 = float(_1263);
    float _1369 = _1359 + (-1.0);
    float _1371 = float(_1345);
    float _1373 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1365);
    float _1375 = _1303 * (-2.0);
    float _1377 = _735 + _755;
    float _1379 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1373);
    float _1381 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1383 = _757 + (-0.5);
    float _1385 = fma(_1375, _1225, _1225);
    float _1387 = _1371 * _1367;
    float _1389 = fma(_1381, _1375, _1381);
    bool _1391 = _1379 >= 0.0;
    float _1393 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1385);
    float _1395 = _1387 * (-2.0);
    float _1397 = _1377 + (-1.0);
    float _1399 = _735 + (-0.5);
    float _1401 = fma(_1327, _991, _1329);
    float _1403 = fma(_1395, _1227, _1227);
    float _1405 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1407 = fma(_1389, _991, _1393);
    float _1409 = _1401 * 0.15915493667125701904296875;
    float _1411 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1403);
    float _1413 = fma(_1405, _1395, _1405);
    float _1415 = _1407 * 0.15915493667125701904296875;
    float _1417 = _1387;
    int _1419 = as_type<int>(_1403);
    if (_1391)
    {
        _1417 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1421 = _1417;
    float _1423 = sqrt(_1331);
    float _1425 = fma(_1413, _991, _1411);
    if (_1391)
    {
        out.m_35.x = 0.0;
    }
    if (_1391)
    {
        float _1427 = _1421 * 5.0;
        _1419 = as_type<int>(_1427);
    }
    int _1429 = _1419;
    float _1431 = _1425 * 0.15915493667125701904296875;
    float _1433 = _1409 * 6.283185482025146484375;
    float _1435 = sin(_1433);
    if (_1391)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4228 = as_type<float>(_1429);
        out.gl_Position.z = _4228;
    }
    float _1437 = _1409 * 6.283185482025146484375;
    float _1439 = cos(_1437);
    float _1441 = _1415 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = _1415 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    if (_1391)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1449 = _1431 * 6.283185482025146484375;
    float _1451 = cos(_1449);
    float _1453 = _1195 * _1423;
    float _1455 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1459 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1463 = _1453 * _1455;
    float _1465 = _1435 * _1443;
    float _1467 = _1431 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    float _1471 = _1439 * _1447;
    float _1473 = _1457 * _1463;
    float _1475 = _1453 * _1459;
    float _1477 = _1461 * _1475;
    float _1479 = _1451 * _1473;
    float _1481 = _1443 * _1451;
    float _1483 = _1447 * _1451;
    float _1485 = _1439 * _1443;
    float _1487 = _1439 * _1479;
    float _1489 = _1435 * _1447;
    float _1491 = _1435 * _1479;
    float _1493 = fma(_1469, _1471, _1465);
    float _1495 = -_1473;
    float _1497 = _1469 * _1495;
    float _1499 = -_1489;
    float _1501 = fma(_1469, _1485, _1499);
    float _1503 = -_1485;
    float _1505 = fma(_1469, _1489, _1503);
    float _1507 = fma(_1493, _1477, _1487);
    float _1509 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1511 = _1509 * 0.5;
    float _1513 = fma(_1483, _1477, _1497);
    float _1515 = fma(_1469, _1465, _1471);
    float _1517 = fma(_1505, _1477, _1491);
    float _1519 = fma(_1501, _1511, _1507);
    float _1521 = fma(_1481, _1511, _1513);
    float _1523 = fma(_1515, _1511, _1517);
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1531 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1525);
    float _1533 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1527);
    float _1535 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1529);
    float _1537 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1531);
    float _1539 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1533);
    float _1541 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1535);
    float _1543 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1545 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1547 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1549 = _847 + _1543;
    float _1551 = _851 + _1545;
    float _1553 = _845 + _1547;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1557 = _1549 + _1555;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1561 = _1551 + _1559;
    float _1563 = _1557 * _1557;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 + _1565;
    float _1569 = sqrt(_1567);
    bool _1571 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1573 = _1545;
    float _1575 = _1563;
    float _1577 = _1565;
    float _1579 = _1549;
    float _1581 = _1551;
    if (!_1571)
    {
        _1573 = _1553;
    }
    float _1583 = _1573;
    bool _1585 = !_1571;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1593 = _1569 + _1591;
        float _1595 = rsqrt(_1567);
        float _1597 = _1593 * _1589;
        float _1599 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = _1597 * 0.15915493667125701904296875;
        float _1603 = _1601 * 6.283185482025146484375;
        float _1605 = sin(_1603);
        float _1607 = _1601 * 6.283185482025146484375;
        float _1609 = cos(_1607);
        float _1611 = fma(_1605, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1613 = _1595 * _1611;
        float _1615 = _1609 + (-1.0);
        float _1617 = fma(_1557, _1613, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1619 = fma(_1561, _1613, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1621 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1625 = _1617 + _1623;
        float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1629 = _1619 + _1627;
        float _1631 = fma(_1553, _1609, _1621);
        float _1633 = _1625 * _1625;
        float _1635 = _1629 * _1629;
        _1587 = _1631;
        _1575 = _1633;
        _1577 = _1635;
        _1579 = _1617;
        _1581 = _1619;
    }
    float _1637 = _1587;
    float _1639 = _1575;
    float _1641 = _1577;
    float _1643 = _1579;
    float _1645 = _1581;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1649 = _1637 + _1647;
    float _1651 = fma(_1649, _1649, _1639);
    float _1653 = _1651 + _1641;
    float _1655 = sqrt(_1653);
    bool _1657 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1659 = isnan(_1655);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1665 = _1661 || _1663;
    float _1667 = _1639;
    if (!_1665)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    bool _1671 = !_1665;
    float _1673 = _1669;
    if (!_1671)
    {
        bool _1675 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1677 = isnan(_1655);
        bool _1679 = _1675 || _1677;
        bool _1681 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1683 = _1679 || _1681;
        if (!_1683)
        {
            float _1685 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1687 = _1655 + _1685;
            float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1691 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1697 = 1.0 / _1691;
            float _1699 = _1687 * _1697;
            float _1701 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1673 = _1701;
            _1703 = true;
        }
        else
        {
            bool _1705 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1707 = isnan(_1655);
            bool _1709 = _1705 || _1707;
            bool _1711 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1713 = _1709 || _1711;
            if (!_1713)
            {
                float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1717 = _1655 + _1715;
                float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1721 = _1719 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1725 = _1723 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1727 = 1.0 / _1721;
                float _1729 = _1717 * _1727;
                float _1731 = fma(_1729, _1725, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1673 = _1731;
                _1703 = true;
            }
            else
            {
                _1673 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1703 = false;
    float _1733 = _1673;
    float _1735 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1737 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1739 = _1643 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1743 = _1645 + _1741;
    float _1745 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1735);
    bool _1747 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1759 = _1637 + _1757;
    float _1761 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1763 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1745);
    float _1765 = fma(_1739, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1767 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1761);
    float _1769 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1771 = fma(_1759, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1773 = fma(_1743, _1733, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1775 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1767);
    float _1777 = 1.0 / _1769;
    bool _1779 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan(0.5);
    bool _1787 = _1783 || _1785;
    float _1789 = -_1241;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1765);
    float _1793 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = -_1239;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1771);
    float _1799 = -_1307;
    float _1801 = fma(_1799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1773);
    float _1803 = _1793 + _1769;
    float _1805 = _1797;
    float _1807 = _1791;
    float _1809 = _1801;
    if (!_1755)
    {
        float _1811 = _1353 * _1353;
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1815 = -_851;
        float _1817 = _1815 + _1773;
        float _1819 = -_847;
        float _1821 = _1819 + _1765;
        float _1823 = fma(_1357, _1357, _1811);
        float _1825 = -_845;
        float _1827 = _1825 + _1771;
        float _1829 = fma(_1363, _1363, _1823);
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1833 = sqrt(_1829);
        float _1835 = 1.0 / _1453;
        float _1837 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1841 = _1839 * _1813;
        float _1843 = _1841 * _1835;
        float _1845 = _1837 * _1843;
        float _1847 = _1817 * _1843;
        float _1849 = fma(_1821, _1845, _1343);
        float _1851 = fma(_1827, _1845, _1339);
        float _1853 = fma(_1837, _1847, _1349);
        _1805 = _1851;
        _1807 = _1849;
        _1809 = _1853;
    }
    float _1855 = _1805;
    float _1857 = _1807;
    float _1859 = _1809;
    float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1863 = _1803 * _1777;
    float _1865 = _1863 * 0.5;
    float _1867 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1869 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1871 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1861);
    float _1875 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1867);
    float _1877 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1869);
    float _1879 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = _1873;
    if (_1787)
    {
        _1883 = 1.0;
    }
    float _1885 = _1883;
    float _1887 = _1885;
    if (!_1787)
    {
        float _1889 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1893 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1891);
        float _1895 = _1889 * 0.15915493667125701904296875;
        float _1897 = _1895 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1903 = _1901 * 0.15915493667125701904296875;
        float _1905 = _1895 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        float _1909 = 1.0 / _1899;
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1907 * _1909;
        float _1917 = 1.0 / _1893;
        float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1921 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1919;
        float _1923 = _1913 * _1915;
        float _1925 = _1903 * 6.283185482025146484375;
        float _1927 = sin(_1925);
        float _1929 = 1.0 / _1923;
        float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1933 = _1917 * _1931;
        float _1935 = 1.0 / _1921;
        float _1937 = _1927 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1941 = fma(_1937, _1933, _1939);
        float _1943 = _1941 * _1935;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1887 = _1945;
    }
    float _1947 = _1887;
    float _1949 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1951 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1953 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1955 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    float _1957 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1959 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1961 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1965 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1967 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1969 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1959);
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1961);
    float _1973 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1963);
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1965);
    float _1977 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1969);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1971);
    float _1983 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1985 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1975);
    bool _1987 = _1947 > 0.0;
    bool _1989 = isnan(_1947);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1999 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1979);
    float _2001 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1981);
    float _2003 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1985);
    float _2005 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1983);
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2009 = _1999 + _2003;
    float _2011 = _2005 + _2003;
    float _2013 = _2003 * 0.5;
    float _2015 = _2009 * 0.5;
    float _2017 = _2011 * 0.5;
    float _2019 = fma(_2001, -0.5, _2013);
    out.m_35.x = _2007;
    out.gl_Position.x = _1999;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2005;
    out.gl_Position.w = _2003;
    out.m_54.x = _2015;
    out.m_54.y = _2019;
    out.m_54.z = _2017;
    out.m_54.w = _2003;
    if (_1995)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2021;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

