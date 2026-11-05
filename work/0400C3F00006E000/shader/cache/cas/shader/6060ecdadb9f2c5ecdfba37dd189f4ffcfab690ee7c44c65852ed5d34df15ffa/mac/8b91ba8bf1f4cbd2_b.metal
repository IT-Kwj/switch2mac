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
    float4 m_46 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _735 = false;
    bool _637 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1882 = as_type<float>(_89);
        out.gl_Position.z = _1882;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1952 = as_type<float>(_127);
        out.gl_Position.z = _1952;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = in.m_30.x;
    float _141 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _143 = in.m_30.z;
    float _145 = floor(_141);
    int _147 = as_type<int>(_135) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_135) & 2;
    bool _153 = _151 != 0;
    float _155 = _141 * 6.283185482025146484375;
    float _157 = _155 * 0.15915493667125701904296875;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _157 * 6.283185482025146484375;
    float _177 = cos(_175);
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    out.m_42.x = _139;
    float _183 = -_145;
    float _185 = _141 + _183;
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_181);
    float _193 = -_185;
    float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _197 = abs(_189);
    out.m_42.z = _143;
    bool _199 = !_169;
    int _201 = _199 ? 0 : 1;
    float _203 = float(_191);
    float _205 = fma(_177, 0.5, 0.5);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_195);
    float _213 = _203 * _211;
    float _215 = float(_197);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _221 = _185 < 0.5;
    float _223 = float(_221);
    float _225 = fma(_215, _219, _213);
    float _227 = -_223;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_209);
    float _233 = abs(_229);
    float _235 = fma(_231, _233, _225);
    bool _237 = !_149;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_207;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_73);
        float _263 = 1.0 / _261;
        float _265 = _107 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _289;
    float _293 = 1.0 / _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _299 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_267);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _275;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _267 + _313;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _287;
    float _321 = _315 * _293;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = _267 + _323;
    bool _327 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _329 = isnan(_267);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _291;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = _267 + _345;
    float _349 = _347 * _311;
    bool _351 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _353 = isnan(_267);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = 1.0 / _279;
    float _365 = _271 * _319;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _267 + _367;
    bool _371 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _373 = isnan(_267);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = 1.0 / _343;
    float _389 = _325 * _339;
    float _391 = -_337;
    float _393 = _391 + 1.0;
    float _395 = 1.0 / _297;
    float _397 = _369 * _363;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _401 = _267 + _399;
    float _403 = _361 * _393;
    bool _405 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_267);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _381 * _385;
    float _419 = -_381;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = _401 * _387;
    bool _429 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_267);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _443 = _267 + _441;
    float _445 = _415 * _421;
    float _447 = -_415;
    float _449 = _447 + 1.0;
    float _451 = fma(_425, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _453 = -_439;
    float _455 = _453 + 1.0;
    float _457 = _443 * _395;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    float _463 = _439 * _449;
    bool _465 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_267);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _309 * _455;
    float _479 = fma(_461, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _481 = -_309;
    float _483 = _481 + 1.0;
    bool _485 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _487 = isnan(_267);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_475;
    float _499 = _497 + 1.0;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = _475 * _483;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _515;
    float _519 = _495 * _499;
    float _521 = fma(_503, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_509, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _525 = fma(_513, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _527 = fma(_517, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _529 = _479 * _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = -_495;
    float _537 = _535 + 1.0;
    float _539 = _451 * _519;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_533, _397, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _547 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _549 = fma(_543, _397, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].y, _539);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _557;
    float _561 = fma(_521, _505, _547);
    float _563 = fma(_523, _505, _551);
    float _565 = fma(_555, _389, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_559, _389, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _577 = fma(_525, _477, _561);
    float _579 = fma(_527, _477, _563);
    float _581 = fma(_571, _457, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _583 = fma(_575, _457, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _585 = fma(_545, _463, _577);
    float _587 = fma(_549, _463, _579);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _593;
    float _597 = fma(_565, _445, _585);
    float _599 = fma(_567, _445, _587);
    float _601 = fma(_591, _427, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _603 = fma(_595, _427, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _605 = fma(_581, _417, _597);
    float _607 = fma(_583, _417, _599);
    float _609 = fma(_601, _403, _605);
    float _611 = fma(_603, _403, _607);
    float _613 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[150].x, _609);
    float _615 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[150].y, _611);
    bool _617 = !_317;
    float _619 = _565;
    float _635;
    if (!_617)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _623 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_73);
        float _641 = 1.0 / _639;
        float _643 = _107 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    bool _647 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_645);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _663 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _665 = isnan(_645);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _681 = _645 + _679;
    float _683 = 1.0 / _661;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _691 = _673 * _687;
    float _693 = -_673;
    float _695 = _693 + 1.0;
    float _697 = _677 * _683;
    float _699 = fma(_697, _681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _701 = _699 * _691;
    float _703 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _705 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[116].x, _703);
    float _707 = in.m_44.x;
    float _709 = in.m_44.y;
    float _711 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.w = _711;
    float _713 = _615 * _709;
    float _715 = _613 * _707;
    bool _717 = !_689;
    float _733;
    if (!_717)
    {
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _721 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        float _737 = float(_73);
        float _739 = 1.0 / _737;
        float _741 = _107 * _739;
        _733 = _741;
    }
    _735 = false;
    float _743 = _733;
    float _745 = in.m_37.z;
    float _747 = _129 * 2.0;
    float _749 = in.m_37.y;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _753 = _751 != 0;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = in.m_30.y;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    bool _773 = _129 > 0.5;
    float _775 = floor(_747);
    float _777 = -_239;
    int _779 = _773 ? as_type<int>(_777) : as_type<int>(_239);
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _783 = _781 != 0;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = 1.0 / _787;
    float _795 = _757 * _107;
    bool _797 = _745 > 0.5;
    if (!_753)
    {
        _619 = _749;
    }
    float _799 = _619;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _803 = -_239;
    int _805 = _797 ? as_type<int>(_803) : as_type<int>(_239);
    float _807 = _129 + _749;
    float _809 = _799;
    if (_753)
    {
        _809 = _129;
    }
    float _811 = _809;
    float _813 = exp2(_795);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    float _819 = _759 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _821 = _749 > 0.5;
    float _823 = _807 + (-1.0);
    bool _825 = !_817;
    float _827 = _825 ? _239 : as_type<float>(_779);
    float _829 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[5].x, _819);
    float _831 = -_161;
    int _833 = _821 ? as_type<int>(_831) : as_type<int>(_161);
    float _835 = _745 * 2.0;
    bool _837 = _775 > 0.0;
    float _839 = _749 * 2.0;
    bool _841 = _775 >= 0.0;
    bool _843 = isnan(_775);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = _759 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _759 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = floor(_835);
    float _857 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[83].z, _801);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _861 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _863 = _745 + _749;
    float _865 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _867 = -_813;
    float _869 = _867 + 1.0;
    float _871 = floor(_839);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _873;
    float _877 = _863 + (-1.0);
    float _879 = _827 + 0.5;
    float _881 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].z, _857);
    float _883 = _875 * _793;
    int _885 = _849 ? 0 : 1;
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _891 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _893 = ~_885;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    float _899 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _901 = _897;
    if (!_837)
    {
        int _903 = ~_885;
        int _905 = _903 + 1;
        _901 = _905;
    }
    int _907 = _901;
    float _909 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].z, _861);
    bool _911 = !_791;
    float _913 = _911 ? _161 : as_type<float>(_833);
    float _915 = -_881;
    float _917 = _915 + 1.0;
    bool _919 = !_783;
    float _921 = _919 ? _239 : as_type<float>(_805);
    float _923 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    bool _925 = _855 > 0.0;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _929 = _855 >= 0.0;
    bool _931 = isnan(_855);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].z, _829);
    bool _941 = _871 > 0.0;
    float _943 = -_913;
    float _945 = _943 + 0.5;
    bool _947 = _871 >= 0.0;
    bool _949 = isnan(_871);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _959 = _743 + _957;
    bool _961 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _963 = isnan(_743);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _975 = fma(_883, _959, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _977 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _979 = isnan(_743);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = -_971;
    float _991 = _989 + 1.0;
    float _993 = _889 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _997 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = _987 * _991;
    float _1001 = -_987;
    float _1003 = _1001 + 1.0;
    float _1005 = -_995;
    float _1007 = fma(_865, 2.0, _1005);
    float _1009 = _975 * _999;
    int _1011 = _955 ? 0 : 1;
    float _1013 = _939 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1015 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1017 = isnan(1.0);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1023 = _1019 || _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    int _1029 = ~_1011;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1009);
    int _1037 = _1033;
    if (!_941)
    {
        int _1039 = ~_1011;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = 1.0 / _1027;
    bool _1047 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = -_107;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1007);
    bool _1061 = !_767;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _921 + 0.5;
    float _1067 = _1055 ? _869 : 0.0;
    float _1069 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1035);
    int _1071 = abs(_1063);
    float _1073 = _997 * _927;
    int _1075 = _937 ? 0 : 1;
    float _1077 = fma(_993, _1065, _1059);
    float _1079 = _887 * _973;
    float _1081 = in.m_48.x;
    float _1083 = in.m_48.y;
    float _1085 = in.m_48.z;
    bool _1087 = !_763;
    int _1089 = _1087 ? 0 : 1;
    float _1091 = _923 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1093 = ~_1075;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _1097;
    if (_1023)
    {
        float _1101 = _1067 * _1045;
        _109 = _1101;
    }
    float _1103 = _109;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _1013 + _1105;
    if (!_925)
    {
        int _1109 = ~_1075;
        int _1111 = _1109 + 1;
        _1099 = _1111;
    }
    int _1113 = _1099;
    out.m_50.y = _1073;
    float _1115 = float(_1071);
    float _1117 = -_917;
    float _1119 = fma(_921, _1117, _1077);
    float _1121 = float(_907);
    out.m_50.x = _1079;
    float _1123 = _909 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1125 = _1107 * _1107;
    float _1127 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1129 = abs(_1089);
    float _1131 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1133 = _1115 * _1121;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1137 = _1123 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1141 = _1091 + _1139;
    float _1143 = _749 + (-0.5);
    float _1145 = _1133 * (-2.0);
    out.m_52.w = _1127;
    float _1147 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1131);
    float _1149 = fma(_1141, _1141, _1125);
    float _1151 = float(_1129);
    float _1153 = fma(_899, _1145, _899);
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1147);
    float _1157 = float(_1113);
    float _1159 = fma(_1137, _1137, _1149);
    out.m_50.z = _1119;
    bool _1161 = _1155 >= 0.0;
    float _1163 = _1151 * _1157;
    float _1165 = fma(_1145, _1083, _1083);
    float _1167 = rsqrt(_1159);
    float _1169 = _129 + (-0.5);
    float _1171 = _1163 * (-2.0);
    float _1173 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1165);
    bool _1175 = !_771;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = fma(_1171, _1081, _1081);
    float _1181 = fma(_891, _1171, _891);
    int _1183 = abs(_1177);
    float _1185 = fma(_1153, _1103, _1173);
    float _1187 = _1127;
    float _1189 = _1085;
    if (_1161)
    {
        _1187 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1191 = _1187;
    float _1193 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1179);
    int _1195 = as_type<int>(_1191);
    if (_1161)
    {
        out.m_33.x = 0.0;
    }
    if (_1161)
    {
        float _1197 = _1191 * 5.0;
        _1195 = as_type<int>(_1197);
    }
    int _1199 = _1195;
    float _1201 = float(_1183);
    float _1203 = _1107 * _1167;
    float _1205 = _1141 * _1167;
    float _1207 = _1137 * _1167;
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3628 = as_type<float>(_1199);
        out.gl_Position.z = _3628;
    }
    float _1209 = -_1203;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1107);
    if (_1161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1213 = -_1203;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1217 = -_1205;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1221 = _1211 * _1211;
    float _1223 = float(_1043);
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1227 = _1215 + _1225;
    float _1229 = -_1205;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1233 = -_1207;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1239 = _1219 + _1237;
    float _1241 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1243 = _129 + _745;
    float _1245 = _1201 * _1223;
    float _1247 = fma(_1181, _1103, _1193);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _1235 + _1249;
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1241);
    float _1255 = _1243 + (-1.0);
    float _1257 = _1245 * (-2.0);
    float _1259 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1253);
    float _1261 = _745 + (-0.5);
    float _1263 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1265 = _1247 * 0.15915493667125701904296875;
    float _1267 = fma(_1257, _1085, _1085);
    float _1269 = fma(_1231, _1231, _1221);
    float _1271 = -_1207;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    bool _1275 = _1259 >= 0.0;
    float _1277 = fma(_1263, _1257, _1263);
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1267);
    float _1281 = fma(_1273, _1273, _1269);
    float _1283 = _1185 * 0.15915493667125701904296875;
    float _1285 = _1265 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = fma(_1277, _1103, _1279);
    float _1291 = _1289 * 0.15915493667125701904296875;
    float _1293 = sqrt(_1281);
    if (_1275)
    {
        _1189 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1189;
    int _1297 = as_type<int>(_1295);
    if (_1275)
    {
        out.m_33.x = 0.0;
    }
    if (_1275)
    {
        float _1299 = _1295 * 5.0;
        _1297 = as_type<int>(_1299);
    }
    int _1301 = _1297;
    float _1303 = _1283 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    if (_1275)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3804 = as_type<float>(_1301);
        out.gl_Position.z = _3804;
    }
    float _1307 = _1283 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1167 * _1293;
    float _1313 = _1265 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1291 * 6.283185482025146484375;
    float _1319 = sin(_1317);
    if (_1275)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1321 = _1291 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _1329 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1333 = _1311 * _1325;
    float _1335 = _1287 * _1305;
    float _1337 = _1311 * _1329;
    float _1339 = _1315 * _1305;
    float _1341 = _1327 * _1333;
    float _1343 = _1315 * _1309;
    float _1345 = _1331 * _1337;
    float _1347 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1349 = _1347 * 0.5;
    float _1351 = fma(_1319, _1343, _1335);
    float _1353 = fma(_1319, _1335, _1343);
    float _1355 = _1323 * _1341;
    float _1357 = _1305 * _1323;
    float _1359 = _1309 * _1323;
    float _1361 = _1287 * _1309;
    float _1363 = _1315 * _1355;
    float _1365 = -_1341;
    float _1367 = _1319 * _1365;
    float _1369 = _1287 * _1355;
    float _1371 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1373 = fma(_1351, _1345, _1363);
    float _1375 = -_1361;
    float _1377 = fma(_1319, _1339, _1375);
    float _1379 = -_1339;
    float _1381 = fma(_1319, _1361, _1379);
    float _1383 = fma(_1359, _1345, _1367);
    float _1385 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1387 = fma(_1377, _1349, _1373);
    float _1389 = fma(_1381, _1345, _1369);
    float _1391 = fma(_1357, _1349, _1383);
    float _1393 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1371);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1397 = fma(_1353, _1349, _1389);
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1393);
    float _1403 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1395);
    bool _1405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1407 = isnan(0.5);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1413 = _1409 || _1411;
    float _1415 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1417 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1419 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1421 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1415);
    float _1423 = 1.0 / _1417;
    float _1425 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1427 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1429 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1385);
    float _1431 = _1123 + _1425;
    float _1433 = _1091 + _1427;
    float _1435 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1429);
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1433 + _1441;
    float _1445 = _1435 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1447 = _1439 * _1439;
    float _1449 = _1445 + _1417;
    float _1451 = fma(_1443, _1443, _1447);
    float _1453 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1455 = _1449 * _1423;
    float _1457 = _1455 * 0.5;
    float _1459 = sqrt(_1451);
    float _1461 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1453);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1465 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1463);
    float _1467 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1461);
    float _1469 = 1.0 / _1465;
    float _1471 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1473 = _1013 + _1471;
    bool _1475 = _1459 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1387;
    float _1479 = _1417;
    float _1481 = _1433;
    if (!_1475)
    {
        _1477 = _1431;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (!_1475)
    {
        _1479 = _1473;
    }
    float _1487 = _1479;
    bool _1489 = !_1475;
    float _1491 = _1487;
    if (!_1489)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1497 = _1459 + _1495;
        float _1499 = rsqrt(_1451);
        float _1501 = _1497 * _1493;
        float _1503 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = _1501 * 0.15915493667125701904296875;
        float _1507 = _1505 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = _1505 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = fma(_1509, _1503, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1517 = _1499 * _1515;
        float _1519 = _1513 + (-1.0);
        float _1521 = fma(_1443, _1517, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1523 = fma(_1439, _1517, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1525 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = fma(_1473, _1513, _1525);
        _1481 = _1521;
        _1491 = _1527;
        _1485 = _1523;
    }
    float _1529 = _1481;
    float _1531 = _1491;
    float _1533 = _1485;
    bool _1535 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1543 = _1539 || _1541;
    float _1545 = -_1205;
    float _1547 = fma(_1545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1529);
    float _1549 = -_1203;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1531);
    float _1553 = -_1207;
    float _1555 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1533);
    float _1557 = _1551;
    float _1559 = _1547;
    float _1561 = _1555;
    if (!_1413)
    {
        float _1563 = _1227 * _1227;
        float _1565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1567 = -_1123;
        float _1569 = _1567 + _1533;
        float _1571 = fma(_1239, _1239, _1563);
        float _1573 = fma(_1251, _1251, _1571);
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1577 = sqrt(_1573);
        float _1579 = 1.0 / _1311;
        float _1581 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1585 = _1583 * _1565;
        float _1587 = _1585 * _1579;
        float _1589 = -_1091;
        float _1591 = _1589 + _1529;
        float _1593 = -_1013;
        float _1595 = _1593 + _1531;
        float _1597 = _1581 * _1587;
        float _1599 = _1569 * _1587;
        float _1601 = fma(_1591, _1597, _1219);
        float _1603 = fma(_1595, _1597, _1215);
        float _1605 = fma(_1581, _1599, _1235);
        _1557 = _1603;
        _1559 = _1601;
        _1561 = _1605;
    }
    float _1607 = _1557;
    float _1609 = _1559;
    float _1611 = _1561;
    float _1613 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1619 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1613);
    float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1615);
    float _1625 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1617);
    float _1627 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1619);
    float _1629 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1621);
    float _1631 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1623);
    float _1633 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1625);
    float _1635 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1627);
    float _1637 = _1623;
    float _1639 = _1611;
    if (_1543)
    {
        _1637 = 1.0;
    }
    float _1641 = _1637;
    float _1643 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1645 = _1641;
    if (_1543)
    {
        _1639 = 1.0;
    }
    float _1647 = _1639;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1651 = _1469 * _1649;
    float _1653 = _1647;
    if (!_1543)
    {
        float _1655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1657 = _1655 * 0.15915493667125701904296875;
        float _1659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1663 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1661;
        float _1665 = _1657 * 6.283185482025146484375;
        float _1667 = cos(_1665);
        float _1669 = _1659 * 0.15915493667125701904296875;
        float _1671 = _1657 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        float _1675 = 1.0 / _1667;
        float _1677 = _1669 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1673 * _1675;
        float _1683 = _1669 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = 1.0 / _1663;
        float _1691 = 1.0 / _1687;
        float _1693 = _1685 * _1691;
        float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1697 = fma(_1651, _1693, _1695);
        float _1699 = _1697 * _1689;
        float _1701 = precise::clamp(_1699, 0.0, 1.0);
        _1645 = _1701;
    }
    float _1703 = _1645;
    if (!_1543)
    {
        float _1705 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1707 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1709 = _1705 * 0.15915493667125701904296875;
        float _1711 = _1707 * 0.15915493667125701904296875;
        float _1713 = _1709 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1717;
        float _1721 = _1709 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = 1.0 / _1715;
        float _1727 = _1711 * 6.283185482025146484375;
        float _1729 = cos(_1727);
        float _1731 = _1723 * _1725;
        float _1733 = _1711 * 6.283185482025146484375;
        float _1735 = sin(_1733);
        float _1737 = _1729 * _1731;
        float _1739 = 1.0 / _1719;
        float _1741 = 1.0 / _1737;
        float _1743 = _1735 * _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1747 = fma(_1651, _1743, _1745);
        float _1749 = _1747 * _1739;
        float _1751 = precise::clamp(_1749, 0.0, 1.0);
        float _1753 = -_1751;
        float _1755 = _1753 + 1.0;
        _1653 = _1755;
    }
    float _1757 = _1653;
    float _1759 = _1631 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1763 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1765 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1767 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1769 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1761);
    float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1763);
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1767);
    float _1777 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1779 = _1703 > 0.0;
    bool _1781 = isnan(_1703);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan(0.0);
    bool _1787 = _1783 || _1785;
    float _1789 = _1703 * _1757;
    float _1791 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1793 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1773);
    float _1795 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    bool _1797 = _1757 <= 0.0;
    bool _1799 = !_1787;
    bool _1801 = _1797 || _1799;
    float _1803 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1805 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1807 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1793);
    float _1809 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1795);
    float _1811 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1771);
    float _1813 = _235 * _1803;
    float _1815 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1805);
    float _1817 = _1807 + _1809;
    float _1819 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1811);
    float _1821 = _1813 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1823 = _1817 * 0.5;
    out.m_33.x = _1821;
    out.gl_Position.x = _1815;
    out.gl_Position.y = _1819;
    out.gl_Position.z = _1807;
    out.gl_Position.w = _1809;
    out.m_54.z = _1823;
    out.m_54.w = _1809;
    if (!_1801)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1825;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _735 = false;
    bool _637 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1882 = as_type<float>(_89);
        out.gl_Position.z = _1882;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1952 = as_type<float>(_127);
        out.gl_Position.z = _1952;
    }
    if (_119)
    {
        return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = in.m_30.x;
    float _141 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _143 = in.m_30.z;
    float _145 = floor(_141);
    int _147 = as_type<int>(_135) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_135) & 2;
    bool _153 = _151 != 0;
    float _155 = _141 * 6.283185482025146484375;
    float _157 = _155 * 0.15915493667125701904296875;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _157 * 6.283185482025146484375;
    float _177 = cos(_175);
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    out.m_42.x = _139;
    float _183 = -_145;
    float _185 = _141 + _183;
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_181);
    float _193 = -_185;
    float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _197 = abs(_189);
    out.m_42.z = _143;
    bool _199 = !_169;
    int _201 = _199 ? 0 : 1;
    float _203 = float(_191);
    float _205 = fma(_177, 0.5, 0.5);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_195);
    float _213 = _203 * _211;
    float _215 = float(_197);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _221 = _185 < 0.5;
    float _223 = float(_221);
    float _225 = fma(_215, _219, _213);
    float _227 = -_223;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_209);
    float _233 = abs(_229);
    float _235 = fma(_231, _233, _225);
    bool _237 = !_149;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_207;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_73);
        float _263 = 1.0 / _261;
        float _265 = _107 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _289;
    float _293 = 1.0 / _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _299 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_267);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _275;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _267 + _313;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _287;
    float _321 = _315 * _293;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = _267 + _323;
    bool _327 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _329 = isnan(_267);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _291;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = _267 + _345;
    float _349 = _347 * _311;
    bool _351 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _353 = isnan(_267);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = 1.0 / _279;
    float _365 = _271 * _319;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _267 + _367;
    bool _371 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _373 = isnan(_267);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = 1.0 / _343;
    float _389 = _325 * _339;
    float _391 = -_337;
    float _393 = _391 + 1.0;
    float _395 = 1.0 / _297;
    float _397 = _369 * _363;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _401 = _267 + _399;
    float _403 = _361 * _393;
    bool _405 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_267);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _381 * _385;
    float _419 = -_381;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = _401 * _387;
    bool _429 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_267);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _443 = _267 + _441;
    float _445 = _415 * _421;
    float _447 = -_415;
    float _449 = _447 + 1.0;
    float _451 = fma(_425, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _453 = -_439;
    float _455 = _453 + 1.0;
    float _457 = _443 * _395;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    float _463 = _439 * _449;
    bool _465 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_267);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _309 * _455;
    float _479 = fma(_461, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _481 = -_309;
    float _483 = _481 + 1.0;
    bool _485 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _487 = isnan(_267);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_475;
    float _499 = _497 + 1.0;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = _475 * _483;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _515;
    float _519 = _495 * _499;
    float _521 = fma(_503, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_509, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _525 = fma(_513, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _527 = fma(_517, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _529 = _479 * _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = -_495;
    float _537 = _535 + 1.0;
    float _539 = _451 * _519;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_533, _397, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _547 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _549 = fma(_543, _397, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].y, _539);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _557;
    float _561 = fma(_521, _505, _547);
    float _563 = fma(_523, _505, _551);
    float _565 = fma(_555, _389, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_559, _389, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _577 = fma(_525, _477, _561);
    float _579 = fma(_527, _477, _563);
    float _581 = fma(_571, _457, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _583 = fma(_575, _457, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _585 = fma(_545, _463, _577);
    float _587 = fma(_549, _463, _579);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _593;
    float _597 = fma(_565, _445, _585);
    float _599 = fma(_567, _445, _587);
    float _601 = fma(_591, _427, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _603 = fma(_595, _427, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _605 = fma(_581, _417, _597);
    float _607 = fma(_583, _417, _599);
    float _609 = fma(_601, _403, _605);
    float _611 = fma(_603, _403, _607);
    float _613 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[150].x, _609);
    float _615 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[150].y, _611);
    bool _617 = !_317;
    float _619 = _565;
    float _635;
    if (!_617)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _623 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_73);
        float _641 = 1.0 / _639;
        float _643 = _107 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    bool _647 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_645);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _663 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _665 = isnan(_645);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _681 = _645 + _679;
    float _683 = 1.0 / _661;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _691 = _673 * _687;
    float _693 = -_673;
    float _695 = _693 + 1.0;
    float _697 = _677 * _683;
    float _699 = fma(_697, _681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _701 = _699 * _691;
    float _703 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _705 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[116].x, _703);
    float _707 = in.m_44.x;
    float _709 = in.m_44.y;
    float _711 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.w = _711;
    float _713 = _615 * _709;
    float _715 = _613 * _707;
    bool _717 = !_689;
    float _733;
    if (!_717)
    {
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _721 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        float _737 = float(_73);
        float _739 = 1.0 / _737;
        float _741 = _107 * _739;
        _733 = _741;
    }
    _735 = false;
    float _743 = _733;
    float _745 = in.m_37.z;
    float _747 = _129 * 2.0;
    float _749 = in.m_37.y;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _753 = _751 != 0;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = in.m_30.y;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    bool _773 = _129 > 0.5;
    float _775 = floor(_747);
    float _777 = -_239;
    int _779 = _773 ? as_type<int>(_777) : as_type<int>(_239);
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _783 = _781 != 0;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = 1.0 / _787;
    float _795 = _757 * _107;
    bool _797 = _745 > 0.5;
    if (!_753)
    {
        _619 = _749;
    }
    float _799 = _619;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _803 = -_239;
    int _805 = _797 ? as_type<int>(_803) : as_type<int>(_239);
    float _807 = _129 + _749;
    float _809 = _799;
    if (_753)
    {
        _809 = _129;
    }
    float _811 = _809;
    float _813 = exp2(_795);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    float _819 = _759 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _821 = _749 > 0.5;
    float _823 = _807 + (-1.0);
    bool _825 = !_817;
    float _827 = _825 ? _239 : as_type<float>(_779);
    float _829 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[5].x, _819);
    float _831 = -_161;
    int _833 = _821 ? as_type<int>(_831) : as_type<int>(_161);
    float _835 = _745 * 2.0;
    bool _837 = _775 > 0.0;
    float _839 = _749 * 2.0;
    bool _841 = _775 >= 0.0;
    bool _843 = isnan(_775);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = _759 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _759 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = floor(_835);
    float _857 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[83].z, _801);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _861 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _863 = _745 + _749;
    float _865 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _867 = -_813;
    float _869 = _867 + 1.0;
    float _871 = floor(_839);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _873;
    float _877 = _863 + (-1.0);
    float _879 = _827 + 0.5;
    float _881 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].z, _857);
    float _883 = _875 * _793;
    int _885 = _849 ? 0 : 1;
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _891 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _893 = ~_885;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    float _899 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _901 = _897;
    if (!_837)
    {
        int _903 = ~_885;
        int _905 = _903 + 1;
        _901 = _905;
    }
    int _907 = _901;
    float _909 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].z, _861);
    bool _911 = !_791;
    float _913 = _911 ? _161 : as_type<float>(_833);
    float _915 = -_881;
    float _917 = _915 + 1.0;
    bool _919 = !_783;
    float _921 = _919 ? _239 : as_type<float>(_805);
    float _923 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    bool _925 = _855 > 0.0;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _929 = _855 >= 0.0;
    bool _931 = isnan(_855);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].z, _829);
    bool _941 = _871 > 0.0;
    float _943 = -_913;
    float _945 = _943 + 0.5;
    bool _947 = _871 >= 0.0;
    bool _949 = isnan(_871);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _959 = _743 + _957;
    bool _961 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _963 = isnan(_743);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _975 = fma(_883, _959, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _977 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _979 = isnan(_743);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = -_971;
    float _991 = _989 + 1.0;
    float _993 = _889 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _997 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = _987 * _991;
    float _1001 = -_987;
    float _1003 = _1001 + 1.0;
    float _1005 = -_995;
    float _1007 = fma(_865, 2.0, _1005);
    float _1009 = _975 * _999;
    int _1011 = _955 ? 0 : 1;
    float _1013 = _939 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1015 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1017 = isnan(1.0);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1023 = _1019 || _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    int _1029 = ~_1011;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1009);
    int _1037 = _1033;
    if (!_941)
    {
        int _1039 = ~_1011;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = 1.0 / _1027;
    bool _1047 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = -_107;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1007);
    bool _1061 = !_767;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _921 + 0.5;
    float _1067 = _1055 ? _869 : 0.0;
    float _1069 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1035);
    int _1071 = abs(_1063);
    float _1073 = _997 * _927;
    int _1075 = _937 ? 0 : 1;
    float _1077 = fma(_993, _1065, _1059);
    float _1079 = _887 * _973;
    float _1081 = in.m_48.x;
    float _1083 = in.m_48.y;
    float _1085 = in.m_48.z;
    bool _1087 = !_763;
    int _1089 = _1087 ? 0 : 1;
    float _1091 = _923 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1093 = ~_1075;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _1097;
    if (_1023)
    {
        float _1101 = _1067 * _1045;
        _109 = _1101;
    }
    float _1103 = _109;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _1013 + _1105;
    if (!_925)
    {
        int _1109 = ~_1075;
        int _1111 = _1109 + 1;
        _1099 = _1111;
    }
    int _1113 = _1099;
    out.m_50.y = _1073;
    float _1115 = float(_1071);
    float _1117 = -_917;
    float _1119 = fma(_921, _1117, _1077);
    float _1121 = float(_907);
    out.m_50.x = _1079;
    float _1123 = _909 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1125 = _1107 * _1107;
    float _1127 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1129 = abs(_1089);
    float _1131 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1133 = _1115 * _1121;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1137 = _1123 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1141 = _1091 + _1139;
    float _1143 = _749 + (-0.5);
    float _1145 = _1133 * (-2.0);
    out.m_52.w = _1127;
    float _1147 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1131);
    float _1149 = fma(_1141, _1141, _1125);
    float _1151 = float(_1129);
    float _1153 = fma(_899, _1145, _899);
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1147);
    float _1157 = float(_1113);
    float _1159 = fma(_1137, _1137, _1149);
    out.m_50.z = _1119;
    bool _1161 = _1155 >= 0.0;
    float _1163 = _1151 * _1157;
    float _1165 = fma(_1145, _1083, _1083);
    float _1167 = rsqrt(_1159);
    float _1169 = _129 + (-0.5);
    float _1171 = _1163 * (-2.0);
    float _1173 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1165);
    bool _1175 = !_771;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = fma(_1171, _1081, _1081);
    float _1181 = fma(_891, _1171, _891);
    int _1183 = abs(_1177);
    float _1185 = fma(_1153, _1103, _1173);
    float _1187 = _1127;
    float _1189 = _1085;
    if (_1161)
    {
        _1187 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1191 = _1187;
    float _1193 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1179);
    int _1195 = as_type<int>(_1191);
    if (_1161)
    {
        out.m_33.x = 0.0;
    }
    if (_1161)
    {
        float _1197 = _1191 * 5.0;
        _1195 = as_type<int>(_1197);
    }
    int _1199 = _1195;
    float _1201 = float(_1183);
    float _1203 = _1107 * _1167;
    float _1205 = _1141 * _1167;
    float _1207 = _1137 * _1167;
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3628 = as_type<float>(_1199);
        out.gl_Position.z = _3628;
    }
    float _1209 = -_1203;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1107);
    if (_1161)
    {
        return out;
    }
    float _1213 = -_1203;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1217 = -_1205;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1221 = _1211 * _1211;
    float _1223 = float(_1043);
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1227 = _1215 + _1225;
    float _1229 = -_1205;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1233 = -_1207;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1239 = _1219 + _1237;
    float _1241 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1243 = _129 + _745;
    float _1245 = _1201 * _1223;
    float _1247 = fma(_1181, _1103, _1193);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _1235 + _1249;
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1241);
    float _1255 = _1243 + (-1.0);
    float _1257 = _1245 * (-2.0);
    float _1259 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1253);
    float _1261 = _745 + (-0.5);
    float _1263 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1265 = _1247 * 0.15915493667125701904296875;
    float _1267 = fma(_1257, _1085, _1085);
    float _1269 = fma(_1231, _1231, _1221);
    float _1271 = -_1207;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    bool _1275 = _1259 >= 0.0;
    float _1277 = fma(_1263, _1257, _1263);
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1267);
    float _1281 = fma(_1273, _1273, _1269);
    float _1283 = _1185 * 0.15915493667125701904296875;
    float _1285 = _1265 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = fma(_1277, _1103, _1279);
    float _1291 = _1289 * 0.15915493667125701904296875;
    float _1293 = sqrt(_1281);
    if (_1275)
    {
        _1189 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1189;
    int _1297 = as_type<int>(_1295);
    if (_1275)
    {
        out.m_33.x = 0.0;
    }
    if (_1275)
    {
        float _1299 = _1295 * 5.0;
        _1297 = as_type<int>(_1299);
    }
    int _1301 = _1297;
    float _1303 = _1283 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    if (_1275)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3804 = as_type<float>(_1301);
        out.gl_Position.z = _3804;
    }
    float _1307 = _1283 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1167 * _1293;
    float _1313 = _1265 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1291 * 6.283185482025146484375;
    float _1319 = sin(_1317);
    if (_1275)
    {
        return out;
    }
    float _1321 = _1291 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _1329 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1333 = _1311 * _1325;
    float _1335 = _1287 * _1305;
    float _1337 = _1311 * _1329;
    float _1339 = _1315 * _1305;
    float _1341 = _1327 * _1333;
    float _1343 = _1315 * _1309;
    float _1345 = _1331 * _1337;
    float _1347 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1349 = _1347 * 0.5;
    float _1351 = fma(_1319, _1343, _1335);
    float _1353 = fma(_1319, _1335, _1343);
    float _1355 = _1323 * _1341;
    float _1357 = _1305 * _1323;
    float _1359 = _1309 * _1323;
    float _1361 = _1287 * _1309;
    float _1363 = _1315 * _1355;
    float _1365 = -_1341;
    float _1367 = _1319 * _1365;
    float _1369 = _1287 * _1355;
    float _1371 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1373 = fma(_1351, _1345, _1363);
    float _1375 = -_1361;
    float _1377 = fma(_1319, _1339, _1375);
    float _1379 = -_1339;
    float _1381 = fma(_1319, _1361, _1379);
    float _1383 = fma(_1359, _1345, _1367);
    float _1385 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1387 = fma(_1377, _1349, _1373);
    float _1389 = fma(_1381, _1345, _1369);
    float _1391 = fma(_1357, _1349, _1383);
    float _1393 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1371);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1397 = fma(_1353, _1349, _1389);
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1393);
    float _1403 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1395);
    bool _1405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1407 = isnan(0.5);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1413 = _1409 || _1411;
    float _1415 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1417 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1419 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1421 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1415);
    float _1423 = 1.0 / _1417;
    float _1425 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1427 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1429 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1385);
    float _1431 = _1123 + _1425;
    float _1433 = _1091 + _1427;
    float _1435 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1429);
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1433 + _1441;
    float _1445 = _1435 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1447 = _1439 * _1439;
    float _1449 = _1445 + _1417;
    float _1451 = fma(_1443, _1443, _1447);
    float _1453 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1455 = _1449 * _1423;
    float _1457 = _1455 * 0.5;
    float _1459 = sqrt(_1451);
    float _1461 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1453);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1465 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1463);
    float _1467 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1461);
    float _1469 = 1.0 / _1465;
    float _1471 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1473 = _1013 + _1471;
    bool _1475 = _1459 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1387;
    float _1479 = _1417;
    float _1481 = _1433;
    if (!_1475)
    {
        _1477 = _1431;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (!_1475)
    {
        _1479 = _1473;
    }
    float _1487 = _1479;
    bool _1489 = !_1475;
    float _1491 = _1487;
    if (!_1489)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1497 = _1459 + _1495;
        float _1499 = rsqrt(_1451);
        float _1501 = _1497 * _1493;
        float _1503 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = _1501 * 0.15915493667125701904296875;
        float _1507 = _1505 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = _1505 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = fma(_1509, _1503, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1517 = _1499 * _1515;
        float _1519 = _1513 + (-1.0);
        float _1521 = fma(_1443, _1517, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1523 = fma(_1439, _1517, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1525 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = fma(_1473, _1513, _1525);
        _1481 = _1521;
        _1491 = _1527;
        _1485 = _1523;
    }
    float _1529 = _1481;
    float _1531 = _1491;
    float _1533 = _1485;
    bool _1535 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1543 = _1539 || _1541;
    float _1545 = -_1205;
    float _1547 = fma(_1545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1529);
    float _1549 = -_1203;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1531);
    float _1553 = -_1207;
    float _1555 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1533);
    float _1557 = _1551;
    float _1559 = _1547;
    float _1561 = _1555;
    if (!_1413)
    {
        float _1563 = _1227 * _1227;
        float _1565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1567 = -_1123;
        float _1569 = _1567 + _1533;
        float _1571 = fma(_1239, _1239, _1563);
        float _1573 = fma(_1251, _1251, _1571);
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1577 = sqrt(_1573);
        float _1579 = 1.0 / _1311;
        float _1581 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1585 = _1583 * _1565;
        float _1587 = _1585 * _1579;
        float _1589 = -_1091;
        float _1591 = _1589 + _1529;
        float _1593 = -_1013;
        float _1595 = _1593 + _1531;
        float _1597 = _1581 * _1587;
        float _1599 = _1569 * _1587;
        float _1601 = fma(_1591, _1597, _1219);
        float _1603 = fma(_1595, _1597, _1215);
        float _1605 = fma(_1581, _1599, _1235);
        _1557 = _1603;
        _1559 = _1601;
        _1561 = _1605;
    }
    float _1607 = _1557;
    float _1609 = _1559;
    float _1611 = _1561;
    float _1613 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1619 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1613);
    float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1615);
    float _1625 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1617);
    float _1627 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1619);
    float _1629 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1621);
    float _1631 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1623);
    float _1633 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1625);
    float _1635 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1627);
    float _1637 = _1623;
    float _1639 = _1611;
    if (_1543)
    {
        _1637 = 1.0;
    }
    float _1641 = _1637;
    float _1643 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1645 = _1641;
    if (_1543)
    {
        _1639 = 1.0;
    }
    float _1647 = _1639;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1651 = _1469 * _1649;
    float _1653 = _1647;
    if (!_1543)
    {
        float _1655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1657 = _1655 * 0.15915493667125701904296875;
        float _1659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1663 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1661;
        float _1665 = _1657 * 6.283185482025146484375;
        float _1667 = cos(_1665);
        float _1669 = _1659 * 0.15915493667125701904296875;
        float _1671 = _1657 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        float _1675 = 1.0 / _1667;
        float _1677 = _1669 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1673 * _1675;
        float _1683 = _1669 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = 1.0 / _1663;
        float _1691 = 1.0 / _1687;
        float _1693 = _1685 * _1691;
        float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1697 = fma(_1651, _1693, _1695);
        float _1699 = _1697 * _1689;
        float _1701 = precise::clamp(_1699, 0.0, 1.0);
        _1645 = _1701;
    }
    float _1703 = _1645;
    if (!_1543)
    {
        float _1705 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1707 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1709 = _1705 * 0.15915493667125701904296875;
        float _1711 = _1707 * 0.15915493667125701904296875;
        float _1713 = _1709 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1717;
        float _1721 = _1709 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = 1.0 / _1715;
        float _1727 = _1711 * 6.283185482025146484375;
        float _1729 = cos(_1727);
        float _1731 = _1723 * _1725;
        float _1733 = _1711 * 6.283185482025146484375;
        float _1735 = sin(_1733);
        float _1737 = _1729 * _1731;
        float _1739 = 1.0 / _1719;
        float _1741 = 1.0 / _1737;
        float _1743 = _1735 * _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1747 = fma(_1651, _1743, _1745);
        float _1749 = _1747 * _1739;
        float _1751 = precise::clamp(_1749, 0.0, 1.0);
        float _1753 = -_1751;
        float _1755 = _1753 + 1.0;
        _1653 = _1755;
    }
    float _1757 = _1653;
    float _1759 = _1631 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1763 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1765 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1767 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1769 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1761);
    float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1763);
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1767);
    float _1777 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1779 = _1703 > 0.0;
    bool _1781 = isnan(_1703);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan(0.0);
    bool _1787 = _1783 || _1785;
    float _1789 = _1703 * _1757;
    float _1791 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1793 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1773);
    float _1795 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    bool _1797 = _1757 <= 0.0;
    bool _1799 = !_1787;
    bool _1801 = _1797 || _1799;
    float _1803 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1805 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1807 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1793);
    float _1809 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1795);
    float _1811 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1771);
    float _1813 = _235 * _1803;
    float _1815 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1805);
    float _1817 = _1807 + _1809;
    float _1819 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1811);
    float _1821 = _1813 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1823 = _1817 * 0.5;
    out.m_33.x = _1821;
    out.gl_Position.x = _1815;
    out.gl_Position.y = _1819;
    out.gl_Position.z = _1807;
    out.gl_Position.w = _1809;
    out.m_54.z = _1823;
    out.m_54.w = _1809;
    if (!_1801)
    {
        return out;
    }
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1825;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _735 = false;
    bool _637 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1882 = as_type<float>(_89);
        out.gl_Position.z = _1882;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1952 = as_type<float>(_127);
        out.gl_Position.z = _1952;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = in.m_30.x;
    float _141 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _143 = in.m_30.z;
    float _145 = floor(_141);
    int _147 = as_type<int>(_135) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_135) & 2;
    bool _153 = _151 != 0;
    float _155 = _141 * 6.283185482025146484375;
    float _157 = _155 * 0.15915493667125701904296875;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _157 * 6.283185482025146484375;
    float _177 = cos(_175);
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    out.m_42.x = _139;
    float _183 = -_145;
    float _185 = _141 + _183;
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_181);
    float _193 = -_185;
    float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _197 = abs(_189);
    out.m_42.z = _143;
    bool _199 = !_169;
    int _201 = _199 ? 0 : 1;
    float _203 = float(_191);
    float _205 = fma(_177, 0.5, 0.5);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_195);
    float _213 = _203 * _211;
    float _215 = float(_197);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _221 = _185 < 0.5;
    float _223 = float(_221);
    float _225 = fma(_215, _219, _213);
    float _227 = -_223;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_209);
    float _233 = abs(_229);
    float _235 = fma(_231, _233, _225);
    bool _237 = !_149;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_207;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_73);
        float _263 = 1.0 / _261;
        float _265 = _107 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _289;
    float _293 = 1.0 / _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _299 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_267);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _275;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _267 + _313;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _287;
    float _321 = _315 * _293;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _325 = _267 + _323;
    bool _327 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _329 = isnan(_267);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _291;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = _267 + _345;
    float _349 = _347 * _311;
    bool _351 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _353 = isnan(_267);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = 1.0 / _279;
    float _365 = _271 * _319;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _267 + _367;
    bool _371 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _373 = isnan(_267);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = 1.0 / _343;
    float _389 = _325 * _339;
    float _391 = -_337;
    float _393 = _391 + 1.0;
    float _395 = 1.0 / _297;
    float _397 = _369 * _363;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _401 = _267 + _399;
    float _403 = _361 * _393;
    bool _405 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_267);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _381 * _385;
    float _419 = -_381;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = _401 * _387;
    bool _429 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_267);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _443 = _267 + _441;
    float _445 = _415 * _421;
    float _447 = -_415;
    float _449 = _447 + 1.0;
    float _451 = fma(_425, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _453 = -_439;
    float _455 = _453 + 1.0;
    float _457 = _443 * _395;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    float _463 = _439 * _449;
    bool _465 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_267);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _309 * _455;
    float _479 = fma(_461, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _481 = -_309;
    float _483 = _481 + 1.0;
    bool _485 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _487 = isnan(_267);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_475;
    float _499 = _497 + 1.0;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = _475 * _483;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _515;
    float _519 = _495 * _499;
    float _521 = fma(_503, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_509, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _525 = fma(_513, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _527 = fma(_517, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _529 = _479 * _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = -_495;
    float _537 = _535 + 1.0;
    float _539 = _451 * _519;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_533, _397, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _547 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _549 = fma(_543, _397, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].y, _539);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _557;
    float _561 = fma(_521, _505, _547);
    float _563 = fma(_523, _505, _551);
    float _565 = fma(_555, _389, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_559, _389, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _577 = fma(_525, _477, _561);
    float _579 = fma(_527, _477, _563);
    float _581 = fma(_571, _457, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _583 = fma(_575, _457, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _585 = fma(_545, _463, _577);
    float _587 = fma(_549, _463, _579);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _593;
    float _597 = fma(_565, _445, _585);
    float _599 = fma(_567, _445, _587);
    float _601 = fma(_591, _427, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _603 = fma(_595, _427, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _605 = fma(_581, _417, _597);
    float _607 = fma(_583, _417, _599);
    float _609 = fma(_601, _403, _605);
    float _611 = fma(_603, _403, _607);
    float _613 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[150].x, _609);
    float _615 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[150].y, _611);
    bool _617 = !_317;
    float _619 = _565;
    float _635;
    if (!_617)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _623 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_73);
        float _641 = 1.0 / _639;
        float _643 = _107 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    bool _647 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_645);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _663 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _665 = isnan(_645);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _681 = _645 + _679;
    float _683 = 1.0 / _661;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _691 = _673 * _687;
    float _693 = -_673;
    float _695 = _693 + 1.0;
    float _697 = _677 * _683;
    float _699 = fma(_697, _681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _701 = _699 * _691;
    float _703 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _705 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[116].x, _703);
    float _707 = in.m_44.x;
    float _709 = in.m_44.y;
    float _711 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.w = _711;
    float _713 = _615 * _709;
    float _715 = _613 * _707;
    bool _717 = !_689;
    float _733;
    if (!_717)
    {
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _721 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        float _737 = float(_73);
        float _739 = 1.0 / _737;
        float _741 = _107 * _739;
        _733 = _741;
    }
    _735 = false;
    float _743 = _733;
    float _745 = in.m_37.z;
    float _747 = _129 * 2.0;
    float _749 = in.m_37.y;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _753 = _751 != 0;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = in.m_30.y;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    bool _773 = _129 > 0.5;
    float _775 = floor(_747);
    float _777 = -_239;
    int _779 = _773 ? as_type<int>(_777) : as_type<int>(_239);
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _783 = _781 != 0;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = 1.0 / _787;
    float _795 = _757 * _107;
    bool _797 = _745 > 0.5;
    if (!_753)
    {
        _619 = _749;
    }
    float _799 = _619;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _803 = -_239;
    int _805 = _797 ? as_type<int>(_803) : as_type<int>(_239);
    float _807 = _129 + _749;
    float _809 = _799;
    if (_753)
    {
        _809 = _129;
    }
    float _811 = _809;
    float _813 = exp2(_795);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    float _819 = _759 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _821 = _749 > 0.5;
    float _823 = _807 + (-1.0);
    bool _825 = !_817;
    float _827 = _825 ? _239 : as_type<float>(_779);
    float _829 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[5].x, _819);
    float _831 = -_161;
    int _833 = _821 ? as_type<int>(_831) : as_type<int>(_161);
    float _835 = _745 * 2.0;
    bool _837 = _775 > 0.0;
    float _839 = _749 * 2.0;
    bool _841 = _775 >= 0.0;
    bool _843 = isnan(_775);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = _759 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _759 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = floor(_835);
    float _857 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[83].z, _801);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _861 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _863 = _745 + _749;
    float _865 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _867 = -_813;
    float _869 = _867 + 1.0;
    float _871 = floor(_839);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _873;
    float _877 = _863 + (-1.0);
    float _879 = _827 + 0.5;
    float _881 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].z, _857);
    float _883 = _875 * _793;
    int _885 = _849 ? 0 : 1;
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _891 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _893 = ~_885;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    float _899 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _901 = _897;
    if (!_837)
    {
        int _903 = ~_885;
        int _905 = _903 + 1;
        _901 = _905;
    }
    int _907 = _901;
    float _909 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].z, _861);
    bool _911 = !_791;
    float _913 = _911 ? _161 : as_type<float>(_833);
    float _915 = -_881;
    float _917 = _915 + 1.0;
    bool _919 = !_783;
    float _921 = _919 ? _239 : as_type<float>(_805);
    float _923 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    bool _925 = _855 > 0.0;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _929 = _855 >= 0.0;
    bool _931 = isnan(_855);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].z, _829);
    bool _941 = _871 > 0.0;
    float _943 = -_913;
    float _945 = _943 + 0.5;
    bool _947 = _871 >= 0.0;
    bool _949 = isnan(_871);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _959 = _743 + _957;
    bool _961 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _963 = isnan(_743);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _975 = fma(_883, _959, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _977 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _979 = isnan(_743);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = -_971;
    float _991 = _989 + 1.0;
    float _993 = _889 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _997 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = _987 * _991;
    float _1001 = -_987;
    float _1003 = _1001 + 1.0;
    float _1005 = -_995;
    float _1007 = fma(_865, 2.0, _1005);
    float _1009 = _975 * _999;
    int _1011 = _955 ? 0 : 1;
    float _1013 = _939 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1015 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1017 = isnan(1.0);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1023 = _1019 || _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    int _1029 = ~_1011;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1009);
    int _1037 = _1033;
    if (!_941)
    {
        int _1039 = ~_1011;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = 1.0 / _1027;
    bool _1047 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = -_107;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1007);
    bool _1061 = !_767;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _921 + 0.5;
    float _1067 = _1055 ? _869 : 0.0;
    float _1069 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1035);
    int _1071 = abs(_1063);
    float _1073 = _997 * _927;
    int _1075 = _937 ? 0 : 1;
    float _1077 = fma(_993, _1065, _1059);
    float _1079 = _887 * _973;
    float _1081 = in.m_48.x;
    float _1083 = in.m_48.y;
    float _1085 = in.m_48.z;
    bool _1087 = !_763;
    int _1089 = _1087 ? 0 : 1;
    float _1091 = _923 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1093 = ~_1075;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _1097;
    if (_1023)
    {
        float _1101 = _1067 * _1045;
        _109 = _1101;
    }
    float _1103 = _109;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _1013 + _1105;
    if (!_925)
    {
        int _1109 = ~_1075;
        int _1111 = _1109 + 1;
        _1099 = _1111;
    }
    int _1113 = _1099;
    out.m_50.y = _1073;
    float _1115 = float(_1071);
    float _1117 = -_917;
    float _1119 = fma(_921, _1117, _1077);
    float _1121 = float(_907);
    out.m_50.x = _1079;
    float _1123 = _909 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1125 = _1107 * _1107;
    float _1127 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1129 = abs(_1089);
    float _1131 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1133 = _1115 * _1121;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1137 = _1123 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1141 = _1091 + _1139;
    float _1143 = _749 + (-0.5);
    float _1145 = _1133 * (-2.0);
    out.m_52.w = _1127;
    float _1147 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1131);
    float _1149 = fma(_1141, _1141, _1125);
    float _1151 = float(_1129);
    float _1153 = fma(_899, _1145, _899);
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1147);
    float _1157 = float(_1113);
    float _1159 = fma(_1137, _1137, _1149);
    out.m_50.z = _1119;
    bool _1161 = _1155 >= 0.0;
    float _1163 = _1151 * _1157;
    float _1165 = fma(_1145, _1083, _1083);
    float _1167 = rsqrt(_1159);
    float _1169 = _129 + (-0.5);
    float _1171 = _1163 * (-2.0);
    float _1173 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1165);
    bool _1175 = !_771;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = fma(_1171, _1081, _1081);
    float _1181 = fma(_891, _1171, _891);
    int _1183 = abs(_1177);
    float _1185 = fma(_1153, _1103, _1173);
    float _1187 = _1127;
    float _1189 = _1085;
    if (_1161)
    {
        _1187 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1191 = _1187;
    float _1193 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1179);
    int _1195 = as_type<int>(_1191);
    if (_1161)
    {
        out.m_33.x = 0.0;
    }
    if (_1161)
    {
        float _1197 = _1191 * 5.0;
        _1195 = as_type<int>(_1197);
    }
    int _1199 = _1195;
    float _1201 = float(_1183);
    float _1203 = _1107 * _1167;
    float _1205 = _1141 * _1167;
    float _1207 = _1137 * _1167;
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3628 = as_type<float>(_1199);
        out.gl_Position.z = _3628;
    }
    float _1209 = -_1203;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1107);
    if (_1161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1213 = -_1203;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1217 = -_1205;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1221 = _1211 * _1211;
    float _1223 = float(_1043);
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1227 = _1215 + _1225;
    float _1229 = -_1205;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1233 = -_1207;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1239 = _1219 + _1237;
    float _1241 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1243 = _129 + _745;
    float _1245 = _1201 * _1223;
    float _1247 = fma(_1181, _1103, _1193);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _1235 + _1249;
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1241);
    float _1255 = _1243 + (-1.0);
    float _1257 = _1245 * (-2.0);
    float _1259 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1253);
    float _1261 = _745 + (-0.5);
    float _1263 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1265 = _1247 * 0.15915493667125701904296875;
    float _1267 = fma(_1257, _1085, _1085);
    float _1269 = fma(_1231, _1231, _1221);
    float _1271 = -_1207;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    bool _1275 = _1259 >= 0.0;
    float _1277 = fma(_1263, _1257, _1263);
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1267);
    float _1281 = fma(_1273, _1273, _1269);
    float _1283 = _1185 * 0.15915493667125701904296875;
    float _1285 = _1265 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = fma(_1277, _1103, _1279);
    float _1291 = _1289 * 0.15915493667125701904296875;
    float _1293 = sqrt(_1281);
    if (_1275)
    {
        _1189 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1189;
    int _1297 = as_type<int>(_1295);
    if (_1275)
    {
        out.m_33.x = 0.0;
    }
    if (_1275)
    {
        float _1299 = _1295 * 5.0;
        _1297 = as_type<int>(_1299);
    }
    int _1301 = _1297;
    float _1303 = _1283 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    if (_1275)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3804 = as_type<float>(_1301);
        out.gl_Position.z = _3804;
    }
    float _1307 = _1283 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1167 * _1293;
    float _1313 = _1265 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1291 * 6.283185482025146484375;
    float _1319 = sin(_1317);
    if (_1275)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1321 = _1291 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _1329 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1333 = _1311 * _1325;
    float _1335 = _1287 * _1305;
    float _1337 = _1311 * _1329;
    float _1339 = _1315 * _1305;
    float _1341 = _1327 * _1333;
    float _1343 = _1315 * _1309;
    float _1345 = _1331 * _1337;
    float _1347 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1349 = _1347 * 0.5;
    float _1351 = fma(_1319, _1343, _1335);
    float _1353 = fma(_1319, _1335, _1343);
    float _1355 = _1323 * _1341;
    float _1357 = _1305 * _1323;
    float _1359 = _1309 * _1323;
    float _1361 = _1287 * _1309;
    float _1363 = _1315 * _1355;
    float _1365 = -_1341;
    float _1367 = _1319 * _1365;
    float _1369 = _1287 * _1355;
    float _1371 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1373 = fma(_1351, _1345, _1363);
    float _1375 = -_1361;
    float _1377 = fma(_1319, _1339, _1375);
    float _1379 = -_1339;
    float _1381 = fma(_1319, _1361, _1379);
    float _1383 = fma(_1359, _1345, _1367);
    float _1385 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1387 = fma(_1377, _1349, _1373);
    float _1389 = fma(_1381, _1345, _1369);
    float _1391 = fma(_1357, _1349, _1383);
    float _1393 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1371);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1397 = fma(_1353, _1349, _1389);
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1393);
    float _1403 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1395);
    bool _1405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1407 = isnan(0.5);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1413 = _1409 || _1411;
    float _1415 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1417 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1419 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1421 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1415);
    float _1423 = 1.0 / _1417;
    float _1425 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1427 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1429 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1385);
    float _1431 = _1123 + _1425;
    float _1433 = _1091 + _1427;
    float _1435 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1429);
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1433 + _1441;
    float _1445 = _1435 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1447 = _1439 * _1439;
    float _1449 = _1445 + _1417;
    float _1451 = fma(_1443, _1443, _1447);
    float _1453 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1455 = _1449 * _1423;
    float _1457 = _1455 * 0.5;
    float _1459 = sqrt(_1451);
    float _1461 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1453);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1465 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1463);
    float _1467 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1461);
    float _1469 = 1.0 / _1465;
    float _1471 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1473 = _1013 + _1471;
    bool _1475 = _1459 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1387;
    float _1479 = _1417;
    float _1481 = _1433;
    if (!_1475)
    {
        _1477 = _1431;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (!_1475)
    {
        _1479 = _1473;
    }
    float _1487 = _1479;
    bool _1489 = !_1475;
    float _1491 = _1487;
    if (!_1489)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1497 = _1459 + _1495;
        float _1499 = rsqrt(_1451);
        float _1501 = _1497 * _1493;
        float _1503 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = _1501 * 0.15915493667125701904296875;
        float _1507 = _1505 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = _1505 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = fma(_1509, _1503, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1517 = _1499 * _1515;
        float _1519 = _1513 + (-1.0);
        float _1521 = fma(_1443, _1517, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1523 = fma(_1439, _1517, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1525 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = fma(_1473, _1513, _1525);
        _1481 = _1521;
        _1491 = _1527;
        _1485 = _1523;
    }
    float _1529 = _1481;
    float _1531 = _1491;
    float _1533 = _1485;
    bool _1535 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1543 = _1539 || _1541;
    float _1545 = -_1205;
    float _1547 = fma(_1545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1529);
    float _1549 = -_1203;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1531);
    float _1553 = -_1207;
    float _1555 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1533);
    float _1557 = _1551;
    float _1559 = _1547;
    float _1561 = _1555;
    if (!_1413)
    {
        float _1563 = _1227 * _1227;
        float _1565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1567 = -_1123;
        float _1569 = _1567 + _1533;
        float _1571 = fma(_1239, _1239, _1563);
        float _1573 = fma(_1251, _1251, _1571);
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1577 = sqrt(_1573);
        float _1579 = 1.0 / _1311;
        float _1581 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1585 = _1583 * _1565;
        float _1587 = _1585 * _1579;
        float _1589 = -_1091;
        float _1591 = _1589 + _1529;
        float _1593 = -_1013;
        float _1595 = _1593 + _1531;
        float _1597 = _1581 * _1587;
        float _1599 = _1569 * _1587;
        float _1601 = fma(_1591, _1597, _1219);
        float _1603 = fma(_1595, _1597, _1215);
        float _1605 = fma(_1581, _1599, _1235);
        _1557 = _1603;
        _1559 = _1601;
        _1561 = _1605;
    }
    float _1607 = _1557;
    float _1609 = _1559;
    float _1611 = _1561;
    float _1613 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1619 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1613);
    float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1615);
    float _1625 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1617);
    float _1627 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1619);
    float _1629 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1621);
    float _1631 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1623);
    float _1633 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1625);
    float _1635 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1627);
    float _1637 = _1623;
    float _1639 = _1611;
    if (_1543)
    {
        _1637 = 1.0;
    }
    float _1641 = _1637;
    float _1643 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1645 = _1641;
    if (_1543)
    {
        _1639 = 1.0;
    }
    float _1647 = _1639;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1651 = _1469 * _1649;
    float _1653 = _1647;
    if (!_1543)
    {
        float _1655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1657 = _1655 * 0.15915493667125701904296875;
        float _1659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1663 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1661;
        float _1665 = _1657 * 6.283185482025146484375;
        float _1667 = cos(_1665);
        float _1669 = _1659 * 0.15915493667125701904296875;
        float _1671 = _1657 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        float _1675 = 1.0 / _1667;
        float _1677 = _1669 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1673 * _1675;
        float _1683 = _1669 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = 1.0 / _1663;
        float _1691 = 1.0 / _1687;
        float _1693 = _1685 * _1691;
        float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1697 = fma(_1651, _1693, _1695);
        float _1699 = _1697 * _1689;
        float _1701 = precise::clamp(_1699, 0.0, 1.0);
        _1645 = _1701;
    }
    float _1703 = _1645;
    if (!_1543)
    {
        float _1705 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1707 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1709 = _1705 * 0.15915493667125701904296875;
        float _1711 = _1707 * 0.15915493667125701904296875;
        float _1713 = _1709 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1717;
        float _1721 = _1709 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = 1.0 / _1715;
        float _1727 = _1711 * 6.283185482025146484375;
        float _1729 = cos(_1727);
        float _1731 = _1723 * _1725;
        float _1733 = _1711 * 6.283185482025146484375;
        float _1735 = sin(_1733);
        float _1737 = _1729 * _1731;
        float _1739 = 1.0 / _1719;
        float _1741 = 1.0 / _1737;
        float _1743 = _1735 * _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1747 = fma(_1651, _1743, _1745);
        float _1749 = _1747 * _1739;
        float _1751 = precise::clamp(_1749, 0.0, 1.0);
        float _1753 = -_1751;
        float _1755 = _1753 + 1.0;
        _1653 = _1755;
    }
    float _1757 = _1653;
    float _1759 = _1631 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1763 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1765 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1767 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1769 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1761);
    float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1763);
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1767);
    float _1777 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1779 = _1703 > 0.0;
    bool _1781 = isnan(_1703);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan(0.0);
    bool _1787 = _1783 || _1785;
    float _1789 = _1703 * _1757;
    float _1791 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1793 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1773);
    float _1795 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    bool _1797 = _1757 <= 0.0;
    bool _1799 = !_1787;
    bool _1801 = _1797 || _1799;
    float _1803 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1805 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1807 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1793);
    float _1809 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1795);
    float _1811 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1771);
    float _1813 = _235 * _1803;
    float _1815 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1805);
    float _1817 = _1807 + _1809;
    float _1819 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1811);
    float _1821 = _1813 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1823 = _1817 * 0.5;
    out.m_33.x = _1821;
    out.gl_Position.x = _1815;
    out.gl_Position.y = _1819;
    out.gl_Position.z = _1807;
    out.gl_Position.w = _1809;
    out.m_54.z = _1823;
    out.m_54.w = _1809;
    if (!_1801)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1825;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

