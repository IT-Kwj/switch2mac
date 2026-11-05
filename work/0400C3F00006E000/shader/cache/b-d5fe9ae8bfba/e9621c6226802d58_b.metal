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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_44 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_50 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_42 [[attribute(7)]];
    float4 m_40 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _691 = false;
    bool _537 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1329 = as_type<float>(_91);
        out.gl_Position.z = _1329;
    }
    if (!_79)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1397 = as_type<float>(_127);
        out.gl_Position.z = _1397;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = in.m_40.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    int _155 = as_type<int>(_129) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_129) & 2;
    bool _161 = _159 != 0;
    float _163 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = 0.0;
    float _167 = _163;
    if (!_141)
    {
        float _169 = _163 * _163;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    bool _175 = !_157;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = _173;
    if (!_141)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    bool _189 = !_141;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _163 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _163);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_141;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _163 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _167 = _245;
    }
    float _247 = _167;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _143, _251);
    float _259 = fma(_247, _145, _253);
    float _261 = fma(_247, _147, _255);
    float _263 = fma(_257, _131, _149);
    float _265 = fma(_259, _131, _151);
    float _267 = fma(_261, _131, _153);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_42.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_75);
        float _293 = 1.0 / _291;
        float _295 = _109 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _297 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _323 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_297);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _309;
    float _337 = -_333;
    float _339 = _337 + 1.0;
    float _341 = 1.0 / _313;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _345 = 1.0 / _317;
    float _347 = _301 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = _297 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _297 + _353;
    float _357 = 1.0 / _321;
    float _359 = _305 * _341;
    bool _361 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_297);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _371 * _339;
    float _375 = _351 * _345;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    bool _381 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _383 = isnan(_297);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    bool _393 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_297);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_379, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = _355 * _357;
    float _413 = -_371;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = -_391;
    float _427 = _425 + 1.0;
    float _429 = _391 * _415;
    float _431 = fma(_409, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_423, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _435 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _437 = isnan(_297);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = _403 * _427;
    float _449 = -_403;
    float _451 = _449 + 1.0;
    float _453 = fma(_419, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _455 = in.m_40.x;
    float _457 = in.m_40.y;
    float _459 = -_445;
    float _461 = _459 + 1.0;
    float _463 = _445 * _451;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = _405 * _463;
    float _475 = _453 * _463;
    float _477 = fma(_467, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_471, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _493 = fma(_431, _447, _481);
    float _495 = fma(_433, _447, _483);
    float _497 = fma(_487, _411, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _499 = fma(_491, _411, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _501 = fma(_477, _429, _493);
    float _503 = fma(_479, _429, _495);
    float _505 = fma(_497, _373, _501);
    float _507 = fma(_499, _373, _503);
    float _509 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].x, _505);
    float _511 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].y, _507);
    float _513 = _509 * _455;
    float _515 = _511 * _457;
    bool _517 = !_343;
    float _535;
    if (!_517)
    {
        float _519 = in.m_42.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_75);
        float _541 = 1.0 / _539;
        float _543 = _109 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _545 + _547;
    float _551 = in.m_42.x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = isnan(_545);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _573 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _575 = isnan(_545);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _591 = 1.0 / _555;
    float _593 = -_567;
    float _595 = _593 + 1.0;
    float _597 = 1.0 / _571;
    float _599 = _587 * _591;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = _583 * _595;
    float _607 = -_583;
    float _609 = _607 + 1.0;
    float _611 = fma(_599, _549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _613 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = isnan(_545);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _627 = _603 * _597;
    float _629 = _611 * _605;
    float _631 = -_623;
    float _633 = _631 + 1.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _545 + _635;
    float _639 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _641 = _567 * _633;
    float _643 = fma(_627, _637, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _645 = _625 * _551;
    float _647 = fma(_643, _641, _639);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[117].x, _647);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = trunc(_645);
    int _667 = int(_665);
    out.m_44.x = _661;
    out.m_44.y = _657;
    out.m_44.z = _663;
    out.m_44.w = _659;
    int _669 = _667 << 4;
    int _671 = _669 + 1968;
    bool _673 = !_589;
    float _689;
    if (!_673)
    {
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _677 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[11].w, _109);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _689 = _687;
        _691 = true;
    }
    else
    {
        float _693 = float(_75);
        float _695 = 1.0 / _693;
        float _697 = _109 * _695;
        _689 = _697;
    }
    _691 = false;
    float _699 = _689;
    float _701 = in.m_42.z;
    float _703 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _707 = in.m_46.x;
    float _709 = in.m_46.y;
    float _711 = in.m_46.z;
    float _713 = in.m_46.w;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _717 = _715 != 0;
    float _719 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _723 = _721 != 0;
    float _725 = in.m_48.x;
    float _727 = in.m_48.y;
    float _729 = in.m_48.z;
    float _731 = in.m_48.w;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _739 = _737 != 0;
    float _741 = in.m_50.x;
    float _743 = in.m_50.y;
    float _745 = in.m_50.z;
    float _747 = in.m_50.w;
    bool _749 = _551 > 0.5;
    float _751 = in.m_42.w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _755 = _701 > 0.5;
    float _757 = in.m_42.y;
    float _759 = _265 * _709;
    float _761 = _265 * _727;
    float _763 = _703 * _705;
    float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _767 = _265 * _743;
    float _769 = fma(_263, _725, _761);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _773 = _751 > 0.5;
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _777 = fma(_263, _741, _767);
    float _779 = _551 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _781 = fma(_267, _729, _769);
    float _783 = _719 * _775;
    float _785 = fma(_263, _707, _759);
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = -_771;
    float _791 = fma(_779, 2.0, _789);
    float _793 = _757 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _795 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _799 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _801 = fma(_793, -2.0, _787);
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _795);
    float _807 = fma(_267, _745, _777);
    float _809 = _781 + _731;
    float _811 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _803);
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _805);
    float _815 = _807 + _747;
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = -_177;
    int _823 = _749 ? as_type<int>(_821) : as_type<int>(_177);
    float _825 = fma(_267, _711, _785);
    bool _827 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _829 = isnan(0.5);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _835 = _831 || _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _841 = _817 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = _809 + _819;
    bool _845 = !_717;
    float _847 = _845 ? _177 : as_type<float>(_823);
    uint _850 = uint(int(uint(_671) >> uint(2)));
    uint _852 = uint(int(uint(int(_850)) >> uint(2)));
    int _854 = int(_850) & 3;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[int(_852)][_854];
    int _858 = int(_850) + 1;
    uint _860 = uint(int(uint(_858) >> uint(2)));
    int _862 = _858 & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    float _866 = _815 + _841;
    float _868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _870 = _843 + _868;
    float _872 = 1.0 / _839;
    bool _874 = _757 > 0.5;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _878 = _866 + _876;
    float _880 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[78].w, _753);
    float _882 = -_109;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    float _886 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[78].z, _797);
    float _888 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = -_177;
    int _892 = _755 ? as_type<int>(_890) : as_type<int>(_177);
    float _894 = _870 * _870;
    float _896 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _886);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _898;
    bool _902 = !_735;
    float _904 = _902 ? _177 : as_type<float>(_892);
    float _906 = fma(_878, _878, _894);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _910 = _699 + _908;
    bool _912 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _914 = isnan(_699);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _926 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _928 = isnan(_699);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _900 * _872;
    float _940 = -_181;
    int _942 = _874 ? as_type<int>(_940) : as_type<int>(_181);
    float _944 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _801);
    float _946 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _880);
    float _948 = -_936;
    float _950 = _948 + 1.0;
    bool _952 = !_723;
    float _954 = _952 ? _181 : as_type<float>(_942);
    float _956 = sqrt(_906);
    float _958 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _960 = fma(_938, _910, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _962 = _922 * _950;
    float _964 = _825 + _713;
    float _966 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _958);
    float _968 = -_922;
    float _970 = _968 + 1.0;
    float _972 = _960 * _962;
    float _974 = _924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _978 = _765 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _980 = _847 + 0.5;
    float _982 = _954 + (-0.5);
    float _984 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[131].x, _972);
    float _986 = _964 + _976;
    float _988 = -_181;
    int _990 = _773 ? as_type<int>(_988) : as_type<int>(_181);
    float _992 = fma(_974, _980, _884);
    bool _994 = _956 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = -_978;
    float _998 = -_944;
    float _1000 = fma(_996, _982, _998);
    float _1002 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[132].x, _984);
    bool _1004 = !_739;
    float _1006 = _1004 ? _181 : as_type<float>(_990);
    float _1008 = _982;
    float _1010 = _866;
    float _1012 = _984;
    float _1014 = _843;
    float _1016 = _878;
    float _1018 = _870;
    if (!_994)
    {
        _1008 = _866;
    }
    float _1020 = _1008;
    float _1022 = _1020;
    if (!_994)
    {
        _1010 = _843;
    }
    float _1024 = _1010;
    float _1026 = _1024;
    if (!_994)
    {
        _1012 = _986;
    }
    float _1028 = _1012;
    bool _1030 = !_994;
    float _1032 = _1028;
    if (!_1030)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1038 = _956 + _1036;
        float _1040 = rsqrt(_906);
        float _1042 = _1038 * _1034;
        float _1044 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = _1042 * 0.15915493667125701904296875;
        float _1048 = _1046 * 6.283185482025146484375;
        float _1050 = cos(_1048);
        float _1052 = _1046 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        float _1056 = _1050 + (-1.0);
        float _1058 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1060 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = _1040 * _1058;
        float _1064 = fma(_986, _1050, _1060);
        float _1066 = fma(_878, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1068 = fma(_870, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1022 = _1066;
        _1032 = _1064;
        _1026 = _1068;
        _1014 = _1058;
    }
    float _1070 = _1022;
    float _1072 = _1032;
    float _1074 = _1026;
    float _1076 = _1014;
    float _1078 = _1076;
    if (_835)
    {
        _1078 = _1070;
    }
    float _1080 = _1078;
    float _1082 = _1080;
    if (_835)
    {
        _1016 = _1072;
    }
    float _1084 = _1016;
    float _1086 = _1084;
    if (_835)
    {
        _1018 = _1074;
    }
    float _1088 = _1018;
    float _1090 = _1088;
    if (!_835)
    {
        float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1094 = _964 + _1092;
        float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1098 = _815 + _1096;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1102 = _1094 * _1094;
        float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1106 = _809 + _1104;
        float _1108 = fma(_1098, _1098, _1102);
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1112 = fma(_1106, _1106, _1108);
        float _1114 = sqrt(_1112);
        float _1116 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1118 = -_815;
        float _1120 = _1118 + _1070;
        float _1122 = precise::min(_1114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1124 = _1122 * _1110;
        float _1126 = -_964;
        float _1128 = _1126 + _1072;
        float _1130 = _1116 * _1124;
        float _1132 = -_809;
        float _1134 = _1132 + _1074;
        float _1136 = fma(_1120, _1130, _815);
        float _1138 = fma(_1128, _1130, _964);
        float _1140 = fma(_1134, _1130, _809);
        _1086 = _1138;
        _1082 = _1136;
        _1090 = _1140;
    }
    float _1142 = _1086;
    float _1144 = _1082;
    float _1146 = _1090;
    int _1148 = _671 + 8;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
    int _1154 = int(_1150) & 3;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[int(_1152)][_1154];
    float _1158 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1162 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1166 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1158);
    float _1168 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1160);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1164);
    float _1174 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1166);
    float _1176 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1168);
    float _1178 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1172);
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1190);
    float _1200 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1202 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1206 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = -_946;
    float _1210 = _1208 + 1.0;
    float _1212 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1198);
    float _1214 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1216 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1218 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1220 = fma(_954, _1210, _1000);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1224 = -_896;
    float _1226 = _1224 + 1.0;
    float _1228 = -_1006;
    float _1230 = _1228 + 0.5;
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1234 = _904 + 0.5;
    float _1236 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1238 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1218);
    float _1240 = -_1226;
    float _1242 = fma(_847, _1240, _992);
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1246 = _856 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1248 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1250 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1252 = _1236 + _1238;
    float _1254 = _1244 * _1204;
    float _1256 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1222);
    float _1258 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1260 = _1250 * _1188;
    float _1262 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1264 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1272 = _1252 * 0.5;
    out.m_33.x = _1262;
    out.m_52.x = _1242;
    out.m_52.y = _1220;
    out.m_52.z = _1260;
    out.m_52.w = _1254;
    out.m_54.x = _1264;
    out.m_54.y = _1266;
    out.m_54.z = _1268;
    out.m_54.w = _1270;
    out.gl_Position.x = _1256;
    out.gl_Position.y = _1232;
    out.gl_Position.z = _1236;
    out.gl_Position.w = _1238;
    out.m_56.z = _1272;
    out.m_56.w = _1238;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _691 = false;
    bool _537 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1329 = as_type<float>(_91);
        out.gl_Position.z = _1329;
    }
    if (!_79)
    {
        return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1397 = as_type<float>(_127);
        out.gl_Position.z = _1397;
    }
    if (_121)
    {
        return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = in.m_40.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    int _155 = as_type<int>(_129) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_129) & 2;
    bool _161 = _159 != 0;
    float _163 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = 0.0;
    float _167 = _163;
    if (!_141)
    {
        float _169 = _163 * _163;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    bool _175 = !_157;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = _173;
    if (!_141)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    bool _189 = !_141;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _163 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _163);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_141;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _163 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _167 = _245;
    }
    float _247 = _167;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _143, _251);
    float _259 = fma(_247, _145, _253);
    float _261 = fma(_247, _147, _255);
    float _263 = fma(_257, _131, _149);
    float _265 = fma(_259, _131, _151);
    float _267 = fma(_261, _131, _153);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_42.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_75);
        float _293 = 1.0 / _291;
        float _295 = _109 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _297 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _323 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_297);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _309;
    float _337 = -_333;
    float _339 = _337 + 1.0;
    float _341 = 1.0 / _313;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _345 = 1.0 / _317;
    float _347 = _301 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = _297 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _297 + _353;
    float _357 = 1.0 / _321;
    float _359 = _305 * _341;
    bool _361 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_297);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _371 * _339;
    float _375 = _351 * _345;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    bool _381 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _383 = isnan(_297);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    bool _393 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_297);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_379, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = _355 * _357;
    float _413 = -_371;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = -_391;
    float _427 = _425 + 1.0;
    float _429 = _391 * _415;
    float _431 = fma(_409, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_423, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _435 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _437 = isnan(_297);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = _403 * _427;
    float _449 = -_403;
    float _451 = _449 + 1.0;
    float _453 = fma(_419, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _455 = in.m_40.x;
    float _457 = in.m_40.y;
    float _459 = -_445;
    float _461 = _459 + 1.0;
    float _463 = _445 * _451;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = _405 * _463;
    float _475 = _453 * _463;
    float _477 = fma(_467, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_471, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _493 = fma(_431, _447, _481);
    float _495 = fma(_433, _447, _483);
    float _497 = fma(_487, _411, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _499 = fma(_491, _411, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _501 = fma(_477, _429, _493);
    float _503 = fma(_479, _429, _495);
    float _505 = fma(_497, _373, _501);
    float _507 = fma(_499, _373, _503);
    float _509 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].x, _505);
    float _511 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].y, _507);
    float _513 = _509 * _455;
    float _515 = _511 * _457;
    bool _517 = !_343;
    float _535;
    if (!_517)
    {
        float _519 = in.m_42.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_75);
        float _541 = 1.0 / _539;
        float _543 = _109 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _545 + _547;
    float _551 = in.m_42.x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = isnan(_545);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _573 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _575 = isnan(_545);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _591 = 1.0 / _555;
    float _593 = -_567;
    float _595 = _593 + 1.0;
    float _597 = 1.0 / _571;
    float _599 = _587 * _591;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = _583 * _595;
    float _607 = -_583;
    float _609 = _607 + 1.0;
    float _611 = fma(_599, _549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _613 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = isnan(_545);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _627 = _603 * _597;
    float _629 = _611 * _605;
    float _631 = -_623;
    float _633 = _631 + 1.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _545 + _635;
    float _639 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _641 = _567 * _633;
    float _643 = fma(_627, _637, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _645 = _625 * _551;
    float _647 = fma(_643, _641, _639);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[117].x, _647);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = trunc(_645);
    int _667 = int(_665);
    out.m_44.x = _661;
    out.m_44.y = _657;
    out.m_44.z = _663;
    out.m_44.w = _659;
    int _669 = _667 << 4;
    int _671 = _669 + 1968;
    bool _673 = !_589;
    float _689;
    if (!_673)
    {
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _677 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[11].w, _109);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _689 = _687;
        _691 = true;
    }
    else
    {
        float _693 = float(_75);
        float _695 = 1.0 / _693;
        float _697 = _109 * _695;
        _689 = _697;
    }
    _691 = false;
    float _699 = _689;
    float _701 = in.m_42.z;
    float _703 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _707 = in.m_46.x;
    float _709 = in.m_46.y;
    float _711 = in.m_46.z;
    float _713 = in.m_46.w;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _717 = _715 != 0;
    float _719 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _723 = _721 != 0;
    float _725 = in.m_48.x;
    float _727 = in.m_48.y;
    float _729 = in.m_48.z;
    float _731 = in.m_48.w;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _739 = _737 != 0;
    float _741 = in.m_50.x;
    float _743 = in.m_50.y;
    float _745 = in.m_50.z;
    float _747 = in.m_50.w;
    bool _749 = _551 > 0.5;
    float _751 = in.m_42.w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _755 = _701 > 0.5;
    float _757 = in.m_42.y;
    float _759 = _265 * _709;
    float _761 = _265 * _727;
    float _763 = _703 * _705;
    float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _767 = _265 * _743;
    float _769 = fma(_263, _725, _761);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _773 = _751 > 0.5;
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _777 = fma(_263, _741, _767);
    float _779 = _551 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _781 = fma(_267, _729, _769);
    float _783 = _719 * _775;
    float _785 = fma(_263, _707, _759);
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = -_771;
    float _791 = fma(_779, 2.0, _789);
    float _793 = _757 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _795 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _799 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _801 = fma(_793, -2.0, _787);
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _795);
    float _807 = fma(_267, _745, _777);
    float _809 = _781 + _731;
    float _811 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _803);
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _805);
    float _815 = _807 + _747;
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = -_177;
    int _823 = _749 ? as_type<int>(_821) : as_type<int>(_177);
    float _825 = fma(_267, _711, _785);
    bool _827 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _829 = isnan(0.5);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _835 = _831 || _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _841 = _817 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = _809 + _819;
    bool _845 = !_717;
    float _847 = _845 ? _177 : as_type<float>(_823);
    uint _850 = uint(int(uint(_671) >> uint(2)));
    uint _852 = uint(int(uint(int(_850)) >> uint(2)));
    int _854 = int(_850) & 3;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[int(_852)][_854];
    int _858 = int(_850) + 1;
    uint _860 = uint(int(uint(_858) >> uint(2)));
    int _862 = _858 & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    float _866 = _815 + _841;
    float _868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _870 = _843 + _868;
    float _872 = 1.0 / _839;
    bool _874 = _757 > 0.5;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _878 = _866 + _876;
    float _880 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[78].w, _753);
    float _882 = -_109;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    float _886 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[78].z, _797);
    float _888 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = -_177;
    int _892 = _755 ? as_type<int>(_890) : as_type<int>(_177);
    float _894 = _870 * _870;
    float _896 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _886);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _898;
    bool _902 = !_735;
    float _904 = _902 ? _177 : as_type<float>(_892);
    float _906 = fma(_878, _878, _894);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _910 = _699 + _908;
    bool _912 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _914 = isnan(_699);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _926 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _928 = isnan(_699);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _900 * _872;
    float _940 = -_181;
    int _942 = _874 ? as_type<int>(_940) : as_type<int>(_181);
    float _944 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _801);
    float _946 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _880);
    float _948 = -_936;
    float _950 = _948 + 1.0;
    bool _952 = !_723;
    float _954 = _952 ? _181 : as_type<float>(_942);
    float _956 = sqrt(_906);
    float _958 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _960 = fma(_938, _910, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _962 = _922 * _950;
    float _964 = _825 + _713;
    float _966 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _958);
    float _968 = -_922;
    float _970 = _968 + 1.0;
    float _972 = _960 * _962;
    float _974 = _924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _978 = _765 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _980 = _847 + 0.5;
    float _982 = _954 + (-0.5);
    float _984 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[131].x, _972);
    float _986 = _964 + _976;
    float _988 = -_181;
    int _990 = _773 ? as_type<int>(_988) : as_type<int>(_181);
    float _992 = fma(_974, _980, _884);
    bool _994 = _956 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = -_978;
    float _998 = -_944;
    float _1000 = fma(_996, _982, _998);
    float _1002 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[132].x, _984);
    bool _1004 = !_739;
    float _1006 = _1004 ? _181 : as_type<float>(_990);
    float _1008 = _982;
    float _1010 = _866;
    float _1012 = _984;
    float _1014 = _843;
    float _1016 = _878;
    float _1018 = _870;
    if (!_994)
    {
        _1008 = _866;
    }
    float _1020 = _1008;
    float _1022 = _1020;
    if (!_994)
    {
        _1010 = _843;
    }
    float _1024 = _1010;
    float _1026 = _1024;
    if (!_994)
    {
        _1012 = _986;
    }
    float _1028 = _1012;
    bool _1030 = !_994;
    float _1032 = _1028;
    if (!_1030)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1038 = _956 + _1036;
        float _1040 = rsqrt(_906);
        float _1042 = _1038 * _1034;
        float _1044 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = _1042 * 0.15915493667125701904296875;
        float _1048 = _1046 * 6.283185482025146484375;
        float _1050 = cos(_1048);
        float _1052 = _1046 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        float _1056 = _1050 + (-1.0);
        float _1058 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1060 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = _1040 * _1058;
        float _1064 = fma(_986, _1050, _1060);
        float _1066 = fma(_878, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1068 = fma(_870, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1022 = _1066;
        _1032 = _1064;
        _1026 = _1068;
        _1014 = _1058;
    }
    float _1070 = _1022;
    float _1072 = _1032;
    float _1074 = _1026;
    float _1076 = _1014;
    float _1078 = _1076;
    if (_835)
    {
        _1078 = _1070;
    }
    float _1080 = _1078;
    float _1082 = _1080;
    if (_835)
    {
        _1016 = _1072;
    }
    float _1084 = _1016;
    float _1086 = _1084;
    if (_835)
    {
        _1018 = _1074;
    }
    float _1088 = _1018;
    float _1090 = _1088;
    if (!_835)
    {
        float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1094 = _964 + _1092;
        float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1098 = _815 + _1096;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1102 = _1094 * _1094;
        float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1106 = _809 + _1104;
        float _1108 = fma(_1098, _1098, _1102);
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1112 = fma(_1106, _1106, _1108);
        float _1114 = sqrt(_1112);
        float _1116 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1118 = -_815;
        float _1120 = _1118 + _1070;
        float _1122 = precise::min(_1114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1124 = _1122 * _1110;
        float _1126 = -_964;
        float _1128 = _1126 + _1072;
        float _1130 = _1116 * _1124;
        float _1132 = -_809;
        float _1134 = _1132 + _1074;
        float _1136 = fma(_1120, _1130, _815);
        float _1138 = fma(_1128, _1130, _964);
        float _1140 = fma(_1134, _1130, _809);
        _1086 = _1138;
        _1082 = _1136;
        _1090 = _1140;
    }
    float _1142 = _1086;
    float _1144 = _1082;
    float _1146 = _1090;
    int _1148 = _671 + 8;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
    int _1154 = int(_1150) & 3;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[int(_1152)][_1154];
    float _1158 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1162 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1166 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1158);
    float _1168 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1160);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1164);
    float _1174 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1166);
    float _1176 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1168);
    float _1178 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1172);
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1190);
    float _1200 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1202 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1206 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = -_946;
    float _1210 = _1208 + 1.0;
    float _1212 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1198);
    float _1214 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1216 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1218 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1220 = fma(_954, _1210, _1000);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1224 = -_896;
    float _1226 = _1224 + 1.0;
    float _1228 = -_1006;
    float _1230 = _1228 + 0.5;
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1234 = _904 + 0.5;
    float _1236 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1238 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1218);
    float _1240 = -_1226;
    float _1242 = fma(_847, _1240, _992);
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1246 = _856 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1248 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1250 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1252 = _1236 + _1238;
    float _1254 = _1244 * _1204;
    float _1256 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1222);
    float _1258 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1260 = _1250 * _1188;
    float _1262 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1264 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1272 = _1252 * 0.5;
    out.m_33.x = _1262;
    out.m_52.x = _1242;
    out.m_52.y = _1220;
    out.m_52.z = _1260;
    out.m_52.w = _1254;
    out.m_54.x = _1264;
    out.m_54.y = _1266;
    out.m_54.z = _1268;
    out.m_54.w = _1270;
    out.gl_Position.x = _1256;
    out.gl_Position.y = _1232;
    out.gl_Position.z = _1236;
    out.gl_Position.w = _1238;
    out.m_56.z = _1272;
    out.m_56.w = _1238;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _691 = false;
    bool _537 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1329 = as_type<float>(_91);
        out.gl_Position.z = _1329;
    }
    if (!_79)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1397 = as_type<float>(_127);
        out.gl_Position.z = _1397;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = in.m_40.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    int _155 = as_type<int>(_129) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_129) & 2;
    bool _161 = _159 != 0;
    float _163 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = 0.0;
    float _167 = _163;
    if (!_141)
    {
        float _169 = _163 * _163;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    bool _175 = !_157;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = _173;
    if (!_141)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    bool _189 = !_141;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _163 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _163);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_141;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _163 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _167 = _245;
    }
    float _247 = _167;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _143, _251);
    float _259 = fma(_247, _145, _253);
    float _261 = fma(_247, _147, _255);
    float _263 = fma(_257, _131, _149);
    float _265 = fma(_259, _131, _151);
    float _267 = fma(_261, _131, _153);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_42.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_75);
        float _293 = 1.0 / _291;
        float _295 = _109 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _297 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _323 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_297);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _309;
    float _337 = -_333;
    float _339 = _337 + 1.0;
    float _341 = 1.0 / _313;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _345 = 1.0 / _317;
    float _347 = _301 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = _297 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _297 + _353;
    float _357 = 1.0 / _321;
    float _359 = _305 * _341;
    bool _361 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_297);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _371 * _339;
    float _375 = _351 * _345;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    bool _381 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _383 = isnan(_297);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    bool _393 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_297);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_379, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = _355 * _357;
    float _413 = -_371;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = -_391;
    float _427 = _425 + 1.0;
    float _429 = _391 * _415;
    float _431 = fma(_409, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_423, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _435 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _437 = isnan(_297);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = _403 * _427;
    float _449 = -_403;
    float _451 = _449 + 1.0;
    float _453 = fma(_419, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _455 = in.m_40.x;
    float _457 = in.m_40.y;
    float _459 = -_445;
    float _461 = _459 + 1.0;
    float _463 = _445 * _451;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = _405 * _463;
    float _475 = _453 * _463;
    float _477 = fma(_467, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_471, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _493 = fma(_431, _447, _481);
    float _495 = fma(_433, _447, _483);
    float _497 = fma(_487, _411, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _499 = fma(_491, _411, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _501 = fma(_477, _429, _493);
    float _503 = fma(_479, _429, _495);
    float _505 = fma(_497, _373, _501);
    float _507 = fma(_499, _373, _503);
    float _509 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].x, _505);
    float _511 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].y, _507);
    float _513 = _509 * _455;
    float _515 = _511 * _457;
    bool _517 = !_343;
    float _535;
    if (!_517)
    {
        float _519 = in.m_42.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_75);
        float _541 = 1.0 / _539;
        float _543 = _109 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _545 + _547;
    float _551 = in.m_42.x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = isnan(_545);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _573 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _575 = isnan(_545);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _591 = 1.0 / _555;
    float _593 = -_567;
    float _595 = _593 + 1.0;
    float _597 = 1.0 / _571;
    float _599 = _587 * _591;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = _583 * _595;
    float _607 = -_583;
    float _609 = _607 + 1.0;
    float _611 = fma(_599, _549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _613 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = isnan(_545);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _627 = _603 * _597;
    float _629 = _611 * _605;
    float _631 = -_623;
    float _633 = _631 + 1.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _545 + _635;
    float _639 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _641 = _567 * _633;
    float _643 = fma(_627, _637, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _645 = _625 * _551;
    float _647 = fma(_643, _641, _639);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[117].x, _647);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = trunc(_645);
    int _667 = int(_665);
    out.m_44.x = _661;
    out.m_44.y = _657;
    out.m_44.z = _663;
    out.m_44.w = _659;
    int _669 = _667 << 4;
    int _671 = _669 + 1968;
    bool _673 = !_589;
    float _689;
    if (!_673)
    {
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _677 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[11].w, _109);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _689 = _687;
        _691 = true;
    }
    else
    {
        float _693 = float(_75);
        float _695 = 1.0 / _693;
        float _697 = _109 * _695;
        _689 = _697;
    }
    _691 = false;
    float _699 = _689;
    float _701 = in.m_42.z;
    float _703 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _707 = in.m_46.x;
    float _709 = in.m_46.y;
    float _711 = in.m_46.z;
    float _713 = in.m_46.w;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _717 = _715 != 0;
    float _719 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _723 = _721 != 0;
    float _725 = in.m_48.x;
    float _727 = in.m_48.y;
    float _729 = in.m_48.z;
    float _731 = in.m_48.w;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _739 = _737 != 0;
    float _741 = in.m_50.x;
    float _743 = in.m_50.y;
    float _745 = in.m_50.z;
    float _747 = in.m_50.w;
    bool _749 = _551 > 0.5;
    float _751 = in.m_42.w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _755 = _701 > 0.5;
    float _757 = in.m_42.y;
    float _759 = _265 * _709;
    float _761 = _265 * _727;
    float _763 = _703 * _705;
    float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _767 = _265 * _743;
    float _769 = fma(_263, _725, _761);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _773 = _751 > 0.5;
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _777 = fma(_263, _741, _767);
    float _779 = _551 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _781 = fma(_267, _729, _769);
    float _783 = _719 * _775;
    float _785 = fma(_263, _707, _759);
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = -_771;
    float _791 = fma(_779, 2.0, _789);
    float _793 = _757 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _795 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _799 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _801 = fma(_793, -2.0, _787);
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _795);
    float _807 = fma(_267, _745, _777);
    float _809 = _781 + _731;
    float _811 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _803);
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _805);
    float _815 = _807 + _747;
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = -_177;
    int _823 = _749 ? as_type<int>(_821) : as_type<int>(_177);
    float _825 = fma(_267, _711, _785);
    bool _827 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _829 = isnan(0.5);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _835 = _831 || _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _841 = _817 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = _809 + _819;
    bool _845 = !_717;
    float _847 = _845 ? _177 : as_type<float>(_823);
    uint _850 = uint(int(uint(_671) >> uint(2)));
    uint _852 = uint(int(uint(int(_850)) >> uint(2)));
    int _854 = int(_850) & 3;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[int(_852)][_854];
    int _858 = int(_850) + 1;
    uint _860 = uint(int(uint(_858) >> uint(2)));
    int _862 = _858 & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    float _866 = _815 + _841;
    float _868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _870 = _843 + _868;
    float _872 = 1.0 / _839;
    bool _874 = _757 > 0.5;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _878 = _866 + _876;
    float _880 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[78].w, _753);
    float _882 = -_109;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    float _886 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[78].z, _797);
    float _888 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = -_177;
    int _892 = _755 ? as_type<int>(_890) : as_type<int>(_177);
    float _894 = _870 * _870;
    float _896 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _886);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _898;
    bool _902 = !_735;
    float _904 = _902 ? _177 : as_type<float>(_892);
    float _906 = fma(_878, _878, _894);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _910 = _699 + _908;
    bool _912 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _914 = isnan(_699);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _926 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _928 = isnan(_699);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _900 * _872;
    float _940 = -_181;
    int _942 = _874 ? as_type<int>(_940) : as_type<int>(_181);
    float _944 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _801);
    float _946 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _880);
    float _948 = -_936;
    float _950 = _948 + 1.0;
    bool _952 = !_723;
    float _954 = _952 ? _181 : as_type<float>(_942);
    float _956 = sqrt(_906);
    float _958 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _960 = fma(_938, _910, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _962 = _922 * _950;
    float _964 = _825 + _713;
    float _966 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _958);
    float _968 = -_922;
    float _970 = _968 + 1.0;
    float _972 = _960 * _962;
    float _974 = _924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _978 = _765 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _980 = _847 + 0.5;
    float _982 = _954 + (-0.5);
    float _984 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[131].x, _972);
    float _986 = _964 + _976;
    float _988 = -_181;
    int _990 = _773 ? as_type<int>(_988) : as_type<int>(_181);
    float _992 = fma(_974, _980, _884);
    bool _994 = _956 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = -_978;
    float _998 = -_944;
    float _1000 = fma(_996, _982, _998);
    float _1002 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[132].x, _984);
    bool _1004 = !_739;
    float _1006 = _1004 ? _181 : as_type<float>(_990);
    float _1008 = _982;
    float _1010 = _866;
    float _1012 = _984;
    float _1014 = _843;
    float _1016 = _878;
    float _1018 = _870;
    if (!_994)
    {
        _1008 = _866;
    }
    float _1020 = _1008;
    float _1022 = _1020;
    if (!_994)
    {
        _1010 = _843;
    }
    float _1024 = _1010;
    float _1026 = _1024;
    if (!_994)
    {
        _1012 = _986;
    }
    float _1028 = _1012;
    bool _1030 = !_994;
    float _1032 = _1028;
    if (!_1030)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1038 = _956 + _1036;
        float _1040 = rsqrt(_906);
        float _1042 = _1038 * _1034;
        float _1044 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = _1042 * 0.15915493667125701904296875;
        float _1048 = _1046 * 6.283185482025146484375;
        float _1050 = cos(_1048);
        float _1052 = _1046 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        float _1056 = _1050 + (-1.0);
        float _1058 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1060 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = _1040 * _1058;
        float _1064 = fma(_986, _1050, _1060);
        float _1066 = fma(_878, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1068 = fma(_870, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1022 = _1066;
        _1032 = _1064;
        _1026 = _1068;
        _1014 = _1058;
    }
    float _1070 = _1022;
    float _1072 = _1032;
    float _1074 = _1026;
    float _1076 = _1014;
    float _1078 = _1076;
    if (_835)
    {
        _1078 = _1070;
    }
    float _1080 = _1078;
    float _1082 = _1080;
    if (_835)
    {
        _1016 = _1072;
    }
    float _1084 = _1016;
    float _1086 = _1084;
    if (_835)
    {
        _1018 = _1074;
    }
    float _1088 = _1018;
    float _1090 = _1088;
    if (!_835)
    {
        float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1094 = _964 + _1092;
        float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1098 = _815 + _1096;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1102 = _1094 * _1094;
        float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1106 = _809 + _1104;
        float _1108 = fma(_1098, _1098, _1102);
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1112 = fma(_1106, _1106, _1108);
        float _1114 = sqrt(_1112);
        float _1116 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1118 = -_815;
        float _1120 = _1118 + _1070;
        float _1122 = precise::min(_1114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1124 = _1122 * _1110;
        float _1126 = -_964;
        float _1128 = _1126 + _1072;
        float _1130 = _1116 * _1124;
        float _1132 = -_809;
        float _1134 = _1132 + _1074;
        float _1136 = fma(_1120, _1130, _815);
        float _1138 = fma(_1128, _1130, _964);
        float _1140 = fma(_1134, _1130, _809);
        _1086 = _1138;
        _1082 = _1136;
        _1090 = _1140;
    }
    float _1142 = _1086;
    float _1144 = _1082;
    float _1146 = _1090;
    int _1148 = _671 + 8;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
    int _1154 = int(_1150) & 3;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[int(_1152)][_1154];
    float _1158 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1162 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1166 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1158);
    float _1168 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1160);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1164);
    float _1174 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1166);
    float _1176 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1168);
    float _1178 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1172);
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1190);
    float _1200 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1202 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1206 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1208 = -_946;
    float _1210 = _1208 + 1.0;
    float _1212 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1198);
    float _1214 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1216 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1218 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1220 = fma(_954, _1210, _1000);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1224 = -_896;
    float _1226 = _1224 + 1.0;
    float _1228 = -_1006;
    float _1230 = _1228 + 0.5;
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1234 = _904 + 0.5;
    float _1236 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1238 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1218);
    float _1240 = -_1226;
    float _1242 = fma(_847, _1240, _992);
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1246 = _856 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1248 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1250 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1252 = _1236 + _1238;
    float _1254 = _1244 * _1204;
    float _1256 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1222);
    float _1258 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1260 = _1250 * _1188;
    float _1262 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1264 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1272 = _1252 * 0.5;
    out.m_33.x = _1262;
    out.m_52.x = _1242;
    out.m_52.y = _1220;
    out.m_52.z = _1260;
    out.m_52.w = _1254;
    out.m_54.x = _1264;
    out.m_54.y = _1266;
    out.m_54.z = _1268;
    out.m_54.w = _1270;
    out.gl_Position.x = _1256;
    out.gl_Position.y = _1232;
    out.gl_Position.z = _1236;
    out.gl_Position.w = _1238;
    out.m_56.z = _1272;
    out.m_56.w = _1238;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

