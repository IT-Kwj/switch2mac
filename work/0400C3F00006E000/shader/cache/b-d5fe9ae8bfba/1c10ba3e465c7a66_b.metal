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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_44 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1346 = false;
    bool _649 = false;
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_93);
        out.gl_Position.z = _1533;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = 0.0;
    if (_107)
    {
        float _115 = float(_77);
        _113 = _115;
    }
    float _117 = _113;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    if (_123)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _87;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1601 = as_type<float>(_129);
        out.gl_Position.z = _1601;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_39.x;
    float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _135 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _135 * _133;
    float _151 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = in.m_37.x;
    float _155 = in.m_37.y;
    float _157 = in.m_37.z;
    float _159 = _151 * 6.283185482025146484375;
    float _161 = floor(_151);
    int _163 = as_type<int>(_137) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_137) & 2;
    bool _169 = _167 != 0;
    float _171 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = _159 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = 0.0;
    float _181 = _171;
    if (!_147)
    {
        float _183 = _171 * _171;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    bool _189 = !_165;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _173 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_169;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _187;
    if (!_147)
    {
        float _203 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = -_161;
    float _209 = _151 + _207;
    bool _211 = !_147;
    float _213 = _205;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _171 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _171);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_147;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _171 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _181 = _267;
    }
    float _269 = _181;
    float _271 = fma(_195, 0.5, 0.5);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _275 = _273 != 0;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _279 = _277 != 0;
    float _281 = in.m_44.w;
    float _283 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _285 = !_177;
    int _287 = _285 ? 0 : 1;
    float _289 = -_209;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _293 = in.m_32.x;
    float _295 = in.m_32.y;
    float _297 = in.m_32.z;
    bool _299 = _209 < 0.5;
    float _301 = float(_299);
    float _303 = fma(_269, _153, _283);
    bool _305 = !_275;
    int _307 = _305 ? 0 : 1;
    float _309 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _311 = abs(_287);
    float _313 = -_301;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_279;
    int _319 = _317 ? 0 : 1;
    float _321 = -_271;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_307);
    float _327 = fma(_269, _155, _309);
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _331 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _333 = abs(_319);
    float _335 = float(_325);
    float _337 = fma(_269, _157, _331);
    float _339 = float(_311);
    float _341 = float(_333);
    float _343 = abs(_291);
    float _345 = _335 * _343;
    float _347 = fma(_339, _323, _345);
    float _349 = fma(_303, _281, _293);
    float _351 = fma(_327, _281, _295);
    float _353 = fma(_337, _281, _297);
    float _355 = abs(_315);
    float _357 = fma(_341, _355, _347);
    bool _359 = !_329;
    float _375;
    if (!_359)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _363 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _367 = _365 * _361;
        float _369 = floor(_367);
        float _371 = -_369;
        float _373 = _367 + _371;
        _375 = _373;
        _377 = true;
    }
    else
    {
        float _379 = float(_77);
        float _381 = 1.0 / _379;
        float _383 = _111 * _381;
        _375 = _383;
    }
    _377 = false;
    float _385 = _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _403 = 1.0 / _389;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _407 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _409 = 1.0 / _397;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _417 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _385 + _419;
    float _423 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = 1.0 / _393;
    float _427 = _411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _431 = _385 + _429;
    float _433 = _407 * _131;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _437 = _431 * _403;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = _385 + _439;
    float _443 = 1.0 / _401;
    bool _445 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_385);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    out.m_46.x = _417;
    out.m_46.y = _423;
    out.m_46.z = _427;
    out.m_46.w = _415;
    float _457 = _441 * _409;
    bool _459 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _461 = isnan(_385);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_455;
    float _473 = _471 + 1.0;
    float _475 = _421 * _425;
    bool _477 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _479 = isnan(_385);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _491 = _385 + _489;
    float _493 = trunc(_433);
    int _495 = int(_493);
    float _497 = _487 * _473;
    float _499 = -_487;
    float _501 = _499 + 1.0;
    bool _503 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_385);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _491 * _443;
    float _517 = _469 * _501;
    bool _519 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_385);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_469;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = -_513;
    float _549 = _547 + 1.0;
    float _551 = _513 * _533;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = fma(_537, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _559 = fma(_545, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _561 = _529 * _549;
    float _563 = fma(_541, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_555, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = _557 * _561;
    float _569 = -_529;
    float _571 = _569 + 1.0;
    float _573 = _559 * _561;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = in.m_44.x;
    float _581 = in.m_44.y;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _585;
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _591 = fma(_577, _457, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _593 = fma(_563, _551, _583);
    float _595 = fma(_587, _457, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_565, _551, _589);
    float _607 = fma(_595, _517, _593);
    float _609 = fma(_599, _515, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _611 = fma(_603, _515, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = fma(_591, _517, _605);
    float _615 = fma(_609, _497, _607);
    float _617 = fma(_611, _497, _613);
    int _619 = _495 << 4;
    int _621 = _619 + 1968;
    float _623 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[147].x, _615);
    float _625 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[147].y, _617);
    float _627 = _623 * _579;
    float _629 = _625 * _581;
    bool _631 = !_435;
    float _647;
    if (!_631)
    {
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _635 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_77);
        float _653 = 1.0 / _651;
        float _655 = _111 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = in.m_48.x;
    float _661 = in.m_48.y;
    float _663 = in.m_48.z;
    float _665 = in.m_48.w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _657 + _667;
    float _671 = in.m_50.x;
    float _673 = in.m_50.y;
    float _675 = in.m_50.z;
    float _677 = in.m_50.w;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _685 = _683 != 0;
    float _687 = in.m_52.x;
    float _689 = in.m_52.y;
    float _691 = in.m_52.z;
    float _693 = in.m_52.w;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = in.m_39.w;
    bool _705 = _131 > 0.5;
    float _707 = in.m_39.y;
    bool _709 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _711 = isnan(_657);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = in.m_39.z;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _727 = _351 * _661;
    float _729 = 1.0 / _725;
    float _731 = _351 * _673;
    float _733 = fma(_349, _659, _727);
    float _735 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _737 = _351 * _689;
    float _739 = fma(_349, _671, _731);
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _743 = fma(_353, _663, _733);
    bool _745 = _703 > 0.5;
    float _747 = -_741;
    float _749 = fma(_735, 2.0, _747);
    float _751 = fma(_349, _687, _737);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _757 = _707 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _759 = 1.0 / _755;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _763 = _721 > 0.5;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _767 = fma(_757, -2.0, _761);
    bool _769 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _771 = isnan(_657);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _765);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _793 = -_779;
    float _795 = _793 + 1.0;
    float _797 = -_191;
    int _799 = _705 ? as_type<int>(_797) : as_type<int>(_191);
    float _801 = 1.0 / _789;
    bool _803 = _707 > 0.5;
    float _805 = _785 * _759;
    bool _807 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _809 = isnan(_657);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[78].w, _791);
    bool _821 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _823 = isnan(_657);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_353, _691, _751);
    float _835 = fma(_805, _669, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _837 = _817 * _795;
    float _839 = -_817;
    float _841 = _839 + 1.0;
    float _843 = -_831;
    float _845 = _843 + 1.0;
    uint _848 = uint(int(uint(_621) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[int(_858)][_860];
    float _864 = _833 + _693;
    float _866 = _831 * _841;
    float _868 = _719 * _845;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _872 = fma(_353, _675, _739);
    float _874 = -_719;
    float _876 = _874 + 1.0;
    float _878 = _835 * _868;
    int _880 = _621 + 8;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    uint _884 = uint(int(uint(int(_882)) >> uint(2)));
    int _886 = int(_882) & 3;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[int(_884)][_886];
    float _890 = _743 + _665;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _894 = _864 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _898 = _657 + _896;
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _904 = _657 + _902;
    float _906 = _872 + _677;
    float _908 = -_199;
    int _910 = _803 ? as_type<int>(_908) : as_type<int>(_199);
    float _912 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[131].x, _878);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _916 = _890 + _914;
    float _918 = _894 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _924 = !_681;
    float _926 = _924 ? _191 : as_type<float>(_799);
    float _928 = -_111;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _749);
    float _932 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _781);
    bool _934 = !_685;
    float _936 = _934 ? _199 : as_type<float>(_910);
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _940 = _906 + _938;
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _918);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _944;
    float _948 = _922 * _801;
    float _950 = _900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _952 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _767);
    float _954 = _936 + (-0.5);
    float _956 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _958 = _946 * _729;
    float _960 = fma(_948, _898, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _962 = _870 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _964 = _926 + 0.5;
    float _966 = -_950;
    float _968 = -_952;
    float _970 = fma(_966, _954, _968);
    float _972 = fma(_958, _904, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _974 = fma(_960, _866, _912);
    bool _976 = _956 >= 0.0;
    float _978 = fma(_962, _964, _930);
    float _980 = -_199;
    int _982 = _745 ? as_type<int>(_980) : as_type<int>(_199);
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _986 = fma(_972, _837, _974);
    float _988 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _819);
    bool _990 = !_701;
    float _992 = _990 ? _199 : as_type<float>(_982);
    float _994 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[134].x, _986);
    float _996 = _854 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _998 = -_932;
    float _1000 = _998 + 1.0;
    float _1002 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1004 = _894 * _894;
    float _1006 = -_191;
    int _1008 = _763 ? as_type<int>(_1006) : as_type<int>(_191);
    float _1010 = -_992;
    float _1012 = _1010 + 0.5;
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1016 = fma(_916, _916, _1004);
    float _1018 = -_988;
    float _1020 = _1018 + 1.0;
    bool _1022 = !_697;
    float _1024 = _1022 ? _191 : as_type<float>(_1008);
    float _1026 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1028 = fma(_940, _940, _1016);
    float _1030 = fma(_936, _1020, _970);
    float _1032 = -_1000;
    float _1034 = fma(_926, _1032, _978);
    float _1036 = _1026 * _984;
    float _1038 = _1024 + 0.5;
    float _1040 = rsqrt(_1028);
    float _1042 = _970;
    if (_976)
    {
        _1042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1044 = _1042;
    float _1046 = _888 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1050 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1048 * _1014;
    float _1056 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1060 = as_type<int>(_1044);
    if (_976)
    {
        float _1062 = _1044 * 5.0;
        _1060 = as_type<int>(_1062);
    }
    int _1064 = _1060;
    float _1066 = as_type<float>(_1064);
    if (_976)
    {
        out.m_35.x = 0.0;
    }
    out.m_54.x = _1034;
    out.m_54.y = _1030;
    out.m_54.z = _1054;
    out.m_54.w = _1036;
    float _1068 = _894 * _1040;
    float _1070 = _916 * _1040;
    out.m_56.x = _1050;
    out.m_56.y = _1052;
    out.m_56.z = _1056;
    out.m_56.w = _1058;
    if (_976)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3113 = as_type<float>(_1064);
        out.gl_Position.z = _3113;
    }
    if (_976)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1072 = -_1068;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _1076 = _940 * _1040;
    float _1078 = -_1070;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _1082 = -_1068;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _894);
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1088 = _1074 + _1086;
    float _1090 = -_1076;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _906);
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1080 + _1094;
    float _1098 = -_1070;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _916);
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1106 = _1092 + _1104;
    float _1108 = _1084 * _1084;
    float _1110 = -_1076;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _940);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1102);
    float _1116 = fma(_1100, _1100, _1108);
    float _1118 = _357 * _627;
    float _1120 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1114);
    float _1122 = fma(_1112, _1112, _1116);
    bool _1124 = _1120 >= 0.0;
    float _1126 = sqrt(_1122);
    float _1128 = _357 * _629;
    if (_1124)
    {
        _1066 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1130 = _1066;
    int _1132 = as_type<int>(_1130);
    if (_1124)
    {
        out.m_35.x = 0.0;
    }
    float _1134 = _1040 * _1126;
    if (_1124)
    {
        float _1136 = _1130 * 5.0;
        _1132 = as_type<int>(_1136);
    }
    int _1138 = _1132;
    if (_1124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3246 = as_type<float>(_1138);
        out.gl_Position.z = _3246;
    }
    if (_1124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1144 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1148 = _1134 * _1140;
    float _1150 = _1134 * _1144;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1154 = _1152 * 0.5;
    float _1156 = _1142 * _1148;
    float _1158 = _1146 * _1150;
    float _1160 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1166 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1168 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1162);
    float _1170 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1164);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1166);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1168);
    float _1176 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1170);
    float _1178 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1184 = _890 + _1178;
    float _1186 = _906 + _1180;
    float _1188 = _864 + _1182;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1184 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _1192 * _1192;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 + _1200;
    float _1204 = sqrt(_1202);
    bool _1206 = _1204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1208 = _1154;
    float _1210 = _1182;
    float _1212 = _1164;
    float _1214 = _1200;
    float _1216 = _1184;
    if (!_1206)
    {
        _1208 = _1198;
    }
    float _1218 = _1208;
    float _1220 = _1218;
    if (!_1206)
    {
        _1210 = _1186;
    }
    float _1222 = _1210;
    float _1224 = _1222;
    if (!_1206)
    {
        _1212 = _1188;
    }
    float _1226 = _1212;
    bool _1228 = !_1206;
    float _1230 = _1226;
    if (!_1228)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1236 = _1204 + _1234;
        float _1238 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = rsqrt(_1202);
        float _1242 = _1236 * _1232;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = _1244 * 6.283185482025146484375;
        float _1248 = sin(_1246);
        float _1250 = _1244 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = fma(_1248, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1256 = _1240 * _1254;
        float _1258 = _1252 + (-1.0);
        float _1260 = fma(_1192, _1256, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1262 = fma(_1196, _1256, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1264 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1268 = _1260 + _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1272 = _1262 + _1270;
        float _1274 = fma(_1188, _1252, _1264);
        float _1276 = _1268 * _1268;
        float _1278 = _1272 * _1272;
        _1230 = _1274;
        _1220 = _1276;
        _1214 = _1278;
        _1216 = _1260;
        _1224 = _1262;
    }
    float _1280 = _1230;
    float _1282 = _1220;
    float _1284 = _1214;
    float _1286 = _1216;
    float _1288 = _1224;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1292 = _1280 + _1290;
    float _1294 = fma(_1292, _1292, _1282);
    float _1296 = _1294 + _1284;
    float _1298 = sqrt(_1296);
    bool _1300 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1302 = isnan(_1298);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1308 = _1304 || _1306;
    float _1310 = _1282;
    if (!_1308)
    {
        _1310 = 1.0;
    }
    float _1312 = _1310;
    bool _1314 = !_1308;
    float _1316 = _1312;
    if (!_1314)
    {
        bool _1318 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1320 = isnan(_1298);
        bool _1322 = _1318 || _1320;
        bool _1324 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1326 = _1322 || _1324;
        if (!_1326)
        {
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1330 = _1298 + _1328;
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1338 = _1336 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1340 = 1.0 / _1334;
            float _1342 = _1330 * _1340;
            float _1344 = fma(_1342, _1338, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1316 = _1344;
            _1346 = true;
        }
        else
        {
            bool _1348 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1350 = isnan(_1298);
            bool _1352 = _1348 || _1350;
            bool _1354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1356 = _1352 || _1354;
            if (!_1356)
            {
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1360 = _1298 + _1358;
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1362 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1370 = 1.0 / _1364;
                float _1372 = _1360 * _1370;
                float _1374 = fma(_1372, _1368, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1316 = _1374;
                _1346 = true;
            }
            else
            {
                _1316 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1346 = false;
    float _1376 = _1316;
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1380 = _1280 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1384 = _1286 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1388 = _1288 + _1386;
    float _1390 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1392 = fma(_1384, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1394 = fma(_1388, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1396 = -_1068;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1400 = -_1070;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1404 = -_1076;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1408 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1418 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1416);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1440);
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1454);
    float _1464 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1456);
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1458);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1460);
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1462);
    float _1472 = _1464 + _1466;
    float _1474 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1472 * 0.5;
    out.m_35.x = _1474;
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1464;
    out.gl_Position.w = _1466;
    out.m_58.z = _1476;
    out.m_58.w = _1466;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1346 = false;
    bool _649 = false;
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_93);
        out.gl_Position.z = _1533;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = 0.0;
    if (_107)
    {
        float _115 = float(_77);
        _113 = _115;
    }
    float _117 = _113;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    if (_123)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _87;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1601 = as_type<float>(_129);
        out.gl_Position.z = _1601;
    }
    if (_123)
    {
        return out;
    }
    float _131 = in.m_39.x;
    float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _135 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _135 * _133;
    float _151 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = in.m_37.x;
    float _155 = in.m_37.y;
    float _157 = in.m_37.z;
    float _159 = _151 * 6.283185482025146484375;
    float _161 = floor(_151);
    int _163 = as_type<int>(_137) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_137) & 2;
    bool _169 = _167 != 0;
    float _171 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = _159 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = 0.0;
    float _181 = _171;
    if (!_147)
    {
        float _183 = _171 * _171;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    bool _189 = !_165;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _173 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_169;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _187;
    if (!_147)
    {
        float _203 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = -_161;
    float _209 = _151 + _207;
    bool _211 = !_147;
    float _213 = _205;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _171 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _171);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_147;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _171 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _181 = _267;
    }
    float _269 = _181;
    float _271 = fma(_195, 0.5, 0.5);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _275 = _273 != 0;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _279 = _277 != 0;
    float _281 = in.m_44.w;
    float _283 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _285 = !_177;
    int _287 = _285 ? 0 : 1;
    float _289 = -_209;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _293 = in.m_32.x;
    float _295 = in.m_32.y;
    float _297 = in.m_32.z;
    bool _299 = _209 < 0.5;
    float _301 = float(_299);
    float _303 = fma(_269, _153, _283);
    bool _305 = !_275;
    int _307 = _305 ? 0 : 1;
    float _309 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _311 = abs(_287);
    float _313 = -_301;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_279;
    int _319 = _317 ? 0 : 1;
    float _321 = -_271;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_307);
    float _327 = fma(_269, _155, _309);
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _331 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _333 = abs(_319);
    float _335 = float(_325);
    float _337 = fma(_269, _157, _331);
    float _339 = float(_311);
    float _341 = float(_333);
    float _343 = abs(_291);
    float _345 = _335 * _343;
    float _347 = fma(_339, _323, _345);
    float _349 = fma(_303, _281, _293);
    float _351 = fma(_327, _281, _295);
    float _353 = fma(_337, _281, _297);
    float _355 = abs(_315);
    float _357 = fma(_341, _355, _347);
    bool _359 = !_329;
    float _375;
    if (!_359)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _363 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _367 = _365 * _361;
        float _369 = floor(_367);
        float _371 = -_369;
        float _373 = _367 + _371;
        _375 = _373;
        _377 = true;
    }
    else
    {
        float _379 = float(_77);
        float _381 = 1.0 / _379;
        float _383 = _111 * _381;
        _375 = _383;
    }
    _377 = false;
    float _385 = _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _403 = 1.0 / _389;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _407 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _409 = 1.0 / _397;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _417 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _385 + _419;
    float _423 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = 1.0 / _393;
    float _427 = _411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _431 = _385 + _429;
    float _433 = _407 * _131;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _437 = _431 * _403;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = _385 + _439;
    float _443 = 1.0 / _401;
    bool _445 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_385);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    out.m_46.x = _417;
    out.m_46.y = _423;
    out.m_46.z = _427;
    out.m_46.w = _415;
    float _457 = _441 * _409;
    bool _459 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _461 = isnan(_385);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_455;
    float _473 = _471 + 1.0;
    float _475 = _421 * _425;
    bool _477 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _479 = isnan(_385);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _491 = _385 + _489;
    float _493 = trunc(_433);
    int _495 = int(_493);
    float _497 = _487 * _473;
    float _499 = -_487;
    float _501 = _499 + 1.0;
    bool _503 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_385);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _491 * _443;
    float _517 = _469 * _501;
    bool _519 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_385);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_469;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = -_513;
    float _549 = _547 + 1.0;
    float _551 = _513 * _533;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = fma(_537, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _559 = fma(_545, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _561 = _529 * _549;
    float _563 = fma(_541, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_555, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = _557 * _561;
    float _569 = -_529;
    float _571 = _569 + 1.0;
    float _573 = _559 * _561;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = in.m_44.x;
    float _581 = in.m_44.y;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _585;
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _591 = fma(_577, _457, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _593 = fma(_563, _551, _583);
    float _595 = fma(_587, _457, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_565, _551, _589);
    float _607 = fma(_595, _517, _593);
    float _609 = fma(_599, _515, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _611 = fma(_603, _515, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = fma(_591, _517, _605);
    float _615 = fma(_609, _497, _607);
    float _617 = fma(_611, _497, _613);
    int _619 = _495 << 4;
    int _621 = _619 + 1968;
    float _623 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[147].x, _615);
    float _625 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[147].y, _617);
    float _627 = _623 * _579;
    float _629 = _625 * _581;
    bool _631 = !_435;
    float _647;
    if (!_631)
    {
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _635 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_77);
        float _653 = 1.0 / _651;
        float _655 = _111 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = in.m_48.x;
    float _661 = in.m_48.y;
    float _663 = in.m_48.z;
    float _665 = in.m_48.w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _657 + _667;
    float _671 = in.m_50.x;
    float _673 = in.m_50.y;
    float _675 = in.m_50.z;
    float _677 = in.m_50.w;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _685 = _683 != 0;
    float _687 = in.m_52.x;
    float _689 = in.m_52.y;
    float _691 = in.m_52.z;
    float _693 = in.m_52.w;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = in.m_39.w;
    bool _705 = _131 > 0.5;
    float _707 = in.m_39.y;
    bool _709 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _711 = isnan(_657);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = in.m_39.z;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _727 = _351 * _661;
    float _729 = 1.0 / _725;
    float _731 = _351 * _673;
    float _733 = fma(_349, _659, _727);
    float _735 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _737 = _351 * _689;
    float _739 = fma(_349, _671, _731);
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _743 = fma(_353, _663, _733);
    bool _745 = _703 > 0.5;
    float _747 = -_741;
    float _749 = fma(_735, 2.0, _747);
    float _751 = fma(_349, _687, _737);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _757 = _707 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _759 = 1.0 / _755;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _763 = _721 > 0.5;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _767 = fma(_757, -2.0, _761);
    bool _769 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _771 = isnan(_657);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _765);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _793 = -_779;
    float _795 = _793 + 1.0;
    float _797 = -_191;
    int _799 = _705 ? as_type<int>(_797) : as_type<int>(_191);
    float _801 = 1.0 / _789;
    bool _803 = _707 > 0.5;
    float _805 = _785 * _759;
    bool _807 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _809 = isnan(_657);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[78].w, _791);
    bool _821 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _823 = isnan(_657);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_353, _691, _751);
    float _835 = fma(_805, _669, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _837 = _817 * _795;
    float _839 = -_817;
    float _841 = _839 + 1.0;
    float _843 = -_831;
    float _845 = _843 + 1.0;
    uint _848 = uint(int(uint(_621) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[int(_858)][_860];
    float _864 = _833 + _693;
    float _866 = _831 * _841;
    float _868 = _719 * _845;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _872 = fma(_353, _675, _739);
    float _874 = -_719;
    float _876 = _874 + 1.0;
    float _878 = _835 * _868;
    int _880 = _621 + 8;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    uint _884 = uint(int(uint(int(_882)) >> uint(2)));
    int _886 = int(_882) & 3;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[int(_884)][_886];
    float _890 = _743 + _665;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _894 = _864 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _898 = _657 + _896;
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _904 = _657 + _902;
    float _906 = _872 + _677;
    float _908 = -_199;
    int _910 = _803 ? as_type<int>(_908) : as_type<int>(_199);
    float _912 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[131].x, _878);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _916 = _890 + _914;
    float _918 = _894 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _924 = !_681;
    float _926 = _924 ? _191 : as_type<float>(_799);
    float _928 = -_111;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _749);
    float _932 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _781);
    bool _934 = !_685;
    float _936 = _934 ? _199 : as_type<float>(_910);
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _940 = _906 + _938;
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _918);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _944;
    float _948 = _922 * _801;
    float _950 = _900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _952 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _767);
    float _954 = _936 + (-0.5);
    float _956 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _958 = _946 * _729;
    float _960 = fma(_948, _898, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _962 = _870 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _964 = _926 + 0.5;
    float _966 = -_950;
    float _968 = -_952;
    float _970 = fma(_966, _954, _968);
    float _972 = fma(_958, _904, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _974 = fma(_960, _866, _912);
    bool _976 = _956 >= 0.0;
    float _978 = fma(_962, _964, _930);
    float _980 = -_199;
    int _982 = _745 ? as_type<int>(_980) : as_type<int>(_199);
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _986 = fma(_972, _837, _974);
    float _988 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _819);
    bool _990 = !_701;
    float _992 = _990 ? _199 : as_type<float>(_982);
    float _994 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[134].x, _986);
    float _996 = _854 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _998 = -_932;
    float _1000 = _998 + 1.0;
    float _1002 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1004 = _894 * _894;
    float _1006 = -_191;
    int _1008 = _763 ? as_type<int>(_1006) : as_type<int>(_191);
    float _1010 = -_992;
    float _1012 = _1010 + 0.5;
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1016 = fma(_916, _916, _1004);
    float _1018 = -_988;
    float _1020 = _1018 + 1.0;
    bool _1022 = !_697;
    float _1024 = _1022 ? _191 : as_type<float>(_1008);
    float _1026 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1028 = fma(_940, _940, _1016);
    float _1030 = fma(_936, _1020, _970);
    float _1032 = -_1000;
    float _1034 = fma(_926, _1032, _978);
    float _1036 = _1026 * _984;
    float _1038 = _1024 + 0.5;
    float _1040 = rsqrt(_1028);
    float _1042 = _970;
    if (_976)
    {
        _1042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1044 = _1042;
    float _1046 = _888 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1050 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1048 * _1014;
    float _1056 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1060 = as_type<int>(_1044);
    if (_976)
    {
        float _1062 = _1044 * 5.0;
        _1060 = as_type<int>(_1062);
    }
    int _1064 = _1060;
    float _1066 = as_type<float>(_1064);
    if (_976)
    {
        out.m_35.x = 0.0;
    }
    out.m_54.x = _1034;
    out.m_54.y = _1030;
    out.m_54.z = _1054;
    out.m_54.w = _1036;
    float _1068 = _894 * _1040;
    float _1070 = _916 * _1040;
    out.m_56.x = _1050;
    out.m_56.y = _1052;
    out.m_56.z = _1056;
    out.m_56.w = _1058;
    if (_976)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3113 = as_type<float>(_1064);
        out.gl_Position.z = _3113;
    }
    if (_976)
    {
        return out;
    }
    float _1072 = -_1068;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _1076 = _940 * _1040;
    float _1078 = -_1070;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _1082 = -_1068;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _894);
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1088 = _1074 + _1086;
    float _1090 = -_1076;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _906);
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1080 + _1094;
    float _1098 = -_1070;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _916);
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1106 = _1092 + _1104;
    float _1108 = _1084 * _1084;
    float _1110 = -_1076;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _940);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1102);
    float _1116 = fma(_1100, _1100, _1108);
    float _1118 = _357 * _627;
    float _1120 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1114);
    float _1122 = fma(_1112, _1112, _1116);
    bool _1124 = _1120 >= 0.0;
    float _1126 = sqrt(_1122);
    float _1128 = _357 * _629;
    if (_1124)
    {
        _1066 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1130 = _1066;
    int _1132 = as_type<int>(_1130);
    if (_1124)
    {
        out.m_35.x = 0.0;
    }
    float _1134 = _1040 * _1126;
    if (_1124)
    {
        float _1136 = _1130 * 5.0;
        _1132 = as_type<int>(_1136);
    }
    int _1138 = _1132;
    if (_1124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3246 = as_type<float>(_1138);
        out.gl_Position.z = _3246;
    }
    if (_1124)
    {
        return out;
    }
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1144 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1148 = _1134 * _1140;
    float _1150 = _1134 * _1144;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1154 = _1152 * 0.5;
    float _1156 = _1142 * _1148;
    float _1158 = _1146 * _1150;
    float _1160 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1166 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1168 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1162);
    float _1170 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1164);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1166);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1168);
    float _1176 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1170);
    float _1178 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1184 = _890 + _1178;
    float _1186 = _906 + _1180;
    float _1188 = _864 + _1182;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1184 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _1192 * _1192;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 + _1200;
    float _1204 = sqrt(_1202);
    bool _1206 = _1204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1208 = _1154;
    float _1210 = _1182;
    float _1212 = _1164;
    float _1214 = _1200;
    float _1216 = _1184;
    if (!_1206)
    {
        _1208 = _1198;
    }
    float _1218 = _1208;
    float _1220 = _1218;
    if (!_1206)
    {
        _1210 = _1186;
    }
    float _1222 = _1210;
    float _1224 = _1222;
    if (!_1206)
    {
        _1212 = _1188;
    }
    float _1226 = _1212;
    bool _1228 = !_1206;
    float _1230 = _1226;
    if (!_1228)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1236 = _1204 + _1234;
        float _1238 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = rsqrt(_1202);
        float _1242 = _1236 * _1232;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = _1244 * 6.283185482025146484375;
        float _1248 = sin(_1246);
        float _1250 = _1244 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = fma(_1248, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1256 = _1240 * _1254;
        float _1258 = _1252 + (-1.0);
        float _1260 = fma(_1192, _1256, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1262 = fma(_1196, _1256, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1264 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1268 = _1260 + _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1272 = _1262 + _1270;
        float _1274 = fma(_1188, _1252, _1264);
        float _1276 = _1268 * _1268;
        float _1278 = _1272 * _1272;
        _1230 = _1274;
        _1220 = _1276;
        _1214 = _1278;
        _1216 = _1260;
        _1224 = _1262;
    }
    float _1280 = _1230;
    float _1282 = _1220;
    float _1284 = _1214;
    float _1286 = _1216;
    float _1288 = _1224;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1292 = _1280 + _1290;
    float _1294 = fma(_1292, _1292, _1282);
    float _1296 = _1294 + _1284;
    float _1298 = sqrt(_1296);
    bool _1300 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1302 = isnan(_1298);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1308 = _1304 || _1306;
    float _1310 = _1282;
    if (!_1308)
    {
        _1310 = 1.0;
    }
    float _1312 = _1310;
    bool _1314 = !_1308;
    float _1316 = _1312;
    if (!_1314)
    {
        bool _1318 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1320 = isnan(_1298);
        bool _1322 = _1318 || _1320;
        bool _1324 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1326 = _1322 || _1324;
        if (!_1326)
        {
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1330 = _1298 + _1328;
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1338 = _1336 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1340 = 1.0 / _1334;
            float _1342 = _1330 * _1340;
            float _1344 = fma(_1342, _1338, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1316 = _1344;
            _1346 = true;
        }
        else
        {
            bool _1348 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1350 = isnan(_1298);
            bool _1352 = _1348 || _1350;
            bool _1354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1356 = _1352 || _1354;
            if (!_1356)
            {
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1360 = _1298 + _1358;
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1362 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1370 = 1.0 / _1364;
                float _1372 = _1360 * _1370;
                float _1374 = fma(_1372, _1368, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1316 = _1374;
                _1346 = true;
            }
            else
            {
                _1316 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1346 = false;
    float _1376 = _1316;
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1380 = _1280 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1384 = _1286 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1388 = _1288 + _1386;
    float _1390 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1392 = fma(_1384, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1394 = fma(_1388, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1396 = -_1068;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1400 = -_1070;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1404 = -_1076;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1408 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1418 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1416);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1440);
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1454);
    float _1464 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1456);
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1458);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1460);
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1462);
    float _1472 = _1464 + _1466;
    float _1474 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1472 * 0.5;
    out.m_35.x = _1474;
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1464;
    out.gl_Position.w = _1466;
    out.m_58.z = _1476;
    out.m_58.w = _1466;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1346 = false;
    bool _649 = false;
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_93);
        out.gl_Position.z = _1533;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = 0.0;
    if (_107)
    {
        float _115 = float(_77);
        _113 = _115;
    }
    float _117 = _113;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    if (_123)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _87;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1601 = as_type<float>(_129);
        out.gl_Position.z = _1601;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_39.x;
    float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _135 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _135 * _133;
    float _151 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = in.m_37.x;
    float _155 = in.m_37.y;
    float _157 = in.m_37.z;
    float _159 = _151 * 6.283185482025146484375;
    float _161 = floor(_151);
    int _163 = as_type<int>(_137) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_137) & 2;
    bool _169 = _167 != 0;
    float _171 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = _159 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = 0.0;
    float _181 = _171;
    if (!_147)
    {
        float _183 = _171 * _171;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    bool _189 = !_165;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _173 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_169;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _187;
    if (!_147)
    {
        float _203 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = -_161;
    float _209 = _151 + _207;
    bool _211 = !_147;
    float _213 = _205;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _171 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _171);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_147;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _171 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _181 = _267;
    }
    float _269 = _181;
    float _271 = fma(_195, 0.5, 0.5);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _275 = _273 != 0;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _279 = _277 != 0;
    float _281 = in.m_44.w;
    float _283 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _285 = !_177;
    int _287 = _285 ? 0 : 1;
    float _289 = -_209;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _293 = in.m_32.x;
    float _295 = in.m_32.y;
    float _297 = in.m_32.z;
    bool _299 = _209 < 0.5;
    float _301 = float(_299);
    float _303 = fma(_269, _153, _283);
    bool _305 = !_275;
    int _307 = _305 ? 0 : 1;
    float _309 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _311 = abs(_287);
    float _313 = -_301;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_279;
    int _319 = _317 ? 0 : 1;
    float _321 = -_271;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_307);
    float _327 = fma(_269, _155, _309);
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _331 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _333 = abs(_319);
    float _335 = float(_325);
    float _337 = fma(_269, _157, _331);
    float _339 = float(_311);
    float _341 = float(_333);
    float _343 = abs(_291);
    float _345 = _335 * _343;
    float _347 = fma(_339, _323, _345);
    float _349 = fma(_303, _281, _293);
    float _351 = fma(_327, _281, _295);
    float _353 = fma(_337, _281, _297);
    float _355 = abs(_315);
    float _357 = fma(_341, _355, _347);
    bool _359 = !_329;
    float _375;
    if (!_359)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _363 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _367 = _365 * _361;
        float _369 = floor(_367);
        float _371 = -_369;
        float _373 = _367 + _371;
        _375 = _373;
        _377 = true;
    }
    else
    {
        float _379 = float(_77);
        float _381 = 1.0 / _379;
        float _383 = _111 * _381;
        _375 = _383;
    }
    _377 = false;
    float _385 = _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _403 = 1.0 / _389;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _407 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _409 = 1.0 / _397;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _417 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _385 + _419;
    float _423 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = 1.0 / _393;
    float _427 = _411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _431 = _385 + _429;
    float _433 = _407 * _131;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _437 = _431 * _403;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = _385 + _439;
    float _443 = 1.0 / _401;
    bool _445 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_385);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    out.m_46.x = _417;
    out.m_46.y = _423;
    out.m_46.z = _427;
    out.m_46.w = _415;
    float _457 = _441 * _409;
    bool _459 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _461 = isnan(_385);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_455;
    float _473 = _471 + 1.0;
    float _475 = _421 * _425;
    bool _477 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _479 = isnan(_385);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _491 = _385 + _489;
    float _493 = trunc(_433);
    int _495 = int(_493);
    float _497 = _487 * _473;
    float _499 = -_487;
    float _501 = _499 + 1.0;
    bool _503 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_385);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _491 * _443;
    float _517 = _469 * _501;
    bool _519 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_385);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_469;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = -_513;
    float _549 = _547 + 1.0;
    float _551 = _513 * _533;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = fma(_537, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _559 = fma(_545, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _561 = _529 * _549;
    float _563 = fma(_541, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_555, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = _557 * _561;
    float _569 = -_529;
    float _571 = _569 + 1.0;
    float _573 = _559 * _561;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = in.m_44.x;
    float _581 = in.m_44.y;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _585;
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _591 = fma(_577, _457, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _593 = fma(_563, _551, _583);
    float _595 = fma(_587, _457, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_565, _551, _589);
    float _607 = fma(_595, _517, _593);
    float _609 = fma(_599, _515, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _611 = fma(_603, _515, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = fma(_591, _517, _605);
    float _615 = fma(_609, _497, _607);
    float _617 = fma(_611, _497, _613);
    int _619 = _495 << 4;
    int _621 = _619 + 1968;
    float _623 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[147].x, _615);
    float _625 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[147].y, _617);
    float _627 = _623 * _579;
    float _629 = _625 * _581;
    bool _631 = !_435;
    float _647;
    if (!_631)
    {
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _635 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_77);
        float _653 = 1.0 / _651;
        float _655 = _111 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = in.m_48.x;
    float _661 = in.m_48.y;
    float _663 = in.m_48.z;
    float _665 = in.m_48.w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _657 + _667;
    float _671 = in.m_50.x;
    float _673 = in.m_50.y;
    float _675 = in.m_50.z;
    float _677 = in.m_50.w;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _685 = _683 != 0;
    float _687 = in.m_52.x;
    float _689 = in.m_52.y;
    float _691 = in.m_52.z;
    float _693 = in.m_52.w;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = in.m_39.w;
    bool _705 = _131 > 0.5;
    float _707 = in.m_39.y;
    bool _709 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _711 = isnan(_657);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = in.m_39.z;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _727 = _351 * _661;
    float _729 = 1.0 / _725;
    float _731 = _351 * _673;
    float _733 = fma(_349, _659, _727);
    float _735 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _737 = _351 * _689;
    float _739 = fma(_349, _671, _731);
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _743 = fma(_353, _663, _733);
    bool _745 = _703 > 0.5;
    float _747 = -_741;
    float _749 = fma(_735, 2.0, _747);
    float _751 = fma(_349, _687, _737);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _757 = _707 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _759 = 1.0 / _755;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _763 = _721 > 0.5;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _767 = fma(_757, -2.0, _761);
    bool _769 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _771 = isnan(_657);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _765);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _793 = -_779;
    float _795 = _793 + 1.0;
    float _797 = -_191;
    int _799 = _705 ? as_type<int>(_797) : as_type<int>(_191);
    float _801 = 1.0 / _789;
    bool _803 = _707 > 0.5;
    float _805 = _785 * _759;
    bool _807 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _809 = isnan(_657);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[78].w, _791);
    bool _821 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _823 = isnan(_657);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_353, _691, _751);
    float _835 = fma(_805, _669, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _837 = _817 * _795;
    float _839 = -_817;
    float _841 = _839 + 1.0;
    float _843 = -_831;
    float _845 = _843 + 1.0;
    uint _848 = uint(int(uint(_621) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[int(_858)][_860];
    float _864 = _833 + _693;
    float _866 = _831 * _841;
    float _868 = _719 * _845;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _872 = fma(_353, _675, _739);
    float _874 = -_719;
    float _876 = _874 + 1.0;
    float _878 = _835 * _868;
    int _880 = _621 + 8;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    uint _884 = uint(int(uint(int(_882)) >> uint(2)));
    int _886 = int(_882) & 3;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[int(_884)][_886];
    float _890 = _743 + _665;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _894 = _864 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _898 = _657 + _896;
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _904 = _657 + _902;
    float _906 = _872 + _677;
    float _908 = -_199;
    int _910 = _803 ? as_type<int>(_908) : as_type<int>(_199);
    float _912 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[131].x, _878);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _916 = _890 + _914;
    float _918 = _894 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _924 = !_681;
    float _926 = _924 ? _191 : as_type<float>(_799);
    float _928 = -_111;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _749);
    float _932 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _781);
    bool _934 = !_685;
    float _936 = _934 ? _199 : as_type<float>(_910);
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _940 = _906 + _938;
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _918);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _944;
    float _948 = _922 * _801;
    float _950 = _900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _952 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _767);
    float _954 = _936 + (-0.5);
    float _956 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _958 = _946 * _729;
    float _960 = fma(_948, _898, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _962 = _870 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _964 = _926 + 0.5;
    float _966 = -_950;
    float _968 = -_952;
    float _970 = fma(_966, _954, _968);
    float _972 = fma(_958, _904, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _974 = fma(_960, _866, _912);
    bool _976 = _956 >= 0.0;
    float _978 = fma(_962, _964, _930);
    float _980 = -_199;
    int _982 = _745 ? as_type<int>(_980) : as_type<int>(_199);
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _986 = fma(_972, _837, _974);
    float _988 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _819);
    bool _990 = !_701;
    float _992 = _990 ? _199 : as_type<float>(_982);
    float _994 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[134].x, _986);
    float _996 = _854 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _998 = -_932;
    float _1000 = _998 + 1.0;
    float _1002 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1004 = _894 * _894;
    float _1006 = -_191;
    int _1008 = _763 ? as_type<int>(_1006) : as_type<int>(_191);
    float _1010 = -_992;
    float _1012 = _1010 + 0.5;
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1016 = fma(_916, _916, _1004);
    float _1018 = -_988;
    float _1020 = _1018 + 1.0;
    bool _1022 = !_697;
    float _1024 = _1022 ? _191 : as_type<float>(_1008);
    float _1026 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1028 = fma(_940, _940, _1016);
    float _1030 = fma(_936, _1020, _970);
    float _1032 = -_1000;
    float _1034 = fma(_926, _1032, _978);
    float _1036 = _1026 * _984;
    float _1038 = _1024 + 0.5;
    float _1040 = rsqrt(_1028);
    float _1042 = _970;
    if (_976)
    {
        _1042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1044 = _1042;
    float _1046 = _888 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1050 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1048 * _1014;
    float _1056 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1060 = as_type<int>(_1044);
    if (_976)
    {
        float _1062 = _1044 * 5.0;
        _1060 = as_type<int>(_1062);
    }
    int _1064 = _1060;
    float _1066 = as_type<float>(_1064);
    if (_976)
    {
        out.m_35.x = 0.0;
    }
    out.m_54.x = _1034;
    out.m_54.y = _1030;
    out.m_54.z = _1054;
    out.m_54.w = _1036;
    float _1068 = _894 * _1040;
    float _1070 = _916 * _1040;
    out.m_56.x = _1050;
    out.m_56.y = _1052;
    out.m_56.z = _1056;
    out.m_56.w = _1058;
    if (_976)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3113 = as_type<float>(_1064);
        out.gl_Position.z = _3113;
    }
    if (_976)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1072 = -_1068;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _1076 = _940 * _1040;
    float _1078 = -_1070;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _1082 = -_1068;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _894);
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1088 = _1074 + _1086;
    float _1090 = -_1076;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _906);
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1080 + _1094;
    float _1098 = -_1070;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _916);
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1106 = _1092 + _1104;
    float _1108 = _1084 * _1084;
    float _1110 = -_1076;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _940);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1102);
    float _1116 = fma(_1100, _1100, _1108);
    float _1118 = _357 * _627;
    float _1120 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1114);
    float _1122 = fma(_1112, _1112, _1116);
    bool _1124 = _1120 >= 0.0;
    float _1126 = sqrt(_1122);
    float _1128 = _357 * _629;
    if (_1124)
    {
        _1066 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1130 = _1066;
    int _1132 = as_type<int>(_1130);
    if (_1124)
    {
        out.m_35.x = 0.0;
    }
    float _1134 = _1040 * _1126;
    if (_1124)
    {
        float _1136 = _1130 * 5.0;
        _1132 = as_type<int>(_1136);
    }
    int _1138 = _1132;
    if (_1124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3246 = as_type<float>(_1138);
        out.gl_Position.z = _3246;
    }
    if (_1124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1144 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1148 = _1134 * _1140;
    float _1150 = _1134 * _1144;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1154 = _1152 * 0.5;
    float _1156 = _1142 * _1148;
    float _1158 = _1146 * _1150;
    float _1160 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1166 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1168 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1162);
    float _1170 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1164);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1166);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1168);
    float _1176 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1170);
    float _1178 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1184 = _890 + _1178;
    float _1186 = _906 + _1180;
    float _1188 = _864 + _1182;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1184 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _1192 * _1192;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 + _1200;
    float _1204 = sqrt(_1202);
    bool _1206 = _1204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1208 = _1154;
    float _1210 = _1182;
    float _1212 = _1164;
    float _1214 = _1200;
    float _1216 = _1184;
    if (!_1206)
    {
        _1208 = _1198;
    }
    float _1218 = _1208;
    float _1220 = _1218;
    if (!_1206)
    {
        _1210 = _1186;
    }
    float _1222 = _1210;
    float _1224 = _1222;
    if (!_1206)
    {
        _1212 = _1188;
    }
    float _1226 = _1212;
    bool _1228 = !_1206;
    float _1230 = _1226;
    if (!_1228)
    {
        float _1232 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1236 = _1204 + _1234;
        float _1238 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = rsqrt(_1202);
        float _1242 = _1236 * _1232;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = _1244 * 6.283185482025146484375;
        float _1248 = sin(_1246);
        float _1250 = _1244 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = fma(_1248, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1256 = _1240 * _1254;
        float _1258 = _1252 + (-1.0);
        float _1260 = fma(_1192, _1256, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1262 = fma(_1196, _1256, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1264 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1268 = _1260 + _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1272 = _1262 + _1270;
        float _1274 = fma(_1188, _1252, _1264);
        float _1276 = _1268 * _1268;
        float _1278 = _1272 * _1272;
        _1230 = _1274;
        _1220 = _1276;
        _1214 = _1278;
        _1216 = _1260;
        _1224 = _1262;
    }
    float _1280 = _1230;
    float _1282 = _1220;
    float _1284 = _1214;
    float _1286 = _1216;
    float _1288 = _1224;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1292 = _1280 + _1290;
    float _1294 = fma(_1292, _1292, _1282);
    float _1296 = _1294 + _1284;
    float _1298 = sqrt(_1296);
    bool _1300 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1302 = isnan(_1298);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1308 = _1304 || _1306;
    float _1310 = _1282;
    if (!_1308)
    {
        _1310 = 1.0;
    }
    float _1312 = _1310;
    bool _1314 = !_1308;
    float _1316 = _1312;
    if (!_1314)
    {
        bool _1318 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1320 = isnan(_1298);
        bool _1322 = _1318 || _1320;
        bool _1324 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1326 = _1322 || _1324;
        if (!_1326)
        {
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1330 = _1298 + _1328;
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1338 = _1336 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1340 = 1.0 / _1334;
            float _1342 = _1330 * _1340;
            float _1344 = fma(_1342, _1338, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1316 = _1344;
            _1346 = true;
        }
        else
        {
            bool _1348 = _1298 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1350 = isnan(_1298);
            bool _1352 = _1348 || _1350;
            bool _1354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1356 = _1352 || _1354;
            if (!_1356)
            {
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1360 = _1298 + _1358;
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1362 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1370 = 1.0 / _1364;
                float _1372 = _1360 * _1370;
                float _1374 = fma(_1372, _1368, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1316 = _1374;
                _1346 = true;
            }
            else
            {
                _1316 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1346 = false;
    float _1376 = _1316;
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1380 = _1280 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1384 = _1286 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1388 = _1288 + _1386;
    float _1390 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1392 = fma(_1384, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1394 = fma(_1388, _1376, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1396 = -_1068;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1400 = -_1070;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1404 = -_1076;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1408 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1418 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1416);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1440);
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1454);
    float _1464 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1456);
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1458);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1460);
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1462);
    float _1472 = _1464 + _1466;
    float _1474 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1472 * 0.5;
    out.m_35.x = _1474;
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1464;
    out.gl_Position.w = _1466;
    out.m_58.z = _1476;
    out.m_58.w = _1466;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

