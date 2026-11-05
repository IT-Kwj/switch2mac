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
    float4 m_52 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _515 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1852 = as_type<float>(_93);
        out.gl_Position.z = _1852;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_131);
        out.gl_Position.z = _1922;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_37.w;
    float _135 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_35.x;
    float _149 = in.m_35.y;
    float _151 = in.m_35.z;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = 0.0;
    float _161 = _135;
    if (!_145)
    {
        float _163 = _135 * _135;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_145)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_145;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _135 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _135);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    bool _211 = !_145;
    if (!_211)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _135 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _161 = _231;
    }
    float _233 = _161;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _239 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = fma(_233, _147, _237);
    float _245 = fma(_233, _149, _239);
    float _247 = fma(_233, _151, _241);
    float _249 = fma(_243, _133, _153);
    float _251 = fma(_245, _133, _155);
    float _253 = fma(_247, _133, _157);
    bool _255 = !_235;
    float _273;
    if (!_255)
    {
        float _257 = in.m_39.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_77);
        float _279 = 1.0 / _277;
        float _281 = _111 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _317 = 1.0 / _311;
    float _319 = 1.0 / _307;
    float _321 = _287 * _313;
    bool _323 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_283);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_283);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _349 = isnan(_283);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _303;
    float _361 = _291 * _317;
    bool _363 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_283);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_333;
    float _377 = _375 + 1.0;
    float _379 = _373 * _377;
    float _381 = _295 * _319;
    float _383 = -_373;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _283 + _387;
    bool _391 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_283);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = _345 * _385;
    float _409 = -_345;
    float _411 = _409 + 1.0;
    float _413 = _389 * _359;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = _357 * _411;
    float _421 = -_357;
    float _423 = _421 + 1.0;
    float _425 = fma(_405, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _427;
    float _431 = fma(_417, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _433 = _401 * _423;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_429, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = -_401;
    float _443 = _441 + 1.0;
    float _445 = _431 * _433;
    float _447 = fma(_437, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = _439 * _433;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = fma(_425, _419, _459);
    float _477 = fma(_447, _419, _461);
    float _479 = fma(_469, _413, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_473, _413, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = fma(_463, _407, _475);
    float _485 = fma(_465, _407, _477);
    float _487 = fma(_479, _379, _483);
    float _489 = fma(_481, _379, _485);
    float _491 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_315;
    float _513;
    if (!_495)
    {
        float _497 = in.m_39.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_77);
        float _519 = 1.0 / _517;
        float _521 = _111 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_39.x;
    float _527 = in.m_39.y;
    float _529 = in.m_39.z;
    float _531 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _533 = log2(_531);
    float _535 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = as_type<float>(int(gl_VertexIndex));
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _523 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _555 = 1.0 + _553;
    bool _557 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _559 = isnan(1.0);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _565 = _561 || _563;
    float _567 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _569 = 1.0 / _555;
    float _571 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _573 = _533 * _111;
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = exp2(_573);
    float _589 = _529 * 2.0;
    float _591 = _525 * 2.0;
    float _593 = _527 * 2.0;
    float _595 = _527 + _529;
    float _597 = _529 + _525;
    float _599 = _527 + _525;
    float _601 = _527 + (-0.5);
    float _603 = floor(_589);
    float _605 = _595 + (-1.0);
    float _607 = _599 + (-1.0);
    bool _609 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _611 = isnan(_523);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = floor(_591);
    float _623 = -_587;
    float _625 = _623 + 1.0;
    float _627 = _547 ? _625 : 0.0;
    float _629 = floor(_593);
    bool _631 = _603 > 0.0;
    bool _633 = _603 >= 0.0;
    bool _635 = isnan(_603);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    if (_565)
    {
        float _643 = _627 * _569;
        _113 = _643;
    }
    float _645 = _113;
    float _647 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _651 = _641 ? 0 : 1;
    bool _653 = _621 > 0.0;
    float _655 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    bool _657 = _621 >= 0.0;
    bool _659 = isnan(_621);
    bool _661 = _657 || _659;
    bool _663 = isnan(0.0);
    bool _665 = _661 || _663;
    float _667 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    int _669 = ~_651;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    int _675 = as_type<int>(_537) & 1;
    bool _677 = _675 != 0;
    int _679 = as_type<int>(_537) & 2;
    bool _681 = _679 != 0;
    int _683 = _665 ? 0 : 1;
    bool _685 = _629 > 0.0;
    bool _687 = _629 >= 0.0;
    bool _689 = isnan(_629);
    bool _691 = _687 || _689;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    float _697 = in.m_37.x;
    float _699 = in.m_37.y;
    int _701 = ~_683;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    int _707 = _695 ? 0 : 1;
    int _709 = _673;
    int _711 = _705;
    if (!_631)
    {
        int _713 = ~_651;
        int _715 = _713 + 1;
        _709 = _715;
    }
    int _717 = _709;
    if (!_653)
    {
        int _719 = ~_683;
        int _721 = _719 + 1;
        _711 = _721;
    }
    int _723 = _711;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _731 = _729 != 0;
    int _733 = ~_707;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    int _739 = _737;
    if (!_685)
    {
        int _741 = ~_707;
        int _743 = _741 + 1;
        _739 = _743;
    }
    int _745 = _739;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _757 = _755 != 0;
    float _759 = _491 * _697;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _761;
    float _765 = _493 * _699;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _771 = 1.0 / _763;
    bool _773 = !_677;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _529 + (-0.5);
    bool _779 = _529 > 0.5;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _781;
    bool _785 = !_681;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _525 + (-0.5);
    bool _791 = !_749;
    int _793 = _791 ? 0 : 1;
    float _795 = 1.0 / _769;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _799 = _525 > 0.5;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _803 = _527 > 0.5;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _811 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = 1.0 / _783;
    float _815 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _819 = _523 + _817;
    float _821 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _667);
    float _823 = _597 + (-1.0);
    float _825 = _819 * _771;
    float _827 = 1.0 / _809;
    float _829 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _835 = _523 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _839 = _523 + _837;
    out.m_44.x = _811;
    out.m_44.y = _815;
    out.m_44.z = _829;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _847;
    float _851 = _835 * _795;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _869 = _571 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _871 = _839 * _813;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _877;
    float _881 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _883 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _885 = isnan(_523);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_855, _851, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_859, _851, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_867, _851, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _901;
    float _905 = -_893;
    float _907 = _905 + 1.0;
    float _909 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _911 = fma(_843, _825, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _913 = fma(_849, _825, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _915 = fma(_863, _825, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _917 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _869 + _919;
    bool _923 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _925 = isnan(_523);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = fma(_875, _871, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _937 = fma(_879, _871, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _939 = fma(_903, _871, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _941 = _585 * _907;
    float _943 = -_585;
    float _945 = _943 + 1.0;
    float _947 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _951 = _917 + _949;
    float _953 = _921 * _921;
    float _955 = _551 * _827;
    float _957 = -_933;
    float _959 = _957 + 1.0;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _947 + _961;
    float _965 = fma(_951, _951, _953);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _971 = _893 * _959;
    bool _973 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _975 = isnan(_523);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = fma(_963, _963, _965);
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    int _995 = abs(_793);
    float _997 = _983 * _945;
    float _999 = -_983;
    float _1001 = _999 + 1.0;
    float _1003 = rsqrt(_985);
    float _1005 = fma(_969, _955, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1007 = fma(_989, _955, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1009 = _619 * _1001;
    float _1011 = fma(_993, _955, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    bool _1013 = !_753;
    int _1015 = _1013 ? 0 : 1;
    float _1017 = in.m_46.x;
    float _1019 = in.m_46.y;
    float _1021 = in.m_46.z;
    float _1023 = _913 * _1009;
    float _1025 = _915 * _1009;
    float _1027 = -_619;
    float _1029 = _1027 + 1.0;
    int _1031 = abs(_1015);
    float _1033 = _911 * _1009;
    float _1035 = float(_717);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1023);
    float _1039 = float(_995);
    float _1041 = _921 * _1003;
    float _1043 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1033);
    float _1045 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1025);
    float _1047 = -_1041;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1051 = _1039 * _1035;
    float _1053 = _951 * _1003;
    float _1055 = float(_1031);
    float _1057 = _1049 * _1049;
    float _1059 = _1051 * (-2.0);
    bool _1061 = !_757;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = -_1053;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1069 = float(_723);
    float _1071 = fma(_909, _1059, _909);
    float _1073 = fma(_1059, _1017, _1017);
    float _1075 = float(_745);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1079 = _1055 * _1069;
    float _1081 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1073);
    int _1083 = abs(_1063);
    float _1085 = _963 * _1003;
    float _1087 = _1079 * (-2.0);
    float _1089 = fma(_1071, _645, _1081);
    float _1091 = float(_1083);
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1095 = fma(_1087, _1019, _1019);
    float _1097 = fma(_845, _1087, _845);
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1101 = _1099 != 0;
    float _1103 = _1091 * _1075;
    float _1105 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1095);
    float _1107 = -_787;
    int _1109 = _803 ? as_type<int>(_1107) : as_type<int>(_787);
    float _1111 = fma(_895, _997, _1043);
    float _1113 = _1103 * (-2.0);
    float _1115 = fma(_1097, _645, _1105);
    float _1117 = -_775;
    int _1119 = _799 ? as_type<int>(_1117) : as_type<int>(_775);
    float _1121 = fma(_897, _997, _1037);
    float _1123 = fma(_1113, _1021, _1021);
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1127 = _1125 != 0;
    float _1129 = fma(_881, _1113, _881);
    bool _1131 = !_1101;
    float _1133 = _1131 ? _775 : as_type<float>(_1119);
    float _1135 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1123);
    bool _1137 = !_1127;
    float _1139 = _1137 ? _787 : as_type<float>(_1109);
    float _1141 = fma(_899, _997, _1045);
    float _1143 = fma(_1067, _1067, _1057);
    float _1145 = -_1085;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1149 = _1089 * 0.15915493667125701904296875;
    float _1151 = _1115 * 0.15915493667125701904296875;
    float _1153 = fma(_1129, _645, _1135);
    float _1155 = _1133 + 0.5;
    float _1157 = fma(_935, _941, _1111);
    float _1159 = fma(_937, _941, _1121);
    float _1161 = fma(_939, _941, _1141);
    float _1163 = fma(_1147, _1147, _1143);
    float _1165 = _1149 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = -_1139;
    float _1171 = _1169 + 0.5;
    float _1173 = _1153 * 0.15915493667125701904296875;
    float _1175 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1177 = fma(_1005, _971, _1157);
    float _1179 = fma(_1007, _971, _1159);
    float _1181 = fma(_1011, _971, _1161);
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1185 = _1149 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = -_1041;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _869);
    float _1193 = _1175 * _1077;
    float _1195 = _1183 * _1093;
    float _1197 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1177);
    float _1199 = -_1053;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1205 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1207 = _1151 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    out.m_48.x = _1193;
    out.m_48.y = _1195;
    float _1211 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1179);
    float _1213 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1181);
    float _1215 = -_1085;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    float _1219 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1221 = _1151 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    bool _1225 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1227 = isnan(0.5);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1233 = _1229 || _1231;
    float _1235 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1203);
    bool _1237 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1239 = isnan(0.5);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1245 = _1241 || _1243;
    float _1247 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1235);
    float _1249 = sqrt(_1163);
    float _1251 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1205);
    float _1253 = _1167 * _1209;
    float _1255 = _1187 * _1209;
    float _1257 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    float _1259 = _1135;
    float _1261 = _1181;
    float _1263 = _775;
    if (!_1233)
    {
        _1259 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1265 = _1259;
    float _1267 = _1173 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1187 * _1223;
    float _1273 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1275 = _1167 * _1223;
    float _1277 = _1265;
    if (!_1233)
    {
        float _1279 = -_1265;
        float _1281 = _1279 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1261 = _1281;
    }
    float _1283 = _1261;
    float _1285 = _1173 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = _1003 * _1249;
    float _1291 = _1219 * _1289;
    float _1293 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    float _1297 = 1.0 / _1273;
    float _1299 = fma(_1269, _1271, _1253);
    float _1301 = fma(_1269, _1253, _1271);
    float _1303 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1307 = _1223 * _1287;
    float _1309 = _1167 * _1287;
    float _1311 = _1187 * _1287;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _1315 = _1209 * _1287;
    float _1317 = _1303 + _1273;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _1321 = _1305 * _1289;
    float _1323 = _1291 * _1313;
    float _1325 = -_1255;
    float _1327 = fma(_1269, _1275, _1325);
    float _1329 = -_1275;
    float _1331 = fma(_1269, _1255, _1329);
    float _1333 = _1321 * _1319;
    float _1335 = _1311 * _1323;
    float _1337 = -_1323;
    float _1339 = _1269 * _1337;
    float _1341 = _1309 * _1323;
    float _1343 = _1317 * _1297;
    float _1345 = _1343 * 0.5;
    float _1347 = fma(_1299, _1333, _1335);
    float _1349 = fma(_1307, _1333, _1339);
    float _1351 = fma(_1327, _1333, _1341);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1355 = fma(_1331, _1295, _1347);
    float _1357 = fma(_1315, _1295, _1349);
    float _1359 = fma(_1301, _1295, _1351);
    float _1361 = -_787;
    int _1363 = _779 ? as_type<int>(_1361) : as_type<int>(_787);
    float _1365 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    bool _1373 = !_731;
    float _1375 = _1373 ? _787 : as_type<float>(_1363);
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1365);
    float _1379 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1367);
    float _1381 = -_775;
    int _1383 = _803 ? as_type<int>(_1381) : as_type<int>(_775);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1387 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1377);
    float _1389 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1379);
    float _1391 = -_1375;
    float _1393 = _1391 + 0.5;
    bool _1395 = !_727;
    float _1397 = _1395 ? _775 : as_type<float>(_1383);
    float _1399 = _947 + _1387;
    float _1401 = _917 + _1389;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1409 = _1399 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1413 = _1401 + _1411;
    float _1415 = _1403 * _1353;
    float _1417 = _1353;
    float _1419 = _1401;
    float _1421 = _1399;
    if (!_1233)
    {
        _1417 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1423 = _1417;
    float _1425 = _1409 * _1409;
    float _1427 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1429 = _787 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1431 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1433 = fma(_1413, _1413, _1425);
    float _1435 = _1213 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1437 = -_1429;
    float _1439 = _1269 * _1437;
    float _1441 = _1423;
    if (!_1233)
    {
        float _1443 = -_1423;
        float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1263 = _1445;
    }
    float _1447 = _1263;
    float _1449 = sqrt(_1433);
    float _1451 = _1397 + 0.5;
    float _1453 = fma(_1307, _1431, _1439);
    float _1455 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1457 = _1309 * _1429;
    float _1459 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1461 = _1311 * _1429;
    float _1463 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1455);
    float _1465 = 1.0 / _1371;
    float _1467 = _1459 * _1385;
    float _1469 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1471 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    float _1473 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1467;
    out.m_50.y = _1415;
    float _1479 = _1283;
    float _1481 = _1473;
    if (!_1233)
    {
        float _1483 = 1.0 / _1283;
        _1479 = _1483;
    }
    float _1485 = _1479;
    bool _1487 = _1449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = fma(_1327, _1431, _1457);
    float _1491 = fma(_1299, _1431, _1461);
    out.m_52.x = _1473;
    out.m_52.y = _1477;
    out.m_52.z = _1475;
    out.m_52.w = _1405;
    float _1493 = _1315 + _1453;
    float _1495 = _1301 + _1489;
    float _1497 = _1331 + _1491;
    float _1499 = _1447;
    float _1501 = _1489;
    if (!_1233)
    {
        float _1503 = 1.0 / _1447;
        _1499 = _1503;
    }
    float _1505 = _1499;
    float _1507 = _869 + _1471;
    float _1509 = _1507;
    if (!_1233)
    {
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1513 = -_1265;
        float _1515 = fma(_1465, _1511, _1513);
        _1277 = _1515;
    }
    float _1517 = _1277;
    if (!_1233)
    {
        float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1521 = -_1423;
        float _1523 = fma(_1465, _1519, _1521);
        _1441 = _1523;
    }
    float _1525 = _1441;
    float _1527 = _1525;
    if (!_1487)
    {
        _1501 = _1507;
    }
    float _1529 = _1501;
    float _1531 = _1529;
    if (_1233)
    {
        _1481 = 1.0;
    }
    float _1533 = _1481;
    float _1535 = _1533;
    if (!_1233)
    {
        float _1537 = _1517 * _1485;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        _1535 = _1539;
    }
    float _1541 = _1535;
    if (!_1233)
    {
        float _1543 = _1525 * _1505;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        _1527 = _1545;
    }
    float _1547 = _1527;
    bool _1549 = !_1487;
    if (!_1549)
    {
        float _1551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1555 = _1449 + _1553;
        float _1557 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = rsqrt(_1433);
        float _1561 = _1555 * _1551;
        float _1563 = _1561 * 0.15915493667125701904296875;
        float _1565 = _1563 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = _1563 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1571, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1577 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = _1559 * _1575;
        float _1581 = fma(_1507, _1567, _1577);
        float _1583 = fma(_1413, _1579, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1585 = fma(_1409, _1579, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1419 = _1583;
        _1531 = _1581;
        _1421 = _1585;
    }
    float _1587 = _1419;
    float _1589 = _1531;
    float _1591 = _1421;
    float _1593 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1595 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1597 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1233)
    {
        _1509 = 1.0;
    }
    float _1599 = _1509;
    float _1601 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1593);
    float _1603 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1595);
    float _1605 = -_1053;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1587);
    float _1609 = -_1041;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _1613 = -_1085;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1591);
    float _1617 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1597);
    float _1619 = _1599;
    float _1621 = _1611;
    float _1623 = _1607;
    float _1625 = _1615;
    if (!_1233)
    {
        float _1627 = -_1547;
        float _1629 = _1627 + 1.0;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (!_1245)
    {
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1635 = _1191 + _1633;
        float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1639 = _1201 + _1637;
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = -_917;
        float _1645 = _1643 + _1587;
        float _1647 = _1635 * _1635;
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1651 = _1217 + _1649;
        float _1653 = -_869;
        float _1655 = _1653 + _1589;
        float _1657 = fma(_1639, _1639, _1647);
        float _1659 = 1.0 / _1289;
        float _1661 = fma(_1651, _1651, _1657);
        float _1663 = -_947;
        float _1665 = _1663 + _1591;
        float _1667 = sqrt(_1661);
        float _1669 = precise::min(_1667, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1671 = _1669 * _1641;
        float _1673 = _1671 * _1659;
        float _1675 = fma(_1645, _1673, _1201);
        float _1677 = fma(_1655, _1673, _1191);
        float _1679 = fma(_1665, _1673, _1217);
        _1621 = _1677;
        _1623 = _1675;
        _1625 = _1679;
    }
    float _1681 = _1621;
    float _1683 = _1623;
    float _1685 = _1625;
    float _1687 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1691 = _1541 > 0.0;
    bool _1693 = isnan(_1541);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.0);
    bool _1699 = _1695 || _1697;
    float _1701 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1703 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1687);
    float _1705 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1689);
    float _1707 = _1541 * _1631;
    bool _1709 = _1631 <= 0.0;
    bool _1711 = !_1699;
    bool _1713 = _1709 || _1711;
    float _1715 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1703);
    float _1717 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1701);
    float _1719 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1721 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1705);
    float _1723 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1725 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1717);
    float _1727 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1719);
    float _1729 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1731 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1733 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1735 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1731);
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1733);
    float _1743 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1727);
    float _1745 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1747 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1735);
    float _1749 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1739);
    float _1751 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1741);
    float _1753 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1755 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1745);
    float _1757 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1759 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1601);
    float _1761 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1749);
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1751);
    float _1765 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1755);
    float _1767 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1617);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1757);
    float _1771 = _1707 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1773 = _1761 + _1763;
    float _1775 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1681 + _1777;
    float _1781 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1603);
    float _1783 = _1771 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1787 = _1683 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1791 = _1685 + _1789;
    float _1793 = _1773 * 0.5;
    out.m_54.x = _1759;
    out.m_54.y = _1781;
    out.m_54.z = _1767;
    out.m_33.x = _1783;
    out.m_56.x = _1787;
    out.m_56.y = _1779;
    out.m_56.z = _1791;
    out.gl_Position.x = _1769;
    out.gl_Position.y = _1775;
    out.gl_Position.z = _1761;
    out.gl_Position.w = _1763;
    out.m_58.z = _1793;
    out.m_58.w = _1763;
    if (!_1713)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1795;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _515 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1852 = as_type<float>(_93);
        out.gl_Position.z = _1852;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_131);
        out.gl_Position.z = _1922;
    }
    if (_123)
    {
        return out;
    }
    float _133 = in.m_37.w;
    float _135 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_35.x;
    float _149 = in.m_35.y;
    float _151 = in.m_35.z;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = 0.0;
    float _161 = _135;
    if (!_145)
    {
        float _163 = _135 * _135;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_145)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_145;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _135 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _135);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    bool _211 = !_145;
    if (!_211)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _135 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _161 = _231;
    }
    float _233 = _161;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _239 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = fma(_233, _147, _237);
    float _245 = fma(_233, _149, _239);
    float _247 = fma(_233, _151, _241);
    float _249 = fma(_243, _133, _153);
    float _251 = fma(_245, _133, _155);
    float _253 = fma(_247, _133, _157);
    bool _255 = !_235;
    float _273;
    if (!_255)
    {
        float _257 = in.m_39.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_77);
        float _279 = 1.0 / _277;
        float _281 = _111 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _317 = 1.0 / _311;
    float _319 = 1.0 / _307;
    float _321 = _287 * _313;
    bool _323 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_283);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_283);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _349 = isnan(_283);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _303;
    float _361 = _291 * _317;
    bool _363 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_283);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_333;
    float _377 = _375 + 1.0;
    float _379 = _373 * _377;
    float _381 = _295 * _319;
    float _383 = -_373;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _283 + _387;
    bool _391 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_283);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = _345 * _385;
    float _409 = -_345;
    float _411 = _409 + 1.0;
    float _413 = _389 * _359;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = _357 * _411;
    float _421 = -_357;
    float _423 = _421 + 1.0;
    float _425 = fma(_405, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _427;
    float _431 = fma(_417, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _433 = _401 * _423;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_429, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = -_401;
    float _443 = _441 + 1.0;
    float _445 = _431 * _433;
    float _447 = fma(_437, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = _439 * _433;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = fma(_425, _419, _459);
    float _477 = fma(_447, _419, _461);
    float _479 = fma(_469, _413, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_473, _413, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = fma(_463, _407, _475);
    float _485 = fma(_465, _407, _477);
    float _487 = fma(_479, _379, _483);
    float _489 = fma(_481, _379, _485);
    float _491 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_315;
    float _513;
    if (!_495)
    {
        float _497 = in.m_39.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_77);
        float _519 = 1.0 / _517;
        float _521 = _111 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_39.x;
    float _527 = in.m_39.y;
    float _529 = in.m_39.z;
    float _531 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _533 = log2(_531);
    float _535 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = as_type<float>(int(gl_VertexIndex));
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _523 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _555 = 1.0 + _553;
    bool _557 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _559 = isnan(1.0);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _565 = _561 || _563;
    float _567 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _569 = 1.0 / _555;
    float _571 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _573 = _533 * _111;
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = exp2(_573);
    float _589 = _529 * 2.0;
    float _591 = _525 * 2.0;
    float _593 = _527 * 2.0;
    float _595 = _527 + _529;
    float _597 = _529 + _525;
    float _599 = _527 + _525;
    float _601 = _527 + (-0.5);
    float _603 = floor(_589);
    float _605 = _595 + (-1.0);
    float _607 = _599 + (-1.0);
    bool _609 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _611 = isnan(_523);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = floor(_591);
    float _623 = -_587;
    float _625 = _623 + 1.0;
    float _627 = _547 ? _625 : 0.0;
    float _629 = floor(_593);
    bool _631 = _603 > 0.0;
    bool _633 = _603 >= 0.0;
    bool _635 = isnan(_603);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    if (_565)
    {
        float _643 = _627 * _569;
        _113 = _643;
    }
    float _645 = _113;
    float _647 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _651 = _641 ? 0 : 1;
    bool _653 = _621 > 0.0;
    float _655 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    bool _657 = _621 >= 0.0;
    bool _659 = isnan(_621);
    bool _661 = _657 || _659;
    bool _663 = isnan(0.0);
    bool _665 = _661 || _663;
    float _667 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    int _669 = ~_651;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    int _675 = as_type<int>(_537) & 1;
    bool _677 = _675 != 0;
    int _679 = as_type<int>(_537) & 2;
    bool _681 = _679 != 0;
    int _683 = _665 ? 0 : 1;
    bool _685 = _629 > 0.0;
    bool _687 = _629 >= 0.0;
    bool _689 = isnan(_629);
    bool _691 = _687 || _689;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    float _697 = in.m_37.x;
    float _699 = in.m_37.y;
    int _701 = ~_683;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    int _707 = _695 ? 0 : 1;
    int _709 = _673;
    int _711 = _705;
    if (!_631)
    {
        int _713 = ~_651;
        int _715 = _713 + 1;
        _709 = _715;
    }
    int _717 = _709;
    if (!_653)
    {
        int _719 = ~_683;
        int _721 = _719 + 1;
        _711 = _721;
    }
    int _723 = _711;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _731 = _729 != 0;
    int _733 = ~_707;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    int _739 = _737;
    if (!_685)
    {
        int _741 = ~_707;
        int _743 = _741 + 1;
        _739 = _743;
    }
    int _745 = _739;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _757 = _755 != 0;
    float _759 = _491 * _697;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _761;
    float _765 = _493 * _699;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _771 = 1.0 / _763;
    bool _773 = !_677;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _529 + (-0.5);
    bool _779 = _529 > 0.5;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _781;
    bool _785 = !_681;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _525 + (-0.5);
    bool _791 = !_749;
    int _793 = _791 ? 0 : 1;
    float _795 = 1.0 / _769;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _799 = _525 > 0.5;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _803 = _527 > 0.5;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _811 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = 1.0 / _783;
    float _815 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _819 = _523 + _817;
    float _821 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _667);
    float _823 = _597 + (-1.0);
    float _825 = _819 * _771;
    float _827 = 1.0 / _809;
    float _829 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _835 = _523 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _839 = _523 + _837;
    out.m_44.x = _811;
    out.m_44.y = _815;
    out.m_44.z = _829;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _847;
    float _851 = _835 * _795;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _869 = _571 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _871 = _839 * _813;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _877;
    float _881 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _883 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _885 = isnan(_523);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_855, _851, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_859, _851, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_867, _851, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _901;
    float _905 = -_893;
    float _907 = _905 + 1.0;
    float _909 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _911 = fma(_843, _825, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _913 = fma(_849, _825, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _915 = fma(_863, _825, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _917 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _869 + _919;
    bool _923 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _925 = isnan(_523);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = fma(_875, _871, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _937 = fma(_879, _871, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _939 = fma(_903, _871, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _941 = _585 * _907;
    float _943 = -_585;
    float _945 = _943 + 1.0;
    float _947 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _951 = _917 + _949;
    float _953 = _921 * _921;
    float _955 = _551 * _827;
    float _957 = -_933;
    float _959 = _957 + 1.0;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _947 + _961;
    float _965 = fma(_951, _951, _953);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _971 = _893 * _959;
    bool _973 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _975 = isnan(_523);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = fma(_963, _963, _965);
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    int _995 = abs(_793);
    float _997 = _983 * _945;
    float _999 = -_983;
    float _1001 = _999 + 1.0;
    float _1003 = rsqrt(_985);
    float _1005 = fma(_969, _955, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1007 = fma(_989, _955, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1009 = _619 * _1001;
    float _1011 = fma(_993, _955, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    bool _1013 = !_753;
    int _1015 = _1013 ? 0 : 1;
    float _1017 = in.m_46.x;
    float _1019 = in.m_46.y;
    float _1021 = in.m_46.z;
    float _1023 = _913 * _1009;
    float _1025 = _915 * _1009;
    float _1027 = -_619;
    float _1029 = _1027 + 1.0;
    int _1031 = abs(_1015);
    float _1033 = _911 * _1009;
    float _1035 = float(_717);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1023);
    float _1039 = float(_995);
    float _1041 = _921 * _1003;
    float _1043 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1033);
    float _1045 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1025);
    float _1047 = -_1041;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1051 = _1039 * _1035;
    float _1053 = _951 * _1003;
    float _1055 = float(_1031);
    float _1057 = _1049 * _1049;
    float _1059 = _1051 * (-2.0);
    bool _1061 = !_757;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = -_1053;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1069 = float(_723);
    float _1071 = fma(_909, _1059, _909);
    float _1073 = fma(_1059, _1017, _1017);
    float _1075 = float(_745);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1079 = _1055 * _1069;
    float _1081 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1073);
    int _1083 = abs(_1063);
    float _1085 = _963 * _1003;
    float _1087 = _1079 * (-2.0);
    float _1089 = fma(_1071, _645, _1081);
    float _1091 = float(_1083);
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1095 = fma(_1087, _1019, _1019);
    float _1097 = fma(_845, _1087, _845);
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1101 = _1099 != 0;
    float _1103 = _1091 * _1075;
    float _1105 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1095);
    float _1107 = -_787;
    int _1109 = _803 ? as_type<int>(_1107) : as_type<int>(_787);
    float _1111 = fma(_895, _997, _1043);
    float _1113 = _1103 * (-2.0);
    float _1115 = fma(_1097, _645, _1105);
    float _1117 = -_775;
    int _1119 = _799 ? as_type<int>(_1117) : as_type<int>(_775);
    float _1121 = fma(_897, _997, _1037);
    float _1123 = fma(_1113, _1021, _1021);
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1127 = _1125 != 0;
    float _1129 = fma(_881, _1113, _881);
    bool _1131 = !_1101;
    float _1133 = _1131 ? _775 : as_type<float>(_1119);
    float _1135 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1123);
    bool _1137 = !_1127;
    float _1139 = _1137 ? _787 : as_type<float>(_1109);
    float _1141 = fma(_899, _997, _1045);
    float _1143 = fma(_1067, _1067, _1057);
    float _1145 = -_1085;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1149 = _1089 * 0.15915493667125701904296875;
    float _1151 = _1115 * 0.15915493667125701904296875;
    float _1153 = fma(_1129, _645, _1135);
    float _1155 = _1133 + 0.5;
    float _1157 = fma(_935, _941, _1111);
    float _1159 = fma(_937, _941, _1121);
    float _1161 = fma(_939, _941, _1141);
    float _1163 = fma(_1147, _1147, _1143);
    float _1165 = _1149 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = -_1139;
    float _1171 = _1169 + 0.5;
    float _1173 = _1153 * 0.15915493667125701904296875;
    float _1175 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1177 = fma(_1005, _971, _1157);
    float _1179 = fma(_1007, _971, _1159);
    float _1181 = fma(_1011, _971, _1161);
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1185 = _1149 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = -_1041;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _869);
    float _1193 = _1175 * _1077;
    float _1195 = _1183 * _1093;
    float _1197 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1177);
    float _1199 = -_1053;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1205 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1207 = _1151 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    out.m_48.x = _1193;
    out.m_48.y = _1195;
    float _1211 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1179);
    float _1213 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1181);
    float _1215 = -_1085;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    float _1219 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1221 = _1151 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    bool _1225 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1227 = isnan(0.5);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1233 = _1229 || _1231;
    float _1235 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1203);
    bool _1237 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1239 = isnan(0.5);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1245 = _1241 || _1243;
    float _1247 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1235);
    float _1249 = sqrt(_1163);
    float _1251 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1205);
    float _1253 = _1167 * _1209;
    float _1255 = _1187 * _1209;
    float _1257 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    float _1259 = _1135;
    float _1261 = _1181;
    float _1263 = _775;
    if (!_1233)
    {
        _1259 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1265 = _1259;
    float _1267 = _1173 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1187 * _1223;
    float _1273 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1275 = _1167 * _1223;
    float _1277 = _1265;
    if (!_1233)
    {
        float _1279 = -_1265;
        float _1281 = _1279 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1261 = _1281;
    }
    float _1283 = _1261;
    float _1285 = _1173 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = _1003 * _1249;
    float _1291 = _1219 * _1289;
    float _1293 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    float _1297 = 1.0 / _1273;
    float _1299 = fma(_1269, _1271, _1253);
    float _1301 = fma(_1269, _1253, _1271);
    float _1303 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1307 = _1223 * _1287;
    float _1309 = _1167 * _1287;
    float _1311 = _1187 * _1287;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _1315 = _1209 * _1287;
    float _1317 = _1303 + _1273;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _1321 = _1305 * _1289;
    float _1323 = _1291 * _1313;
    float _1325 = -_1255;
    float _1327 = fma(_1269, _1275, _1325);
    float _1329 = -_1275;
    float _1331 = fma(_1269, _1255, _1329);
    float _1333 = _1321 * _1319;
    float _1335 = _1311 * _1323;
    float _1337 = -_1323;
    float _1339 = _1269 * _1337;
    float _1341 = _1309 * _1323;
    float _1343 = _1317 * _1297;
    float _1345 = _1343 * 0.5;
    float _1347 = fma(_1299, _1333, _1335);
    float _1349 = fma(_1307, _1333, _1339);
    float _1351 = fma(_1327, _1333, _1341);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1355 = fma(_1331, _1295, _1347);
    float _1357 = fma(_1315, _1295, _1349);
    float _1359 = fma(_1301, _1295, _1351);
    float _1361 = -_787;
    int _1363 = _779 ? as_type<int>(_1361) : as_type<int>(_787);
    float _1365 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    bool _1373 = !_731;
    float _1375 = _1373 ? _787 : as_type<float>(_1363);
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1365);
    float _1379 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1367);
    float _1381 = -_775;
    int _1383 = _803 ? as_type<int>(_1381) : as_type<int>(_775);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1387 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1377);
    float _1389 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1379);
    float _1391 = -_1375;
    float _1393 = _1391 + 0.5;
    bool _1395 = !_727;
    float _1397 = _1395 ? _775 : as_type<float>(_1383);
    float _1399 = _947 + _1387;
    float _1401 = _917 + _1389;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1409 = _1399 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1413 = _1401 + _1411;
    float _1415 = _1403 * _1353;
    float _1417 = _1353;
    float _1419 = _1401;
    float _1421 = _1399;
    if (!_1233)
    {
        _1417 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1423 = _1417;
    float _1425 = _1409 * _1409;
    float _1427 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1429 = _787 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1431 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1433 = fma(_1413, _1413, _1425);
    float _1435 = _1213 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1437 = -_1429;
    float _1439 = _1269 * _1437;
    float _1441 = _1423;
    if (!_1233)
    {
        float _1443 = -_1423;
        float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1263 = _1445;
    }
    float _1447 = _1263;
    float _1449 = sqrt(_1433);
    float _1451 = _1397 + 0.5;
    float _1453 = fma(_1307, _1431, _1439);
    float _1455 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1457 = _1309 * _1429;
    float _1459 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1461 = _1311 * _1429;
    float _1463 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1455);
    float _1465 = 1.0 / _1371;
    float _1467 = _1459 * _1385;
    float _1469 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1471 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    float _1473 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1467;
    out.m_50.y = _1415;
    float _1479 = _1283;
    float _1481 = _1473;
    if (!_1233)
    {
        float _1483 = 1.0 / _1283;
        _1479 = _1483;
    }
    float _1485 = _1479;
    bool _1487 = _1449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = fma(_1327, _1431, _1457);
    float _1491 = fma(_1299, _1431, _1461);
    out.m_52.x = _1473;
    out.m_52.y = _1477;
    out.m_52.z = _1475;
    out.m_52.w = _1405;
    float _1493 = _1315 + _1453;
    float _1495 = _1301 + _1489;
    float _1497 = _1331 + _1491;
    float _1499 = _1447;
    float _1501 = _1489;
    if (!_1233)
    {
        float _1503 = 1.0 / _1447;
        _1499 = _1503;
    }
    float _1505 = _1499;
    float _1507 = _869 + _1471;
    float _1509 = _1507;
    if (!_1233)
    {
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1513 = -_1265;
        float _1515 = fma(_1465, _1511, _1513);
        _1277 = _1515;
    }
    float _1517 = _1277;
    if (!_1233)
    {
        float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1521 = -_1423;
        float _1523 = fma(_1465, _1519, _1521);
        _1441 = _1523;
    }
    float _1525 = _1441;
    float _1527 = _1525;
    if (!_1487)
    {
        _1501 = _1507;
    }
    float _1529 = _1501;
    float _1531 = _1529;
    if (_1233)
    {
        _1481 = 1.0;
    }
    float _1533 = _1481;
    float _1535 = _1533;
    if (!_1233)
    {
        float _1537 = _1517 * _1485;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        _1535 = _1539;
    }
    float _1541 = _1535;
    if (!_1233)
    {
        float _1543 = _1525 * _1505;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        _1527 = _1545;
    }
    float _1547 = _1527;
    bool _1549 = !_1487;
    if (!_1549)
    {
        float _1551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1555 = _1449 + _1553;
        float _1557 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = rsqrt(_1433);
        float _1561 = _1555 * _1551;
        float _1563 = _1561 * 0.15915493667125701904296875;
        float _1565 = _1563 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = _1563 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1571, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1577 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = _1559 * _1575;
        float _1581 = fma(_1507, _1567, _1577);
        float _1583 = fma(_1413, _1579, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1585 = fma(_1409, _1579, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1419 = _1583;
        _1531 = _1581;
        _1421 = _1585;
    }
    float _1587 = _1419;
    float _1589 = _1531;
    float _1591 = _1421;
    float _1593 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1595 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1597 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1233)
    {
        _1509 = 1.0;
    }
    float _1599 = _1509;
    float _1601 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1593);
    float _1603 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1595);
    float _1605 = -_1053;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1587);
    float _1609 = -_1041;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _1613 = -_1085;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1591);
    float _1617 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1597);
    float _1619 = _1599;
    float _1621 = _1611;
    float _1623 = _1607;
    float _1625 = _1615;
    if (!_1233)
    {
        float _1627 = -_1547;
        float _1629 = _1627 + 1.0;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (!_1245)
    {
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1635 = _1191 + _1633;
        float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1639 = _1201 + _1637;
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = -_917;
        float _1645 = _1643 + _1587;
        float _1647 = _1635 * _1635;
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1651 = _1217 + _1649;
        float _1653 = -_869;
        float _1655 = _1653 + _1589;
        float _1657 = fma(_1639, _1639, _1647);
        float _1659 = 1.0 / _1289;
        float _1661 = fma(_1651, _1651, _1657);
        float _1663 = -_947;
        float _1665 = _1663 + _1591;
        float _1667 = sqrt(_1661);
        float _1669 = precise::min(_1667, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1671 = _1669 * _1641;
        float _1673 = _1671 * _1659;
        float _1675 = fma(_1645, _1673, _1201);
        float _1677 = fma(_1655, _1673, _1191);
        float _1679 = fma(_1665, _1673, _1217);
        _1621 = _1677;
        _1623 = _1675;
        _1625 = _1679;
    }
    float _1681 = _1621;
    float _1683 = _1623;
    float _1685 = _1625;
    float _1687 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1691 = _1541 > 0.0;
    bool _1693 = isnan(_1541);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.0);
    bool _1699 = _1695 || _1697;
    float _1701 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1703 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1687);
    float _1705 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1689);
    float _1707 = _1541 * _1631;
    bool _1709 = _1631 <= 0.0;
    bool _1711 = !_1699;
    bool _1713 = _1709 || _1711;
    float _1715 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1703);
    float _1717 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1701);
    float _1719 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1721 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1705);
    float _1723 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1725 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1717);
    float _1727 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1719);
    float _1729 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1731 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1733 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1735 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1731);
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1733);
    float _1743 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1727);
    float _1745 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1747 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1735);
    float _1749 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1739);
    float _1751 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1741);
    float _1753 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1755 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1745);
    float _1757 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1759 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1601);
    float _1761 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1749);
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1751);
    float _1765 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1755);
    float _1767 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1617);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1757);
    float _1771 = _1707 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1773 = _1761 + _1763;
    float _1775 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1681 + _1777;
    float _1781 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1603);
    float _1783 = _1771 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1787 = _1683 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1791 = _1685 + _1789;
    float _1793 = _1773 * 0.5;
    out.m_54.x = _1759;
    out.m_54.y = _1781;
    out.m_54.z = _1767;
    out.m_33.x = _1783;
    out.m_56.x = _1787;
    out.m_56.y = _1779;
    out.m_56.z = _1791;
    out.gl_Position.x = _1769;
    out.gl_Position.y = _1775;
    out.gl_Position.z = _1761;
    out.gl_Position.w = _1763;
    out.m_58.z = _1793;
    out.m_58.w = _1763;
    if (!_1713)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1795;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _515 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1852 = as_type<float>(_93);
        out.gl_Position.z = _1852;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_131);
        out.gl_Position.z = _1922;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_37.w;
    float _135 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_35.x;
    float _149 = in.m_35.y;
    float _151 = in.m_35.z;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = 0.0;
    float _161 = _135;
    if (!_145)
    {
        float _163 = _135 * _135;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_145)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_145;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _135 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _135);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    bool _211 = !_145;
    if (!_211)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _135 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _161 = _231;
    }
    float _233 = _161;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _239 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = fma(_233, _147, _237);
    float _245 = fma(_233, _149, _239);
    float _247 = fma(_233, _151, _241);
    float _249 = fma(_243, _133, _153);
    float _251 = fma(_245, _133, _155);
    float _253 = fma(_247, _133, _157);
    bool _255 = !_235;
    float _273;
    if (!_255)
    {
        float _257 = in.m_39.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_77);
        float _279 = 1.0 / _277;
        float _281 = _111 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _317 = 1.0 / _311;
    float _319 = 1.0 / _307;
    float _321 = _287 * _313;
    bool _323 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_283);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_283);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _349 = isnan(_283);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _303;
    float _361 = _291 * _317;
    bool _363 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_283);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_333;
    float _377 = _375 + 1.0;
    float _379 = _373 * _377;
    float _381 = _295 * _319;
    float _383 = -_373;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _283 + _387;
    bool _391 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_283);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = _345 * _385;
    float _409 = -_345;
    float _411 = _409 + 1.0;
    float _413 = _389 * _359;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = _357 * _411;
    float _421 = -_357;
    float _423 = _421 + 1.0;
    float _425 = fma(_405, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _427;
    float _431 = fma(_417, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _433 = _401 * _423;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_429, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = -_401;
    float _443 = _441 + 1.0;
    float _445 = _431 * _433;
    float _447 = fma(_437, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = _439 * _433;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = fma(_425, _419, _459);
    float _477 = fma(_447, _419, _461);
    float _479 = fma(_469, _413, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_473, _413, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = fma(_463, _407, _475);
    float _485 = fma(_465, _407, _477);
    float _487 = fma(_479, _379, _483);
    float _489 = fma(_481, _379, _485);
    float _491 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_315;
    float _513;
    if (!_495)
    {
        float _497 = in.m_39.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_77);
        float _519 = 1.0 / _517;
        float _521 = _111 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_39.x;
    float _527 = in.m_39.y;
    float _529 = in.m_39.z;
    float _531 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _533 = log2(_531);
    float _535 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = as_type<float>(int(gl_VertexIndex));
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _523 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _555 = 1.0 + _553;
    bool _557 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _559 = isnan(1.0);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _565 = _561 || _563;
    float _567 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _569 = 1.0 / _555;
    float _571 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _573 = _533 * _111;
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = exp2(_573);
    float _589 = _529 * 2.0;
    float _591 = _525 * 2.0;
    float _593 = _527 * 2.0;
    float _595 = _527 + _529;
    float _597 = _529 + _525;
    float _599 = _527 + _525;
    float _601 = _527 + (-0.5);
    float _603 = floor(_589);
    float _605 = _595 + (-1.0);
    float _607 = _599 + (-1.0);
    bool _609 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _611 = isnan(_523);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = floor(_591);
    float _623 = -_587;
    float _625 = _623 + 1.0;
    float _627 = _547 ? _625 : 0.0;
    float _629 = floor(_593);
    bool _631 = _603 > 0.0;
    bool _633 = _603 >= 0.0;
    bool _635 = isnan(_603);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    if (_565)
    {
        float _643 = _627 * _569;
        _113 = _643;
    }
    float _645 = _113;
    float _647 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _651 = _641 ? 0 : 1;
    bool _653 = _621 > 0.0;
    float _655 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    bool _657 = _621 >= 0.0;
    bool _659 = isnan(_621);
    bool _661 = _657 || _659;
    bool _663 = isnan(0.0);
    bool _665 = _661 || _663;
    float _667 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    int _669 = ~_651;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    int _675 = as_type<int>(_537) & 1;
    bool _677 = _675 != 0;
    int _679 = as_type<int>(_537) & 2;
    bool _681 = _679 != 0;
    int _683 = _665 ? 0 : 1;
    bool _685 = _629 > 0.0;
    bool _687 = _629 >= 0.0;
    bool _689 = isnan(_629);
    bool _691 = _687 || _689;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    float _697 = in.m_37.x;
    float _699 = in.m_37.y;
    int _701 = ~_683;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    int _707 = _695 ? 0 : 1;
    int _709 = _673;
    int _711 = _705;
    if (!_631)
    {
        int _713 = ~_651;
        int _715 = _713 + 1;
        _709 = _715;
    }
    int _717 = _709;
    if (!_653)
    {
        int _719 = ~_683;
        int _721 = _719 + 1;
        _711 = _721;
    }
    int _723 = _711;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _731 = _729 != 0;
    int _733 = ~_707;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    int _739 = _737;
    if (!_685)
    {
        int _741 = ~_707;
        int _743 = _741 + 1;
        _739 = _743;
    }
    int _745 = _739;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _757 = _755 != 0;
    float _759 = _491 * _697;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _761;
    float _765 = _493 * _699;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _771 = 1.0 / _763;
    bool _773 = !_677;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _529 + (-0.5);
    bool _779 = _529 > 0.5;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _781;
    bool _785 = !_681;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _525 + (-0.5);
    bool _791 = !_749;
    int _793 = _791 ? 0 : 1;
    float _795 = 1.0 / _769;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _799 = _525 > 0.5;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _803 = _527 > 0.5;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _811 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = 1.0 / _783;
    float _815 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _819 = _523 + _817;
    float _821 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _667);
    float _823 = _597 + (-1.0);
    float _825 = _819 * _771;
    float _827 = 1.0 / _809;
    float _829 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _835 = _523 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _839 = _523 + _837;
    out.m_44.x = _811;
    out.m_44.y = _815;
    out.m_44.z = _829;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _847;
    float _851 = _835 * _795;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _869 = _571 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _871 = _839 * _813;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _877;
    float _881 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _883 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _885 = isnan(_523);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_855, _851, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_859, _851, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_867, _851, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _901;
    float _905 = -_893;
    float _907 = _905 + 1.0;
    float _909 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _911 = fma(_843, _825, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _913 = fma(_849, _825, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _915 = fma(_863, _825, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _917 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _869 + _919;
    bool _923 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _925 = isnan(_523);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = fma(_875, _871, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _937 = fma(_879, _871, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _939 = fma(_903, _871, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _941 = _585 * _907;
    float _943 = -_585;
    float _945 = _943 + 1.0;
    float _947 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _951 = _917 + _949;
    float _953 = _921 * _921;
    float _955 = _551 * _827;
    float _957 = -_933;
    float _959 = _957 + 1.0;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _947 + _961;
    float _965 = fma(_951, _951, _953);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _971 = _893 * _959;
    bool _973 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _975 = isnan(_523);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = fma(_963, _963, _965);
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    int _995 = abs(_793);
    float _997 = _983 * _945;
    float _999 = -_983;
    float _1001 = _999 + 1.0;
    float _1003 = rsqrt(_985);
    float _1005 = fma(_969, _955, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1007 = fma(_989, _955, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1009 = _619 * _1001;
    float _1011 = fma(_993, _955, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    bool _1013 = !_753;
    int _1015 = _1013 ? 0 : 1;
    float _1017 = in.m_46.x;
    float _1019 = in.m_46.y;
    float _1021 = in.m_46.z;
    float _1023 = _913 * _1009;
    float _1025 = _915 * _1009;
    float _1027 = -_619;
    float _1029 = _1027 + 1.0;
    int _1031 = abs(_1015);
    float _1033 = _911 * _1009;
    float _1035 = float(_717);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1023);
    float _1039 = float(_995);
    float _1041 = _921 * _1003;
    float _1043 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1033);
    float _1045 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1025);
    float _1047 = -_1041;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1051 = _1039 * _1035;
    float _1053 = _951 * _1003;
    float _1055 = float(_1031);
    float _1057 = _1049 * _1049;
    float _1059 = _1051 * (-2.0);
    bool _1061 = !_757;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = -_1053;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1069 = float(_723);
    float _1071 = fma(_909, _1059, _909);
    float _1073 = fma(_1059, _1017, _1017);
    float _1075 = float(_745);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1079 = _1055 * _1069;
    float _1081 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1073);
    int _1083 = abs(_1063);
    float _1085 = _963 * _1003;
    float _1087 = _1079 * (-2.0);
    float _1089 = fma(_1071, _645, _1081);
    float _1091 = float(_1083);
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1095 = fma(_1087, _1019, _1019);
    float _1097 = fma(_845, _1087, _845);
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1101 = _1099 != 0;
    float _1103 = _1091 * _1075;
    float _1105 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1095);
    float _1107 = -_787;
    int _1109 = _803 ? as_type<int>(_1107) : as_type<int>(_787);
    float _1111 = fma(_895, _997, _1043);
    float _1113 = _1103 * (-2.0);
    float _1115 = fma(_1097, _645, _1105);
    float _1117 = -_775;
    int _1119 = _799 ? as_type<int>(_1117) : as_type<int>(_775);
    float _1121 = fma(_897, _997, _1037);
    float _1123 = fma(_1113, _1021, _1021);
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1127 = _1125 != 0;
    float _1129 = fma(_881, _1113, _881);
    bool _1131 = !_1101;
    float _1133 = _1131 ? _775 : as_type<float>(_1119);
    float _1135 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1123);
    bool _1137 = !_1127;
    float _1139 = _1137 ? _787 : as_type<float>(_1109);
    float _1141 = fma(_899, _997, _1045);
    float _1143 = fma(_1067, _1067, _1057);
    float _1145 = -_1085;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1149 = _1089 * 0.15915493667125701904296875;
    float _1151 = _1115 * 0.15915493667125701904296875;
    float _1153 = fma(_1129, _645, _1135);
    float _1155 = _1133 + 0.5;
    float _1157 = fma(_935, _941, _1111);
    float _1159 = fma(_937, _941, _1121);
    float _1161 = fma(_939, _941, _1141);
    float _1163 = fma(_1147, _1147, _1143);
    float _1165 = _1149 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = -_1139;
    float _1171 = _1169 + 0.5;
    float _1173 = _1153 * 0.15915493667125701904296875;
    float _1175 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1177 = fma(_1005, _971, _1157);
    float _1179 = fma(_1007, _971, _1159);
    float _1181 = fma(_1011, _971, _1161);
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1185 = _1149 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = -_1041;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _869);
    float _1193 = _1175 * _1077;
    float _1195 = _1183 * _1093;
    float _1197 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1177);
    float _1199 = -_1053;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1205 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1207 = _1151 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    out.m_48.x = _1193;
    out.m_48.y = _1195;
    float _1211 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1179);
    float _1213 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1181);
    float _1215 = -_1085;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    float _1219 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1221 = _1151 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    bool _1225 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1227 = isnan(0.5);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1233 = _1229 || _1231;
    float _1235 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1203);
    bool _1237 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1239 = isnan(0.5);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1245 = _1241 || _1243;
    float _1247 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1235);
    float _1249 = sqrt(_1163);
    float _1251 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1205);
    float _1253 = _1167 * _1209;
    float _1255 = _1187 * _1209;
    float _1257 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    float _1259 = _1135;
    float _1261 = _1181;
    float _1263 = _775;
    if (!_1233)
    {
        _1259 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1265 = _1259;
    float _1267 = _1173 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1187 * _1223;
    float _1273 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1275 = _1167 * _1223;
    float _1277 = _1265;
    if (!_1233)
    {
        float _1279 = -_1265;
        float _1281 = _1279 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1261 = _1281;
    }
    float _1283 = _1261;
    float _1285 = _1173 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = _1003 * _1249;
    float _1291 = _1219 * _1289;
    float _1293 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    float _1297 = 1.0 / _1273;
    float _1299 = fma(_1269, _1271, _1253);
    float _1301 = fma(_1269, _1253, _1271);
    float _1303 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1305 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1307 = _1223 * _1287;
    float _1309 = _1167 * _1287;
    float _1311 = _1187 * _1287;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _1315 = _1209 * _1287;
    float _1317 = _1303 + _1273;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _1321 = _1305 * _1289;
    float _1323 = _1291 * _1313;
    float _1325 = -_1255;
    float _1327 = fma(_1269, _1275, _1325);
    float _1329 = -_1275;
    float _1331 = fma(_1269, _1255, _1329);
    float _1333 = _1321 * _1319;
    float _1335 = _1311 * _1323;
    float _1337 = -_1323;
    float _1339 = _1269 * _1337;
    float _1341 = _1309 * _1323;
    float _1343 = _1317 * _1297;
    float _1345 = _1343 * 0.5;
    float _1347 = fma(_1299, _1333, _1335);
    float _1349 = fma(_1307, _1333, _1339);
    float _1351 = fma(_1327, _1333, _1341);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1355 = fma(_1331, _1295, _1347);
    float _1357 = fma(_1315, _1295, _1349);
    float _1359 = fma(_1301, _1295, _1351);
    float _1361 = -_787;
    int _1363 = _779 ? as_type<int>(_1361) : as_type<int>(_787);
    float _1365 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    bool _1373 = !_731;
    float _1375 = _1373 ? _787 : as_type<float>(_1363);
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1365);
    float _1379 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1367);
    float _1381 = -_775;
    int _1383 = _803 ? as_type<int>(_1381) : as_type<int>(_775);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1387 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1377);
    float _1389 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1379);
    float _1391 = -_1375;
    float _1393 = _1391 + 0.5;
    bool _1395 = !_727;
    float _1397 = _1395 ? _775 : as_type<float>(_1383);
    float _1399 = _947 + _1387;
    float _1401 = _917 + _1389;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1409 = _1399 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1413 = _1401 + _1411;
    float _1415 = _1403 * _1353;
    float _1417 = _1353;
    float _1419 = _1401;
    float _1421 = _1399;
    if (!_1233)
    {
        _1417 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1423 = _1417;
    float _1425 = _1409 * _1409;
    float _1427 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1429 = _787 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1431 = _775 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1433 = fma(_1413, _1413, _1425);
    float _1435 = _1213 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1437 = -_1429;
    float _1439 = _1269 * _1437;
    float _1441 = _1423;
    if (!_1233)
    {
        float _1443 = -_1423;
        float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1263 = _1445;
    }
    float _1447 = _1263;
    float _1449 = sqrt(_1433);
    float _1451 = _1397 + 0.5;
    float _1453 = fma(_1307, _1431, _1439);
    float _1455 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1457 = _1309 * _1429;
    float _1459 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1461 = _1311 * _1429;
    float _1463 = fma(_1357, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1455);
    float _1465 = 1.0 / _1371;
    float _1467 = _1459 * _1385;
    float _1469 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1471 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    float _1473 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _1467;
    out.m_50.y = _1415;
    float _1479 = _1283;
    float _1481 = _1473;
    if (!_1233)
    {
        float _1483 = 1.0 / _1283;
        _1479 = _1483;
    }
    float _1485 = _1479;
    bool _1487 = _1449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = fma(_1327, _1431, _1457);
    float _1491 = fma(_1299, _1431, _1461);
    out.m_52.x = _1473;
    out.m_52.y = _1477;
    out.m_52.z = _1475;
    out.m_52.w = _1405;
    float _1493 = _1315 + _1453;
    float _1495 = _1301 + _1489;
    float _1497 = _1331 + _1491;
    float _1499 = _1447;
    float _1501 = _1489;
    if (!_1233)
    {
        float _1503 = 1.0 / _1447;
        _1499 = _1503;
    }
    float _1505 = _1499;
    float _1507 = _869 + _1471;
    float _1509 = _1507;
    if (!_1233)
    {
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1513 = -_1265;
        float _1515 = fma(_1465, _1511, _1513);
        _1277 = _1515;
    }
    float _1517 = _1277;
    if (!_1233)
    {
        float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1521 = -_1423;
        float _1523 = fma(_1465, _1519, _1521);
        _1441 = _1523;
    }
    float _1525 = _1441;
    float _1527 = _1525;
    if (!_1487)
    {
        _1501 = _1507;
    }
    float _1529 = _1501;
    float _1531 = _1529;
    if (_1233)
    {
        _1481 = 1.0;
    }
    float _1533 = _1481;
    float _1535 = _1533;
    if (!_1233)
    {
        float _1537 = _1517 * _1485;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        _1535 = _1539;
    }
    float _1541 = _1535;
    if (!_1233)
    {
        float _1543 = _1525 * _1505;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        _1527 = _1545;
    }
    float _1547 = _1527;
    bool _1549 = !_1487;
    if (!_1549)
    {
        float _1551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1555 = _1449 + _1553;
        float _1557 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = rsqrt(_1433);
        float _1561 = _1555 * _1551;
        float _1563 = _1561 * 0.15915493667125701904296875;
        float _1565 = _1563 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = _1563 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1571, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1577 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = _1559 * _1575;
        float _1581 = fma(_1507, _1567, _1577);
        float _1583 = fma(_1413, _1579, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1585 = fma(_1409, _1579, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1419 = _1583;
        _1531 = _1581;
        _1421 = _1585;
    }
    float _1587 = _1419;
    float _1589 = _1531;
    float _1591 = _1421;
    float _1593 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1595 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1597 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1233)
    {
        _1509 = 1.0;
    }
    float _1599 = _1509;
    float _1601 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1593);
    float _1603 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1595);
    float _1605 = -_1053;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1587);
    float _1609 = -_1041;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _1613 = -_1085;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1591);
    float _1617 = fma(_1493, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1597);
    float _1619 = _1599;
    float _1621 = _1611;
    float _1623 = _1607;
    float _1625 = _1615;
    if (!_1233)
    {
        float _1627 = -_1547;
        float _1629 = _1627 + 1.0;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (!_1245)
    {
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1635 = _1191 + _1633;
        float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1639 = _1201 + _1637;
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = -_917;
        float _1645 = _1643 + _1587;
        float _1647 = _1635 * _1635;
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1651 = _1217 + _1649;
        float _1653 = -_869;
        float _1655 = _1653 + _1589;
        float _1657 = fma(_1639, _1639, _1647);
        float _1659 = 1.0 / _1289;
        float _1661 = fma(_1651, _1651, _1657);
        float _1663 = -_947;
        float _1665 = _1663 + _1591;
        float _1667 = sqrt(_1661);
        float _1669 = precise::min(_1667, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1671 = _1669 * _1641;
        float _1673 = _1671 * _1659;
        float _1675 = fma(_1645, _1673, _1201);
        float _1677 = fma(_1655, _1673, _1191);
        float _1679 = fma(_1665, _1673, _1217);
        _1621 = _1677;
        _1623 = _1675;
        _1625 = _1679;
    }
    float _1681 = _1621;
    float _1683 = _1623;
    float _1685 = _1625;
    float _1687 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1691 = _1541 > 0.0;
    bool _1693 = isnan(_1541);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.0);
    bool _1699 = _1695 || _1697;
    float _1701 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1703 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1687);
    float _1705 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1689);
    float _1707 = _1541 * _1631;
    bool _1709 = _1631 <= 0.0;
    bool _1711 = !_1699;
    bool _1713 = _1709 || _1711;
    float _1715 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1703);
    float _1717 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1701);
    float _1719 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1721 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1705);
    float _1723 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1725 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1717);
    float _1727 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1719);
    float _1729 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1731 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1733 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1735 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1731);
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1733);
    float _1743 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1727);
    float _1745 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1747 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1735);
    float _1749 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1739);
    float _1751 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1741);
    float _1753 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1755 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1745);
    float _1757 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1759 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1601);
    float _1761 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1749);
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1751);
    float _1765 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1755);
    float _1767 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1617);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1757);
    float _1771 = _1707 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1773 = _1761 + _1763;
    float _1775 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1681 + _1777;
    float _1781 = fma(_1495, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1603);
    float _1783 = _1771 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1787 = _1683 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1791 = _1685 + _1789;
    float _1793 = _1773 * 0.5;
    out.m_54.x = _1759;
    out.m_54.y = _1781;
    out.m_54.z = _1767;
    out.m_33.x = _1783;
    out.m_56.x = _1787;
    out.m_56.y = _1779;
    out.m_56.z = _1791;
    out.gl_Position.x = _1769;
    out.gl_Position.y = _1775;
    out.gl_Position.z = _1761;
    out.gl_Position.w = _1763;
    out.m_58.z = _1793;
    out.m_58.w = _1763;
    if (!_1713)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1795;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

