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
};

struct main0_out
{
    float4 m_35 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_26 [[attribute(3)]];
    float4 m_31 [[attribute(4)]];
    float4 m_33 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _455 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1450 = as_type<float>(_85);
        out.gl_Position.z = _1450;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_31.w;
    float _91 = in.m_33.x;
    bool _93 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_89;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.x = _91;
    float _107 = 0.0;
    float _109 = _105;
    if (_101)
    {
        float _111 = float(_69);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _79;
    if (_119)
    {
        out.m_29.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _87 = as_type<int>(_123);
    }
    int _125 = _87;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1523 = as_type<float>(_125);
        out.gl_Position.z = _1523;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_37.x;
    float _129 = in.m_37.y;
    float _131 = in.m_37.z;
    bool _133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _135 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _137 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _139 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _141 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _135);
    float _143 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _137);
    float _145 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _139);
    float _147 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _141);
    float _149 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _143);
    float _151 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _145);
    bool _153 = !_133;
    float _169;
    if (!_153)
    {
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _91 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_69);
        float _175 = 1.0 / _173;
        float _177 = _105 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _183 = _179 + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _189 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _199 = _197 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _201 = 1.0 / _187;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _203;
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _209 = 1.0 / _191;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _179 + _211;
    float _215 = 1.0 / _199;
    float _217 = _213 * _201;
    bool _219 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _221 = isnan(_179);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = 1.0 / _195;
    float _233 = _183 * _209;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _179 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _179 + _239;
    bool _243 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_179);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _205;
    float _257 = _237 * _215;
    bool _259 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _261 = isnan(_179);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _273 = _179 + _271;
    float _275 = _241 * _231;
    bool _277 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_179);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_269;
    float _291 = _289 + 1.0;
    float _293 = -_229;
    float _295 = _293 + 1.0;
    float _297 = -_287;
    float _299 = _297 + 1.0;
    float _301 = _287 * _291;
    float _303 = _273 * _255;
    bool _305 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_179);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _253 * _299;
    float _319 = -_253;
    float _321 = _319 + 1.0;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _269 * _295;
    bool _333 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_179);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _315 * _321;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -_315;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_325, _217, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_349, _217, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _343 * _353;
    float _365 = -_343;
    float _367 = _365 + 1.0;
    float _369 = fma(_357, _233, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_329, _233, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = _361 * _363;
    float _375 = _359 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _387 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _393 = fma(_379, _275, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_383, _275, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _401 = fma(_369, _345, _385);
    float _403 = fma(_371, _345, _387);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _405;
    float _409 = fma(_391, _257, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_399, _257, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _413;
    float _417 = fma(_393, _317, _401);
    float _419 = fma(_395, _317, _403);
    float _421 = fma(_407, _303, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _423 = fma(_415, _303, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _425 = fma(_409, _301, _417);
    float _427 = fma(_411, _301, _419);
    float _429 = fma(_421, _331, _425);
    float _431 = fma(_423, _331, _427);
    float _433 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[148].x, _429);
    float _435 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[148].y, _431);
    bool _437 = !_207;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _91 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_69);
        float _459 = 1.0 / _457;
        float _461 = _105 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_33.z;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    float _471 = _91 * 2.0;
    float _473 = as_type<float>(int(gl_VertexIndex));
    float _475 = in.m_33.y;
    float _477 = floor(_471);
    float _479 = in.m_33.w;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _481;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = _469 * _105;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    float _497 = 1.0 / _483;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _501 = _465 * 2.0;
    float _503 = _91 + _465;
    int _505 = as_type<int>(_473) & 1;
    bool _507 = _505 != 0;
    int _509 = as_type<int>(_473) & 2;
    bool _511 = _509 != 0;
    float _513 = exp2(_489);
    float _515 = _91 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _517 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _519 = isnan(1.0);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _525 = _521 || _523;
    float _527 = _475 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _529 = _477 > 0.0;
    float _531 = -_499;
    float _533 = fma(_515, 2.0, _531);
    bool _535 = _477 >= 0.0;
    bool _537 = isnan(_477);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    float _545 = _475 * 2.0;
    float _547 = floor(_501);
    float _549 = fma(_527, -2.0, _491);
    float _551 = -_105;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[76].x, _533);
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _567 = _435 * _487;
    float _569 = 1.0 / _495;
    float _571 = -_513;
    float _573 = _571 + 1.0;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _577 = fma(_91, (*spvDescriptorSet0.vp_c9)._m0[78].z, _565);
    float _579 = _503 + (-1.0);
    float _581 = _563 ? _573 : 0.0;
    float _583 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[78].w, _575);
    float _585 = floor(_545);
    bool _587 = _547 > 0.0;
    float _589 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _577);
    bool _591 = _547 >= 0.0;
    bool _593 = isnan(_547);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    float _603 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _583);
    int _605 = _543 ? 0 : 1;
    float _607 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_525)
    {
        float _609 = _581 * _569;
        _109 = _609;
    }
    float _611 = _109;
    int _613 = _599 ? 0 : 1;
    int _615 = ~_605;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    int _621 = ~_613;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    int _627 = _625;
    int _629 = _619;
    if (!_587)
    {
        int _631 = ~_613;
        int _633 = _631 + 1;
        _627 = _633;
    }
    int _635 = _627;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _637;
    bool _641 = _585 > 0.0;
    if (!_529)
    {
        int _643 = ~_605;
        int _645 = _643 + 1;
        _629 = _645;
    }
    int _647 = _629;
    float _649 = in.m_26.x;
    float _651 = in.m_26.y;
    float _653 = in.m_26.z;
    bool _655 = _585 >= 0.0;
    bool _657 = isnan(_585);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    float _665 = 1.0 / _639;
    int _667 = _663 ? 0 : 1;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _675 = _673 != 0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _679 = _677 != 0;
    int _681 = ~_667;
    int _683 = _681 + 1;
    int _685 = _683 + 1;
    int _687 = _685;
    if (!_641)
    {
        int _689 = ~_667;
        int _691 = _689 + 1;
        _687 = _691;
    }
    int _693 = _687;
    bool _695 = !_675;
    int _697 = _695 ? 0 : 1;
    bool _699 = _479 > 0.5;
    float _701 = _433 * _485;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _709 = _463 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _713 = _463 + _711;
    float _715 = 1.0 / _705;
    float _717 = _709 * _665;
    int _719 = abs(_697);
    float _721 = _651 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _723 = !_507;
    float _725 = _723 ? (-0.5) : 0.5;
    float _727 = _651 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _729 = !_671;
    int _731 = _729 ? 0 : 1;
    float _733 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = in.m_44.x;
    float _741 = in.m_44.y;
    float _743 = in.m_44.z;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _755 = _753 != 0;
    float _757 = _651 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _759 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[4].x, _721);
    float _761 = float(_719);
    float _763 = _713 * _715;
    float _765 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[5].x, _757);
    float _767 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[6].x, _727);
    float _769 = _475 + _465;
    float _771 = float(_647);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _775 = _463 + _773;
    int _777 = abs(_731);
    float _779 = _769 + (-1.0);
    float _781 = _761 * _771;
    bool _783 = !_679;
    int _785 = _783 ? 0 : 1;
    float _787 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _789 = _775 * _497;
    float _791 = _781 * (-2.0);
    bool _793 = _475 > 0.5;
    float _795 = _91 + _475;
    int _797 = abs(_785);
    float _799 = _475 + (-0.5);
    float _801 = fma(_791, _741, _741);
    float _803 = float(_777);
    float _805 = fma(_787, _791, _787);
    float _807 = float(_635);
    float _809 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = _795 + (-1.0);
    float _813 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[4].z, _759);
    float _815 = _803 * _807;
    float _817 = fma(_805, _611, _809);
    float _819 = float(_797);
    float _821 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _823 = float(_693);
    float _825 = _815 * (-2.0);
    bool _827 = !_511;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _817 * 0.15915493667125701904296875;
    bool _833 = _91 > 0.5;
    float _835 = _91 + (-0.5);
    float _837 = fma(_825, _739, _739);
    float _839 = _819 * _823;
    float _841 = fma(_821, _825, _821);
    float _843 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[196].x, _837);
    float _845 = _839 * (-2.0);
    float _847 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[5].z, _765);
    float _849 = fma(_841, _611, _843);
    float _851 = -_725;
    int _853 = _833 ? as_type<int>(_851) : as_type<int>(_725);
    float _855 = fma(_845, _743, _743);
    bool _857 = _465 > 0.5;
    float _859 = _465 + (-0.5);
    float _861 = fma(_607, _845, _607);
    float _863 = _831 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[196].z, _855);
    float _869 = _849 * 0.15915493667125701904296875;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = fma(_861, _611, _867);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _881;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _889 = _831 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _899 = fma(_873, _717, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _901 = fma(_877, _717, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _903 = fma(_883, _717, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _905 = fma(_887, _763, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _907 = _869 * 6.283185482025146484375;
    float _909 = sin(_907);
    float _911 = _879 * 0.15915493667125701904296875;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_897, _763, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _919 = fma(_915, _763, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _923 = _869 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _931;
    float _935 = _813 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _937 = _847 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _939 = _911 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _943;
    float _947 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _949 = fma(_929, _789, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _951 = -_725;
    int _953 = _857 ? as_type<int>(_951) : as_type<int>(_725);
    float _955 = fma(_945, _789, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _957 = fma(_933, _789, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _959 = _947 * _921;
    float _961 = _911 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _725);
    bool _967 = !_737;
    float _969 = _967 ? _725 : as_type<float>(_853);
    float _971 = _909 * _865;
    float _973 = _925 * _891;
    float _975 = _733 * _965;
    float _977 = _925 * _865;
    bool _979 = !_751;
    float _981 = _979 ? _725 : as_type<float>(_953);
    float _983 = _865 * _941;
    float _985 = _941 * _959;
    float _987 = _891 * _941;
    float _989 = _909 * _891;
    float _991 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _993 = _925 * _985;
    float _995 = _909 * _985;
    bool _997 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _999 = isnan(_463);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = fma(_963, _973, _971);
    float _1011 = _963 * _959;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1015 = fma(_1009, _975, _993);
    float _1017 = -_989;
    float _1019 = fma(_963, _977, _1017);
    float _1021 = -_977;
    float _1023 = fma(_963, _989, _1021);
    float _1025 = -_1011;
    float _1027 = fma(_987, _975, _1025);
    float _1029 = fma(_963, _971, _973);
    float _1031 = fma(_1019, _991, _1015);
    float _1033 = fma(_1023, _975, _995);
    float _1035 = fma(_983, _991, _1027);
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1043 = fma(_1029, _991, _1033);
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1039);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1041);
    bool _1051 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1053 = isnan(_463);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1065 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1047);
    float _1067 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1049);
    bool _1069 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1071 = isnan(_463);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1063);
    float _1083 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1085 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1087 = isnan(_463);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = -_1061;
    float _1099 = _1097 + 1.0;
    float _1101 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1103 = _1083 * _1083;
    float _1105 = -_829;
    int _1107 = _793 ? as_type<int>(_1105) : as_type<int>(_829);
    float _1109 = _1095 * _1099;
    float _1111 = -_1095;
    float _1113 = _1111 + 1.0;
    float _1115 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1117 = fma(_1101, _1101, _1103);
    float _1119 = -_829;
    int _1121 = _699 ? as_type<int>(_1119) : as_type<int>(_829);
    float _1123 = _1079 * _1113;
    bool _1125 = !_747;
    float _1127 = _1125 ? _829 : as_type<float>(_1107);
    float _1129 = fma(_1115, _1115, _1117);
    float _1131 = -_1079;
    float _1133 = _1131 + 1.0;
    bool _1135 = !_755;
    float _1137 = _1135 ? _829 : as_type<float>(_1121);
    float _1139 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = sqrt(_1129);
    float _1143 = _1007 * _1133;
    float _1145 = -_1007;
    float _1147 = _1145 + 1.0;
    float _1149 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1151 = _1127 + (-0.5);
    float _1153 = _899 * _1143;
    float _1155 = _969 + 0.5;
    float _1157 = _901 * _1143;
    float _1159 = _903 * _1143;
    float _1161 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1153);
    float _1163 = fma(_1139, _1155, _553);
    float _1165 = -_1149;
    float _1167 = -_601;
    float _1169 = fma(_1165, _1151, _1167);
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1157);
    float _1173 = fma(_905, _1123, _1161);
    float _1175 = _893 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1177 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1159);
    bool _1179 = _1141 > 0.0;
    float _1181 = fma(_955, _1109, _1173);
    float _1183 = _935 + _1101;
    float _1185 = _937 + _1083;
    float _1187 = _1175 + _1115;
    float _1189 = fma(_917, _1123, _1171);
    float _1191 = fma(_919, _1123, _1177);
    float _1193 = fma(_949, _1109, _1189);
    float _1195 = fma(_957, _1109, _1191);
    float _1197 = _1171;
    float _1199 = _935;
    float _1201 = _893;
    if (!_1179)
    {
        _1197 = _1183;
    }
    float _1203 = _1197;
    float _1205 = _1203;
    if (!_1179)
    {
        _1199 = _1185;
    }
    float _1207 = _1199;
    float _1209 = _1207;
    if (!_1179)
    {
        _1201 = _1187;
    }
    float _1211 = _1201;
    bool _1213 = !_1179;
    float _1215 = _1211;
    float _1217 = _1211;
    if (!_1213)
    {
        float _1219 = _149 * _149;
        float _1221 = fma(_147, _147, _1219);
        float _1223 = fma(_151, _151, _1221);
        float _1225 = rsqrt(_1129);
        float _1227 = sqrt(_1223);
        float _1229 = _1083 * _1225;
        float _1231 = _1101 * _1225;
        float _1233 = _1115 * _1225;
        bool _1235 = _1227 > 0.0;
        float _1237 = _1227;
        float _1239 = _1225;
        if (!_1235)
        {
            _1237 = _1183;
        }
        float _1241 = _1237;
        _1205 = _1241;
        if (!_1235)
        {
            _1239 = _1185;
        }
        float _1243 = _1239;
        _1209 = _1243;
        if (!_1235)
        {
            _1215 = _1187;
        }
        float _1245 = _1215;
        bool _1247 = !_1235;
        _1217 = _1245;
        if (!_1247)
        {
            float _1249 = rsqrt(_1223);
            float _1251 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1253 = _149 * _1249;
            float _1255 = _147 * _1249;
            float _1257 = _1229 * _1253;
            float _1259 = _151 * _1249;
            float _1261 = fma(_1231, _1255, _1257);
            float _1263 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1265 = fma(_1233, _1259, _1261);
            float _1267 = _1265 * _1263;
            float _1269 = fma(_147, _1267, _1183);
            float _1271 = fma(_149, _1267, _1185);
            float _1273 = fma(_151, _1267, _1187);
            _1209 = _1271;
            _1205 = _1269;
            _1217 = _1273;
        }
    }
    float _1275 = _1209;
    float _1277 = _1205;
    float _1279 = _1217;
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1193);
    float _1295 = -_603;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1301 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1285);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1305 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1311 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1181);
    float _1313 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1195);
    float _1315 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1301);
    float _1317 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1321 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1323 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1305);
    float _1325 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1327 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1329 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1331 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1319);
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1321);
    float _1335 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1323);
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1325);
    float _1339 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1327);
    float _1341 = _981 + 0.5;
    float _1343 = -_1137;
    float _1345 = _1343 + 0.5;
    float _1347 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1331);
    float _1349 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1333);
    float _1351 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1353 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1355 = -_589;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1361 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1339);
    float _1363 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1367 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1369 = _1293 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = fma(_1127, _1297, _1169);
    float _1373 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1377 = -_1357;
    float _1379 = fma(_969, _1377, _1163);
    float _1381 = _1363 * _1287;
    float _1383 = _1365 * _1309;
    float _1385 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1391 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1359);
    float _1393 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1361);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1379;
    out.m_46.y = _1371;
    out.m_46.z = _1381;
    out.m_46.w = _1383;
    out.m_48.x = _1385;
    out.m_48.y = _1387;
    out.m_48.z = _1373;
    out.m_50.x = _1277;
    out.m_50.y = _1275;
    out.m_50.z = _1279;
    out.gl_Position.x = _1389;
    out.gl_Position.y = _1375;
    out.gl_Position.z = _1391;
    out.gl_Position.w = _1393;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _455 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1450 = as_type<float>(_85);
        out.gl_Position.z = _1450;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_31.w;
    float _91 = in.m_33.x;
    bool _93 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_89;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.x = _91;
    float _107 = 0.0;
    float _109 = _105;
    if (_101)
    {
        float _111 = float(_69);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _79;
    if (_119)
    {
        out.m_29.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _87 = as_type<int>(_123);
    }
    int _125 = _87;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1523 = as_type<float>(_125);
        out.gl_Position.z = _1523;
    }
    if (_119)
    {
        return out;
    }
    float _127 = in.m_37.x;
    float _129 = in.m_37.y;
    float _131 = in.m_37.z;
    bool _133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _135 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _137 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _139 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _141 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _135);
    float _143 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _137);
    float _145 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _139);
    float _147 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _141);
    float _149 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _143);
    float _151 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _145);
    bool _153 = !_133;
    float _169;
    if (!_153)
    {
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _91 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_69);
        float _175 = 1.0 / _173;
        float _177 = _105 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _183 = _179 + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _189 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _199 = _197 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _201 = 1.0 / _187;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _203;
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _209 = 1.0 / _191;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _179 + _211;
    float _215 = 1.0 / _199;
    float _217 = _213 * _201;
    bool _219 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _221 = isnan(_179);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = 1.0 / _195;
    float _233 = _183 * _209;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _179 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _179 + _239;
    bool _243 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_179);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _205;
    float _257 = _237 * _215;
    bool _259 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _261 = isnan(_179);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _273 = _179 + _271;
    float _275 = _241 * _231;
    bool _277 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_179);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_269;
    float _291 = _289 + 1.0;
    float _293 = -_229;
    float _295 = _293 + 1.0;
    float _297 = -_287;
    float _299 = _297 + 1.0;
    float _301 = _287 * _291;
    float _303 = _273 * _255;
    bool _305 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_179);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _253 * _299;
    float _319 = -_253;
    float _321 = _319 + 1.0;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _269 * _295;
    bool _333 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_179);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _315 * _321;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -_315;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_325, _217, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_349, _217, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _343 * _353;
    float _365 = -_343;
    float _367 = _365 + 1.0;
    float _369 = fma(_357, _233, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_329, _233, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = _361 * _363;
    float _375 = _359 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _387 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _393 = fma(_379, _275, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_383, _275, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _401 = fma(_369, _345, _385);
    float _403 = fma(_371, _345, _387);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _405;
    float _409 = fma(_391, _257, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_399, _257, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _413;
    float _417 = fma(_393, _317, _401);
    float _419 = fma(_395, _317, _403);
    float _421 = fma(_407, _303, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _423 = fma(_415, _303, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _425 = fma(_409, _301, _417);
    float _427 = fma(_411, _301, _419);
    float _429 = fma(_421, _331, _425);
    float _431 = fma(_423, _331, _427);
    float _433 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[148].x, _429);
    float _435 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[148].y, _431);
    bool _437 = !_207;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _91 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_69);
        float _459 = 1.0 / _457;
        float _461 = _105 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_33.z;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    float _471 = _91 * 2.0;
    float _473 = as_type<float>(int(gl_VertexIndex));
    float _475 = in.m_33.y;
    float _477 = floor(_471);
    float _479 = in.m_33.w;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _481;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = _469 * _105;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    float _497 = 1.0 / _483;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _501 = _465 * 2.0;
    float _503 = _91 + _465;
    int _505 = as_type<int>(_473) & 1;
    bool _507 = _505 != 0;
    int _509 = as_type<int>(_473) & 2;
    bool _511 = _509 != 0;
    float _513 = exp2(_489);
    float _515 = _91 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _517 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _519 = isnan(1.0);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _525 = _521 || _523;
    float _527 = _475 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _529 = _477 > 0.0;
    float _531 = -_499;
    float _533 = fma(_515, 2.0, _531);
    bool _535 = _477 >= 0.0;
    bool _537 = isnan(_477);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    float _545 = _475 * 2.0;
    float _547 = floor(_501);
    float _549 = fma(_527, -2.0, _491);
    float _551 = -_105;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[76].x, _533);
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _567 = _435 * _487;
    float _569 = 1.0 / _495;
    float _571 = -_513;
    float _573 = _571 + 1.0;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _577 = fma(_91, (*spvDescriptorSet0.vp_c9)._m0[78].z, _565);
    float _579 = _503 + (-1.0);
    float _581 = _563 ? _573 : 0.0;
    float _583 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[78].w, _575);
    float _585 = floor(_545);
    bool _587 = _547 > 0.0;
    float _589 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _577);
    bool _591 = _547 >= 0.0;
    bool _593 = isnan(_547);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    float _603 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _583);
    int _605 = _543 ? 0 : 1;
    float _607 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_525)
    {
        float _609 = _581 * _569;
        _109 = _609;
    }
    float _611 = _109;
    int _613 = _599 ? 0 : 1;
    int _615 = ~_605;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    int _621 = ~_613;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    int _627 = _625;
    int _629 = _619;
    if (!_587)
    {
        int _631 = ~_613;
        int _633 = _631 + 1;
        _627 = _633;
    }
    int _635 = _627;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _637;
    bool _641 = _585 > 0.0;
    if (!_529)
    {
        int _643 = ~_605;
        int _645 = _643 + 1;
        _629 = _645;
    }
    int _647 = _629;
    float _649 = in.m_26.x;
    float _651 = in.m_26.y;
    float _653 = in.m_26.z;
    bool _655 = _585 >= 0.0;
    bool _657 = isnan(_585);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    float _665 = 1.0 / _639;
    int _667 = _663 ? 0 : 1;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _675 = _673 != 0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _679 = _677 != 0;
    int _681 = ~_667;
    int _683 = _681 + 1;
    int _685 = _683 + 1;
    int _687 = _685;
    if (!_641)
    {
        int _689 = ~_667;
        int _691 = _689 + 1;
        _687 = _691;
    }
    int _693 = _687;
    bool _695 = !_675;
    int _697 = _695 ? 0 : 1;
    bool _699 = _479 > 0.5;
    float _701 = _433 * _485;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _709 = _463 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _713 = _463 + _711;
    float _715 = 1.0 / _705;
    float _717 = _709 * _665;
    int _719 = abs(_697);
    float _721 = _651 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _723 = !_507;
    float _725 = _723 ? (-0.5) : 0.5;
    float _727 = _651 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _729 = !_671;
    int _731 = _729 ? 0 : 1;
    float _733 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = in.m_44.x;
    float _741 = in.m_44.y;
    float _743 = in.m_44.z;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _755 = _753 != 0;
    float _757 = _651 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _759 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[4].x, _721);
    float _761 = float(_719);
    float _763 = _713 * _715;
    float _765 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[5].x, _757);
    float _767 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[6].x, _727);
    float _769 = _475 + _465;
    float _771 = float(_647);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _775 = _463 + _773;
    int _777 = abs(_731);
    float _779 = _769 + (-1.0);
    float _781 = _761 * _771;
    bool _783 = !_679;
    int _785 = _783 ? 0 : 1;
    float _787 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _789 = _775 * _497;
    float _791 = _781 * (-2.0);
    bool _793 = _475 > 0.5;
    float _795 = _91 + _475;
    int _797 = abs(_785);
    float _799 = _475 + (-0.5);
    float _801 = fma(_791, _741, _741);
    float _803 = float(_777);
    float _805 = fma(_787, _791, _787);
    float _807 = float(_635);
    float _809 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = _795 + (-1.0);
    float _813 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[4].z, _759);
    float _815 = _803 * _807;
    float _817 = fma(_805, _611, _809);
    float _819 = float(_797);
    float _821 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _823 = float(_693);
    float _825 = _815 * (-2.0);
    bool _827 = !_511;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _817 * 0.15915493667125701904296875;
    bool _833 = _91 > 0.5;
    float _835 = _91 + (-0.5);
    float _837 = fma(_825, _739, _739);
    float _839 = _819 * _823;
    float _841 = fma(_821, _825, _821);
    float _843 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[196].x, _837);
    float _845 = _839 * (-2.0);
    float _847 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[5].z, _765);
    float _849 = fma(_841, _611, _843);
    float _851 = -_725;
    int _853 = _833 ? as_type<int>(_851) : as_type<int>(_725);
    float _855 = fma(_845, _743, _743);
    bool _857 = _465 > 0.5;
    float _859 = _465 + (-0.5);
    float _861 = fma(_607, _845, _607);
    float _863 = _831 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[196].z, _855);
    float _869 = _849 * 0.15915493667125701904296875;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = fma(_861, _611, _867);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _881;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _889 = _831 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _899 = fma(_873, _717, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _901 = fma(_877, _717, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _903 = fma(_883, _717, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _905 = fma(_887, _763, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _907 = _869 * 6.283185482025146484375;
    float _909 = sin(_907);
    float _911 = _879 * 0.15915493667125701904296875;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_897, _763, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _919 = fma(_915, _763, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _923 = _869 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _931;
    float _935 = _813 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _937 = _847 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _939 = _911 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _943;
    float _947 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _949 = fma(_929, _789, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _951 = -_725;
    int _953 = _857 ? as_type<int>(_951) : as_type<int>(_725);
    float _955 = fma(_945, _789, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _957 = fma(_933, _789, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _959 = _947 * _921;
    float _961 = _911 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _725);
    bool _967 = !_737;
    float _969 = _967 ? _725 : as_type<float>(_853);
    float _971 = _909 * _865;
    float _973 = _925 * _891;
    float _975 = _733 * _965;
    float _977 = _925 * _865;
    bool _979 = !_751;
    float _981 = _979 ? _725 : as_type<float>(_953);
    float _983 = _865 * _941;
    float _985 = _941 * _959;
    float _987 = _891 * _941;
    float _989 = _909 * _891;
    float _991 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _993 = _925 * _985;
    float _995 = _909 * _985;
    bool _997 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _999 = isnan(_463);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = fma(_963, _973, _971);
    float _1011 = _963 * _959;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1015 = fma(_1009, _975, _993);
    float _1017 = -_989;
    float _1019 = fma(_963, _977, _1017);
    float _1021 = -_977;
    float _1023 = fma(_963, _989, _1021);
    float _1025 = -_1011;
    float _1027 = fma(_987, _975, _1025);
    float _1029 = fma(_963, _971, _973);
    float _1031 = fma(_1019, _991, _1015);
    float _1033 = fma(_1023, _975, _995);
    float _1035 = fma(_983, _991, _1027);
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1043 = fma(_1029, _991, _1033);
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1039);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1041);
    bool _1051 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1053 = isnan(_463);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1065 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1047);
    float _1067 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1049);
    bool _1069 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1071 = isnan(_463);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1063);
    float _1083 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1085 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1087 = isnan(_463);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = -_1061;
    float _1099 = _1097 + 1.0;
    float _1101 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1103 = _1083 * _1083;
    float _1105 = -_829;
    int _1107 = _793 ? as_type<int>(_1105) : as_type<int>(_829);
    float _1109 = _1095 * _1099;
    float _1111 = -_1095;
    float _1113 = _1111 + 1.0;
    float _1115 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1117 = fma(_1101, _1101, _1103);
    float _1119 = -_829;
    int _1121 = _699 ? as_type<int>(_1119) : as_type<int>(_829);
    float _1123 = _1079 * _1113;
    bool _1125 = !_747;
    float _1127 = _1125 ? _829 : as_type<float>(_1107);
    float _1129 = fma(_1115, _1115, _1117);
    float _1131 = -_1079;
    float _1133 = _1131 + 1.0;
    bool _1135 = !_755;
    float _1137 = _1135 ? _829 : as_type<float>(_1121);
    float _1139 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = sqrt(_1129);
    float _1143 = _1007 * _1133;
    float _1145 = -_1007;
    float _1147 = _1145 + 1.0;
    float _1149 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1151 = _1127 + (-0.5);
    float _1153 = _899 * _1143;
    float _1155 = _969 + 0.5;
    float _1157 = _901 * _1143;
    float _1159 = _903 * _1143;
    float _1161 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1153);
    float _1163 = fma(_1139, _1155, _553);
    float _1165 = -_1149;
    float _1167 = -_601;
    float _1169 = fma(_1165, _1151, _1167);
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1157);
    float _1173 = fma(_905, _1123, _1161);
    float _1175 = _893 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1177 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1159);
    bool _1179 = _1141 > 0.0;
    float _1181 = fma(_955, _1109, _1173);
    float _1183 = _935 + _1101;
    float _1185 = _937 + _1083;
    float _1187 = _1175 + _1115;
    float _1189 = fma(_917, _1123, _1171);
    float _1191 = fma(_919, _1123, _1177);
    float _1193 = fma(_949, _1109, _1189);
    float _1195 = fma(_957, _1109, _1191);
    float _1197 = _1171;
    float _1199 = _935;
    float _1201 = _893;
    if (!_1179)
    {
        _1197 = _1183;
    }
    float _1203 = _1197;
    float _1205 = _1203;
    if (!_1179)
    {
        _1199 = _1185;
    }
    float _1207 = _1199;
    float _1209 = _1207;
    if (!_1179)
    {
        _1201 = _1187;
    }
    float _1211 = _1201;
    bool _1213 = !_1179;
    float _1215 = _1211;
    float _1217 = _1211;
    if (!_1213)
    {
        float _1219 = _149 * _149;
        float _1221 = fma(_147, _147, _1219);
        float _1223 = fma(_151, _151, _1221);
        float _1225 = rsqrt(_1129);
        float _1227 = sqrt(_1223);
        float _1229 = _1083 * _1225;
        float _1231 = _1101 * _1225;
        float _1233 = _1115 * _1225;
        bool _1235 = _1227 > 0.0;
        float _1237 = _1227;
        float _1239 = _1225;
        if (!_1235)
        {
            _1237 = _1183;
        }
        float _1241 = _1237;
        _1205 = _1241;
        if (!_1235)
        {
            _1239 = _1185;
        }
        float _1243 = _1239;
        _1209 = _1243;
        if (!_1235)
        {
            _1215 = _1187;
        }
        float _1245 = _1215;
        bool _1247 = !_1235;
        _1217 = _1245;
        if (!_1247)
        {
            float _1249 = rsqrt(_1223);
            float _1251 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1253 = _149 * _1249;
            float _1255 = _147 * _1249;
            float _1257 = _1229 * _1253;
            float _1259 = _151 * _1249;
            float _1261 = fma(_1231, _1255, _1257);
            float _1263 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1265 = fma(_1233, _1259, _1261);
            float _1267 = _1265 * _1263;
            float _1269 = fma(_147, _1267, _1183);
            float _1271 = fma(_149, _1267, _1185);
            float _1273 = fma(_151, _1267, _1187);
            _1209 = _1271;
            _1205 = _1269;
            _1217 = _1273;
        }
    }
    float _1275 = _1209;
    float _1277 = _1205;
    float _1279 = _1217;
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1193);
    float _1295 = -_603;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1301 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1285);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1305 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1311 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1181);
    float _1313 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1195);
    float _1315 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1301);
    float _1317 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1321 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1323 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1305);
    float _1325 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1327 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1329 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1331 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1319);
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1321);
    float _1335 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1323);
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1325);
    float _1339 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1327);
    float _1341 = _981 + 0.5;
    float _1343 = -_1137;
    float _1345 = _1343 + 0.5;
    float _1347 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1331);
    float _1349 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1333);
    float _1351 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1353 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1355 = -_589;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1361 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1339);
    float _1363 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1367 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1369 = _1293 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = fma(_1127, _1297, _1169);
    float _1373 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1377 = -_1357;
    float _1379 = fma(_969, _1377, _1163);
    float _1381 = _1363 * _1287;
    float _1383 = _1365 * _1309;
    float _1385 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1391 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1359);
    float _1393 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1361);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1379;
    out.m_46.y = _1371;
    out.m_46.z = _1381;
    out.m_46.w = _1383;
    out.m_48.x = _1385;
    out.m_48.y = _1387;
    out.m_48.z = _1373;
    out.m_50.x = _1277;
    out.m_50.y = _1275;
    out.m_50.z = _1279;
    out.gl_Position.x = _1389;
    out.gl_Position.y = _1375;
    out.gl_Position.z = _1391;
    out.gl_Position.w = _1393;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _455 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1450 = as_type<float>(_85);
        out.gl_Position.z = _1450;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_31.w;
    float _91 = in.m_33.x;
    bool _93 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_89;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.x = _91;
    float _107 = 0.0;
    float _109 = _105;
    if (_101)
    {
        float _111 = float(_69);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _79;
    if (_119)
    {
        out.m_29.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _87 = as_type<int>(_123);
    }
    int _125 = _87;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1523 = as_type<float>(_125);
        out.gl_Position.z = _1523;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_37.x;
    float _129 = in.m_37.y;
    float _131 = in.m_37.z;
    bool _133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _135 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _137 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _139 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _141 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _135);
    float _143 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _137);
    float _145 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _139);
    float _147 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _141);
    float _149 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _143);
    float _151 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _145);
    bool _153 = !_133;
    float _169;
    if (!_153)
    {
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _91 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_69);
        float _175 = 1.0 / _173;
        float _177 = _105 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _183 = _179 + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _189 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _199 = _197 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _201 = 1.0 / _187;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _203;
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _209 = 1.0 / _191;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _179 + _211;
    float _215 = 1.0 / _199;
    float _217 = _213 * _201;
    bool _219 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _221 = isnan(_179);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = 1.0 / _195;
    float _233 = _183 * _209;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _179 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _179 + _239;
    bool _243 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_179);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _205;
    float _257 = _237 * _215;
    bool _259 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _261 = isnan(_179);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _273 = _179 + _271;
    float _275 = _241 * _231;
    bool _277 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_179);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_269;
    float _291 = _289 + 1.0;
    float _293 = -_229;
    float _295 = _293 + 1.0;
    float _297 = -_287;
    float _299 = _297 + 1.0;
    float _301 = _287 * _291;
    float _303 = _273 * _255;
    bool _305 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_179);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _253 * _299;
    float _319 = -_253;
    float _321 = _319 + 1.0;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _269 * _295;
    bool _333 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_179);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _315 * _321;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -_315;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_325, _217, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_349, _217, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _343 * _353;
    float _365 = -_343;
    float _367 = _365 + 1.0;
    float _369 = fma(_357, _233, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_329, _233, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = _361 * _363;
    float _375 = _359 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _387 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _393 = fma(_379, _275, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_383, _275, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _401 = fma(_369, _345, _385);
    float _403 = fma(_371, _345, _387);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _405;
    float _409 = fma(_391, _257, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_399, _257, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _413;
    float _417 = fma(_393, _317, _401);
    float _419 = fma(_395, _317, _403);
    float _421 = fma(_407, _303, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _423 = fma(_415, _303, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _425 = fma(_409, _301, _417);
    float _427 = fma(_411, _301, _419);
    float _429 = fma(_421, _331, _425);
    float _431 = fma(_423, _331, _427);
    float _433 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[148].x, _429);
    float _435 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[148].y, _431);
    bool _437 = !_207;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _91 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_69);
        float _459 = 1.0 / _457;
        float _461 = _105 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_33.z;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    float _471 = _91 * 2.0;
    float _473 = as_type<float>(int(gl_VertexIndex));
    float _475 = in.m_33.y;
    float _477 = floor(_471);
    float _479 = in.m_33.w;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _481;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = _469 * _105;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    float _497 = 1.0 / _483;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _501 = _465 * 2.0;
    float _503 = _91 + _465;
    int _505 = as_type<int>(_473) & 1;
    bool _507 = _505 != 0;
    int _509 = as_type<int>(_473) & 2;
    bool _511 = _509 != 0;
    float _513 = exp2(_489);
    float _515 = _91 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _517 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _519 = isnan(1.0);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _525 = _521 || _523;
    float _527 = _475 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _529 = _477 > 0.0;
    float _531 = -_499;
    float _533 = fma(_515, 2.0, _531);
    bool _535 = _477 >= 0.0;
    bool _537 = isnan(_477);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    float _545 = _475 * 2.0;
    float _547 = floor(_501);
    float _549 = fma(_527, -2.0, _491);
    float _551 = -_105;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[76].x, _533);
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _567 = _435 * _487;
    float _569 = 1.0 / _495;
    float _571 = -_513;
    float _573 = _571 + 1.0;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _577 = fma(_91, (*spvDescriptorSet0.vp_c9)._m0[78].z, _565);
    float _579 = _503 + (-1.0);
    float _581 = _563 ? _573 : 0.0;
    float _583 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[78].w, _575);
    float _585 = floor(_545);
    bool _587 = _547 > 0.0;
    float _589 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _577);
    bool _591 = _547 >= 0.0;
    bool _593 = isnan(_547);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    float _603 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _583);
    int _605 = _543 ? 0 : 1;
    float _607 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_525)
    {
        float _609 = _581 * _569;
        _109 = _609;
    }
    float _611 = _109;
    int _613 = _599 ? 0 : 1;
    int _615 = ~_605;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    int _621 = ~_613;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    int _627 = _625;
    int _629 = _619;
    if (!_587)
    {
        int _631 = ~_613;
        int _633 = _631 + 1;
        _627 = _633;
    }
    int _635 = _627;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _637;
    bool _641 = _585 > 0.0;
    if (!_529)
    {
        int _643 = ~_605;
        int _645 = _643 + 1;
        _629 = _645;
    }
    int _647 = _629;
    float _649 = in.m_26.x;
    float _651 = in.m_26.y;
    float _653 = in.m_26.z;
    bool _655 = _585 >= 0.0;
    bool _657 = isnan(_585);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    float _665 = 1.0 / _639;
    int _667 = _663 ? 0 : 1;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _675 = _673 != 0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _679 = _677 != 0;
    int _681 = ~_667;
    int _683 = _681 + 1;
    int _685 = _683 + 1;
    int _687 = _685;
    if (!_641)
    {
        int _689 = ~_667;
        int _691 = _689 + 1;
        _687 = _691;
    }
    int _693 = _687;
    bool _695 = !_675;
    int _697 = _695 ? 0 : 1;
    bool _699 = _479 > 0.5;
    float _701 = _433 * _485;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _709 = _463 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _713 = _463 + _711;
    float _715 = 1.0 / _705;
    float _717 = _709 * _665;
    int _719 = abs(_697);
    float _721 = _651 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _723 = !_507;
    float _725 = _723 ? (-0.5) : 0.5;
    float _727 = _651 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _729 = !_671;
    int _731 = _729 ? 0 : 1;
    float _733 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = in.m_44.x;
    float _741 = in.m_44.y;
    float _743 = in.m_44.z;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _755 = _753 != 0;
    float _757 = _651 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _759 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[4].x, _721);
    float _761 = float(_719);
    float _763 = _713 * _715;
    float _765 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[5].x, _757);
    float _767 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[6].x, _727);
    float _769 = _475 + _465;
    float _771 = float(_647);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _775 = _463 + _773;
    int _777 = abs(_731);
    float _779 = _769 + (-1.0);
    float _781 = _761 * _771;
    bool _783 = !_679;
    int _785 = _783 ? 0 : 1;
    float _787 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _789 = _775 * _497;
    float _791 = _781 * (-2.0);
    bool _793 = _475 > 0.5;
    float _795 = _91 + _475;
    int _797 = abs(_785);
    float _799 = _475 + (-0.5);
    float _801 = fma(_791, _741, _741);
    float _803 = float(_777);
    float _805 = fma(_787, _791, _787);
    float _807 = float(_635);
    float _809 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _811 = _795 + (-1.0);
    float _813 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[4].z, _759);
    float _815 = _803 * _807;
    float _817 = fma(_805, _611, _809);
    float _819 = float(_797);
    float _821 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _823 = float(_693);
    float _825 = _815 * (-2.0);
    bool _827 = !_511;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _817 * 0.15915493667125701904296875;
    bool _833 = _91 > 0.5;
    float _835 = _91 + (-0.5);
    float _837 = fma(_825, _739, _739);
    float _839 = _819 * _823;
    float _841 = fma(_821, _825, _821);
    float _843 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[196].x, _837);
    float _845 = _839 * (-2.0);
    float _847 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[5].z, _765);
    float _849 = fma(_841, _611, _843);
    float _851 = -_725;
    int _853 = _833 ? as_type<int>(_851) : as_type<int>(_725);
    float _855 = fma(_845, _743, _743);
    bool _857 = _465 > 0.5;
    float _859 = _465 + (-0.5);
    float _861 = fma(_607, _845, _607);
    float _863 = _831 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[196].z, _855);
    float _869 = _849 * 0.15915493667125701904296875;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = fma(_861, _611, _867);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _881;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _889 = _831 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _899 = fma(_873, _717, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _901 = fma(_877, _717, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _903 = fma(_883, _717, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _905 = fma(_887, _763, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _907 = _869 * 6.283185482025146484375;
    float _909 = sin(_907);
    float _911 = _879 * 0.15915493667125701904296875;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_897, _763, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _919 = fma(_915, _763, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _923 = _869 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _931;
    float _935 = _813 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _937 = _847 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _939 = _911 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _943;
    float _947 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _949 = fma(_929, _789, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _951 = -_725;
    int _953 = _857 ? as_type<int>(_951) : as_type<int>(_725);
    float _955 = fma(_945, _789, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _957 = fma(_933, _789, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _959 = _947 * _921;
    float _961 = _911 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _725);
    bool _967 = !_737;
    float _969 = _967 ? _725 : as_type<float>(_853);
    float _971 = _909 * _865;
    float _973 = _925 * _891;
    float _975 = _733 * _965;
    float _977 = _925 * _865;
    bool _979 = !_751;
    float _981 = _979 ? _725 : as_type<float>(_953);
    float _983 = _865 * _941;
    float _985 = _941 * _959;
    float _987 = _891 * _941;
    float _989 = _909 * _891;
    float _991 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _993 = _925 * _985;
    float _995 = _909 * _985;
    bool _997 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _999 = isnan(_463);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = fma(_963, _973, _971);
    float _1011 = _963 * _959;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1015 = fma(_1009, _975, _993);
    float _1017 = -_989;
    float _1019 = fma(_963, _977, _1017);
    float _1021 = -_977;
    float _1023 = fma(_963, _989, _1021);
    float _1025 = -_1011;
    float _1027 = fma(_987, _975, _1025);
    float _1029 = fma(_963, _971, _973);
    float _1031 = fma(_1019, _991, _1015);
    float _1033 = fma(_1023, _975, _995);
    float _1035 = fma(_983, _991, _1027);
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1043 = fma(_1029, _991, _1033);
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1039);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1041);
    bool _1051 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1053 = isnan(_463);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1065 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1047);
    float _1067 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1049);
    bool _1069 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1071 = isnan(_463);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1063);
    float _1083 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1085 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1087 = isnan(_463);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = -_1061;
    float _1099 = _1097 + 1.0;
    float _1101 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1103 = _1083 * _1083;
    float _1105 = -_829;
    int _1107 = _793 ? as_type<int>(_1105) : as_type<int>(_829);
    float _1109 = _1095 * _1099;
    float _1111 = -_1095;
    float _1113 = _1111 + 1.0;
    float _1115 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1117 = fma(_1101, _1101, _1103);
    float _1119 = -_829;
    int _1121 = _699 ? as_type<int>(_1119) : as_type<int>(_829);
    float _1123 = _1079 * _1113;
    bool _1125 = !_747;
    float _1127 = _1125 ? _829 : as_type<float>(_1107);
    float _1129 = fma(_1115, _1115, _1117);
    float _1131 = -_1079;
    float _1133 = _1131 + 1.0;
    bool _1135 = !_755;
    float _1137 = _1135 ? _829 : as_type<float>(_1121);
    float _1139 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = sqrt(_1129);
    float _1143 = _1007 * _1133;
    float _1145 = -_1007;
    float _1147 = _1145 + 1.0;
    float _1149 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1151 = _1127 + (-0.5);
    float _1153 = _899 * _1143;
    float _1155 = _969 + 0.5;
    float _1157 = _901 * _1143;
    float _1159 = _903 * _1143;
    float _1161 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1153);
    float _1163 = fma(_1139, _1155, _553);
    float _1165 = -_1149;
    float _1167 = -_601;
    float _1169 = fma(_1165, _1151, _1167);
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1157);
    float _1173 = fma(_905, _1123, _1161);
    float _1175 = _893 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1177 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1159);
    bool _1179 = _1141 > 0.0;
    float _1181 = fma(_955, _1109, _1173);
    float _1183 = _935 + _1101;
    float _1185 = _937 + _1083;
    float _1187 = _1175 + _1115;
    float _1189 = fma(_917, _1123, _1171);
    float _1191 = fma(_919, _1123, _1177);
    float _1193 = fma(_949, _1109, _1189);
    float _1195 = fma(_957, _1109, _1191);
    float _1197 = _1171;
    float _1199 = _935;
    float _1201 = _893;
    if (!_1179)
    {
        _1197 = _1183;
    }
    float _1203 = _1197;
    float _1205 = _1203;
    if (!_1179)
    {
        _1199 = _1185;
    }
    float _1207 = _1199;
    float _1209 = _1207;
    if (!_1179)
    {
        _1201 = _1187;
    }
    float _1211 = _1201;
    bool _1213 = !_1179;
    float _1215 = _1211;
    float _1217 = _1211;
    if (!_1213)
    {
        float _1219 = _149 * _149;
        float _1221 = fma(_147, _147, _1219);
        float _1223 = fma(_151, _151, _1221);
        float _1225 = rsqrt(_1129);
        float _1227 = sqrt(_1223);
        float _1229 = _1083 * _1225;
        float _1231 = _1101 * _1225;
        float _1233 = _1115 * _1225;
        bool _1235 = _1227 > 0.0;
        float _1237 = _1227;
        float _1239 = _1225;
        if (!_1235)
        {
            _1237 = _1183;
        }
        float _1241 = _1237;
        _1205 = _1241;
        if (!_1235)
        {
            _1239 = _1185;
        }
        float _1243 = _1239;
        _1209 = _1243;
        if (!_1235)
        {
            _1215 = _1187;
        }
        float _1245 = _1215;
        bool _1247 = !_1235;
        _1217 = _1245;
        if (!_1247)
        {
            float _1249 = rsqrt(_1223);
            float _1251 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1253 = _149 * _1249;
            float _1255 = _147 * _1249;
            float _1257 = _1229 * _1253;
            float _1259 = _151 * _1249;
            float _1261 = fma(_1231, _1255, _1257);
            float _1263 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1265 = fma(_1233, _1259, _1261);
            float _1267 = _1265 * _1263;
            float _1269 = fma(_147, _1267, _1183);
            float _1271 = fma(_149, _1267, _1185);
            float _1273 = fma(_151, _1267, _1187);
            _1209 = _1271;
            _1205 = _1269;
            _1217 = _1273;
        }
    }
    float _1275 = _1209;
    float _1277 = _1205;
    float _1279 = _1217;
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1193);
    float _1295 = -_603;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1301 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1285);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1305 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1311 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1181);
    float _1313 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1195);
    float _1315 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1301);
    float _1317 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1321 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1323 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1305);
    float _1325 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1327 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1329 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1331 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1319);
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1321);
    float _1335 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1323);
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1325);
    float _1339 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1327);
    float _1341 = _981 + 0.5;
    float _1343 = -_1137;
    float _1345 = _1343 + 0.5;
    float _1347 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1331);
    float _1349 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1333);
    float _1351 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1353 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1355 = -_589;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1361 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1339);
    float _1363 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1367 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1369 = _1293 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = fma(_1127, _1297, _1169);
    float _1373 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1377 = -_1357;
    float _1379 = fma(_969, _1377, _1163);
    float _1381 = _1363 * _1287;
    float _1383 = _1365 * _1309;
    float _1385 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1391 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1359);
    float _1393 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1361);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1379;
    out.m_46.y = _1371;
    out.m_46.z = _1381;
    out.m_46.w = _1383;
    out.m_48.x = _1385;
    out.m_48.y = _1387;
    out.m_48.z = _1373;
    out.m_50.x = _1277;
    out.m_50.y = _1275;
    out.m_50.z = _1279;
    out.gl_Position.x = _1389;
    out.gl_Position.y = _1375;
    out.gl_Position.z = _1391;
    out.gl_Position.w = _1393;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

