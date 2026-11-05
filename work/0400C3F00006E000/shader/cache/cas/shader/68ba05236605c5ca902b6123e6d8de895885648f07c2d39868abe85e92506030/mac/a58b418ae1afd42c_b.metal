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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_32 [[attribute(6)]];
    float4 m_50 [[attribute(7)]];
    float4 m_42 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _769 = false;
    bool _557 = false;
    bool _453 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = in.m_32.w;
    float _80 = trunc(_76);
    int _83 = int(_80);
    float _85 = -_78;
    float _87 = _85 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _87;
    bool _91 = _83 >= 1;
    float _93 = 0.0;
    float _95 = _78;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _93;
    if (!_91)
    {
        out.m_37.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2697 = as_type<float>(_103);
        out.gl_Position.z = _2697;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _107 = _78 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_78);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = float(_83);
    bool _119 = _87 >= _117;
    bool _121 = !_115;
    bool _123 = _119 || _121;
    if (_123)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _95;
    if (_123)
    {
        out.m_37.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _105 = as_type<int>(_127);
    }
    int _129 = _105;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_129);
        out.gl_Position.z = _2752;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _87 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _133;
    if (!_145)
    {
        float _169 = _133 * _133;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    float _181 = _173;
    if (!_145)
    {
        float _183 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = in.m_48.x;
    float _189 = in.m_48.y;
    float _191 = in.m_48.z;
    int _193 = as_type<int>(_131) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_131) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_145;
    float _211 = _185;
    float _213 = 0.0;
    float _215 = 0.0;
    if (!_209)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _133 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _133);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _245;
        _213 = _235;
        _215 = _233;
    }
    float _247 = _211;
    float _249 = _213;
    float _251 = _215;
    bool _253 = !_145;
    float _255 = _249;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _133 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _167 = _277;
    }
    float _279 = _255;
    float _281 = _167;
    float _283 = _279;
    if (!_145)
    {
        float _285 = _87 * _87;
        float _287 = _285 * 0.5;
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _289;
    if (!_145)
    {
        _257 = _87;
    }
    float _293 = _257;
    float _295 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _293;
    if (!_145)
    {
        float _301 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _301;
    }
    float _303 = _291;
    bool _305 = !_145;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _87 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _87);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_145;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _87 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_281, _149, _297);
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = fma(_281, _147, _295);
    float _373 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _375 = fma(_281, _151, _365);
    float _377 = fma(_363, _149, _369);
    float _379 = 1.0 / _117;
    float _381 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_363, _147, _373);
    float _387 = -_377;
    float _389 = _367 + _387;
    float _391 = fma(_363, _151, _381);
    float _393 = fma(_367, _135, _155);
    float _395 = fma(_371, _135, _153);
    float _397 = -_385;
    float _399 = _371 + _397;
    float _401 = _389 * _161;
    float _403 = _389 * _177;
    float _405 = _389 * _189;
    float _407 = -_391;
    float _409 = _375 + _407;
    float _411 = fma(_399, _159, _401);
    float _413 = fma(_399, _175, _403);
    float _415 = fma(_399, _187, _405);
    float _417 = fma(_375, _135, _157);
    float _419 = fma(_409, _163, _411);
    float _421 = fma(_409, _179, _413);
    float _423 = fma(_409, _191, _415);
    float _425 = _87 * _379;
    bool _427 = !_383;
    float _429 = _421;
    float _431 = _419;
    float _433 = _423;
    float _451;
    if (!_427)
    {
        float _435 = in.m_50.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[12].x, _87);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _425;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _455 + _457;
    float _461 = in.m_42.x;
    float _463 = in.m_42.y;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _497;
    float _501 = 1.0 / _479;
    bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _505 = _491 * _495;
    float _507 = -_491;
    float _509 = _507 + 1.0;
    float _511 = _459 * _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _513;
    float _517 = fma(_499, _511, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _519 = fma(_515, _511, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _521 = _517 * _505;
    float _523 = _519 * _505;
    float _525 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _527 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[143].y, _523);
    float _529 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[144].x, _525);
    float _531 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[144].y, _527);
    float _533 = _529 * _461;
    float _535 = _531 * _463;
    bool _537 = !_503;
    float _555;
    if (!_537)
    {
        float _539 = in.m_50.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _87);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        _555 = _425;
    }
    _557 = false;
    float _559 = _555;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _559 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = isnan(_559);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _567;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _597 = isnan(_559);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _609 = 1.0 / _575;
    float _611 = _571 * _589;
    bool _613 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_559);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _593;
    float _627 = -_587;
    float _629 = _627 + 1.0;
    float _631 = fma(_611, _563, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _637 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _639 = isnan(_559);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_623;
    float _651 = _649 + 1.0;
    float _653 = _623 * _629;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = 1.0 / _635;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    float _665 = _605 * _651;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _667;
    float _671 = _657 * _609;
    float _673 = _587 * _663;
    float _675 = _631 * _665;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _559 + _677;
    float _681 = -_605;
    float _683 = _681 + 1.0;
    float _685 = _669 * _625;
    bool _687 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _689 = isnan(_559);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = _559 + _703;
    float _707 = fma(_671, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _709 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _711 = -_697;
    float _713 = _711 + 1.0;
    float _715 = _701 * _659;
    float _717 = fma(_685, _705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _721 = _559 + _719;
    float _723 = fma(_707, _653, _709);
    float _725 = _647 * _713;
    float _727 = fma(_715, _721, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _729 = fma(_717, _673, _723);
    float _731 = fma(_727, _725, _729);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _739 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[119].x, _731);
    float _741 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = _739 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _741;
    out.m_52.y = _743;
    out.m_52.z = _745;
    out.m_52.w = _747;
    bool _749 = !_607;
    float _767;
    if (!_749)
    {
        float _751 = in.m_50.x;
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _755 = _751 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].z, _87);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        _767 = _425;
    }
    _769 = false;
    float _771 = _767;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _775 = int(_773);
    float _777 = _393 * _177;
    float _779 = in.m_48.w;
    float _781 = fma(_395, _175, _777);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = _771 + _783;
    float _787 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _789 = int(_787);
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _793 = fma(_417, _179, _781);
    float _795 = in.m_44.w;
    bool _797 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _799 = isnan(_771);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = float(_775);
    float _811 = 1.0 / _809;
    float _813 = float(uint(_789));
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _817 = ~_789;
    int _819 = _817 + 1;
    int _821 = ~_789;
    int _823 = _821 + 1;
    float _825 = 1.0 / _813;
    bool _827 = _789 == 0;
    int _829 = ~_789;
    int _831 = _829 + 1;
    float _833 = _87 * _811;
    float _835 = trunc(_833);
    int _837 = int(_835);
    int _839 = as_type<int>(_825) + (-2);
    float _841 = float(uint(_837));
    float _843 = as_type<float>(_839) * _841;
    float _845 = trunc(_843);
    float _847 = precise::max(_845, 0.0);
    uint _850 = uint(_847);
    float _852 = float(_837);
    int _854 = _819 * int(_850);
    int _856 = _854 + _837;
    float _858 = in.m_50.x;
    float _860 = in.m_50.y;
    float _862 = float(uint(_856));
    float _864 = as_type<float>(_839) * _862;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _868 = _866 != 0;
    float _870 = trunc(_864);
    float _872 = precise::max(_870, 0.0);
    uint _874 = uint(_872);
    bool _876 = !_868;
    float _878 = _876 ? 7.345489978790283203125 : 1.0;
    float _880 = _878 * _858;
    float _882 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _884 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].w, _815);
    float _888 = floor(_880);
    int _890 = int(_850) + int(_874);
    float _892 = fma(_884, -2.0, _791);
    float _894 = float(_789);
    float _896 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[77].w, _886);
    int _898 = _823 * _890;
    int _900 = _898 + _837;
    bool _902 = _852 >= _894;
    bool _904 = isnan(_852);
    bool _906 = _902 || _904;
    bool _908 = isnan(_894);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[76].y, _892);
    float _916 = -_896;
    float _918 = _916 + 1.0;
    bool _920 = uint(_900) >= uint(_789);
    float _922 = trunc(_912);
    int _924 = int(_922);
    bool _926 = !_920;
    int _928 = _926 ? 0 : (-1);
    float _930 = -_888;
    float _932 = _880 + _930;
    int _934 = ~_890;
    int _936 = _934 + _928;
    int _938 = _936 + 1;
    float _940 = _932 * _894;
    float _942 = _87 * _894;
    int _944 = _789 * _938;
    int _946 = _944 + _837;
    float _948 = _942 * _379;
    float _950 = trunc(_940);
    int _952 = int(_950);
    int _954 = ~_924;
    int _956 = _954 + 1;
    int _958 = _956 + 1;
    bool _960 = !_827;
    int _962 = _960 ? _946 : (-1);
    float _964 = trunc(_948);
    int _966 = int(_964);
    int _968 = _962 * _958;
    int _970 = _789 + (-1);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _986 = _984 != 0;
    int _988 = _924 * _970;
    int _990 = _988 + _968;
    bool _992 = !_978;
    int _994 = _992 ? 0 : 1;
    bool _996 = !_974;
    int _998 = _996 ? 0 : 1;
    bool _1000 = !_986;
    int _1002 = _1000 ? 0 : 1;
    int _1004 = abs(_994);
    bool _1006 = !_982;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = abs(_998);
    int _1012 = _990 * _1004;
    int _1014 = abs(_1002);
    int _1016 = abs(_1008);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1020 = _1018 != 0;
    int _1022 = _952 * _1014;
    int _1024 = _1022 + _837;
    bool _1026 = !_1020;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _966 * _1010;
    int _1032 = _1030 + _1012;
    int _1034 = abs(_1028);
    float _1036 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1038 = log2(_1036);
    int _1040 = ~_789;
    int _1042 = _1040 + 1;
    int _1044 = _1024 * _1016;
    int _1046 = _1044 + _1032;
    int _1048 = _952 * _1034;
    int _1050 = _1048 + _1046;
    int _1052 = ~_789;
    int _1054 = _1052 + 1;
    float _1056 = float(uint(_1050));
    float _1058 = as_type<float>(_839) * _1056;
    float _1060 = _87 * _1038;
    float _1062 = trunc(_1058);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    float _1068 = exp2(_1060);
    int _1070 = _1054 * int(_1066);
    int _1072 = _1070 + _1050;
    float _1074 = float(uint(_1072));
    float _1076 = -_1068;
    float _1078 = _1076 + 1.0;
    float _1080 = as_type<float>(_839) * _1074;
    float _1082 = trunc(_1080);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = int(_1066) + int(_1086);
    int _1090 = _1042 * _1088;
    int _1092 = _1090 + _1050;
    bool _1094 = uint(_1092) >= uint(_789);
    float _1096 = _858 * 2.0;
    bool _1098 = !_1094;
    int _1100 = _1098 ? 0 : (-1);
    float _1102 = floor(_1096);
    int _1104 = ~_1088;
    int _1106 = _1104 + _1100;
    int _1108 = _1106 + 1;
    float _1110 = in.m_50.z;
    int _1112 = _789 * _1108;
    int _1114 = _1112 + _1050;
    float _1116 = _860 * 2.0;
    bool _1118 = !_827;
    int _1120 = _1118 ? _1114 : (-1);
    float _1122 = floor(_1116);
    int _1124 = _1120 & 3;
    bool _1126 = _1124 != 0;
    bool _1128 = _1102 > 0.0;
    bool _1130 = uint(_1124) > 1u;
    bool _1132 = _1102 >= 0.0;
    bool _1134 = isnan(_1102);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    int _1142 = _1120 & 3;
    bool _1144 = _1142 != 0;
    int _1146 = _1140 ? 0 : 1;
    int _1148 = _1144 ? 0 : 1;
    float _1150 = _1110 * 2.0;
    bool _1152 = _860 > 0.5;
    int _1154 = ~_1146;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = ~_1148;
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    int _1166 = _1158;
    int _1168 = _1164;
    if (!_1128)
    {
        int _1170 = ~_1146;
        int _1172 = _1170 + 1;
        _1166 = _1172;
    }
    int _1174 = _1166;
    if (!_1130)
    {
        int _1176 = ~_1148;
        int _1178 = _1176 + 1;
        _1168 = _1178;
    }
    int _1180 = _1168;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1182;
    float _1186 = -_207;
    int _1188 = _1152 ? as_type<int>(_1186) : as_type<int>(_207);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1192 = _1190 != 0;
    float _1194 = 1.0 / _1184;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    bool _1204 = _858 > 0.5;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1208 = -_203;
    int _1210 = _1204 ? as_type<int>(_1208) : as_type<int>(_203);
    bool _1212 = _1122 >= 0.0;
    bool _1214 = isnan(_1122);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = -_1206;
    float _1224 = fma(_882, 2.0, _1222);
    bool _1226 = !_1198;
    float _1228 = _1226 ? _203 : as_type<float>(_1210);
    float _1230 = in.m_46.w;
    int _1232 = _1220 ? 0 : 1;
    float _1234 = _785 * _1194;
    bool _1236 = _1122 > 0.0;
    float _1238 = _393 * _161;
    float _1240 = _393 * _189;
    int _1242 = ~_1232;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1248;
    float _1252 = fma(_395, _159, _1238);
    float _1254 = fma(_395, _187, _1240);
    float _1256 = _860 + _1110;
    float _1258 = floor(_1150);
    float _1260 = fma(_417, _163, _1252);
    float _1262 = fma(_417, _191, _1254);
    bool _1264 = !_1202;
    float _1266 = _1264 ? _207 : as_type<float>(_1188);
    float _1268 = _860 + _858;
    int _1270 = _1246;
    if (!_1236)
    {
        int _1272 = ~_1232;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1280 = _771 + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1292 = _1290 != 0;
    float _1294 = _1268 + (-1.0);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1300 = _1260 + _795;
    bool _1302 = !_1288;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = 1.0 / _1298;
    bool _1308 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1310 = isnan(_771);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = fma(_1250, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1322 = _1258 >= 0.0;
    bool _1324 = isnan(_1258);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    float _1332 = _1256 + (-1.0);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1338 = -_87;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    int _1342 = _1330 ? 0 : 1;
    float _1344 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1346 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1348 = _793 + _1230;
    float _1350 = float(uint(_1024));
    bool _1352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1354 = isnan(0.0);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1360 = _1356 || _1358;
    bool _1362 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1364 = isnan(_771);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = as_type<float>(_839) * _1350;
    float _1376 = _1280 * _1306;
    float _1378 = _1360 ? _1078 : 0.0;
    bool _1380 = _1258 > 0.0;
    float _1382 = _1262 + _779;
    float _1384 = trunc(_1374);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    float _1390 = -_1372;
    float _1392 = _1390 + 1.0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1394;
    float _1398 = _807 * _1392;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1400;
    float _1404 = -_807;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1396, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1414 = fma(_1402, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1416 = _1318 * _1406;
    float _1418 = fma(_1412, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1420 = _831 * int(_1388);
    int _1422 = _1420 + _1024;
    float _1424 = _1320 * _1416;
    float _1426 = _1408 * _1416;
    float _1428 = _1414 * _1416;
    int _1430 = _1120 >> 31;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1434 = 1.0 + _1432;
    float _1436 = float(uint(_1422));
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1442 = _1430 & 3;
    float _1444 = 1.0 / _1434;
    float _1446 = fma(_1336, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1448 = as_type<float>(_839) * _1436;
    int _1450 = _1120 + _1442;
    float _1452 = _1228 + 0.5;
    float _1454 = fma(_1440, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1456 = _1450 >> 2;
    float _1458 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1340);
    float _1460 = trunc(_1448);
    float _1462 = precise::max(_1460, 0.0);
    uint _1464 = uint(_1462);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1468 = -_1318;
    float _1470 = _1468 + 1.0;
    float _1472 = _1266 + (-0.5);
    float _1474 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1466);
    float _1476 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1424);
    float _1478 = _1378 * _1444;
    int _1480 = _1456 << 4;
    int _1482 = _1480 + 368;
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1426);
    int _1486 = ~_1342;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1428);
    uint _1494 = uint(int(uint(_1482) >> uint(2)));
    uint _1496 = uint(int(uint(int(_1494)) >> uint(2)));
    int _1498 = int(_1494) & 3;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[int(_1496)][_1498];
    int _1502 = int(_1494) + 1;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    int _1506 = _1502 & 3;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[int(_1504)][_1506];
    int _1510 = _1490;
    if (!_1380)
    {
        int _1512 = ~_1342;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    float _1518 = fma(_1446, _1398, _1476);
    int _1520 = ~_789;
    int _1522 = _1520 + 1;
    float _1524 = fma(_1418, _1398, _1484);
    int _1526 = int(_1388) + int(_1464);
    float _1528 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1474);
    float _1530 = fma(_1454, _1398, _1492);
    int _1532 = abs(_1304);
    float _1534 = -_1472;
    float _1536 = -_914;
    float _1538 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1536);
    int _1540 = _1482 + 8;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = _1522 * _1526;
    int _1560 = _1558 + _1024;
    float _1562 = -_1528;
    float _1564 = _1562 + 1.0;
    bool _1566 = !_1284;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = fma(_1266, _918, _1538);
    float _1572 = float(_1174);
    float _1574 = -_1564;
    float _1576 = fma(_1228, _1574, _1458);
    bool _1578 = uint(_1560) >= uint(_789);
    float _1580 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1518);
    int _1582 = abs(_1568);
    bool _1584 = !_1578;
    int _1586 = _1584 ? 0 : (-1);
    out.m_54.x = _1576;
    out.m_54.y = _1570;
    bool _1588 = uint(_1124) >= 2u;
    float _1590 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1530);
    float _1592 = float(_1582);
    float _1594 = float(_1516);
    float _1596 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1524);
    float _1598 = float(_1532);
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1300 + _1600;
    int _1604 = _1588 ? 0 : 1;
    float _1606 = _1592 * _1594;
    bool _1608 = _1124 != 3;
    float _1610 = _1598 * _1572;
    int _1612 = ~_1604;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    int _1618 = abs(_1180);
    bool _1620 = !_1126;
    int _1622 = _1620 ? 0 : 1;
    int _1624 = ~_1618;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = ~_1526;
    int _1632 = _1630 + _1586;
    int _1634 = _1632 + 1;
    int _1636 = abs(_1622);
    int _1638 = _1628 * as_type<int>(_1508);
    int _1640 = _1616;
    if (_1608)
    {
        int _1642 = ~_1604;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1650 = _1382 + _1648;
    bool _1652 = _1124 != 3;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1656 = _1348 + _1654;
    int _1658 = abs(_1646);
    float _1660 = in.m_56.x;
    float _1662 = in.m_56.y;
    float _1664 = in.m_56.z;
    bool _1666 = !_1652;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1672 = !_1192;
    int _1674 = _1672 ? 0 : 1;
    int _1676 = _789 * _1634;
    int _1678 = _1676 + _1024;
    int _1680 = ~_1636;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1670);
    int _1688 = abs(_1668);
    float _1690 = _1656 * _1656;
    int _1692 = _1684 * as_type<int>(_1500);
    int _1694 = _1692 + _1638;
    int _1696 = abs(_1674);
    float _1698 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1686);
    int _1700 = ~_1658;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    int _1706 = ~_1688;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    bool _1712 = _1698 >= 0.0;
    int _1714 = _1704 * as_type<int>(_1548);
    int _1716 = _1714 + _1694;
    float _1718 = fma(_1602, _1602, _1690);
    float _1720 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1722 = _1710 * as_type<int>(_1556);
    int _1724 = _1722 + _1716;
    float _1726 = _1606 * (-2.0);
    float _1728 = fma(_1650, _1650, _1718);
    int _1730 = ~_1696;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1738 = !_827;
    int _1740 = _1738 ? _1678 : (-1);
    float _1742 = fma(_1346, _1726, _1346);
    float _1744 = fma(_1726, _1660, _1660);
    float _1746 = rsqrt(_1728);
    int _1748 = _1724 * _1734;
    float _1750 = as_type<float>(_1678);
    if (_1712)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1752 = _1750;
    float _1754 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1756 = _1740 * _1696;
    int _1758 = _1756 + _1748;
    float _1760 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1762 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1764 = as_type<int>(_1752);
    if (_1712)
    {
        float _1766 = _1752 * 5.0;
        _1764 = as_type<int>(_1766);
    }
    int _1768 = _1764;
    float _1770 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1772 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1774 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1776 = float(_1758);
    float _1778 = _858 + (-0.5);
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5173 = as_type<float>(_1768);
        out.gl_Position.z = _5173;
    }
    bool _1780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(1.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = _1770 * _1746;
    float _1792 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1744);
    out.m_58.x = _1772;
    out.m_58.y = _1774;
    out.m_58.z = _1754;
    bool _1794 = !_1292;
    int _1796 = _1794 ? 0 : 1;
    float _1798 = _1602 * _1790;
    float _1800 = _1656 * _1790;
    out.m_60.x = _1776;
    if (_1712)
    {
        out.m_37.x = 0.0;
    }
    if (_1712)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1802 = -_1800;
    float _1804 = _1348 + _1802;
    float _1806 = _1610 * (-2.0);
    float _1808 = -_1798;
    float _1810 = _1300 + _1808;
    int _1812 = abs(_1796);
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1816 = _1804 + _1814;
    float _1818 = fma(_1806, _1662, _1662);
    float _1820 = fma(_1344, _1806, _1344);
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1824 = _1810 + _1822;
    float _1826 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1828 = _1650 * _1790;
    float _1830 = _860 + (-0.5);
    float _1832 = -_1800;
    float _1834 = _1656 + _1832;
    float _1836 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1826);
    float _1838 = -_1828;
    float _1840 = _1382 + _1838;
    float _1842 = float(_1276);
    float _1844 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1818);
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1848 = _1840 + _1846;
    bool _1850 = !_1788;
    float _1852 = _1850 ? _87 : _1478;
    float _1854 = -_1798;
    float _1856 = _1602 + _1854;
    float _1858 = float(_1812);
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1836);
    float _1862 = _1834 * _1834;
    float _1864 = fma(_1852, _1820, _1844);
    float _1866 = _1110 + _858;
    float _1868 = _1858 * _1842;
    bool _1870 = _1860 >= 0.0;
    float _1872 = fma(_1852, _1742, _1792);
    float _1874 = fma(_1856, _1856, _1862);
    float _1876 = -_1828;
    float _1878 = _1650 + _1876;
    float _1880 = _1864 * 0.15915493667125701904296875;
    float _1882 = _1866 + (-1.0);
    float _1884 = _1868 * (-2.0);
    float _1886 = _1872 * 0.15915493667125701904296875;
    float _1888 = fma(_1878, _1878, _1874);
    float _1890 = _1880 * 6.283185482025146484375;
    float _1892 = sin(_1890);
    float _1894 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1896 = fma(_1884, _1664, _1664);
    float _1898 = _1110 + (-0.5);
    float _1900 = _1878;
    int _1902 = as_type<int>(_1896);
    if (_1870)
    {
        _1900 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1904 = _1900;
    float _1906 = fma(_1894, _1884, _1894);
    if (_1870)
    {
        out.m_37.x = 0.0;
    }
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1896);
    float _1910 = _1886 * 6.283185482025146484375;
    float _1912 = sin(_1910);
    if (_1870)
    {
        float _1914 = _1904 * 5.0;
        _1902 = as_type<int>(_1914);
    }
    int _1916 = _1902;
    float _1918 = fma(_1852, _1906, _1908);
    if (_1870)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5413 = as_type<float>(_1916);
        out.gl_Position.z = _5413;
    }
    float _1920 = _1886 * 6.283185482025146484375;
    float _1922 = cos(_1920);
    float _1924 = _1918 * 0.15915493667125701904296875;
    float _1926 = sqrt(_1888);
    float _1928 = _1880 * 6.283185482025146484375;
    float _1930 = cos(_1928);
    if (_1870)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1932 = _1924 * 6.283185482025146484375;
    float _1934 = cos(_1932);
    float _1936 = _1746 * _1926;
    float _1938 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1944 = _1720 * _1936;
    float _1946 = _1936 * _1938;
    float _1948 = _1912 * _1892;
    float _1950 = _1924 * 6.283185482025146484375;
    float _1952 = sin(_1950);
    float _1954 = _1942 * _1944;
    float _1956 = _1940 * _1946;
    float _1958 = _1922 * _1930;
    float _1960 = _1922 * _1892;
    float _1962 = _1934 * _1956;
    float _1964 = _1892 * _1934;
    float _1966 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1968 = _1966 * 0.5;
    float _1970 = _1922 * _1962;
    float _1972 = _1930 * _1934;
    float _1974 = _1912 * _1930;
    float _1976 = _1912 * _1962;
    float _1978 = fma(_1952, _1958, _1948);
    float _1980 = -_1956;
    float _1982 = _1952 * _1980;
    float _1984 = fma(_1952, _1948, _1958);
    float _1986 = fma(_1978, _1954, _1970);
    float _1988 = -_1974;
    float _1990 = fma(_1952, _1960, _1988);
    float _1992 = -_1960;
    float _1994 = fma(_1952, _1974, _1992);
    float _1996 = fma(_1972, _1954, _1982);
    float _1998 = fma(_1990, _1968, _1986);
    float _2000 = fma(_1994, _1954, _1976);
    float _2002 = fma(_1964, _1968, _1996);
    float _2004 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2006 = fma(_1984, _1968, _2000);
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2010 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2012 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2008);
    float _2014 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2010);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2012);
    float _2018 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2020 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2022 = _1382 + _2018;
    float _2024 = _1300 + _2020;
    float _2026 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2030 = _2022 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2034 = _2024 + _2032;
    float _2036 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2026);
    float _2038 = _2030 * _2030;
    float _2040 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2036);
    float _2042 = fma(_2034, _2034, _2038);
    float _2044 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2046 = sqrt(_2042);
    float _2048 = _1348 + _2044;
    bool _2050 = _2046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2040;
    float _2054 = _2024;
    float _2056 = _2044;
    float _2058 = _2002;
    if (!_2050)
    {
        _2052 = _2024;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    if (!_2050)
    {
        _2054 = _2022;
    }
    float _2064 = _2054;
    float _2066 = _2064;
    if (!_2050)
    {
        _2056 = _2048;
    }
    float _2068 = _2056;
    bool _2070 = !_2050;
    float _2072 = _2068;
    if (!_2070)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2078 = _2046 + _2076;
        float _2080 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2082 = rsqrt(_2042);
        float _2084 = _2078 * _2074;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = _2086 * 6.283185482025146484375;
        float _2090 = cos(_2088);
        float _2092 = _2086 * 6.283185482025146484375;
        float _2094 = sin(_2092);
        float _2096 = _2090 + (-1.0);
        float _2098 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2100 = fma(_2094, _2080, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2102 = fma(_2048, _2090, _2098);
        float _2104 = _2082 * _2100;
        float _2106 = fma(_2034, _2104, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2108 = fma(_2030, _2104, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2072 = _2102;
        _2062 = _2106;
        _2066 = _2108;
        _2058 = _2086;
    }
    float _2110 = _2072;
    float _2112 = _2062;
    float _2114 = _2066;
    float _2116 = _2058;
    float _2118 = -_1348;
    float _2120 = _2118 + _2110;
    float _2122 = -_1300;
    float _2124 = _2122 + _2112;
    float _2126 = -_1382;
    float _2128 = _2126 + _2114;
    float _2130 = _2120 * _2120;
    float _2132 = fma(_2124, _2124, _2130);
    float _2134 = fma(_2128, _2128, _2132);
    float _2136 = sqrt(_2134);
    bool _2138 = _2136 > 0.0;
    bool _2140 = !_2138;
    float _2142 = _2116;
    float _2144 = _2132;
    float _2146 = _2110;
    float _2148 = _2112;
    float _2150 = _2114;
    if (!_2140)
    {
        bool _2152 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2154 = _2136;
        if (_2152)
        {
            float _2156 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2154 = _2156;
        }
        float _2158 = _2154;
        float _2160 = _2158;
        if (_2152)
        {
            float _2162 = _419 * _2158;
            _2142 = _2162;
        }
        float _2164 = _2142;
        float _2166 = _2164;
        if (_2152)
        {
            float _2168 = _421 * _2158;
            _2144 = _2168;
        }
        float _2170 = _2144;
        float _2172 = _2170;
        if (_2152)
        {
            float _2174 = _423 * _2158;
            _2160 = _2174;
        }
        float _2176 = _2160;
        float _2178 = _2176;
        float _2180 = _2176;
        if (!_2152)
        {
            float _2182 = _87 + 1.0;
            float _2184 = _2182;
            if (!_145)
            {
                float _2186 = _2182 * _2182;
                float _2188 = _2186 * 0.5;
                _2178 = _2188;
            }
            float _2190 = _2178;
            float _2192 = _2190;
            if (!_145)
            {
                float _2194 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2192 = _2194;
            }
            float _2196 = _2192;
            bool _2198 = !_145;
            float _2200 = _2196;
            if (!_2198)
            {
                float _2202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2204 = log2(_2202);
                float _2206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2208 = _2204 * _2182;
                float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2212 = 1.0 + _2210;
                float _2214 = 1.0 / _2212;
                float _2216 = _2206 * 0.693147182464599609375;
                float _2218 = exp2(_2208);
                float _2220 = 1.0 / _2216;
                float _2222 = _2218 + (-1.0);
                float _2224 = -_2222;
                float _2226 = fma(_2224, _2220, _2182);
                float _2228 = _2226 * _2214;
                float _2230 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2200 = _2230;
            }
            float _2232 = _2200;
            float _2234 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2236 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2238 = !_145;
            if (!_2238)
            {
                float _2240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2242 = log2(_2240);
                float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2246 = 1.0 + _2244;
                float _2248 = 1.0 / _2246;
                float _2250 = _2242 * _2182;
                float _2252 = exp2(_2250);
                float _2254 = -_2252;
                float _2256 = _2254 + 1.0;
                float _2258 = _2256 * _2248;
                _2184 = _2258;
            }
            float _2260 = _2184;
            float _2262 = fma(_2260, _149, _2236);
            float _2264 = fma(_2260, _147, _2234);
            float _2266 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2268 = -_377;
            float _2270 = _2268 + _2262;
            float _2272 = -_385;
            float _2274 = _2272 + _2264;
            float _2276 = fma(_2260, _151, _2266);
            float _2278 = _2270 * _161;
            float _2280 = _2270 * _177;
            float _2282 = _2270 * _189;
            float _2284 = -_391;
            float _2286 = _2284 + _2276;
            float _2288 = fma(_2274, _159, _2278);
            float _2290 = fma(_2274, _175, _2280);
            float _2292 = fma(_2274, _187, _2282);
            float _2294 = fma(_2286, _163, _2288);
            float _2296 = fma(_2286, _179, _2290);
            float _2298 = fma(_2286, _191, _2292);
            _429 = _2296;
            _431 = _2294;
            _433 = _2298;
            _2166 = _2294;
            _2172 = _2296;
            _2180 = _2298;
        }
        float _2300 = _429;
        float _2302 = _431;
        float _2304 = _433;
        float _2306 = _2166;
        float _2308 = _2172;
        float _2310 = _2180;
        float _2312 = _2300 * _2300;
        float _2314 = rsqrt(_2134);
        float _2316 = fma(_2302, _2302, _2312);
        float _2318 = fma(_2304, _2304, _2316);
        float _2320 = sqrt(_2318);
        float _2322 = _2124 * _2314;
        float _2324 = _2120 * _2314;
        float _2326 = _2128 * _2314;
        bool _2328 = _2320 > 0.0;
        bool _2330 = !_2328;
        if (!_2330)
        {
            float _2332 = rsqrt(_2318);
            float _2334 = _2332 * _2300;
            float _2336 = _2332 * _2302;
            float _2338 = _2332 * _2304;
            float _2340 = _2324 * _2334;
            float _2342 = fma(_2322, _2336, _2340);
            float _2344 = fma(_2326, _2338, _2342);
            float _2346 = _2344 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2348 = fma(_2306, _2346, _2112);
            float _2350 = fma(_2308, _2346, _2110);
            float _2352 = fma(_2310, _2346, _2114);
            _2146 = _2350;
            _2148 = _2348;
            _2150 = _2352;
        }
    }
    float _2354 = _2146;
    float _2356 = _2148;
    float _2358 = _2150;
    float _2360 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2362 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2364 = -_1800;
    float _2366 = _2364 + _2354;
    float _2368 = -_1798;
    float _2370 = _2368 + _2356;
    float _2372 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2360);
    float _2374 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2362);
    float _2376 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2378 = -_1828;
    float _2380 = _2378 + _2358;
    float _2382 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2372);
    float _2384 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2374);
    float _2386 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2388 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2376);
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2394 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2396 = isnan(0.5);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2402 = _2398 || _2400;
    float _2404 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2386);
    float _2406 = 1.0 / _2390;
    float _2408 = _2392 + _2390;
    float _2410 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2388);
    float _2412 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2404);
    float _2414 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2416 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2418 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2420 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2422 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2424 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2426 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2418);
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2430 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2432 = _2408 * _2406;
    float _2434 = _2432 * 0.5;
    float _2436 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2420);
    float _2438 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2426);
    float _2440 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2422);
    float _2442 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2424);
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2444);
    float _2448 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2428);
    float _2450 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2430);
    float _2452 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2436);
    float _2454 = _2416;
    float _2456 = _2422;
    if (_2402)
    {
        _2454 = 1.0;
    }
    float _2458 = _2454;
    float _2460 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2462 = 1.0 / _2446;
    float _2464 = _2458;
    if (_2402)
    {
        _2456 = 1.0;
    }
    float _2466 = _2456;
    float _2468 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2470 = _2462 * _2468;
    float _2472 = _2466;
    if (!_2402)
    {
        float _2474 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2476 = _2474 * 0.15915493667125701904296875;
        float _2478 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2480 = _2476 * 6.283185482025146484375;
        float _2482 = cos(_2480);
        float _2484 = _2478 * 0.15915493667125701904296875;
        float _2486 = _2476 * 6.283185482025146484375;
        float _2488 = sin(_2486);
        float _2490 = 1.0 / _2482;
        float _2492 = _2484 * 6.283185482025146484375;
        float _2494 = cos(_2492);
        float _2496 = _2488 * _2490;
        float _2498 = _2484 * 6.283185482025146484375;
        float _2500 = sin(_2498);
        float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2504 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2502;
        float _2506 = _2494 * _2496;
        float _2508 = 1.0 / _2504;
        float _2510 = 1.0 / _2506;
        float _2512 = _2500 * _2510;
        float _2514 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2516 = fma(_2470, _2512, _2514);
        float _2518 = _2516 * _2508;
        float _2520 = precise::clamp(_2518, 0.0, 1.0);
        _2464 = _2520;
    }
    float _2522 = _2464;
    if (!_2402)
    {
        float _2524 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2526 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2526 * 0.15915493667125701904296875;
        float _2532 = _2528 * 6.283185482025146484375;
        float _2534 = cos(_2532);
        float _2536 = _2528 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        float _2540 = 1.0 / _2534;
        float _2542 = _2530 * 6.283185482025146484375;
        float _2544 = cos(_2542);
        float _2546 = _2538 * _2540;
        float _2548 = _2530 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        float _2552 = _2544 * _2546;
        float _2554 = 1.0 / _2552;
        float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2558 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2556;
        float _2560 = 1.0 / _2558;
        float _2562 = _2550 * _2554;
        float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2566 = fma(_2470, _2562, _2564);
        float _2568 = _2566 * _2560;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = -_2570;
        float _2574 = _2572 + 1.0;
        _2472 = _2574;
    }
    float _2576 = _2472;
    float _2578 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2580 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2440);
    float _2582 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2448);
    float _2584 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2450);
    bool _2586 = _2522 > 0.0;
    bool _2588 = isnan(_2522);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2442);
    float _2598 = _2522 * _2576;
    float _2600 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2580);
    float _2602 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2584);
    float _2604 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2582);
    bool _2606 = _2576 <= 0.0;
    bool _2608 = !_2594;
    bool _2610 = _2606 || _2608;
    float _2612 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2596);
    float _2614 = _2600 + _2602;
    float _2616 = _2604 + _2602;
    float _2618 = _2602 * 0.5;
    float _2620 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2622 = _2614 * 0.5;
    float _2624 = _2616 * 0.5;
    float _2626 = fma(_2612, -0.5, _2618);
    float _2628 = _2620 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2600;
    out.gl_Position.y = _2612;
    out.gl_Position.z = _2604;
    out.gl_Position.w = _2602;
    out.m_62.x = _2622;
    out.m_62.y = _2626;
    out.m_62.z = _2624;
    out.m_62.w = _2602;
    out.m_37.x = _2628;
    if (!_2610)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2630 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_37.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2630;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _769 = false;
    bool _557 = false;
    bool _453 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = in.m_32.w;
    float _80 = trunc(_76);
    int _83 = int(_80);
    float _85 = -_78;
    float _87 = _85 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _87;
    bool _91 = _83 >= 1;
    float _93 = 0.0;
    float _95 = _78;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _93;
    if (!_91)
    {
        out.m_37.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2697 = as_type<float>(_103);
        out.gl_Position.z = _2697;
    }
    if (!_91)
    {
        return out;
    }
    bool _107 = _78 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_78);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = float(_83);
    bool _119 = _87 >= _117;
    bool _121 = !_115;
    bool _123 = _119 || _121;
    if (_123)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _95;
    if (_123)
    {
        out.m_37.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _105 = as_type<int>(_127);
    }
    int _129 = _105;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_129);
        out.gl_Position.z = _2752;
    }
    if (_123)
    {
        return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _87 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _133;
    if (!_145)
    {
        float _169 = _133 * _133;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    float _181 = _173;
    if (!_145)
    {
        float _183 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = in.m_48.x;
    float _189 = in.m_48.y;
    float _191 = in.m_48.z;
    int _193 = as_type<int>(_131) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_131) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_145;
    float _211 = _185;
    float _213 = 0.0;
    float _215 = 0.0;
    if (!_209)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _133 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _133);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _245;
        _213 = _235;
        _215 = _233;
    }
    float _247 = _211;
    float _249 = _213;
    float _251 = _215;
    bool _253 = !_145;
    float _255 = _249;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _133 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _167 = _277;
    }
    float _279 = _255;
    float _281 = _167;
    float _283 = _279;
    if (!_145)
    {
        float _285 = _87 * _87;
        float _287 = _285 * 0.5;
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _289;
    if (!_145)
    {
        _257 = _87;
    }
    float _293 = _257;
    float _295 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _293;
    if (!_145)
    {
        float _301 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _301;
    }
    float _303 = _291;
    bool _305 = !_145;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _87 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _87);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_145;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _87 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_281, _149, _297);
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = fma(_281, _147, _295);
    float _373 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _375 = fma(_281, _151, _365);
    float _377 = fma(_363, _149, _369);
    float _379 = 1.0 / _117;
    float _381 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_363, _147, _373);
    float _387 = -_377;
    float _389 = _367 + _387;
    float _391 = fma(_363, _151, _381);
    float _393 = fma(_367, _135, _155);
    float _395 = fma(_371, _135, _153);
    float _397 = -_385;
    float _399 = _371 + _397;
    float _401 = _389 * _161;
    float _403 = _389 * _177;
    float _405 = _389 * _189;
    float _407 = -_391;
    float _409 = _375 + _407;
    float _411 = fma(_399, _159, _401);
    float _413 = fma(_399, _175, _403);
    float _415 = fma(_399, _187, _405);
    float _417 = fma(_375, _135, _157);
    float _419 = fma(_409, _163, _411);
    float _421 = fma(_409, _179, _413);
    float _423 = fma(_409, _191, _415);
    float _425 = _87 * _379;
    bool _427 = !_383;
    float _429 = _421;
    float _431 = _419;
    float _433 = _423;
    float _451;
    if (!_427)
    {
        float _435 = in.m_50.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[12].x, _87);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _425;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _455 + _457;
    float _461 = in.m_42.x;
    float _463 = in.m_42.y;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _497;
    float _501 = 1.0 / _479;
    bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _505 = _491 * _495;
    float _507 = -_491;
    float _509 = _507 + 1.0;
    float _511 = _459 * _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _513;
    float _517 = fma(_499, _511, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _519 = fma(_515, _511, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _521 = _517 * _505;
    float _523 = _519 * _505;
    float _525 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _527 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[143].y, _523);
    float _529 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[144].x, _525);
    float _531 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[144].y, _527);
    float _533 = _529 * _461;
    float _535 = _531 * _463;
    bool _537 = !_503;
    float _555;
    if (!_537)
    {
        float _539 = in.m_50.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _87);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        _555 = _425;
    }
    _557 = false;
    float _559 = _555;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _559 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = isnan(_559);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _567;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _597 = isnan(_559);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _609 = 1.0 / _575;
    float _611 = _571 * _589;
    bool _613 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_559);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _593;
    float _627 = -_587;
    float _629 = _627 + 1.0;
    float _631 = fma(_611, _563, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _637 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _639 = isnan(_559);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_623;
    float _651 = _649 + 1.0;
    float _653 = _623 * _629;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = 1.0 / _635;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    float _665 = _605 * _651;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _667;
    float _671 = _657 * _609;
    float _673 = _587 * _663;
    float _675 = _631 * _665;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _559 + _677;
    float _681 = -_605;
    float _683 = _681 + 1.0;
    float _685 = _669 * _625;
    bool _687 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _689 = isnan(_559);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = _559 + _703;
    float _707 = fma(_671, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _709 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _711 = -_697;
    float _713 = _711 + 1.0;
    float _715 = _701 * _659;
    float _717 = fma(_685, _705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _721 = _559 + _719;
    float _723 = fma(_707, _653, _709);
    float _725 = _647 * _713;
    float _727 = fma(_715, _721, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _729 = fma(_717, _673, _723);
    float _731 = fma(_727, _725, _729);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _739 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[119].x, _731);
    float _741 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = _739 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _741;
    out.m_52.y = _743;
    out.m_52.z = _745;
    out.m_52.w = _747;
    bool _749 = !_607;
    float _767;
    if (!_749)
    {
        float _751 = in.m_50.x;
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _755 = _751 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].z, _87);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        _767 = _425;
    }
    _769 = false;
    float _771 = _767;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _775 = int(_773);
    float _777 = _393 * _177;
    float _779 = in.m_48.w;
    float _781 = fma(_395, _175, _777);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = _771 + _783;
    float _787 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _789 = int(_787);
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _793 = fma(_417, _179, _781);
    float _795 = in.m_44.w;
    bool _797 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _799 = isnan(_771);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = float(_775);
    float _811 = 1.0 / _809;
    float _813 = float(uint(_789));
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _817 = ~_789;
    int _819 = _817 + 1;
    int _821 = ~_789;
    int _823 = _821 + 1;
    float _825 = 1.0 / _813;
    bool _827 = _789 == 0;
    int _829 = ~_789;
    int _831 = _829 + 1;
    float _833 = _87 * _811;
    float _835 = trunc(_833);
    int _837 = int(_835);
    int _839 = as_type<int>(_825) + (-2);
    float _841 = float(uint(_837));
    float _843 = as_type<float>(_839) * _841;
    float _845 = trunc(_843);
    float _847 = precise::max(_845, 0.0);
    uint _850 = uint(_847);
    float _852 = float(_837);
    int _854 = _819 * int(_850);
    int _856 = _854 + _837;
    float _858 = in.m_50.x;
    float _860 = in.m_50.y;
    float _862 = float(uint(_856));
    float _864 = as_type<float>(_839) * _862;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _868 = _866 != 0;
    float _870 = trunc(_864);
    float _872 = precise::max(_870, 0.0);
    uint _874 = uint(_872);
    bool _876 = !_868;
    float _878 = _876 ? 7.345489978790283203125 : 1.0;
    float _880 = _878 * _858;
    float _882 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _884 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].w, _815);
    float _888 = floor(_880);
    int _890 = int(_850) + int(_874);
    float _892 = fma(_884, -2.0, _791);
    float _894 = float(_789);
    float _896 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[77].w, _886);
    int _898 = _823 * _890;
    int _900 = _898 + _837;
    bool _902 = _852 >= _894;
    bool _904 = isnan(_852);
    bool _906 = _902 || _904;
    bool _908 = isnan(_894);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[76].y, _892);
    float _916 = -_896;
    float _918 = _916 + 1.0;
    bool _920 = uint(_900) >= uint(_789);
    float _922 = trunc(_912);
    int _924 = int(_922);
    bool _926 = !_920;
    int _928 = _926 ? 0 : (-1);
    float _930 = -_888;
    float _932 = _880 + _930;
    int _934 = ~_890;
    int _936 = _934 + _928;
    int _938 = _936 + 1;
    float _940 = _932 * _894;
    float _942 = _87 * _894;
    int _944 = _789 * _938;
    int _946 = _944 + _837;
    float _948 = _942 * _379;
    float _950 = trunc(_940);
    int _952 = int(_950);
    int _954 = ~_924;
    int _956 = _954 + 1;
    int _958 = _956 + 1;
    bool _960 = !_827;
    int _962 = _960 ? _946 : (-1);
    float _964 = trunc(_948);
    int _966 = int(_964);
    int _968 = _962 * _958;
    int _970 = _789 + (-1);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _986 = _984 != 0;
    int _988 = _924 * _970;
    int _990 = _988 + _968;
    bool _992 = !_978;
    int _994 = _992 ? 0 : 1;
    bool _996 = !_974;
    int _998 = _996 ? 0 : 1;
    bool _1000 = !_986;
    int _1002 = _1000 ? 0 : 1;
    int _1004 = abs(_994);
    bool _1006 = !_982;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = abs(_998);
    int _1012 = _990 * _1004;
    int _1014 = abs(_1002);
    int _1016 = abs(_1008);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1020 = _1018 != 0;
    int _1022 = _952 * _1014;
    int _1024 = _1022 + _837;
    bool _1026 = !_1020;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _966 * _1010;
    int _1032 = _1030 + _1012;
    int _1034 = abs(_1028);
    float _1036 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1038 = log2(_1036);
    int _1040 = ~_789;
    int _1042 = _1040 + 1;
    int _1044 = _1024 * _1016;
    int _1046 = _1044 + _1032;
    int _1048 = _952 * _1034;
    int _1050 = _1048 + _1046;
    int _1052 = ~_789;
    int _1054 = _1052 + 1;
    float _1056 = float(uint(_1050));
    float _1058 = as_type<float>(_839) * _1056;
    float _1060 = _87 * _1038;
    float _1062 = trunc(_1058);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    float _1068 = exp2(_1060);
    int _1070 = _1054 * int(_1066);
    int _1072 = _1070 + _1050;
    float _1074 = float(uint(_1072));
    float _1076 = -_1068;
    float _1078 = _1076 + 1.0;
    float _1080 = as_type<float>(_839) * _1074;
    float _1082 = trunc(_1080);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = int(_1066) + int(_1086);
    int _1090 = _1042 * _1088;
    int _1092 = _1090 + _1050;
    bool _1094 = uint(_1092) >= uint(_789);
    float _1096 = _858 * 2.0;
    bool _1098 = !_1094;
    int _1100 = _1098 ? 0 : (-1);
    float _1102 = floor(_1096);
    int _1104 = ~_1088;
    int _1106 = _1104 + _1100;
    int _1108 = _1106 + 1;
    float _1110 = in.m_50.z;
    int _1112 = _789 * _1108;
    int _1114 = _1112 + _1050;
    float _1116 = _860 * 2.0;
    bool _1118 = !_827;
    int _1120 = _1118 ? _1114 : (-1);
    float _1122 = floor(_1116);
    int _1124 = _1120 & 3;
    bool _1126 = _1124 != 0;
    bool _1128 = _1102 > 0.0;
    bool _1130 = uint(_1124) > 1u;
    bool _1132 = _1102 >= 0.0;
    bool _1134 = isnan(_1102);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    int _1142 = _1120 & 3;
    bool _1144 = _1142 != 0;
    int _1146 = _1140 ? 0 : 1;
    int _1148 = _1144 ? 0 : 1;
    float _1150 = _1110 * 2.0;
    bool _1152 = _860 > 0.5;
    int _1154 = ~_1146;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = ~_1148;
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    int _1166 = _1158;
    int _1168 = _1164;
    if (!_1128)
    {
        int _1170 = ~_1146;
        int _1172 = _1170 + 1;
        _1166 = _1172;
    }
    int _1174 = _1166;
    if (!_1130)
    {
        int _1176 = ~_1148;
        int _1178 = _1176 + 1;
        _1168 = _1178;
    }
    int _1180 = _1168;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1182;
    float _1186 = -_207;
    int _1188 = _1152 ? as_type<int>(_1186) : as_type<int>(_207);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1192 = _1190 != 0;
    float _1194 = 1.0 / _1184;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    bool _1204 = _858 > 0.5;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1208 = -_203;
    int _1210 = _1204 ? as_type<int>(_1208) : as_type<int>(_203);
    bool _1212 = _1122 >= 0.0;
    bool _1214 = isnan(_1122);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = -_1206;
    float _1224 = fma(_882, 2.0, _1222);
    bool _1226 = !_1198;
    float _1228 = _1226 ? _203 : as_type<float>(_1210);
    float _1230 = in.m_46.w;
    int _1232 = _1220 ? 0 : 1;
    float _1234 = _785 * _1194;
    bool _1236 = _1122 > 0.0;
    float _1238 = _393 * _161;
    float _1240 = _393 * _189;
    int _1242 = ~_1232;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1248;
    float _1252 = fma(_395, _159, _1238);
    float _1254 = fma(_395, _187, _1240);
    float _1256 = _860 + _1110;
    float _1258 = floor(_1150);
    float _1260 = fma(_417, _163, _1252);
    float _1262 = fma(_417, _191, _1254);
    bool _1264 = !_1202;
    float _1266 = _1264 ? _207 : as_type<float>(_1188);
    float _1268 = _860 + _858;
    int _1270 = _1246;
    if (!_1236)
    {
        int _1272 = ~_1232;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1280 = _771 + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1292 = _1290 != 0;
    float _1294 = _1268 + (-1.0);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1300 = _1260 + _795;
    bool _1302 = !_1288;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = 1.0 / _1298;
    bool _1308 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1310 = isnan(_771);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = fma(_1250, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1322 = _1258 >= 0.0;
    bool _1324 = isnan(_1258);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    float _1332 = _1256 + (-1.0);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1338 = -_87;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    int _1342 = _1330 ? 0 : 1;
    float _1344 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1346 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1348 = _793 + _1230;
    float _1350 = float(uint(_1024));
    bool _1352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1354 = isnan(0.0);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1360 = _1356 || _1358;
    bool _1362 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1364 = isnan(_771);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = as_type<float>(_839) * _1350;
    float _1376 = _1280 * _1306;
    float _1378 = _1360 ? _1078 : 0.0;
    bool _1380 = _1258 > 0.0;
    float _1382 = _1262 + _779;
    float _1384 = trunc(_1374);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    float _1390 = -_1372;
    float _1392 = _1390 + 1.0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1394;
    float _1398 = _807 * _1392;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1400;
    float _1404 = -_807;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1396, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1414 = fma(_1402, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1416 = _1318 * _1406;
    float _1418 = fma(_1412, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1420 = _831 * int(_1388);
    int _1422 = _1420 + _1024;
    float _1424 = _1320 * _1416;
    float _1426 = _1408 * _1416;
    float _1428 = _1414 * _1416;
    int _1430 = _1120 >> 31;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1434 = 1.0 + _1432;
    float _1436 = float(uint(_1422));
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1442 = _1430 & 3;
    float _1444 = 1.0 / _1434;
    float _1446 = fma(_1336, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1448 = as_type<float>(_839) * _1436;
    int _1450 = _1120 + _1442;
    float _1452 = _1228 + 0.5;
    float _1454 = fma(_1440, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1456 = _1450 >> 2;
    float _1458 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1340);
    float _1460 = trunc(_1448);
    float _1462 = precise::max(_1460, 0.0);
    uint _1464 = uint(_1462);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1468 = -_1318;
    float _1470 = _1468 + 1.0;
    float _1472 = _1266 + (-0.5);
    float _1474 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1466);
    float _1476 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1424);
    float _1478 = _1378 * _1444;
    int _1480 = _1456 << 4;
    int _1482 = _1480 + 368;
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1426);
    int _1486 = ~_1342;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1428);
    uint _1494 = uint(int(uint(_1482) >> uint(2)));
    uint _1496 = uint(int(uint(int(_1494)) >> uint(2)));
    int _1498 = int(_1494) & 3;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[int(_1496)][_1498];
    int _1502 = int(_1494) + 1;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    int _1506 = _1502 & 3;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[int(_1504)][_1506];
    int _1510 = _1490;
    if (!_1380)
    {
        int _1512 = ~_1342;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    float _1518 = fma(_1446, _1398, _1476);
    int _1520 = ~_789;
    int _1522 = _1520 + 1;
    float _1524 = fma(_1418, _1398, _1484);
    int _1526 = int(_1388) + int(_1464);
    float _1528 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1474);
    float _1530 = fma(_1454, _1398, _1492);
    int _1532 = abs(_1304);
    float _1534 = -_1472;
    float _1536 = -_914;
    float _1538 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1536);
    int _1540 = _1482 + 8;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = _1522 * _1526;
    int _1560 = _1558 + _1024;
    float _1562 = -_1528;
    float _1564 = _1562 + 1.0;
    bool _1566 = !_1284;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = fma(_1266, _918, _1538);
    float _1572 = float(_1174);
    float _1574 = -_1564;
    float _1576 = fma(_1228, _1574, _1458);
    bool _1578 = uint(_1560) >= uint(_789);
    float _1580 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1518);
    int _1582 = abs(_1568);
    bool _1584 = !_1578;
    int _1586 = _1584 ? 0 : (-1);
    out.m_54.x = _1576;
    out.m_54.y = _1570;
    bool _1588 = uint(_1124) >= 2u;
    float _1590 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1530);
    float _1592 = float(_1582);
    float _1594 = float(_1516);
    float _1596 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1524);
    float _1598 = float(_1532);
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1300 + _1600;
    int _1604 = _1588 ? 0 : 1;
    float _1606 = _1592 * _1594;
    bool _1608 = _1124 != 3;
    float _1610 = _1598 * _1572;
    int _1612 = ~_1604;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    int _1618 = abs(_1180);
    bool _1620 = !_1126;
    int _1622 = _1620 ? 0 : 1;
    int _1624 = ~_1618;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = ~_1526;
    int _1632 = _1630 + _1586;
    int _1634 = _1632 + 1;
    int _1636 = abs(_1622);
    int _1638 = _1628 * as_type<int>(_1508);
    int _1640 = _1616;
    if (_1608)
    {
        int _1642 = ~_1604;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1650 = _1382 + _1648;
    bool _1652 = _1124 != 3;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1656 = _1348 + _1654;
    int _1658 = abs(_1646);
    float _1660 = in.m_56.x;
    float _1662 = in.m_56.y;
    float _1664 = in.m_56.z;
    bool _1666 = !_1652;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1672 = !_1192;
    int _1674 = _1672 ? 0 : 1;
    int _1676 = _789 * _1634;
    int _1678 = _1676 + _1024;
    int _1680 = ~_1636;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1670);
    int _1688 = abs(_1668);
    float _1690 = _1656 * _1656;
    int _1692 = _1684 * as_type<int>(_1500);
    int _1694 = _1692 + _1638;
    int _1696 = abs(_1674);
    float _1698 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1686);
    int _1700 = ~_1658;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    int _1706 = ~_1688;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    bool _1712 = _1698 >= 0.0;
    int _1714 = _1704 * as_type<int>(_1548);
    int _1716 = _1714 + _1694;
    float _1718 = fma(_1602, _1602, _1690);
    float _1720 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1722 = _1710 * as_type<int>(_1556);
    int _1724 = _1722 + _1716;
    float _1726 = _1606 * (-2.0);
    float _1728 = fma(_1650, _1650, _1718);
    int _1730 = ~_1696;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1738 = !_827;
    int _1740 = _1738 ? _1678 : (-1);
    float _1742 = fma(_1346, _1726, _1346);
    float _1744 = fma(_1726, _1660, _1660);
    float _1746 = rsqrt(_1728);
    int _1748 = _1724 * _1734;
    float _1750 = as_type<float>(_1678);
    if (_1712)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1752 = _1750;
    float _1754 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1756 = _1740 * _1696;
    int _1758 = _1756 + _1748;
    float _1760 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1762 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1764 = as_type<int>(_1752);
    if (_1712)
    {
        float _1766 = _1752 * 5.0;
        _1764 = as_type<int>(_1766);
    }
    int _1768 = _1764;
    float _1770 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1772 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1774 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1776 = float(_1758);
    float _1778 = _858 + (-0.5);
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5173 = as_type<float>(_1768);
        out.gl_Position.z = _5173;
    }
    bool _1780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(1.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = _1770 * _1746;
    float _1792 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1744);
    out.m_58.x = _1772;
    out.m_58.y = _1774;
    out.m_58.z = _1754;
    bool _1794 = !_1292;
    int _1796 = _1794 ? 0 : 1;
    float _1798 = _1602 * _1790;
    float _1800 = _1656 * _1790;
    out.m_60.x = _1776;
    if (_1712)
    {
        out.m_37.x = 0.0;
    }
    if (_1712)
    {
        return out;
    }
    float _1802 = -_1800;
    float _1804 = _1348 + _1802;
    float _1806 = _1610 * (-2.0);
    float _1808 = -_1798;
    float _1810 = _1300 + _1808;
    int _1812 = abs(_1796);
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1816 = _1804 + _1814;
    float _1818 = fma(_1806, _1662, _1662);
    float _1820 = fma(_1344, _1806, _1344);
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1824 = _1810 + _1822;
    float _1826 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1828 = _1650 * _1790;
    float _1830 = _860 + (-0.5);
    float _1832 = -_1800;
    float _1834 = _1656 + _1832;
    float _1836 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1826);
    float _1838 = -_1828;
    float _1840 = _1382 + _1838;
    float _1842 = float(_1276);
    float _1844 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1818);
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1848 = _1840 + _1846;
    bool _1850 = !_1788;
    float _1852 = _1850 ? _87 : _1478;
    float _1854 = -_1798;
    float _1856 = _1602 + _1854;
    float _1858 = float(_1812);
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1836);
    float _1862 = _1834 * _1834;
    float _1864 = fma(_1852, _1820, _1844);
    float _1866 = _1110 + _858;
    float _1868 = _1858 * _1842;
    bool _1870 = _1860 >= 0.0;
    float _1872 = fma(_1852, _1742, _1792);
    float _1874 = fma(_1856, _1856, _1862);
    float _1876 = -_1828;
    float _1878 = _1650 + _1876;
    float _1880 = _1864 * 0.15915493667125701904296875;
    float _1882 = _1866 + (-1.0);
    float _1884 = _1868 * (-2.0);
    float _1886 = _1872 * 0.15915493667125701904296875;
    float _1888 = fma(_1878, _1878, _1874);
    float _1890 = _1880 * 6.283185482025146484375;
    float _1892 = sin(_1890);
    float _1894 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1896 = fma(_1884, _1664, _1664);
    float _1898 = _1110 + (-0.5);
    float _1900 = _1878;
    int _1902 = as_type<int>(_1896);
    if (_1870)
    {
        _1900 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1904 = _1900;
    float _1906 = fma(_1894, _1884, _1894);
    if (_1870)
    {
        out.m_37.x = 0.0;
    }
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1896);
    float _1910 = _1886 * 6.283185482025146484375;
    float _1912 = sin(_1910);
    if (_1870)
    {
        float _1914 = _1904 * 5.0;
        _1902 = as_type<int>(_1914);
    }
    int _1916 = _1902;
    float _1918 = fma(_1852, _1906, _1908);
    if (_1870)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5413 = as_type<float>(_1916);
        out.gl_Position.z = _5413;
    }
    float _1920 = _1886 * 6.283185482025146484375;
    float _1922 = cos(_1920);
    float _1924 = _1918 * 0.15915493667125701904296875;
    float _1926 = sqrt(_1888);
    float _1928 = _1880 * 6.283185482025146484375;
    float _1930 = cos(_1928);
    if (_1870)
    {
        return out;
    }
    float _1932 = _1924 * 6.283185482025146484375;
    float _1934 = cos(_1932);
    float _1936 = _1746 * _1926;
    float _1938 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1944 = _1720 * _1936;
    float _1946 = _1936 * _1938;
    float _1948 = _1912 * _1892;
    float _1950 = _1924 * 6.283185482025146484375;
    float _1952 = sin(_1950);
    float _1954 = _1942 * _1944;
    float _1956 = _1940 * _1946;
    float _1958 = _1922 * _1930;
    float _1960 = _1922 * _1892;
    float _1962 = _1934 * _1956;
    float _1964 = _1892 * _1934;
    float _1966 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1968 = _1966 * 0.5;
    float _1970 = _1922 * _1962;
    float _1972 = _1930 * _1934;
    float _1974 = _1912 * _1930;
    float _1976 = _1912 * _1962;
    float _1978 = fma(_1952, _1958, _1948);
    float _1980 = -_1956;
    float _1982 = _1952 * _1980;
    float _1984 = fma(_1952, _1948, _1958);
    float _1986 = fma(_1978, _1954, _1970);
    float _1988 = -_1974;
    float _1990 = fma(_1952, _1960, _1988);
    float _1992 = -_1960;
    float _1994 = fma(_1952, _1974, _1992);
    float _1996 = fma(_1972, _1954, _1982);
    float _1998 = fma(_1990, _1968, _1986);
    float _2000 = fma(_1994, _1954, _1976);
    float _2002 = fma(_1964, _1968, _1996);
    float _2004 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2006 = fma(_1984, _1968, _2000);
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2010 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2012 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2008);
    float _2014 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2010);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2012);
    float _2018 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2020 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2022 = _1382 + _2018;
    float _2024 = _1300 + _2020;
    float _2026 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2030 = _2022 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2034 = _2024 + _2032;
    float _2036 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2026);
    float _2038 = _2030 * _2030;
    float _2040 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2036);
    float _2042 = fma(_2034, _2034, _2038);
    float _2044 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2046 = sqrt(_2042);
    float _2048 = _1348 + _2044;
    bool _2050 = _2046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2040;
    float _2054 = _2024;
    float _2056 = _2044;
    float _2058 = _2002;
    if (!_2050)
    {
        _2052 = _2024;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    if (!_2050)
    {
        _2054 = _2022;
    }
    float _2064 = _2054;
    float _2066 = _2064;
    if (!_2050)
    {
        _2056 = _2048;
    }
    float _2068 = _2056;
    bool _2070 = !_2050;
    float _2072 = _2068;
    if (!_2070)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2078 = _2046 + _2076;
        float _2080 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2082 = rsqrt(_2042);
        float _2084 = _2078 * _2074;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = _2086 * 6.283185482025146484375;
        float _2090 = cos(_2088);
        float _2092 = _2086 * 6.283185482025146484375;
        float _2094 = sin(_2092);
        float _2096 = _2090 + (-1.0);
        float _2098 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2100 = fma(_2094, _2080, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2102 = fma(_2048, _2090, _2098);
        float _2104 = _2082 * _2100;
        float _2106 = fma(_2034, _2104, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2108 = fma(_2030, _2104, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2072 = _2102;
        _2062 = _2106;
        _2066 = _2108;
        _2058 = _2086;
    }
    float _2110 = _2072;
    float _2112 = _2062;
    float _2114 = _2066;
    float _2116 = _2058;
    float _2118 = -_1348;
    float _2120 = _2118 + _2110;
    float _2122 = -_1300;
    float _2124 = _2122 + _2112;
    float _2126 = -_1382;
    float _2128 = _2126 + _2114;
    float _2130 = _2120 * _2120;
    float _2132 = fma(_2124, _2124, _2130);
    float _2134 = fma(_2128, _2128, _2132);
    float _2136 = sqrt(_2134);
    bool _2138 = _2136 > 0.0;
    bool _2140 = !_2138;
    float _2142 = _2116;
    float _2144 = _2132;
    float _2146 = _2110;
    float _2148 = _2112;
    float _2150 = _2114;
    if (!_2140)
    {
        bool _2152 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2154 = _2136;
        if (_2152)
        {
            float _2156 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2154 = _2156;
        }
        float _2158 = _2154;
        float _2160 = _2158;
        if (_2152)
        {
            float _2162 = _419 * _2158;
            _2142 = _2162;
        }
        float _2164 = _2142;
        float _2166 = _2164;
        if (_2152)
        {
            float _2168 = _421 * _2158;
            _2144 = _2168;
        }
        float _2170 = _2144;
        float _2172 = _2170;
        if (_2152)
        {
            float _2174 = _423 * _2158;
            _2160 = _2174;
        }
        float _2176 = _2160;
        float _2178 = _2176;
        float _2180 = _2176;
        if (!_2152)
        {
            float _2182 = _87 + 1.0;
            float _2184 = _2182;
            if (!_145)
            {
                float _2186 = _2182 * _2182;
                float _2188 = _2186 * 0.5;
                _2178 = _2188;
            }
            float _2190 = _2178;
            float _2192 = _2190;
            if (!_145)
            {
                float _2194 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2192 = _2194;
            }
            float _2196 = _2192;
            bool _2198 = !_145;
            float _2200 = _2196;
            if (!_2198)
            {
                float _2202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2204 = log2(_2202);
                float _2206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2208 = _2204 * _2182;
                float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2212 = 1.0 + _2210;
                float _2214 = 1.0 / _2212;
                float _2216 = _2206 * 0.693147182464599609375;
                float _2218 = exp2(_2208);
                float _2220 = 1.0 / _2216;
                float _2222 = _2218 + (-1.0);
                float _2224 = -_2222;
                float _2226 = fma(_2224, _2220, _2182);
                float _2228 = _2226 * _2214;
                float _2230 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2200 = _2230;
            }
            float _2232 = _2200;
            float _2234 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2236 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2238 = !_145;
            if (!_2238)
            {
                float _2240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2242 = log2(_2240);
                float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2246 = 1.0 + _2244;
                float _2248 = 1.0 / _2246;
                float _2250 = _2242 * _2182;
                float _2252 = exp2(_2250);
                float _2254 = -_2252;
                float _2256 = _2254 + 1.0;
                float _2258 = _2256 * _2248;
                _2184 = _2258;
            }
            float _2260 = _2184;
            float _2262 = fma(_2260, _149, _2236);
            float _2264 = fma(_2260, _147, _2234);
            float _2266 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2268 = -_377;
            float _2270 = _2268 + _2262;
            float _2272 = -_385;
            float _2274 = _2272 + _2264;
            float _2276 = fma(_2260, _151, _2266);
            float _2278 = _2270 * _161;
            float _2280 = _2270 * _177;
            float _2282 = _2270 * _189;
            float _2284 = -_391;
            float _2286 = _2284 + _2276;
            float _2288 = fma(_2274, _159, _2278);
            float _2290 = fma(_2274, _175, _2280);
            float _2292 = fma(_2274, _187, _2282);
            float _2294 = fma(_2286, _163, _2288);
            float _2296 = fma(_2286, _179, _2290);
            float _2298 = fma(_2286, _191, _2292);
            _429 = _2296;
            _431 = _2294;
            _433 = _2298;
            _2166 = _2294;
            _2172 = _2296;
            _2180 = _2298;
        }
        float _2300 = _429;
        float _2302 = _431;
        float _2304 = _433;
        float _2306 = _2166;
        float _2308 = _2172;
        float _2310 = _2180;
        float _2312 = _2300 * _2300;
        float _2314 = rsqrt(_2134);
        float _2316 = fma(_2302, _2302, _2312);
        float _2318 = fma(_2304, _2304, _2316);
        float _2320 = sqrt(_2318);
        float _2322 = _2124 * _2314;
        float _2324 = _2120 * _2314;
        float _2326 = _2128 * _2314;
        bool _2328 = _2320 > 0.0;
        bool _2330 = !_2328;
        if (!_2330)
        {
            float _2332 = rsqrt(_2318);
            float _2334 = _2332 * _2300;
            float _2336 = _2332 * _2302;
            float _2338 = _2332 * _2304;
            float _2340 = _2324 * _2334;
            float _2342 = fma(_2322, _2336, _2340);
            float _2344 = fma(_2326, _2338, _2342);
            float _2346 = _2344 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2348 = fma(_2306, _2346, _2112);
            float _2350 = fma(_2308, _2346, _2110);
            float _2352 = fma(_2310, _2346, _2114);
            _2146 = _2350;
            _2148 = _2348;
            _2150 = _2352;
        }
    }
    float _2354 = _2146;
    float _2356 = _2148;
    float _2358 = _2150;
    float _2360 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2362 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2364 = -_1800;
    float _2366 = _2364 + _2354;
    float _2368 = -_1798;
    float _2370 = _2368 + _2356;
    float _2372 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2360);
    float _2374 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2362);
    float _2376 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2378 = -_1828;
    float _2380 = _2378 + _2358;
    float _2382 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2372);
    float _2384 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2374);
    float _2386 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2388 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2376);
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2394 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2396 = isnan(0.5);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2402 = _2398 || _2400;
    float _2404 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2386);
    float _2406 = 1.0 / _2390;
    float _2408 = _2392 + _2390;
    float _2410 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2388);
    float _2412 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2404);
    float _2414 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2416 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2418 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2420 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2422 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2424 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2426 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2418);
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2430 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2432 = _2408 * _2406;
    float _2434 = _2432 * 0.5;
    float _2436 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2420);
    float _2438 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2426);
    float _2440 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2422);
    float _2442 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2424);
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2444);
    float _2448 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2428);
    float _2450 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2430);
    float _2452 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2436);
    float _2454 = _2416;
    float _2456 = _2422;
    if (_2402)
    {
        _2454 = 1.0;
    }
    float _2458 = _2454;
    float _2460 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2462 = 1.0 / _2446;
    float _2464 = _2458;
    if (_2402)
    {
        _2456 = 1.0;
    }
    float _2466 = _2456;
    float _2468 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2470 = _2462 * _2468;
    float _2472 = _2466;
    if (!_2402)
    {
        float _2474 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2476 = _2474 * 0.15915493667125701904296875;
        float _2478 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2480 = _2476 * 6.283185482025146484375;
        float _2482 = cos(_2480);
        float _2484 = _2478 * 0.15915493667125701904296875;
        float _2486 = _2476 * 6.283185482025146484375;
        float _2488 = sin(_2486);
        float _2490 = 1.0 / _2482;
        float _2492 = _2484 * 6.283185482025146484375;
        float _2494 = cos(_2492);
        float _2496 = _2488 * _2490;
        float _2498 = _2484 * 6.283185482025146484375;
        float _2500 = sin(_2498);
        float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2504 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2502;
        float _2506 = _2494 * _2496;
        float _2508 = 1.0 / _2504;
        float _2510 = 1.0 / _2506;
        float _2512 = _2500 * _2510;
        float _2514 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2516 = fma(_2470, _2512, _2514);
        float _2518 = _2516 * _2508;
        float _2520 = precise::clamp(_2518, 0.0, 1.0);
        _2464 = _2520;
    }
    float _2522 = _2464;
    if (!_2402)
    {
        float _2524 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2526 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2526 * 0.15915493667125701904296875;
        float _2532 = _2528 * 6.283185482025146484375;
        float _2534 = cos(_2532);
        float _2536 = _2528 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        float _2540 = 1.0 / _2534;
        float _2542 = _2530 * 6.283185482025146484375;
        float _2544 = cos(_2542);
        float _2546 = _2538 * _2540;
        float _2548 = _2530 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        float _2552 = _2544 * _2546;
        float _2554 = 1.0 / _2552;
        float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2558 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2556;
        float _2560 = 1.0 / _2558;
        float _2562 = _2550 * _2554;
        float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2566 = fma(_2470, _2562, _2564);
        float _2568 = _2566 * _2560;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = -_2570;
        float _2574 = _2572 + 1.0;
        _2472 = _2574;
    }
    float _2576 = _2472;
    float _2578 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2580 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2440);
    float _2582 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2448);
    float _2584 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2450);
    bool _2586 = _2522 > 0.0;
    bool _2588 = isnan(_2522);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2442);
    float _2598 = _2522 * _2576;
    float _2600 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2580);
    float _2602 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2584);
    float _2604 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2582);
    bool _2606 = _2576 <= 0.0;
    bool _2608 = !_2594;
    bool _2610 = _2606 || _2608;
    float _2612 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2596);
    float _2614 = _2600 + _2602;
    float _2616 = _2604 + _2602;
    float _2618 = _2602 * 0.5;
    float _2620 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2622 = _2614 * 0.5;
    float _2624 = _2616 * 0.5;
    float _2626 = fma(_2612, -0.5, _2618);
    float _2628 = _2620 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2600;
    out.gl_Position.y = _2612;
    out.gl_Position.z = _2604;
    out.gl_Position.w = _2602;
    out.m_62.x = _2622;
    out.m_62.y = _2626;
    out.m_62.z = _2624;
    out.m_62.w = _2602;
    out.m_37.x = _2628;
    if (!_2610)
    {
        return out;
    }
    float _2630 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_37.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2630;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _769 = false;
    bool _557 = false;
    bool _453 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = in.m_32.w;
    float _80 = trunc(_76);
    int _83 = int(_80);
    float _85 = -_78;
    float _87 = _85 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _87;
    bool _91 = _83 >= 1;
    float _93 = 0.0;
    float _95 = _78;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _93;
    if (!_91)
    {
        out.m_37.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2697 = as_type<float>(_103);
        out.gl_Position.z = _2697;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _107 = _78 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_78);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = float(_83);
    bool _119 = _87 >= _117;
    bool _121 = !_115;
    bool _123 = _119 || _121;
    if (_123)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _95;
    if (_123)
    {
        out.m_37.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _105 = as_type<int>(_127);
    }
    int _129 = _105;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_129);
        out.gl_Position.z = _2752;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _87 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _133;
    if (!_145)
    {
        float _169 = _133 * _133;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    float _181 = _173;
    if (!_145)
    {
        float _183 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = in.m_48.x;
    float _189 = in.m_48.y;
    float _191 = in.m_48.z;
    int _193 = as_type<int>(_131) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_131) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_145;
    float _211 = _185;
    float _213 = 0.0;
    float _215 = 0.0;
    if (!_209)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _133 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _133);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _245;
        _213 = _235;
        _215 = _233;
    }
    float _247 = _211;
    float _249 = _213;
    float _251 = _215;
    bool _253 = !_145;
    float _255 = _249;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _133 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _167 = _277;
    }
    float _279 = _255;
    float _281 = _167;
    float _283 = _279;
    if (!_145)
    {
        float _285 = _87 * _87;
        float _287 = _285 * 0.5;
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _289;
    if (!_145)
    {
        _257 = _87;
    }
    float _293 = _257;
    float _295 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _293;
    if (!_145)
    {
        float _301 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _301;
    }
    float _303 = _291;
    bool _305 = !_145;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _87 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _87);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_145;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _87 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_281, _149, _297);
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = fma(_281, _147, _295);
    float _373 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _375 = fma(_281, _151, _365);
    float _377 = fma(_363, _149, _369);
    float _379 = 1.0 / _117;
    float _381 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_363, _147, _373);
    float _387 = -_377;
    float _389 = _367 + _387;
    float _391 = fma(_363, _151, _381);
    float _393 = fma(_367, _135, _155);
    float _395 = fma(_371, _135, _153);
    float _397 = -_385;
    float _399 = _371 + _397;
    float _401 = _389 * _161;
    float _403 = _389 * _177;
    float _405 = _389 * _189;
    float _407 = -_391;
    float _409 = _375 + _407;
    float _411 = fma(_399, _159, _401);
    float _413 = fma(_399, _175, _403);
    float _415 = fma(_399, _187, _405);
    float _417 = fma(_375, _135, _157);
    float _419 = fma(_409, _163, _411);
    float _421 = fma(_409, _179, _413);
    float _423 = fma(_409, _191, _415);
    float _425 = _87 * _379;
    bool _427 = !_383;
    float _429 = _421;
    float _431 = _419;
    float _433 = _423;
    float _451;
    if (!_427)
    {
        float _435 = in.m_50.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[12].x, _87);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _425;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _455 + _457;
    float _461 = in.m_42.x;
    float _463 = in.m_42.y;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _477;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _497;
    float _501 = 1.0 / _479;
    bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _505 = _491 * _495;
    float _507 = -_491;
    float _509 = _507 + 1.0;
    float _511 = _459 * _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _513;
    float _517 = fma(_499, _511, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _519 = fma(_515, _511, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _521 = _517 * _505;
    float _523 = _519 * _505;
    float _525 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _527 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[143].y, _523);
    float _529 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[144].x, _525);
    float _531 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[144].y, _527);
    float _533 = _529 * _461;
    float _535 = _531 * _463;
    bool _537 = !_503;
    float _555;
    if (!_537)
    {
        float _539 = in.m_50.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _87);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        _555 = _425;
    }
    _557 = false;
    float _559 = _555;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _559 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = isnan(_559);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _567;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _597 = isnan(_559);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _609 = 1.0 / _575;
    float _611 = _571 * _589;
    bool _613 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_559);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _593;
    float _627 = -_587;
    float _629 = _627 + 1.0;
    float _631 = fma(_611, _563, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _637 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _639 = isnan(_559);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_623;
    float _651 = _649 + 1.0;
    float _653 = _623 * _629;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = 1.0 / _635;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    float _665 = _605 * _651;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _667;
    float _671 = _657 * _609;
    float _673 = _587 * _663;
    float _675 = _631 * _665;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _559 + _677;
    float _681 = -_605;
    float _683 = _681 + 1.0;
    float _685 = _669 * _625;
    bool _687 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _689 = isnan(_559);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = _559 + _703;
    float _707 = fma(_671, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _709 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _711 = -_697;
    float _713 = _711 + 1.0;
    float _715 = _701 * _659;
    float _717 = fma(_685, _705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _721 = _559 + _719;
    float _723 = fma(_707, _653, _709);
    float _725 = _647 * _713;
    float _727 = fma(_715, _721, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _729 = fma(_717, _673, _723);
    float _731 = fma(_727, _725, _729);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _739 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[119].x, _731);
    float _741 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = _739 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _741;
    out.m_52.y = _743;
    out.m_52.z = _745;
    out.m_52.w = _747;
    bool _749 = !_607;
    float _767;
    if (!_749)
    {
        float _751 = in.m_50.x;
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _755 = _751 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].z, _87);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        _767 = _425;
    }
    _769 = false;
    float _771 = _767;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _775 = int(_773);
    float _777 = _393 * _177;
    float _779 = in.m_48.w;
    float _781 = fma(_395, _175, _777);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = _771 + _783;
    float _787 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _789 = int(_787);
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _793 = fma(_417, _179, _781);
    float _795 = in.m_44.w;
    bool _797 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _799 = isnan(_771);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = float(_775);
    float _811 = 1.0 / _809;
    float _813 = float(uint(_789));
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _817 = ~_789;
    int _819 = _817 + 1;
    int _821 = ~_789;
    int _823 = _821 + 1;
    float _825 = 1.0 / _813;
    bool _827 = _789 == 0;
    int _829 = ~_789;
    int _831 = _829 + 1;
    float _833 = _87 * _811;
    float _835 = trunc(_833);
    int _837 = int(_835);
    int _839 = as_type<int>(_825) + (-2);
    float _841 = float(uint(_837));
    float _843 = as_type<float>(_839) * _841;
    float _845 = trunc(_843);
    float _847 = precise::max(_845, 0.0);
    uint _850 = uint(_847);
    float _852 = float(_837);
    int _854 = _819 * int(_850);
    int _856 = _854 + _837;
    float _858 = in.m_50.x;
    float _860 = in.m_50.y;
    float _862 = float(uint(_856));
    float _864 = as_type<float>(_839) * _862;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _868 = _866 != 0;
    float _870 = trunc(_864);
    float _872 = precise::max(_870, 0.0);
    uint _874 = uint(_872);
    bool _876 = !_868;
    float _878 = _876 ? 7.345489978790283203125 : 1.0;
    float _880 = _878 * _858;
    float _882 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _884 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].w, _815);
    float _888 = floor(_880);
    int _890 = int(_850) + int(_874);
    float _892 = fma(_884, -2.0, _791);
    float _894 = float(_789);
    float _896 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[77].w, _886);
    int _898 = _823 * _890;
    int _900 = _898 + _837;
    bool _902 = _852 >= _894;
    bool _904 = isnan(_852);
    bool _906 = _902 || _904;
    bool _908 = isnan(_894);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[76].y, _892);
    float _916 = -_896;
    float _918 = _916 + 1.0;
    bool _920 = uint(_900) >= uint(_789);
    float _922 = trunc(_912);
    int _924 = int(_922);
    bool _926 = !_920;
    int _928 = _926 ? 0 : (-1);
    float _930 = -_888;
    float _932 = _880 + _930;
    int _934 = ~_890;
    int _936 = _934 + _928;
    int _938 = _936 + 1;
    float _940 = _932 * _894;
    float _942 = _87 * _894;
    int _944 = _789 * _938;
    int _946 = _944 + _837;
    float _948 = _942 * _379;
    float _950 = trunc(_940);
    int _952 = int(_950);
    int _954 = ~_924;
    int _956 = _954 + 1;
    int _958 = _956 + 1;
    bool _960 = !_827;
    int _962 = _960 ? _946 : (-1);
    float _964 = trunc(_948);
    int _966 = int(_964);
    int _968 = _962 * _958;
    int _970 = _789 + (-1);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _986 = _984 != 0;
    int _988 = _924 * _970;
    int _990 = _988 + _968;
    bool _992 = !_978;
    int _994 = _992 ? 0 : 1;
    bool _996 = !_974;
    int _998 = _996 ? 0 : 1;
    bool _1000 = !_986;
    int _1002 = _1000 ? 0 : 1;
    int _1004 = abs(_994);
    bool _1006 = !_982;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = abs(_998);
    int _1012 = _990 * _1004;
    int _1014 = abs(_1002);
    int _1016 = abs(_1008);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1020 = _1018 != 0;
    int _1022 = _952 * _1014;
    int _1024 = _1022 + _837;
    bool _1026 = !_1020;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _966 * _1010;
    int _1032 = _1030 + _1012;
    int _1034 = abs(_1028);
    float _1036 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1038 = log2(_1036);
    int _1040 = ~_789;
    int _1042 = _1040 + 1;
    int _1044 = _1024 * _1016;
    int _1046 = _1044 + _1032;
    int _1048 = _952 * _1034;
    int _1050 = _1048 + _1046;
    int _1052 = ~_789;
    int _1054 = _1052 + 1;
    float _1056 = float(uint(_1050));
    float _1058 = as_type<float>(_839) * _1056;
    float _1060 = _87 * _1038;
    float _1062 = trunc(_1058);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    float _1068 = exp2(_1060);
    int _1070 = _1054 * int(_1066);
    int _1072 = _1070 + _1050;
    float _1074 = float(uint(_1072));
    float _1076 = -_1068;
    float _1078 = _1076 + 1.0;
    float _1080 = as_type<float>(_839) * _1074;
    float _1082 = trunc(_1080);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = int(_1066) + int(_1086);
    int _1090 = _1042 * _1088;
    int _1092 = _1090 + _1050;
    bool _1094 = uint(_1092) >= uint(_789);
    float _1096 = _858 * 2.0;
    bool _1098 = !_1094;
    int _1100 = _1098 ? 0 : (-1);
    float _1102 = floor(_1096);
    int _1104 = ~_1088;
    int _1106 = _1104 + _1100;
    int _1108 = _1106 + 1;
    float _1110 = in.m_50.z;
    int _1112 = _789 * _1108;
    int _1114 = _1112 + _1050;
    float _1116 = _860 * 2.0;
    bool _1118 = !_827;
    int _1120 = _1118 ? _1114 : (-1);
    float _1122 = floor(_1116);
    int _1124 = _1120 & 3;
    bool _1126 = _1124 != 0;
    bool _1128 = _1102 > 0.0;
    bool _1130 = uint(_1124) > 1u;
    bool _1132 = _1102 >= 0.0;
    bool _1134 = isnan(_1102);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    int _1142 = _1120 & 3;
    bool _1144 = _1142 != 0;
    int _1146 = _1140 ? 0 : 1;
    int _1148 = _1144 ? 0 : 1;
    float _1150 = _1110 * 2.0;
    bool _1152 = _860 > 0.5;
    int _1154 = ~_1146;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = ~_1148;
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    int _1166 = _1158;
    int _1168 = _1164;
    if (!_1128)
    {
        int _1170 = ~_1146;
        int _1172 = _1170 + 1;
        _1166 = _1172;
    }
    int _1174 = _1166;
    if (!_1130)
    {
        int _1176 = ~_1148;
        int _1178 = _1176 + 1;
        _1168 = _1178;
    }
    int _1180 = _1168;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1182;
    float _1186 = -_207;
    int _1188 = _1152 ? as_type<int>(_1186) : as_type<int>(_207);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1192 = _1190 != 0;
    float _1194 = 1.0 / _1184;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    bool _1204 = _858 > 0.5;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1208 = -_203;
    int _1210 = _1204 ? as_type<int>(_1208) : as_type<int>(_203);
    bool _1212 = _1122 >= 0.0;
    bool _1214 = isnan(_1122);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = -_1206;
    float _1224 = fma(_882, 2.0, _1222);
    bool _1226 = !_1198;
    float _1228 = _1226 ? _203 : as_type<float>(_1210);
    float _1230 = in.m_46.w;
    int _1232 = _1220 ? 0 : 1;
    float _1234 = _785 * _1194;
    bool _1236 = _1122 > 0.0;
    float _1238 = _393 * _161;
    float _1240 = _393 * _189;
    int _1242 = ~_1232;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1248;
    float _1252 = fma(_395, _159, _1238);
    float _1254 = fma(_395, _187, _1240);
    float _1256 = _860 + _1110;
    float _1258 = floor(_1150);
    float _1260 = fma(_417, _163, _1252);
    float _1262 = fma(_417, _191, _1254);
    bool _1264 = !_1202;
    float _1266 = _1264 ? _207 : as_type<float>(_1188);
    float _1268 = _860 + _858;
    int _1270 = _1246;
    if (!_1236)
    {
        int _1272 = ~_1232;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1280 = _771 + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1292 = _1290 != 0;
    float _1294 = _1268 + (-1.0);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1300 = _1260 + _795;
    bool _1302 = !_1288;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = 1.0 / _1298;
    bool _1308 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1310 = isnan(_771);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = fma(_1250, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1322 = _1258 >= 0.0;
    bool _1324 = isnan(_1258);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    float _1332 = _1256 + (-1.0);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1338 = -_87;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    int _1342 = _1330 ? 0 : 1;
    float _1344 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1346 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1348 = _793 + _1230;
    float _1350 = float(uint(_1024));
    bool _1352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1354 = isnan(0.0);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1360 = _1356 || _1358;
    bool _1362 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1364 = isnan(_771);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = as_type<float>(_839) * _1350;
    float _1376 = _1280 * _1306;
    float _1378 = _1360 ? _1078 : 0.0;
    bool _1380 = _1258 > 0.0;
    float _1382 = _1262 + _779;
    float _1384 = trunc(_1374);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    float _1390 = -_1372;
    float _1392 = _1390 + 1.0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1394;
    float _1398 = _807 * _1392;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1400;
    float _1404 = -_807;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1396, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1414 = fma(_1402, _1234, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1416 = _1318 * _1406;
    float _1418 = fma(_1412, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1420 = _831 * int(_1388);
    int _1422 = _1420 + _1024;
    float _1424 = _1320 * _1416;
    float _1426 = _1408 * _1416;
    float _1428 = _1414 * _1416;
    int _1430 = _1120 >> 31;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1434 = 1.0 + _1432;
    float _1436 = float(uint(_1422));
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1442 = _1430 & 3;
    float _1444 = 1.0 / _1434;
    float _1446 = fma(_1336, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1448 = as_type<float>(_839) * _1436;
    int _1450 = _1120 + _1442;
    float _1452 = _1228 + 0.5;
    float _1454 = fma(_1440, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1456 = _1450 >> 2;
    float _1458 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1340);
    float _1460 = trunc(_1448);
    float _1462 = precise::max(_1460, 0.0);
    uint _1464 = uint(_1462);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1468 = -_1318;
    float _1470 = _1468 + 1.0;
    float _1472 = _1266 + (-0.5);
    float _1474 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1466);
    float _1476 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1424);
    float _1478 = _1378 * _1444;
    int _1480 = _1456 << 4;
    int _1482 = _1480 + 368;
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1426);
    int _1486 = ~_1342;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1428);
    uint _1494 = uint(int(uint(_1482) >> uint(2)));
    uint _1496 = uint(int(uint(int(_1494)) >> uint(2)));
    int _1498 = int(_1494) & 3;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[int(_1496)][_1498];
    int _1502 = int(_1494) + 1;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    int _1506 = _1502 & 3;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[int(_1504)][_1506];
    int _1510 = _1490;
    if (!_1380)
    {
        int _1512 = ~_1342;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    float _1518 = fma(_1446, _1398, _1476);
    int _1520 = ~_789;
    int _1522 = _1520 + 1;
    float _1524 = fma(_1418, _1398, _1484);
    int _1526 = int(_1388) + int(_1464);
    float _1528 = fma(_87, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1474);
    float _1530 = fma(_1454, _1398, _1492);
    int _1532 = abs(_1304);
    float _1534 = -_1472;
    float _1536 = -_914;
    float _1538 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1536);
    int _1540 = _1482 + 8;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = _1522 * _1526;
    int _1560 = _1558 + _1024;
    float _1562 = -_1528;
    float _1564 = _1562 + 1.0;
    bool _1566 = !_1284;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = fma(_1266, _918, _1538);
    float _1572 = float(_1174);
    float _1574 = -_1564;
    float _1576 = fma(_1228, _1574, _1458);
    bool _1578 = uint(_1560) >= uint(_789);
    float _1580 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1518);
    int _1582 = abs(_1568);
    bool _1584 = !_1578;
    int _1586 = _1584 ? 0 : (-1);
    out.m_54.x = _1576;
    out.m_54.y = _1570;
    bool _1588 = uint(_1124) >= 2u;
    float _1590 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1530);
    float _1592 = float(_1582);
    float _1594 = float(_1516);
    float _1596 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1524);
    float _1598 = float(_1532);
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1300 + _1600;
    int _1604 = _1588 ? 0 : 1;
    float _1606 = _1592 * _1594;
    bool _1608 = _1124 != 3;
    float _1610 = _1598 * _1572;
    int _1612 = ~_1604;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    int _1618 = abs(_1180);
    bool _1620 = !_1126;
    int _1622 = _1620 ? 0 : 1;
    int _1624 = ~_1618;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = ~_1526;
    int _1632 = _1630 + _1586;
    int _1634 = _1632 + 1;
    int _1636 = abs(_1622);
    int _1638 = _1628 * as_type<int>(_1508);
    int _1640 = _1616;
    if (_1608)
    {
        int _1642 = ~_1604;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1650 = _1382 + _1648;
    bool _1652 = _1124 != 3;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1656 = _1348 + _1654;
    int _1658 = abs(_1646);
    float _1660 = in.m_56.x;
    float _1662 = in.m_56.y;
    float _1664 = in.m_56.z;
    bool _1666 = !_1652;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1672 = !_1192;
    int _1674 = _1672 ? 0 : 1;
    int _1676 = _789 * _1634;
    int _1678 = _1676 + _1024;
    int _1680 = ~_1636;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1670);
    int _1688 = abs(_1668);
    float _1690 = _1656 * _1656;
    int _1692 = _1684 * as_type<int>(_1500);
    int _1694 = _1692 + _1638;
    int _1696 = abs(_1674);
    float _1698 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1686);
    int _1700 = ~_1658;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    int _1706 = ~_1688;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    bool _1712 = _1698 >= 0.0;
    int _1714 = _1704 * as_type<int>(_1548);
    int _1716 = _1714 + _1694;
    float _1718 = fma(_1602, _1602, _1690);
    float _1720 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1722 = _1710 * as_type<int>(_1556);
    int _1724 = _1722 + _1716;
    float _1726 = _1606 * (-2.0);
    float _1728 = fma(_1650, _1650, _1718);
    int _1730 = ~_1696;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1738 = !_827;
    int _1740 = _1738 ? _1678 : (-1);
    float _1742 = fma(_1346, _1726, _1346);
    float _1744 = fma(_1726, _1660, _1660);
    float _1746 = rsqrt(_1728);
    int _1748 = _1724 * _1734;
    float _1750 = as_type<float>(_1678);
    if (_1712)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1752 = _1750;
    float _1754 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1756 = _1740 * _1696;
    int _1758 = _1756 + _1748;
    float _1760 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1762 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1764 = as_type<int>(_1752);
    if (_1712)
    {
        float _1766 = _1752 * 5.0;
        _1764 = as_type<int>(_1766);
    }
    int _1768 = _1764;
    float _1770 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1772 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1774 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1776 = float(_1758);
    float _1778 = _858 + (-0.5);
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5173 = as_type<float>(_1768);
        out.gl_Position.z = _5173;
    }
    bool _1780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(1.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = _1770 * _1746;
    float _1792 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1744);
    out.m_58.x = _1772;
    out.m_58.y = _1774;
    out.m_58.z = _1754;
    bool _1794 = !_1292;
    int _1796 = _1794 ? 0 : 1;
    float _1798 = _1602 * _1790;
    float _1800 = _1656 * _1790;
    out.m_60.x = _1776;
    if (_1712)
    {
        out.m_37.x = 0.0;
    }
    if (_1712)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1802 = -_1800;
    float _1804 = _1348 + _1802;
    float _1806 = _1610 * (-2.0);
    float _1808 = -_1798;
    float _1810 = _1300 + _1808;
    int _1812 = abs(_1796);
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1816 = _1804 + _1814;
    float _1818 = fma(_1806, _1662, _1662);
    float _1820 = fma(_1344, _1806, _1344);
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1824 = _1810 + _1822;
    float _1826 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1828 = _1650 * _1790;
    float _1830 = _860 + (-0.5);
    float _1832 = -_1800;
    float _1834 = _1656 + _1832;
    float _1836 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1826);
    float _1838 = -_1828;
    float _1840 = _1382 + _1838;
    float _1842 = float(_1276);
    float _1844 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1818);
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1848 = _1840 + _1846;
    bool _1850 = !_1788;
    float _1852 = _1850 ? _87 : _1478;
    float _1854 = -_1798;
    float _1856 = _1602 + _1854;
    float _1858 = float(_1812);
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1836);
    float _1862 = _1834 * _1834;
    float _1864 = fma(_1852, _1820, _1844);
    float _1866 = _1110 + _858;
    float _1868 = _1858 * _1842;
    bool _1870 = _1860 >= 0.0;
    float _1872 = fma(_1852, _1742, _1792);
    float _1874 = fma(_1856, _1856, _1862);
    float _1876 = -_1828;
    float _1878 = _1650 + _1876;
    float _1880 = _1864 * 0.15915493667125701904296875;
    float _1882 = _1866 + (-1.0);
    float _1884 = _1868 * (-2.0);
    float _1886 = _1872 * 0.15915493667125701904296875;
    float _1888 = fma(_1878, _1878, _1874);
    float _1890 = _1880 * 6.283185482025146484375;
    float _1892 = sin(_1890);
    float _1894 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1896 = fma(_1884, _1664, _1664);
    float _1898 = _1110 + (-0.5);
    float _1900 = _1878;
    int _1902 = as_type<int>(_1896);
    if (_1870)
    {
        _1900 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1904 = _1900;
    float _1906 = fma(_1894, _1884, _1894);
    if (_1870)
    {
        out.m_37.x = 0.0;
    }
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1896);
    float _1910 = _1886 * 6.283185482025146484375;
    float _1912 = sin(_1910);
    if (_1870)
    {
        float _1914 = _1904 * 5.0;
        _1902 = as_type<int>(_1914);
    }
    int _1916 = _1902;
    float _1918 = fma(_1852, _1906, _1908);
    if (_1870)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5413 = as_type<float>(_1916);
        out.gl_Position.z = _5413;
    }
    float _1920 = _1886 * 6.283185482025146484375;
    float _1922 = cos(_1920);
    float _1924 = _1918 * 0.15915493667125701904296875;
    float _1926 = sqrt(_1888);
    float _1928 = _1880 * 6.283185482025146484375;
    float _1930 = cos(_1928);
    if (_1870)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1932 = _1924 * 6.283185482025146484375;
    float _1934 = cos(_1932);
    float _1936 = _1746 * _1926;
    float _1938 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1944 = _1720 * _1936;
    float _1946 = _1936 * _1938;
    float _1948 = _1912 * _1892;
    float _1950 = _1924 * 6.283185482025146484375;
    float _1952 = sin(_1950);
    float _1954 = _1942 * _1944;
    float _1956 = _1940 * _1946;
    float _1958 = _1922 * _1930;
    float _1960 = _1922 * _1892;
    float _1962 = _1934 * _1956;
    float _1964 = _1892 * _1934;
    float _1966 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1968 = _1966 * 0.5;
    float _1970 = _1922 * _1962;
    float _1972 = _1930 * _1934;
    float _1974 = _1912 * _1930;
    float _1976 = _1912 * _1962;
    float _1978 = fma(_1952, _1958, _1948);
    float _1980 = -_1956;
    float _1982 = _1952 * _1980;
    float _1984 = fma(_1952, _1948, _1958);
    float _1986 = fma(_1978, _1954, _1970);
    float _1988 = -_1974;
    float _1990 = fma(_1952, _1960, _1988);
    float _1992 = -_1960;
    float _1994 = fma(_1952, _1974, _1992);
    float _1996 = fma(_1972, _1954, _1982);
    float _1998 = fma(_1990, _1968, _1986);
    float _2000 = fma(_1994, _1954, _1976);
    float _2002 = fma(_1964, _1968, _1996);
    float _2004 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2006 = fma(_1984, _1968, _2000);
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2010 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2012 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2008);
    float _2014 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2010);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2012);
    float _2018 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2020 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2022 = _1382 + _2018;
    float _2024 = _1300 + _2020;
    float _2026 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2030 = _2022 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2034 = _2024 + _2032;
    float _2036 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2026);
    float _2038 = _2030 * _2030;
    float _2040 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2036);
    float _2042 = fma(_2034, _2034, _2038);
    float _2044 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2046 = sqrt(_2042);
    float _2048 = _1348 + _2044;
    bool _2050 = _2046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2040;
    float _2054 = _2024;
    float _2056 = _2044;
    float _2058 = _2002;
    if (!_2050)
    {
        _2052 = _2024;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    if (!_2050)
    {
        _2054 = _2022;
    }
    float _2064 = _2054;
    float _2066 = _2064;
    if (!_2050)
    {
        _2056 = _2048;
    }
    float _2068 = _2056;
    bool _2070 = !_2050;
    float _2072 = _2068;
    if (!_2070)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2078 = _2046 + _2076;
        float _2080 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2082 = rsqrt(_2042);
        float _2084 = _2078 * _2074;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = _2086 * 6.283185482025146484375;
        float _2090 = cos(_2088);
        float _2092 = _2086 * 6.283185482025146484375;
        float _2094 = sin(_2092);
        float _2096 = _2090 + (-1.0);
        float _2098 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2100 = fma(_2094, _2080, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2102 = fma(_2048, _2090, _2098);
        float _2104 = _2082 * _2100;
        float _2106 = fma(_2034, _2104, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2108 = fma(_2030, _2104, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2072 = _2102;
        _2062 = _2106;
        _2066 = _2108;
        _2058 = _2086;
    }
    float _2110 = _2072;
    float _2112 = _2062;
    float _2114 = _2066;
    float _2116 = _2058;
    float _2118 = -_1348;
    float _2120 = _2118 + _2110;
    float _2122 = -_1300;
    float _2124 = _2122 + _2112;
    float _2126 = -_1382;
    float _2128 = _2126 + _2114;
    float _2130 = _2120 * _2120;
    float _2132 = fma(_2124, _2124, _2130);
    float _2134 = fma(_2128, _2128, _2132);
    float _2136 = sqrt(_2134);
    bool _2138 = _2136 > 0.0;
    bool _2140 = !_2138;
    float _2142 = _2116;
    float _2144 = _2132;
    float _2146 = _2110;
    float _2148 = _2112;
    float _2150 = _2114;
    if (!_2140)
    {
        bool _2152 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2154 = _2136;
        if (_2152)
        {
            float _2156 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2154 = _2156;
        }
        float _2158 = _2154;
        float _2160 = _2158;
        if (_2152)
        {
            float _2162 = _419 * _2158;
            _2142 = _2162;
        }
        float _2164 = _2142;
        float _2166 = _2164;
        if (_2152)
        {
            float _2168 = _421 * _2158;
            _2144 = _2168;
        }
        float _2170 = _2144;
        float _2172 = _2170;
        if (_2152)
        {
            float _2174 = _423 * _2158;
            _2160 = _2174;
        }
        float _2176 = _2160;
        float _2178 = _2176;
        float _2180 = _2176;
        if (!_2152)
        {
            float _2182 = _87 + 1.0;
            float _2184 = _2182;
            if (!_145)
            {
                float _2186 = _2182 * _2182;
                float _2188 = _2186 * 0.5;
                _2178 = _2188;
            }
            float _2190 = _2178;
            float _2192 = _2190;
            if (!_145)
            {
                float _2194 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2192 = _2194;
            }
            float _2196 = _2192;
            bool _2198 = !_145;
            float _2200 = _2196;
            if (!_2198)
            {
                float _2202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2204 = log2(_2202);
                float _2206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2208 = _2204 * _2182;
                float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2212 = 1.0 + _2210;
                float _2214 = 1.0 / _2212;
                float _2216 = _2206 * 0.693147182464599609375;
                float _2218 = exp2(_2208);
                float _2220 = 1.0 / _2216;
                float _2222 = _2218 + (-1.0);
                float _2224 = -_2222;
                float _2226 = fma(_2224, _2220, _2182);
                float _2228 = _2226 * _2214;
                float _2230 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2200 = _2230;
            }
            float _2232 = _2200;
            float _2234 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2236 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2238 = !_145;
            if (!_2238)
            {
                float _2240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2242 = log2(_2240);
                float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2246 = 1.0 + _2244;
                float _2248 = 1.0 / _2246;
                float _2250 = _2242 * _2182;
                float _2252 = exp2(_2250);
                float _2254 = -_2252;
                float _2256 = _2254 + 1.0;
                float _2258 = _2256 * _2248;
                _2184 = _2258;
            }
            float _2260 = _2184;
            float _2262 = fma(_2260, _149, _2236);
            float _2264 = fma(_2260, _147, _2234);
            float _2266 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2268 = -_377;
            float _2270 = _2268 + _2262;
            float _2272 = -_385;
            float _2274 = _2272 + _2264;
            float _2276 = fma(_2260, _151, _2266);
            float _2278 = _2270 * _161;
            float _2280 = _2270 * _177;
            float _2282 = _2270 * _189;
            float _2284 = -_391;
            float _2286 = _2284 + _2276;
            float _2288 = fma(_2274, _159, _2278);
            float _2290 = fma(_2274, _175, _2280);
            float _2292 = fma(_2274, _187, _2282);
            float _2294 = fma(_2286, _163, _2288);
            float _2296 = fma(_2286, _179, _2290);
            float _2298 = fma(_2286, _191, _2292);
            _429 = _2296;
            _431 = _2294;
            _433 = _2298;
            _2166 = _2294;
            _2172 = _2296;
            _2180 = _2298;
        }
        float _2300 = _429;
        float _2302 = _431;
        float _2304 = _433;
        float _2306 = _2166;
        float _2308 = _2172;
        float _2310 = _2180;
        float _2312 = _2300 * _2300;
        float _2314 = rsqrt(_2134);
        float _2316 = fma(_2302, _2302, _2312);
        float _2318 = fma(_2304, _2304, _2316);
        float _2320 = sqrt(_2318);
        float _2322 = _2124 * _2314;
        float _2324 = _2120 * _2314;
        float _2326 = _2128 * _2314;
        bool _2328 = _2320 > 0.0;
        bool _2330 = !_2328;
        if (!_2330)
        {
            float _2332 = rsqrt(_2318);
            float _2334 = _2332 * _2300;
            float _2336 = _2332 * _2302;
            float _2338 = _2332 * _2304;
            float _2340 = _2324 * _2334;
            float _2342 = fma(_2322, _2336, _2340);
            float _2344 = fma(_2326, _2338, _2342);
            float _2346 = _2344 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2348 = fma(_2306, _2346, _2112);
            float _2350 = fma(_2308, _2346, _2110);
            float _2352 = fma(_2310, _2346, _2114);
            _2146 = _2350;
            _2148 = _2348;
            _2150 = _2352;
        }
    }
    float _2354 = _2146;
    float _2356 = _2148;
    float _2358 = _2150;
    float _2360 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2362 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2364 = -_1800;
    float _2366 = _2364 + _2354;
    float _2368 = -_1798;
    float _2370 = _2368 + _2356;
    float _2372 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2360);
    float _2374 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2362);
    float _2376 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2378 = -_1828;
    float _2380 = _2378 + _2358;
    float _2382 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2372);
    float _2384 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2374);
    float _2386 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2388 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2376);
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2394 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2396 = isnan(0.5);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2402 = _2398 || _2400;
    float _2404 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2386);
    float _2406 = 1.0 / _2390;
    float _2408 = _2392 + _2390;
    float _2410 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2388);
    float _2412 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2404);
    float _2414 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2416 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2418 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2420 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2422 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2424 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2426 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2418);
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2430 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2432 = _2408 * _2406;
    float _2434 = _2432 * 0.5;
    float _2436 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2420);
    float _2438 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2426);
    float _2440 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2422);
    float _2442 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2424);
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2444);
    float _2448 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2428);
    float _2450 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2430);
    float _2452 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2436);
    float _2454 = _2416;
    float _2456 = _2422;
    if (_2402)
    {
        _2454 = 1.0;
    }
    float _2458 = _2454;
    float _2460 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2462 = 1.0 / _2446;
    float _2464 = _2458;
    if (_2402)
    {
        _2456 = 1.0;
    }
    float _2466 = _2456;
    float _2468 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2470 = _2462 * _2468;
    float _2472 = _2466;
    if (!_2402)
    {
        float _2474 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2476 = _2474 * 0.15915493667125701904296875;
        float _2478 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2480 = _2476 * 6.283185482025146484375;
        float _2482 = cos(_2480);
        float _2484 = _2478 * 0.15915493667125701904296875;
        float _2486 = _2476 * 6.283185482025146484375;
        float _2488 = sin(_2486);
        float _2490 = 1.0 / _2482;
        float _2492 = _2484 * 6.283185482025146484375;
        float _2494 = cos(_2492);
        float _2496 = _2488 * _2490;
        float _2498 = _2484 * 6.283185482025146484375;
        float _2500 = sin(_2498);
        float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2504 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2502;
        float _2506 = _2494 * _2496;
        float _2508 = 1.0 / _2504;
        float _2510 = 1.0 / _2506;
        float _2512 = _2500 * _2510;
        float _2514 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2516 = fma(_2470, _2512, _2514);
        float _2518 = _2516 * _2508;
        float _2520 = precise::clamp(_2518, 0.0, 1.0);
        _2464 = _2520;
    }
    float _2522 = _2464;
    if (!_2402)
    {
        float _2524 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2526 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2526 * 0.15915493667125701904296875;
        float _2532 = _2528 * 6.283185482025146484375;
        float _2534 = cos(_2532);
        float _2536 = _2528 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        float _2540 = 1.0 / _2534;
        float _2542 = _2530 * 6.283185482025146484375;
        float _2544 = cos(_2542);
        float _2546 = _2538 * _2540;
        float _2548 = _2530 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        float _2552 = _2544 * _2546;
        float _2554 = 1.0 / _2552;
        float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2558 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2556;
        float _2560 = 1.0 / _2558;
        float _2562 = _2550 * _2554;
        float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2566 = fma(_2470, _2562, _2564);
        float _2568 = _2566 * _2560;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = -_2570;
        float _2574 = _2572 + 1.0;
        _2472 = _2574;
    }
    float _2576 = _2472;
    float _2578 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2580 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2440);
    float _2582 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2448);
    float _2584 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2450);
    bool _2586 = _2522 > 0.0;
    bool _2588 = isnan(_2522);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2442);
    float _2598 = _2522 * _2576;
    float _2600 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2580);
    float _2602 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2584);
    float _2604 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2582);
    bool _2606 = _2576 <= 0.0;
    bool _2608 = !_2594;
    bool _2610 = _2606 || _2608;
    float _2612 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2596);
    float _2614 = _2600 + _2602;
    float _2616 = _2604 + _2602;
    float _2618 = _2602 * 0.5;
    float _2620 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2622 = _2614 * 0.5;
    float _2624 = _2616 * 0.5;
    float _2626 = fma(_2612, -0.5, _2618);
    float _2628 = _2620 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2600;
    out.gl_Position.y = _2612;
    out.gl_Position.z = _2604;
    out.gl_Position.w = _2602;
    out.m_62.x = _2622;
    out.m_62.y = _2626;
    out.m_62.z = _2624;
    out.m_62.w = _2602;
    out.m_37.x = _2628;
    if (!_2610)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2630 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_37.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2630;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

