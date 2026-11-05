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
    float4 m_42 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_26 [[attribute(3)]];
    float4 m_31 [[attribute(4)]];
    float4 m_33 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
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
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_83);
        out.gl_Position.z = _1395;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _87 = in.m_31.w;
    float _89 = in.m_33.x;
    bool _91 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_87;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.x = _89;
    float _105 = 0.0;
    float _107 = _103;
    if (_99)
    {
        float _109 = float(_69);
        _105 = _109;
    }
    float _111 = _105;
    bool _113 = _103 >= _111;
    bool _115 = !_99;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_29.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _85 = as_type<int>(_123);
    }
    int _125 = _85;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1469 = as_type<float>(_125);
        out.gl_Position.z = _1469;
    }
    if (_117)
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
        float _157 = _89 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
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
        float _177 = _103 * _175;
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
    bool _207 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _209 = isnan(_179);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = 1.0 / _191;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _179 + _221;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _227 = 1.0 / _199;
    float _229 = _223 * _201;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _179 + _231;
    float _235 = 1.0 / _195;
    float _237 = _183 * _219;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _179 + _239;
    bool _243 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _245 = isnan(_179);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _257 = _179 + _255;
    float _259 = 1.0 / _205;
    float _261 = _241 * _227;
    bool _263 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _265 = isnan(_179);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_253;
    float _277 = _275 + 1.0;
    bool _279 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _281 = isnan(_179);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _233 * _235;
    float _293 = -_273;
    float _295 = _293 + 1.0;
    float _297 = _289 * _277;
    float _299 = -_217;
    float _301 = _299 + 1.0;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _253 * _295;
    bool _309 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_179);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _273 * _301;
    float _323 = _257 * _259;
    bool _325 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_179);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _319 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = fma(_341, _229, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _335 * _345;
    float _359 = fma(_349, _229, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = -_335;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = _355 * _357;
    float _371 = _359 * _357;
    float _373 = fma(_353, _237, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _381 = fma(_367, _237, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _393 = fma(_377, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_373, _337, _379);
    float _397 = fma(_385, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _403 = fma(_381, _337, _387);
    float _405 = fma(_391, _261, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _407;
    float _411 = fma(_393, _297, _395);
    float _413 = fma(_401, _261, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _415;
    float _419 = fma(_397, _297, _403);
    float _421 = fma(_409, _323, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _423 = fma(_405, _307, _411);
    float _425 = fma(_417, _323, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _427 = fma(_413, _307, _419);
    float _429 = fma(_421, _321, _423);
    float _431 = fma(_425, _321, _427);
    float _433 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[148].x, _429);
    float _435 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[148].y, _431);
    bool _437 = !_225;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _89 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
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
        float _461 = _103 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_33.z;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    float _471 = _89 * 2.0;
    float _473 = in.m_33.y;
    float _475 = as_type<float>(int(gl_VertexIndex));
    float _477 = floor(_471);
    float _479 = _469 * _103;
    float _481 = exp2(_479);
    float _483 = _465 * 2.0;
    bool _485 = _477 > 0.0;
    bool _487 = _477 >= 0.0;
    bool _489 = isnan(_477);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _473 * 2.0;
    float _499 = floor(_483);
    int _501 = _495 ? 0 : 1;
    int _503 = ~_501;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    int _509 = _507;
    if (!_485)
    {
        int _511 = ~_501;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = floor(_497);
    float _519 = -_481;
    float _521 = _519 + 1.0;
    float _523 = float(_515);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _527 = _499 > 0.0;
    float _529 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[78].w, _525);
    bool _531 = _499 >= 0.0;
    bool _533 = isnan(_499);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    int _541 = _539 ? 0 : 1;
    bool _543 = _517 > 0.0;
    bool _545 = _517 >= 0.0;
    bool _547 = isnan(_517);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    int _555 = as_type<int>(_475) & 1;
    bool _557 = _555 != 0;
    int _559 = as_type<int>(_475) & 2;
    bool _561 = _559 != 0;
    int _563 = ~_541;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    int _569 = _553 ? 0 : 1;
    int _571 = _567;
    if (!_527)
    {
        int _573 = ~_541;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _89 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _591 = _589 != 0;
    bool _593 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    int _603 = ~_569;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    int _609 = _607;
    if (!_543)
    {
        int _611 = ~_569;
        int _613 = _611 + 1;
        _609 = _613;
    }
    int _615 = _609;
    float _617 = _601 ? _521 : 0.0;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = _89 + _473;
    float _623 = -_619;
    float _625 = fma(_579, 2.0, _623);
    float _627 = _473 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _631 = !_587;
    int _633 = _631 ? 0 : 1;
    float _635 = _473 + _465;
    bool _637 = !_583;
    int _639 = _637 ? 0 : 1;
    float _641 = _621 + (-1.0);
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _645 = _643 != 0;
    float _647 = _635 + (-1.0);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _663 = _661 != 0;
    float _665 = fma(_627, -2.0, _629);
    int _667 = abs(_633);
    bool _669 = !_591;
    int _671 = _669 ? 0 : 1;
    float _673 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _665);
    bool _675 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _677 = isnan(1.0);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _683 = _679 || _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _687 = 1.0 + _685;
    float _689 = in.m_42.x;
    float _691 = in.m_42.y;
    float _693 = in.m_42.z;
    float _695 = 1.0 / _687;
    float _697 = float(_667);
    int _699 = abs(_639);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _703 = abs(_671);
    float _705 = _697 * _523;
    float _707 = float(_615);
    float _709 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[78].z, _701);
    float _711 = -_103;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[76].x, _625);
    float _715 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _717 = float(_699);
    float _719 = float(_577);
    float _721 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _529);
    float _723 = float(_703);
    if (_683)
    {
        float _725 = _617 * _695;
        _107 = _725;
    }
    float _727 = _107;
    float _729 = _705 * (-2.0);
    float _731 = _717 * _719;
    bool _733 = _473 > 0.5;
    float _735 = _723 * _707;
    float _737 = fma(_659, _729, _659);
    float _739 = fma(_729, _691, _691);
    float _741 = _473 + (-0.5);
    float _743 = _731 * (-2.0);
    float _745 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[196].y, _739);
    float _747 = in.m_33.w;
    float _749 = fma(_653, _743, _653);
    float _751 = fma(_743, _689, _689);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _761 = !_557;
    float _763 = _761 ? (-0.5) : 0.5;
    float _765 = fma(_737, _727, _745);
    float _767 = in.m_44.x;
    float _769 = in.m_44.y;
    bool _771 = _89 > 0.5;
    float _773 = _89 + (-0.5);
    float _775 = _89 + _465;
    float _777 = _765 * 0.15915493667125701904296875;
    float _779 = in.m_26.x;
    float _781 = in.m_26.y;
    float _783 = in.m_26.z;
    float _785 = _735 * (-2.0);
    float _787 = _775 + (-1.0);
    float _789 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].x, _751);
    float _791 = 1.0 / _759;
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _763);
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _797 = fma(_785, _693, _693);
    float _799 = _465 + (-0.5);
    float _801 = fma(_749, _727, _789);
    float _803 = fma(_795, _785, _795);
    float _805 = -_763;
    int _807 = _771 ? as_type<int>(_805) : as_type<int>(_763);
    float _809 = 1.0 / _755;
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].z, _797);
    bool _813 = _747 > 0.5;
    float _815 = _801 * 0.15915493667125701904296875;
    bool _817 = !_561;
    float _819 = _817 ? (-0.5) : 0.5;
    float _821 = fma(_803, _727, _811);
    bool _823 = _465 > 0.5;
    float _825 = _433 * _767;
    float _827 = _435 * _769;
    float _829 = _777 * 6.283185482025146484375;
    float _831 = sin(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _835 = _463 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _839 = _463 + _837;
    float _841 = _781 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _781 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _845 = _781 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _847 = _835 * _791;
    float _849 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    float _851 = _777 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[5].x, _843);
    float _857 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[6].x, _845);
    float _859 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _861 = _839 * _809;
    float _863 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[5].z, _855);
    float _865 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    float _867 = _815 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _821 * 0.15915493667125701904296875;
    float _873 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _881;
    float _885 = _815 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    float _893 = fma(_877, _861, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _895 = fma(_883, _861, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _901 = fma(_891, _861, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _903 = _873 * _793;
    bool _905 = !_645;
    float _907 = _905 ? _763 : as_type<float>(_807);
    float _909 = _871 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _819);
    float _915 = _859 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _917 = _863 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _919 = _865 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _921 = _879 * _913;
    float _923 = _869 * _831;
    float _925 = _871 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _887 * _831;
    float _931 = _887 * _853;
    float _933 = _911 * _921;
    float _935 = _831 * _911;
    float _937 = _869 * _853;
    float _939 = _853 * _911;
    float _941 = _887 * _933;
    float _943 = _869 * _933;
    float _945 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _951 = _927 * _921;
    float _953 = -_929;
    float _955 = fma(_927, _937, _953);
    float _957 = -_937;
    float _959 = fma(_927, _929, _957);
    float _961 = fma(_927, _931, _923);
    float _963 = -_951;
    float _965 = fma(_939, _903, _963);
    float _967 = fma(_927, _923, _931);
    float _969 = fma(_955, _903, _943);
    float _971 = fma(_961, _903, _941);
    float _973 = fma(_935, _945, _965);
    float _975 = fma(_949, _847, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _977 = fma(_967, _945, _969);
    float _979 = fma(_959, _945, _971);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _987 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _989 = isnan(_463);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = _979 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1001 = _979 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1003 = _979 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1005 = fma(_983, _847, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1007 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _999);
    float _1009 = fma(_899, _847, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1011 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1001);
    float _1013 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1003);
    float _1015 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1007);
    bool _1017 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1019 = isnan(_463);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1031 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1033 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1035 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1037 = isnan(_463);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1049 = -_1027;
    float _1051 = _1049 + 1.0;
    float _1053 = _1033 * _1033;
    float _1055 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1059 = _1045 * _1051;
    float _1061 = fma(_1047, _1047, _1053);
    float _1063 = -_1045;
    float _1065 = _1063 + 1.0;
    float _1067 = -_763;
    int _1069 = _823 ? as_type<int>(_1067) : as_type<int>(_763);
    float _1071 = fma(_1055, _1055, _1061);
    float _1073 = _997 * _1065;
    float _1075 = -_819;
    int _1077 = _813 ? as_type<int>(_1075) : as_type<int>(_819);
    float _1079 = -_997;
    float _1081 = _1079 + 1.0;
    float _1083 = sqrt(_1071);
    float _1085 = -_819;
    int _1087 = _733 ? as_type<int>(_1085) : as_type<int>(_819);
    float _1089 = _895 * _1073;
    bool _1091 = !_657;
    float _1093 = _1091 ? _763 : as_type<float>(_1069);
    float _1095 = _907 + 0.5;
    bool _1097 = !_651;
    float _1099 = _1097 ? _819 : as_type<float>(_1087);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1089);
    bool _1103 = !_663;
    float _1105 = _1103 ? _819 : as_type<float>(_1077);
    float _1107 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1109 = _893 * _1073;
    float _1111 = _901 * _1073;
    float _1113 = fma(_975, _1059, _1101);
    float _1115 = fma(_1107, _1095, _713);
    float _1117 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1119 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1109);
    float _1121 = _915 + _1047;
    bool _1123 = _1083 > 0.0;
    float _1125 = _917 + _1033;
    float _1127 = _919 + _1055;
    float _1129 = _1099 + (-0.5);
    float _1131 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1111);
    float _1133 = fma(_1005, _1059, _1119);
    float _1135 = -_1117;
    float _1137 = -_673;
    float _1139 = fma(_1135, _1129, _1137);
    float _1141 = fma(_1009, _1059, _1131);
    float _1143 = _917;
    float _1145 = _915;
    float _1147 = _919;
    if (!_1123)
    {
        _1143 = _1121;
    }
    float _1149 = _1143;
    float _1151 = _1149;
    if (!_1123)
    {
        _1145 = _1125;
    }
    float _1153 = _1145;
    float _1155 = _1153;
    if (!_1123)
    {
        _1147 = _1127;
    }
    float _1157 = _1147;
    bool _1159 = !_1123;
    float _1161 = _1157;
    float _1163 = _1157;
    if (!_1159)
    {
        float _1165 = _149 * _149;
        float _1167 = fma(_147, _147, _1165);
        float _1169 = rsqrt(_1071);
        float _1171 = fma(_151, _151, _1167);
        float _1173 = sqrt(_1171);
        float _1175 = _1047 * _1169;
        float _1177 = _1033 * _1169;
        float _1179 = _1055 * _1169;
        bool _1181 = _1173 > 0.0;
        float _1183 = _1169;
        float _1185 = _1173;
        if (!_1181)
        {
            _1183 = _1121;
        }
        float _1187 = _1183;
        _1151 = _1187;
        if (!_1181)
        {
            _1185 = _1125;
        }
        float _1189 = _1185;
        _1155 = _1189;
        if (!_1181)
        {
            _1161 = _1127;
        }
        float _1191 = _1161;
        bool _1193 = !_1181;
        _1163 = _1191;
        if (!_1193)
        {
            float _1195 = rsqrt(_1171);
            float _1197 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1199 = _149 * _1195;
            float _1201 = _147 * _1195;
            float _1203 = _1177 * _1199;
            float _1205 = _151 * _1195;
            float _1207 = fma(_1175, _1201, _1203);
            float _1209 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1211 = fma(_1179, _1205, _1207);
            float _1213 = _1211 * _1209;
            float _1215 = fma(_147, _1213, _1121);
            float _1217 = fma(_149, _1213, _1125);
            float _1219 = fma(_151, _1213, _1127);
            _1155 = _1217;
            _1151 = _1215;
            _1163 = _1219;
        }
    }
    float _1221 = _1155;
    float _1223 = _1151;
    float _1225 = _1163;
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1231 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1227);
    float _1237 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1229);
    float _1239 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1231);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1113);
    float _1243 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1235);
    float _1245 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1237);
    float _1247 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1239);
    float _1249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1251 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1253 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1133);
    float _1257 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1141);
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1261 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1265 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1267 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1259);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1261);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1263);
    float _1273 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1265);
    float _1275 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1277 = -_715;
    float _1279 = _1277 + 1.0;
    float _1281 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1283 = _1093 + 0.5;
    float _1285 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1275);
    float _1287 = -_1105;
    float _1289 = _1287 + 0.5;
    float _1291 = -_1279;
    float _1293 = fma(_907, _1291, _1115);
    float _1295 = -_721;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1301 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1267);
    float _1303 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1305 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1271);
    float _1307 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1273);
    float _1309 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1311 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1313 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1315 = _1255 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1317 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1319 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1321 = fma(_1099, _1297, _1139);
    float _1323 = _1309 * _1233;
    float _1325 = _1311 * _1249;
    float _1327 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1301);
    float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1303);
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1305);
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1307);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1293;
    out.m_46.y = _1321;
    out.m_46.z = _1323;
    out.m_46.w = _1325;
    out.m_48.x = _1327;
    out.m_48.y = _1329;
    out.m_48.z = _1331;
    out.m_50.x = _1223;
    out.m_50.y = _1221;
    out.m_50.z = _1225;
    out.gl_Position.x = _1333;
    out.gl_Position.y = _1335;
    out.gl_Position.z = _1337;
    out.gl_Position.w = _1339;
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
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_83);
        out.gl_Position.z = _1395;
    }
    if (!_73)
    {
        return out;
    }
    float _87 = in.m_31.w;
    float _89 = in.m_33.x;
    bool _91 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_87;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.x = _89;
    float _105 = 0.0;
    float _107 = _103;
    if (_99)
    {
        float _109 = float(_69);
        _105 = _109;
    }
    float _111 = _105;
    bool _113 = _103 >= _111;
    bool _115 = !_99;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_29.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _85 = as_type<int>(_123);
    }
    int _125 = _85;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1469 = as_type<float>(_125);
        out.gl_Position.z = _1469;
    }
    if (_117)
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
        float _157 = _89 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
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
        float _177 = _103 * _175;
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
    bool _207 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _209 = isnan(_179);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = 1.0 / _191;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _179 + _221;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _227 = 1.0 / _199;
    float _229 = _223 * _201;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _179 + _231;
    float _235 = 1.0 / _195;
    float _237 = _183 * _219;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _179 + _239;
    bool _243 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _245 = isnan(_179);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _257 = _179 + _255;
    float _259 = 1.0 / _205;
    float _261 = _241 * _227;
    bool _263 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _265 = isnan(_179);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_253;
    float _277 = _275 + 1.0;
    bool _279 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _281 = isnan(_179);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _233 * _235;
    float _293 = -_273;
    float _295 = _293 + 1.0;
    float _297 = _289 * _277;
    float _299 = -_217;
    float _301 = _299 + 1.0;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _253 * _295;
    bool _309 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_179);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _273 * _301;
    float _323 = _257 * _259;
    bool _325 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_179);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _319 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = fma(_341, _229, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _335 * _345;
    float _359 = fma(_349, _229, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = -_335;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = _355 * _357;
    float _371 = _359 * _357;
    float _373 = fma(_353, _237, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _381 = fma(_367, _237, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _393 = fma(_377, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_373, _337, _379);
    float _397 = fma(_385, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _403 = fma(_381, _337, _387);
    float _405 = fma(_391, _261, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _407;
    float _411 = fma(_393, _297, _395);
    float _413 = fma(_401, _261, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _415;
    float _419 = fma(_397, _297, _403);
    float _421 = fma(_409, _323, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _423 = fma(_405, _307, _411);
    float _425 = fma(_417, _323, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _427 = fma(_413, _307, _419);
    float _429 = fma(_421, _321, _423);
    float _431 = fma(_425, _321, _427);
    float _433 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[148].x, _429);
    float _435 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[148].y, _431);
    bool _437 = !_225;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _89 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
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
        float _461 = _103 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_33.z;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    float _471 = _89 * 2.0;
    float _473 = in.m_33.y;
    float _475 = as_type<float>(int(gl_VertexIndex));
    float _477 = floor(_471);
    float _479 = _469 * _103;
    float _481 = exp2(_479);
    float _483 = _465 * 2.0;
    bool _485 = _477 > 0.0;
    bool _487 = _477 >= 0.0;
    bool _489 = isnan(_477);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _473 * 2.0;
    float _499 = floor(_483);
    int _501 = _495 ? 0 : 1;
    int _503 = ~_501;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    int _509 = _507;
    if (!_485)
    {
        int _511 = ~_501;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = floor(_497);
    float _519 = -_481;
    float _521 = _519 + 1.0;
    float _523 = float(_515);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _527 = _499 > 0.0;
    float _529 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[78].w, _525);
    bool _531 = _499 >= 0.0;
    bool _533 = isnan(_499);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    int _541 = _539 ? 0 : 1;
    bool _543 = _517 > 0.0;
    bool _545 = _517 >= 0.0;
    bool _547 = isnan(_517);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    int _555 = as_type<int>(_475) & 1;
    bool _557 = _555 != 0;
    int _559 = as_type<int>(_475) & 2;
    bool _561 = _559 != 0;
    int _563 = ~_541;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    int _569 = _553 ? 0 : 1;
    int _571 = _567;
    if (!_527)
    {
        int _573 = ~_541;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _89 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _591 = _589 != 0;
    bool _593 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    int _603 = ~_569;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    int _609 = _607;
    if (!_543)
    {
        int _611 = ~_569;
        int _613 = _611 + 1;
        _609 = _613;
    }
    int _615 = _609;
    float _617 = _601 ? _521 : 0.0;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = _89 + _473;
    float _623 = -_619;
    float _625 = fma(_579, 2.0, _623);
    float _627 = _473 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _631 = !_587;
    int _633 = _631 ? 0 : 1;
    float _635 = _473 + _465;
    bool _637 = !_583;
    int _639 = _637 ? 0 : 1;
    float _641 = _621 + (-1.0);
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _645 = _643 != 0;
    float _647 = _635 + (-1.0);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _663 = _661 != 0;
    float _665 = fma(_627, -2.0, _629);
    int _667 = abs(_633);
    bool _669 = !_591;
    int _671 = _669 ? 0 : 1;
    float _673 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _665);
    bool _675 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _677 = isnan(1.0);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _683 = _679 || _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _687 = 1.0 + _685;
    float _689 = in.m_42.x;
    float _691 = in.m_42.y;
    float _693 = in.m_42.z;
    float _695 = 1.0 / _687;
    float _697 = float(_667);
    int _699 = abs(_639);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _703 = abs(_671);
    float _705 = _697 * _523;
    float _707 = float(_615);
    float _709 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[78].z, _701);
    float _711 = -_103;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[76].x, _625);
    float _715 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _717 = float(_699);
    float _719 = float(_577);
    float _721 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _529);
    float _723 = float(_703);
    if (_683)
    {
        float _725 = _617 * _695;
        _107 = _725;
    }
    float _727 = _107;
    float _729 = _705 * (-2.0);
    float _731 = _717 * _719;
    bool _733 = _473 > 0.5;
    float _735 = _723 * _707;
    float _737 = fma(_659, _729, _659);
    float _739 = fma(_729, _691, _691);
    float _741 = _473 + (-0.5);
    float _743 = _731 * (-2.0);
    float _745 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[196].y, _739);
    float _747 = in.m_33.w;
    float _749 = fma(_653, _743, _653);
    float _751 = fma(_743, _689, _689);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _761 = !_557;
    float _763 = _761 ? (-0.5) : 0.5;
    float _765 = fma(_737, _727, _745);
    float _767 = in.m_44.x;
    float _769 = in.m_44.y;
    bool _771 = _89 > 0.5;
    float _773 = _89 + (-0.5);
    float _775 = _89 + _465;
    float _777 = _765 * 0.15915493667125701904296875;
    float _779 = in.m_26.x;
    float _781 = in.m_26.y;
    float _783 = in.m_26.z;
    float _785 = _735 * (-2.0);
    float _787 = _775 + (-1.0);
    float _789 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].x, _751);
    float _791 = 1.0 / _759;
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _763);
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _797 = fma(_785, _693, _693);
    float _799 = _465 + (-0.5);
    float _801 = fma(_749, _727, _789);
    float _803 = fma(_795, _785, _795);
    float _805 = -_763;
    int _807 = _771 ? as_type<int>(_805) : as_type<int>(_763);
    float _809 = 1.0 / _755;
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].z, _797);
    bool _813 = _747 > 0.5;
    float _815 = _801 * 0.15915493667125701904296875;
    bool _817 = !_561;
    float _819 = _817 ? (-0.5) : 0.5;
    float _821 = fma(_803, _727, _811);
    bool _823 = _465 > 0.5;
    float _825 = _433 * _767;
    float _827 = _435 * _769;
    float _829 = _777 * 6.283185482025146484375;
    float _831 = sin(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _835 = _463 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _839 = _463 + _837;
    float _841 = _781 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _781 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _845 = _781 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _847 = _835 * _791;
    float _849 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    float _851 = _777 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[5].x, _843);
    float _857 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[6].x, _845);
    float _859 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _861 = _839 * _809;
    float _863 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[5].z, _855);
    float _865 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    float _867 = _815 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _821 * 0.15915493667125701904296875;
    float _873 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _881;
    float _885 = _815 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    float _893 = fma(_877, _861, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _895 = fma(_883, _861, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _901 = fma(_891, _861, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _903 = _873 * _793;
    bool _905 = !_645;
    float _907 = _905 ? _763 : as_type<float>(_807);
    float _909 = _871 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _819);
    float _915 = _859 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _917 = _863 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _919 = _865 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _921 = _879 * _913;
    float _923 = _869 * _831;
    float _925 = _871 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _887 * _831;
    float _931 = _887 * _853;
    float _933 = _911 * _921;
    float _935 = _831 * _911;
    float _937 = _869 * _853;
    float _939 = _853 * _911;
    float _941 = _887 * _933;
    float _943 = _869 * _933;
    float _945 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _951 = _927 * _921;
    float _953 = -_929;
    float _955 = fma(_927, _937, _953);
    float _957 = -_937;
    float _959 = fma(_927, _929, _957);
    float _961 = fma(_927, _931, _923);
    float _963 = -_951;
    float _965 = fma(_939, _903, _963);
    float _967 = fma(_927, _923, _931);
    float _969 = fma(_955, _903, _943);
    float _971 = fma(_961, _903, _941);
    float _973 = fma(_935, _945, _965);
    float _975 = fma(_949, _847, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _977 = fma(_967, _945, _969);
    float _979 = fma(_959, _945, _971);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _987 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _989 = isnan(_463);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = _979 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1001 = _979 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1003 = _979 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1005 = fma(_983, _847, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1007 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _999);
    float _1009 = fma(_899, _847, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1011 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1001);
    float _1013 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1003);
    float _1015 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1007);
    bool _1017 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1019 = isnan(_463);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1031 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1033 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1035 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1037 = isnan(_463);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1049 = -_1027;
    float _1051 = _1049 + 1.0;
    float _1053 = _1033 * _1033;
    float _1055 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1059 = _1045 * _1051;
    float _1061 = fma(_1047, _1047, _1053);
    float _1063 = -_1045;
    float _1065 = _1063 + 1.0;
    float _1067 = -_763;
    int _1069 = _823 ? as_type<int>(_1067) : as_type<int>(_763);
    float _1071 = fma(_1055, _1055, _1061);
    float _1073 = _997 * _1065;
    float _1075 = -_819;
    int _1077 = _813 ? as_type<int>(_1075) : as_type<int>(_819);
    float _1079 = -_997;
    float _1081 = _1079 + 1.0;
    float _1083 = sqrt(_1071);
    float _1085 = -_819;
    int _1087 = _733 ? as_type<int>(_1085) : as_type<int>(_819);
    float _1089 = _895 * _1073;
    bool _1091 = !_657;
    float _1093 = _1091 ? _763 : as_type<float>(_1069);
    float _1095 = _907 + 0.5;
    bool _1097 = !_651;
    float _1099 = _1097 ? _819 : as_type<float>(_1087);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1089);
    bool _1103 = !_663;
    float _1105 = _1103 ? _819 : as_type<float>(_1077);
    float _1107 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1109 = _893 * _1073;
    float _1111 = _901 * _1073;
    float _1113 = fma(_975, _1059, _1101);
    float _1115 = fma(_1107, _1095, _713);
    float _1117 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1119 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1109);
    float _1121 = _915 + _1047;
    bool _1123 = _1083 > 0.0;
    float _1125 = _917 + _1033;
    float _1127 = _919 + _1055;
    float _1129 = _1099 + (-0.5);
    float _1131 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1111);
    float _1133 = fma(_1005, _1059, _1119);
    float _1135 = -_1117;
    float _1137 = -_673;
    float _1139 = fma(_1135, _1129, _1137);
    float _1141 = fma(_1009, _1059, _1131);
    float _1143 = _917;
    float _1145 = _915;
    float _1147 = _919;
    if (!_1123)
    {
        _1143 = _1121;
    }
    float _1149 = _1143;
    float _1151 = _1149;
    if (!_1123)
    {
        _1145 = _1125;
    }
    float _1153 = _1145;
    float _1155 = _1153;
    if (!_1123)
    {
        _1147 = _1127;
    }
    float _1157 = _1147;
    bool _1159 = !_1123;
    float _1161 = _1157;
    float _1163 = _1157;
    if (!_1159)
    {
        float _1165 = _149 * _149;
        float _1167 = fma(_147, _147, _1165);
        float _1169 = rsqrt(_1071);
        float _1171 = fma(_151, _151, _1167);
        float _1173 = sqrt(_1171);
        float _1175 = _1047 * _1169;
        float _1177 = _1033 * _1169;
        float _1179 = _1055 * _1169;
        bool _1181 = _1173 > 0.0;
        float _1183 = _1169;
        float _1185 = _1173;
        if (!_1181)
        {
            _1183 = _1121;
        }
        float _1187 = _1183;
        _1151 = _1187;
        if (!_1181)
        {
            _1185 = _1125;
        }
        float _1189 = _1185;
        _1155 = _1189;
        if (!_1181)
        {
            _1161 = _1127;
        }
        float _1191 = _1161;
        bool _1193 = !_1181;
        _1163 = _1191;
        if (!_1193)
        {
            float _1195 = rsqrt(_1171);
            float _1197 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1199 = _149 * _1195;
            float _1201 = _147 * _1195;
            float _1203 = _1177 * _1199;
            float _1205 = _151 * _1195;
            float _1207 = fma(_1175, _1201, _1203);
            float _1209 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1211 = fma(_1179, _1205, _1207);
            float _1213 = _1211 * _1209;
            float _1215 = fma(_147, _1213, _1121);
            float _1217 = fma(_149, _1213, _1125);
            float _1219 = fma(_151, _1213, _1127);
            _1155 = _1217;
            _1151 = _1215;
            _1163 = _1219;
        }
    }
    float _1221 = _1155;
    float _1223 = _1151;
    float _1225 = _1163;
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1231 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1227);
    float _1237 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1229);
    float _1239 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1231);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1113);
    float _1243 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1235);
    float _1245 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1237);
    float _1247 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1239);
    float _1249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1251 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1253 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1133);
    float _1257 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1141);
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1261 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1265 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1267 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1259);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1261);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1263);
    float _1273 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1265);
    float _1275 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1277 = -_715;
    float _1279 = _1277 + 1.0;
    float _1281 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1283 = _1093 + 0.5;
    float _1285 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1275);
    float _1287 = -_1105;
    float _1289 = _1287 + 0.5;
    float _1291 = -_1279;
    float _1293 = fma(_907, _1291, _1115);
    float _1295 = -_721;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1301 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1267);
    float _1303 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1305 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1271);
    float _1307 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1273);
    float _1309 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1311 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1313 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1315 = _1255 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1317 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1319 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1321 = fma(_1099, _1297, _1139);
    float _1323 = _1309 * _1233;
    float _1325 = _1311 * _1249;
    float _1327 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1301);
    float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1303);
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1305);
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1307);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1293;
    out.m_46.y = _1321;
    out.m_46.z = _1323;
    out.m_46.w = _1325;
    out.m_48.x = _1327;
    out.m_48.y = _1329;
    out.m_48.z = _1331;
    out.m_50.x = _1223;
    out.m_50.y = _1221;
    out.m_50.z = _1225;
    out.gl_Position.x = _1333;
    out.gl_Position.y = _1335;
    out.gl_Position.z = _1337;
    out.gl_Position.w = _1339;
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
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_83);
        out.gl_Position.z = _1395;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_31.w;
    float _89 = in.m_33.x;
    bool _91 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_87;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.x = _89;
    float _105 = 0.0;
    float _107 = _103;
    if (_99)
    {
        float _109 = float(_69);
        _105 = _109;
    }
    float _111 = _105;
    bool _113 = _103 >= _111;
    bool _115 = !_99;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_29.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _85 = as_type<int>(_123);
    }
    int _125 = _85;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1469 = as_type<float>(_125);
        out.gl_Position.z = _1469;
    }
    if (_117)
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
        float _157 = _89 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
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
        float _177 = _103 * _175;
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
    bool _207 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _209 = isnan(_179);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = 1.0 / _191;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _179 + _221;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _227 = 1.0 / _199;
    float _229 = _223 * _201;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _179 + _231;
    float _235 = 1.0 / _195;
    float _237 = _183 * _219;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _179 + _239;
    bool _243 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _245 = isnan(_179);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _257 = _179 + _255;
    float _259 = 1.0 / _205;
    float _261 = _241 * _227;
    bool _263 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _265 = isnan(_179);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_253;
    float _277 = _275 + 1.0;
    bool _279 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _281 = isnan(_179);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _233 * _235;
    float _293 = -_273;
    float _295 = _293 + 1.0;
    float _297 = _289 * _277;
    float _299 = -_217;
    float _301 = _299 + 1.0;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _253 * _295;
    bool _309 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_179);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _273 * _301;
    float _323 = _257 * _259;
    bool _325 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_179);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _319 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = fma(_341, _229, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _335 * _345;
    float _359 = fma(_349, _229, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = -_335;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = _355 * _357;
    float _371 = _359 * _357;
    float _373 = fma(_353, _237, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _381 = fma(_367, _237, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _393 = fma(_377, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_373, _337, _379);
    float _397 = fma(_385, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _403 = fma(_381, _337, _387);
    float _405 = fma(_391, _261, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _407;
    float _411 = fma(_393, _297, _395);
    float _413 = fma(_401, _261, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _415;
    float _419 = fma(_397, _297, _403);
    float _421 = fma(_409, _323, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _423 = fma(_405, _307, _411);
    float _425 = fma(_417, _323, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _427 = fma(_413, _307, _419);
    float _429 = fma(_421, _321, _423);
    float _431 = fma(_425, _321, _427);
    float _433 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[148].x, _429);
    float _435 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[148].y, _431);
    bool _437 = !_225;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _89 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
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
        float _461 = _103 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = in.m_33.z;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    float _471 = _89 * 2.0;
    float _473 = in.m_33.y;
    float _475 = as_type<float>(int(gl_VertexIndex));
    float _477 = floor(_471);
    float _479 = _469 * _103;
    float _481 = exp2(_479);
    float _483 = _465 * 2.0;
    bool _485 = _477 > 0.0;
    bool _487 = _477 >= 0.0;
    bool _489 = isnan(_477);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _473 * 2.0;
    float _499 = floor(_483);
    int _501 = _495 ? 0 : 1;
    int _503 = ~_501;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    int _509 = _507;
    if (!_485)
    {
        int _511 = ~_501;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = floor(_497);
    float _519 = -_481;
    float _521 = _519 + 1.0;
    float _523 = float(_515);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _527 = _499 > 0.0;
    float _529 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[78].w, _525);
    bool _531 = _499 >= 0.0;
    bool _533 = isnan(_499);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    int _541 = _539 ? 0 : 1;
    bool _543 = _517 > 0.0;
    bool _545 = _517 >= 0.0;
    bool _547 = isnan(_517);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    int _555 = as_type<int>(_475) & 1;
    bool _557 = _555 != 0;
    int _559 = as_type<int>(_475) & 2;
    bool _561 = _559 != 0;
    int _563 = ~_541;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    int _569 = _553 ? 0 : 1;
    int _571 = _567;
    if (!_527)
    {
        int _573 = ~_541;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _89 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _591 = _589 != 0;
    bool _593 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    int _603 = ~_569;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    int _609 = _607;
    if (!_543)
    {
        int _611 = ~_569;
        int _613 = _611 + 1;
        _609 = _613;
    }
    int _615 = _609;
    float _617 = _601 ? _521 : 0.0;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = _89 + _473;
    float _623 = -_619;
    float _625 = fma(_579, 2.0, _623);
    float _627 = _473 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _631 = !_587;
    int _633 = _631 ? 0 : 1;
    float _635 = _473 + _465;
    bool _637 = !_583;
    int _639 = _637 ? 0 : 1;
    float _641 = _621 + (-1.0);
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _645 = _643 != 0;
    float _647 = _635 + (-1.0);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _663 = _661 != 0;
    float _665 = fma(_627, -2.0, _629);
    int _667 = abs(_633);
    bool _669 = !_591;
    int _671 = _669 ? 0 : 1;
    float _673 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _665);
    bool _675 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _677 = isnan(1.0);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _683 = _679 || _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _687 = 1.0 + _685;
    float _689 = in.m_42.x;
    float _691 = in.m_42.y;
    float _693 = in.m_42.z;
    float _695 = 1.0 / _687;
    float _697 = float(_667);
    int _699 = abs(_639);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _703 = abs(_671);
    float _705 = _697 * _523;
    float _707 = float(_615);
    float _709 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[78].z, _701);
    float _711 = -_103;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[76].x, _625);
    float _715 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _717 = float(_699);
    float _719 = float(_577);
    float _721 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _529);
    float _723 = float(_703);
    if (_683)
    {
        float _725 = _617 * _695;
        _107 = _725;
    }
    float _727 = _107;
    float _729 = _705 * (-2.0);
    float _731 = _717 * _719;
    bool _733 = _473 > 0.5;
    float _735 = _723 * _707;
    float _737 = fma(_659, _729, _659);
    float _739 = fma(_729, _691, _691);
    float _741 = _473 + (-0.5);
    float _743 = _731 * (-2.0);
    float _745 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[196].y, _739);
    float _747 = in.m_33.w;
    float _749 = fma(_653, _743, _653);
    float _751 = fma(_743, _689, _689);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _761 = !_557;
    float _763 = _761 ? (-0.5) : 0.5;
    float _765 = fma(_737, _727, _745);
    float _767 = in.m_44.x;
    float _769 = in.m_44.y;
    bool _771 = _89 > 0.5;
    float _773 = _89 + (-0.5);
    float _775 = _89 + _465;
    float _777 = _765 * 0.15915493667125701904296875;
    float _779 = in.m_26.x;
    float _781 = in.m_26.y;
    float _783 = in.m_26.z;
    float _785 = _735 * (-2.0);
    float _787 = _775 + (-1.0);
    float _789 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].x, _751);
    float _791 = 1.0 / _759;
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _763);
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _797 = fma(_785, _693, _693);
    float _799 = _465 + (-0.5);
    float _801 = fma(_749, _727, _789);
    float _803 = fma(_795, _785, _795);
    float _805 = -_763;
    int _807 = _771 ? as_type<int>(_805) : as_type<int>(_763);
    float _809 = 1.0 / _755;
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[196].z, _797);
    bool _813 = _747 > 0.5;
    float _815 = _801 * 0.15915493667125701904296875;
    bool _817 = !_561;
    float _819 = _817 ? (-0.5) : 0.5;
    float _821 = fma(_803, _727, _811);
    bool _823 = _465 > 0.5;
    float _825 = _433 * _767;
    float _827 = _435 * _769;
    float _829 = _777 * 6.283185482025146484375;
    float _831 = sin(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _835 = _463 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _839 = _463 + _837;
    float _841 = _781 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _781 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _845 = _781 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _847 = _835 * _791;
    float _849 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    float _851 = _777 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[5].x, _843);
    float _857 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[6].x, _845);
    float _859 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _861 = _839 * _809;
    float _863 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[5].z, _855);
    float _865 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    float _867 = _815 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _821 * 0.15915493667125701904296875;
    float _873 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _881;
    float _885 = _815 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    float _893 = fma(_877, _861, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _895 = fma(_883, _861, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _901 = fma(_891, _861, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _903 = _873 * _793;
    bool _905 = !_645;
    float _907 = _905 ? _763 : as_type<float>(_807);
    float _909 = _871 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _819);
    float _915 = _859 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _917 = _863 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _919 = _865 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _921 = _879 * _913;
    float _923 = _869 * _831;
    float _925 = _871 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _887 * _831;
    float _931 = _887 * _853;
    float _933 = _911 * _921;
    float _935 = _831 * _911;
    float _937 = _869 * _853;
    float _939 = _853 * _911;
    float _941 = _887 * _933;
    float _943 = _869 * _933;
    float _945 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _951 = _927 * _921;
    float _953 = -_929;
    float _955 = fma(_927, _937, _953);
    float _957 = -_937;
    float _959 = fma(_927, _929, _957);
    float _961 = fma(_927, _931, _923);
    float _963 = -_951;
    float _965 = fma(_939, _903, _963);
    float _967 = fma(_927, _923, _931);
    float _969 = fma(_955, _903, _943);
    float _971 = fma(_961, _903, _941);
    float _973 = fma(_935, _945, _965);
    float _975 = fma(_949, _847, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _977 = fma(_967, _945, _969);
    float _979 = fma(_959, _945, _971);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _987 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _989 = isnan(_463);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = _979 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1001 = _979 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1003 = _979 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1005 = fma(_983, _847, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1007 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _999);
    float _1009 = fma(_899, _847, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1011 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1001);
    float _1013 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1003);
    float _1015 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1007);
    bool _1017 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1019 = isnan(_463);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1031 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1033 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1035 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1037 = isnan(_463);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1049 = -_1027;
    float _1051 = _1049 + 1.0;
    float _1053 = _1033 * _1033;
    float _1055 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1059 = _1045 * _1051;
    float _1061 = fma(_1047, _1047, _1053);
    float _1063 = -_1045;
    float _1065 = _1063 + 1.0;
    float _1067 = -_763;
    int _1069 = _823 ? as_type<int>(_1067) : as_type<int>(_763);
    float _1071 = fma(_1055, _1055, _1061);
    float _1073 = _997 * _1065;
    float _1075 = -_819;
    int _1077 = _813 ? as_type<int>(_1075) : as_type<int>(_819);
    float _1079 = -_997;
    float _1081 = _1079 + 1.0;
    float _1083 = sqrt(_1071);
    float _1085 = -_819;
    int _1087 = _733 ? as_type<int>(_1085) : as_type<int>(_819);
    float _1089 = _895 * _1073;
    bool _1091 = !_657;
    float _1093 = _1091 ? _763 : as_type<float>(_1069);
    float _1095 = _907 + 0.5;
    bool _1097 = !_651;
    float _1099 = _1097 ? _819 : as_type<float>(_1087);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1089);
    bool _1103 = !_663;
    float _1105 = _1103 ? _819 : as_type<float>(_1077);
    float _1107 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1109 = _893 * _1073;
    float _1111 = _901 * _1073;
    float _1113 = fma(_975, _1059, _1101);
    float _1115 = fma(_1107, _1095, _713);
    float _1117 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1119 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1109);
    float _1121 = _915 + _1047;
    bool _1123 = _1083 > 0.0;
    float _1125 = _917 + _1033;
    float _1127 = _919 + _1055;
    float _1129 = _1099 + (-0.5);
    float _1131 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1111);
    float _1133 = fma(_1005, _1059, _1119);
    float _1135 = -_1117;
    float _1137 = -_673;
    float _1139 = fma(_1135, _1129, _1137);
    float _1141 = fma(_1009, _1059, _1131);
    float _1143 = _917;
    float _1145 = _915;
    float _1147 = _919;
    if (!_1123)
    {
        _1143 = _1121;
    }
    float _1149 = _1143;
    float _1151 = _1149;
    if (!_1123)
    {
        _1145 = _1125;
    }
    float _1153 = _1145;
    float _1155 = _1153;
    if (!_1123)
    {
        _1147 = _1127;
    }
    float _1157 = _1147;
    bool _1159 = !_1123;
    float _1161 = _1157;
    float _1163 = _1157;
    if (!_1159)
    {
        float _1165 = _149 * _149;
        float _1167 = fma(_147, _147, _1165);
        float _1169 = rsqrt(_1071);
        float _1171 = fma(_151, _151, _1167);
        float _1173 = sqrt(_1171);
        float _1175 = _1047 * _1169;
        float _1177 = _1033 * _1169;
        float _1179 = _1055 * _1169;
        bool _1181 = _1173 > 0.0;
        float _1183 = _1169;
        float _1185 = _1173;
        if (!_1181)
        {
            _1183 = _1121;
        }
        float _1187 = _1183;
        _1151 = _1187;
        if (!_1181)
        {
            _1185 = _1125;
        }
        float _1189 = _1185;
        _1155 = _1189;
        if (!_1181)
        {
            _1161 = _1127;
        }
        float _1191 = _1161;
        bool _1193 = !_1181;
        _1163 = _1191;
        if (!_1193)
        {
            float _1195 = rsqrt(_1171);
            float _1197 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1199 = _149 * _1195;
            float _1201 = _147 * _1195;
            float _1203 = _1177 * _1199;
            float _1205 = _151 * _1195;
            float _1207 = fma(_1175, _1201, _1203);
            float _1209 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1211 = fma(_1179, _1205, _1207);
            float _1213 = _1211 * _1209;
            float _1215 = fma(_147, _1213, _1121);
            float _1217 = fma(_149, _1213, _1125);
            float _1219 = fma(_151, _1213, _1127);
            _1155 = _1217;
            _1151 = _1215;
            _1163 = _1219;
        }
    }
    float _1221 = _1155;
    float _1223 = _1151;
    float _1225 = _1163;
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1231 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1227);
    float _1237 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1229);
    float _1239 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1231);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1113);
    float _1243 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1235);
    float _1245 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1237);
    float _1247 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1239);
    float _1249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1251 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1253 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1133);
    float _1257 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1141);
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1261 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1265 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1267 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1259);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1261);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1263);
    float _1273 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1265);
    float _1275 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1277 = -_715;
    float _1279 = _1277 + 1.0;
    float _1281 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1283 = _1093 + 0.5;
    float _1285 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1275);
    float _1287 = -_1105;
    float _1289 = _1287 + 0.5;
    float _1291 = -_1279;
    float _1293 = fma(_907, _1291, _1115);
    float _1295 = -_721;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1301 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1267);
    float _1303 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1305 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1271);
    float _1307 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1273);
    float _1309 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1311 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1313 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1315 = _1255 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1317 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1319 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1321 = fma(_1099, _1297, _1139);
    float _1323 = _1309 * _1233;
    float _1325 = _1311 * _1249;
    float _1327 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1301);
    float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1303);
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1305);
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1307);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1293;
    out.m_46.y = _1321;
    out.m_46.z = _1323;
    out.m_46.w = _1325;
    out.m_48.x = _1327;
    out.m_48.y = _1329;
    out.m_48.z = _1331;
    out.m_50.x = _1223;
    out.m_50.y = _1221;
    out.m_50.z = _1225;
    out.gl_Position.x = _1333;
    out.gl_Position.y = _1335;
    out.gl_Position.z = _1337;
    out.gl_Position.w = _1339;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

