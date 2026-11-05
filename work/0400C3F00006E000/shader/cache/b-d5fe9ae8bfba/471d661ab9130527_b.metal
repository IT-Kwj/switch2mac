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
    float4 m_54 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_60 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_50 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
    float4 m_46 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _477 = false;
    bool _275 = false;
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
        float _1158 = as_type<float>(_95);
        out.gl_Position.z = _1158;
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
        float _1227 = as_type<float>(_131);
        out.gl_Position.z = _1227;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_39.w;
    float _135 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _257 = in.m_41.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_79);
        float _279 = 1.0 / _277;
        float _281 = _113 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = 1.0 / _299;
    bool _307 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _309 = isnan(_283);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _295;
    bool _323 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_283);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _303;
    float _337 = _287 * _321;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _283 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = _341 * _305;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -_317;
    float _355 = _353 + 1.0;
    float _357 = _291 * _335;
    bool _359 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _361 = isnan(_283);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = fma(_345, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_351, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _333 * _355;
    float _377 = -_333;
    float _379 = _377 + 1.0;
    bool _381 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_283);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -_369;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = _369 * _379;
    float _407 = fma(_395, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _409 = _391 * _399;
    float _411 = in.m_39.x;
    float _413 = in.m_39.y;
    float _415 = fma(_403, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _417 = -_391;
    float _419 = _417 + 1.0;
    float _421 = _371 * _409;
    float _423 = _373 * _409;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _421);
    float _435 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _423);
    float _437 = fma(_427, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _439 = fma(_431, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _441 = fma(_415, _405, _433);
    float _443 = fma(_407, _405, _435);
    float _445 = fma(_437, _375, _441);
    float _447 = fma(_439, _375, _443);
    float _449 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].x, _445);
    float _451 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].y, _447);
    float _453 = _449 * _411;
    float _455 = _451 * _413;
    bool _457 = !_319;
    float _475;
    if (!_457)
    {
        float _459 = in.m_41.x;
        float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _467 = _465 * _461;
        float _469 = floor(_467);
        float _471 = -_469;
        float _473 = _467 + _471;
        _475 = _473;
        _477 = true;
    }
    else
    {
        float _479 = float(_79);
        float _481 = 1.0 / _479;
        float _483 = _113 * _481;
        _475 = _483;
    }
    _477 = false;
    float _485 = _475;
    float _487 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _491 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _493 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _495 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _497 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _489);
    float _499 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _491);
    float _501 = in.m_41.x;
    float _503 = in.m_41.y;
    float _505 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    float _507 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _497);
    float _509 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
    float _511 = _493 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _513 = _505 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _515 = _507 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _517 = _509 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _519 = as_type<float>(int(gl_VertexIndex));
    float _521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _523 = _513 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _527 = _515 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _531 = _517 + _529;
    float _533 = _523 * _523;
    float _535 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _539 = fma(_527, _527, _533);
    float _541 = fma(_531, _531, _539);
    bool _543 = _501 > 0.5;
    float _545 = sqrt(_541);
    bool _547 = _503 > 0.5;
    int _549 = as_type<int>(_519) & 1;
    bool _551 = _549 != 0;
    int _553 = as_type<int>(_519) & 2;
    bool _555 = _553 != 0;
    float _557 = rsqrt(_541);
    float _559 = _545 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _567 = precise::min(_511, _559);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = _557 * _567;
    float _575 = 1.0 / _563;
    out.m_46.w = _567;
    float _577 = _523 * _573;
    float _579 = _527 * _573;
    float _581 = _531 * _573;
    float _583 = -_577;
    float _585 = _523 + _583;
    float _587 = -_579;
    float _589 = _527 + _587;
    float _591 = -_581;
    float _593 = _531 + _591;
    float _595 = _585 * _585;
    float _597 = fma(_589, _589, _595);
    bool _599 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_485);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _485 + _611;
    float _615 = _571 * _575;
    float _617 = fma(_593, _593, _597);
    bool _619 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _621 = isnan(_485);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_609;
    float _633 = _631 + 1.0;
    float _635 = fma(_615, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = sqrt(_617);
    float _639 = _629 * _633;
    float _641 = -_629;
    float _643 = _641 + 1.0;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = _635 * _639;
    bool _655 = !_551;
    float _657 = _655 ? (-0.5) : 0.5;
    bool _659 = !_555;
    float _661 = _659 ? (-0.5) : 0.5;
    float _663 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[115].x, _653);
    float _665 = -_657;
    int _667 = _543 ? as_type<int>(_665) : as_type<int>(_657);
    float _669 = -_661;
    int _671 = _547 ? as_type<int>(_669) : as_type<int>(_661);
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _661);
    float _675 = _557 * _637;
    bool _677 = !_647;
    float _679 = _677 ? _657 : as_type<float>(_667);
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _657);
    bool _683 = !_651;
    float _685 = _683 ? _661 : as_type<float>(_671);
    float _687 = _535 * _675;
    float _689 = _493 * _675;
    float _691 = _679 + 0.5;
    float _693 = _675 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _695 = _693 * 0.5;
    float _697 = _687 * _673;
    float _699 = _689 * _681;
    float _701 = _691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _703 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[116].x, _663);
    float _705 = _697 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _707 = _697 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _709 = _701 * _565;
    float _711 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _705);
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _707);
    float _715 = -_685;
    float _717 = _715 + 0.5;
    float _719 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[26].z, _711);
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[24].z, _713);
    float _723 = _717 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _727 = _721 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _733 = _517 + _725;
    float _735 = _515 + _727;
    float _737 = -_577;
    float _739 = _513 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _747 = _735 + _745;
    float _749 = _723 * _537;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = _743 * _743;
    float _755 = _739 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _759 = fma(_747, _747, _753);
    float _761 = -_579;
    float _763 = _515 + _761;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _767 = sqrt(_759);
    float _769 = -_581;
    float _771 = _517 + _769;
    float _773 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].x, _755);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _779 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _697 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_48.x = _709;
    out.m_48.y = _749;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[11].z, _773);
    float _789 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _763;
    out.m_50.y = _739;
    out.m_50.z = _771;
    float _793 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _703 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _785);
    out.m_52.x = _779;
    out.m_52.y = _781;
    out.m_52.z = _783;
    out.m_52.w = _731;
    float _799 = _739 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _801 = _767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _803 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[25].z, _797);
    out.m_54.x = _789;
    out.m_54.y = _791;
    out.m_54.z = _793;
    out.m_54.w = _795;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].x, _799);
    bool _807 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _809 = isnan(0.5);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[10].z, _805);
    float _829 = _827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _831 = _787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = _803 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _835 = _731;
    float _837 = _791;
    float _839 = _789;
    float _841 = _763;
    if (!_801)
    {
        _835 = _733;
    }
    float _843 = _835;
    float _845 = 1.0 / _831;
    float _847 = _513 + _833;
    float _849 = _829 + _831;
    float _851 = _843;
    if (!_801)
    {
        _837 = _735;
    }
    float _853 = _837;
    float _855 = _853;
    if (!_801)
    {
        _839 = _847;
    }
    float _857 = _839;
    bool _859 = !_801;
    float _861 = _857;
    if (!_859)
    {
        float _863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _867 = _767 + _865;
        float _869 = _847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = rsqrt(_759);
        float _873 = _867 * _863;
        float _875 = _873 * 0.15915493667125701904296875;
        float _877 = _875 * 6.283185482025146484375;
        float _879 = sin(_877);
        float _881 = _875 * 6.283185482025146484375;
        float _883 = cos(_881);
        float _885 = fma(_879, _869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _887 = _871 * _885;
        float _889 = _883 + (-1.0);
        float _891 = fma(_747, _887, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _893 = fma(_743, _887, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _895 = _889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = fma(_847, _883, _895);
        _855 = _891;
        _861 = _897;
        _851 = _893;
    }
    float _899 = _855;
    float _901 = _861;
    float _903 = _851;
    float _905 = -_579;
    float _907 = _905 + _899;
    float _909 = -_577;
    float _911 = _909 + _901;
    float _913 = -_581;
    float _915 = _913 + _903;
    float _917 = _849 * _845;
    float _919 = _917 * 0.5;
    float _921 = _911;
    float _923 = _907;
    float _925 = _915;
    if (!_815)
    {
        float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _929 = _739 + _927;
        float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _933 = _763 + _931;
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _937 = -_515;
        float _939 = _937 + _899;
        float _941 = _929 * _929;
        float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _945 = _771 + _943;
        float _947 = -_513;
        float _949 = _947 + _901;
        float _951 = -_517;
        float _953 = _951 + _903;
        float _955 = fma(_933, _933, _941);
        float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _959 = fma(_945, _945, _955);
        float _961 = sqrt(_959);
        float _963 = _935 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _965 = precise::min(_961, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _967 = _965 * _957;
        float _969 = _963 * _967;
        float _971 = fma(_939, _969, _763);
        float _973 = fma(_949, _969, _739);
        float _975 = fma(_953, _969, _771);
        _921 = _973;
        _923 = _971;
        _925 = _975;
    }
    float _977 = _921;
    float _979 = _923;
    float _981 = _925;
    float _983 = _977 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_825)
    {
        _841 = 1.0;
    }
    float _985 = _841;
    float _987 = _985;
    if (!_825)
    {
        float _989 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _991 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _989);
        float _993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _997 = 1.0 / _991;
        float _999 = 1.0 / _995;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1005 = fma(_997, _1001, _1003);
        float _1007 = _1005 * _999;
        float _1009 = precise::clamp(_1007, 0.0, 1.0);
        _987 = _1009;
    }
    float _1011 = _987;
    float _1013 = _977 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[1].x, _983);
    float _1017 = _977 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = _977 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1015);
    float _1025 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1027 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1029 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1033 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1035 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1027);
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1039);
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1041);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1043);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1057 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1049);
    float _1061 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1051);
    float _1063 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1053);
    bool _1065 = _1011 > 0.0;
    bool _1067 = isnan(_1011);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    float _1075 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1055);
    float _1077 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1079 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1059);
    float _1081 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1063);
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1061);
    float _1085 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1075);
    float _1087 = _1077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1089 = _1079 + _1081;
    float _1091 = _1083 + _1081;
    float _1093 = _1081 * 0.5;
    float _1095 = _1089 * 0.5;
    float _1097 = _1091 * 0.5;
    float _1099 = fma(_1085, -0.5, _1093);
    out.m_56.x = _689;
    out.m_58.x = _979;
    out.m_58.y = _977;
    out.m_58.z = _981;
    out.m_35.x = _1087;
    out.gl_Position.x = _1079;
    out.gl_Position.y = _1085;
    out.gl_Position.z = _1083;
    out.gl_Position.w = _1081;
    out.m_60.x = _1095;
    out.m_60.y = _1099;
    out.m_60.z = _1097;
    out.m_60.w = _1081;
    if (_1073)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1101;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _477 = false;
    bool _275 = false;
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
        float _1158 = as_type<float>(_95);
        out.gl_Position.z = _1158;
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
        float _1227 = as_type<float>(_131);
        out.gl_Position.z = _1227;
    }
    if (_123)
    {
        return out;
    }
    float _133 = in.m_39.w;
    float _135 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _257 = in.m_41.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_79);
        float _279 = 1.0 / _277;
        float _281 = _113 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = 1.0 / _299;
    bool _307 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _309 = isnan(_283);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _295;
    bool _323 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_283);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _303;
    float _337 = _287 * _321;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _283 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = _341 * _305;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -_317;
    float _355 = _353 + 1.0;
    float _357 = _291 * _335;
    bool _359 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _361 = isnan(_283);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = fma(_345, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_351, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _333 * _355;
    float _377 = -_333;
    float _379 = _377 + 1.0;
    bool _381 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_283);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -_369;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = _369 * _379;
    float _407 = fma(_395, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _409 = _391 * _399;
    float _411 = in.m_39.x;
    float _413 = in.m_39.y;
    float _415 = fma(_403, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _417 = -_391;
    float _419 = _417 + 1.0;
    float _421 = _371 * _409;
    float _423 = _373 * _409;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _421);
    float _435 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _423);
    float _437 = fma(_427, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _439 = fma(_431, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _441 = fma(_415, _405, _433);
    float _443 = fma(_407, _405, _435);
    float _445 = fma(_437, _375, _441);
    float _447 = fma(_439, _375, _443);
    float _449 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].x, _445);
    float _451 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].y, _447);
    float _453 = _449 * _411;
    float _455 = _451 * _413;
    bool _457 = !_319;
    float _475;
    if (!_457)
    {
        float _459 = in.m_41.x;
        float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _467 = _465 * _461;
        float _469 = floor(_467);
        float _471 = -_469;
        float _473 = _467 + _471;
        _475 = _473;
        _477 = true;
    }
    else
    {
        float _479 = float(_79);
        float _481 = 1.0 / _479;
        float _483 = _113 * _481;
        _475 = _483;
    }
    _477 = false;
    float _485 = _475;
    float _487 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _491 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _493 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _495 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _497 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _489);
    float _499 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _491);
    float _501 = in.m_41.x;
    float _503 = in.m_41.y;
    float _505 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    float _507 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _497);
    float _509 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
    float _511 = _493 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _513 = _505 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _515 = _507 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _517 = _509 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _519 = as_type<float>(int(gl_VertexIndex));
    float _521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _523 = _513 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _527 = _515 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _531 = _517 + _529;
    float _533 = _523 * _523;
    float _535 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _539 = fma(_527, _527, _533);
    float _541 = fma(_531, _531, _539);
    bool _543 = _501 > 0.5;
    float _545 = sqrt(_541);
    bool _547 = _503 > 0.5;
    int _549 = as_type<int>(_519) & 1;
    bool _551 = _549 != 0;
    int _553 = as_type<int>(_519) & 2;
    bool _555 = _553 != 0;
    float _557 = rsqrt(_541);
    float _559 = _545 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _567 = precise::min(_511, _559);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = _557 * _567;
    float _575 = 1.0 / _563;
    out.m_46.w = _567;
    float _577 = _523 * _573;
    float _579 = _527 * _573;
    float _581 = _531 * _573;
    float _583 = -_577;
    float _585 = _523 + _583;
    float _587 = -_579;
    float _589 = _527 + _587;
    float _591 = -_581;
    float _593 = _531 + _591;
    float _595 = _585 * _585;
    float _597 = fma(_589, _589, _595);
    bool _599 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_485);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _485 + _611;
    float _615 = _571 * _575;
    float _617 = fma(_593, _593, _597);
    bool _619 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _621 = isnan(_485);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_609;
    float _633 = _631 + 1.0;
    float _635 = fma(_615, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = sqrt(_617);
    float _639 = _629 * _633;
    float _641 = -_629;
    float _643 = _641 + 1.0;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = _635 * _639;
    bool _655 = !_551;
    float _657 = _655 ? (-0.5) : 0.5;
    bool _659 = !_555;
    float _661 = _659 ? (-0.5) : 0.5;
    float _663 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[115].x, _653);
    float _665 = -_657;
    int _667 = _543 ? as_type<int>(_665) : as_type<int>(_657);
    float _669 = -_661;
    int _671 = _547 ? as_type<int>(_669) : as_type<int>(_661);
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _661);
    float _675 = _557 * _637;
    bool _677 = !_647;
    float _679 = _677 ? _657 : as_type<float>(_667);
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _657);
    bool _683 = !_651;
    float _685 = _683 ? _661 : as_type<float>(_671);
    float _687 = _535 * _675;
    float _689 = _493 * _675;
    float _691 = _679 + 0.5;
    float _693 = _675 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _695 = _693 * 0.5;
    float _697 = _687 * _673;
    float _699 = _689 * _681;
    float _701 = _691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _703 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[116].x, _663);
    float _705 = _697 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _707 = _697 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _709 = _701 * _565;
    float _711 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _705);
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _707);
    float _715 = -_685;
    float _717 = _715 + 0.5;
    float _719 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[26].z, _711);
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[24].z, _713);
    float _723 = _717 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _727 = _721 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _733 = _517 + _725;
    float _735 = _515 + _727;
    float _737 = -_577;
    float _739 = _513 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _747 = _735 + _745;
    float _749 = _723 * _537;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = _743 * _743;
    float _755 = _739 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _759 = fma(_747, _747, _753);
    float _761 = -_579;
    float _763 = _515 + _761;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _767 = sqrt(_759);
    float _769 = -_581;
    float _771 = _517 + _769;
    float _773 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].x, _755);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _779 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _697 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_48.x = _709;
    out.m_48.y = _749;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[11].z, _773);
    float _789 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _763;
    out.m_50.y = _739;
    out.m_50.z = _771;
    float _793 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _703 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _785);
    out.m_52.x = _779;
    out.m_52.y = _781;
    out.m_52.z = _783;
    out.m_52.w = _731;
    float _799 = _739 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _801 = _767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _803 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[25].z, _797);
    out.m_54.x = _789;
    out.m_54.y = _791;
    out.m_54.z = _793;
    out.m_54.w = _795;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].x, _799);
    bool _807 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _809 = isnan(0.5);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[10].z, _805);
    float _829 = _827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _831 = _787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = _803 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _835 = _731;
    float _837 = _791;
    float _839 = _789;
    float _841 = _763;
    if (!_801)
    {
        _835 = _733;
    }
    float _843 = _835;
    float _845 = 1.0 / _831;
    float _847 = _513 + _833;
    float _849 = _829 + _831;
    float _851 = _843;
    if (!_801)
    {
        _837 = _735;
    }
    float _853 = _837;
    float _855 = _853;
    if (!_801)
    {
        _839 = _847;
    }
    float _857 = _839;
    bool _859 = !_801;
    float _861 = _857;
    if (!_859)
    {
        float _863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _867 = _767 + _865;
        float _869 = _847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = rsqrt(_759);
        float _873 = _867 * _863;
        float _875 = _873 * 0.15915493667125701904296875;
        float _877 = _875 * 6.283185482025146484375;
        float _879 = sin(_877);
        float _881 = _875 * 6.283185482025146484375;
        float _883 = cos(_881);
        float _885 = fma(_879, _869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _887 = _871 * _885;
        float _889 = _883 + (-1.0);
        float _891 = fma(_747, _887, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _893 = fma(_743, _887, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _895 = _889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = fma(_847, _883, _895);
        _855 = _891;
        _861 = _897;
        _851 = _893;
    }
    float _899 = _855;
    float _901 = _861;
    float _903 = _851;
    float _905 = -_579;
    float _907 = _905 + _899;
    float _909 = -_577;
    float _911 = _909 + _901;
    float _913 = -_581;
    float _915 = _913 + _903;
    float _917 = _849 * _845;
    float _919 = _917 * 0.5;
    float _921 = _911;
    float _923 = _907;
    float _925 = _915;
    if (!_815)
    {
        float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _929 = _739 + _927;
        float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _933 = _763 + _931;
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _937 = -_515;
        float _939 = _937 + _899;
        float _941 = _929 * _929;
        float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _945 = _771 + _943;
        float _947 = -_513;
        float _949 = _947 + _901;
        float _951 = -_517;
        float _953 = _951 + _903;
        float _955 = fma(_933, _933, _941);
        float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _959 = fma(_945, _945, _955);
        float _961 = sqrt(_959);
        float _963 = _935 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _965 = precise::min(_961, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _967 = _965 * _957;
        float _969 = _963 * _967;
        float _971 = fma(_939, _969, _763);
        float _973 = fma(_949, _969, _739);
        float _975 = fma(_953, _969, _771);
        _921 = _973;
        _923 = _971;
        _925 = _975;
    }
    float _977 = _921;
    float _979 = _923;
    float _981 = _925;
    float _983 = _977 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_825)
    {
        _841 = 1.0;
    }
    float _985 = _841;
    float _987 = _985;
    if (!_825)
    {
        float _989 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _991 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _989);
        float _993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _997 = 1.0 / _991;
        float _999 = 1.0 / _995;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1005 = fma(_997, _1001, _1003);
        float _1007 = _1005 * _999;
        float _1009 = precise::clamp(_1007, 0.0, 1.0);
        _987 = _1009;
    }
    float _1011 = _987;
    float _1013 = _977 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[1].x, _983);
    float _1017 = _977 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = _977 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1015);
    float _1025 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1027 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1029 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1033 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1035 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1027);
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1039);
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1041);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1043);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1057 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1049);
    float _1061 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1051);
    float _1063 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1053);
    bool _1065 = _1011 > 0.0;
    bool _1067 = isnan(_1011);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    float _1075 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1055);
    float _1077 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1079 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1059);
    float _1081 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1063);
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1061);
    float _1085 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1075);
    float _1087 = _1077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1089 = _1079 + _1081;
    float _1091 = _1083 + _1081;
    float _1093 = _1081 * 0.5;
    float _1095 = _1089 * 0.5;
    float _1097 = _1091 * 0.5;
    float _1099 = fma(_1085, -0.5, _1093);
    out.m_56.x = _689;
    out.m_58.x = _979;
    out.m_58.y = _977;
    out.m_58.z = _981;
    out.m_35.x = _1087;
    out.gl_Position.x = _1079;
    out.gl_Position.y = _1085;
    out.gl_Position.z = _1083;
    out.gl_Position.w = _1081;
    out.m_60.x = _1095;
    out.m_60.y = _1099;
    out.m_60.z = _1097;
    out.m_60.w = _1081;
    if (_1073)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1101;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _477 = false;
    bool _275 = false;
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
        float _1158 = as_type<float>(_95);
        out.gl_Position.z = _1158;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1227 = as_type<float>(_131);
        out.gl_Position.z = _1227;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_39.w;
    float _135 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _257 = in.m_41.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_79);
        float _279 = 1.0 / _277;
        float _281 = _113 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = 1.0 / _299;
    bool _307 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _309 = isnan(_283);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _295;
    bool _323 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_283);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _303;
    float _337 = _287 * _321;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _283 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = _341 * _305;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -_317;
    float _355 = _353 + 1.0;
    float _357 = _291 * _335;
    bool _359 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _361 = isnan(_283);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = fma(_345, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_351, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _333 * _355;
    float _377 = -_333;
    float _379 = _377 + 1.0;
    bool _381 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_283);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -_369;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = _369 * _379;
    float _407 = fma(_395, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _409 = _391 * _399;
    float _411 = in.m_39.x;
    float _413 = in.m_39.y;
    float _415 = fma(_403, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _417 = -_391;
    float _419 = _417 + 1.0;
    float _421 = _371 * _409;
    float _423 = _373 * _409;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _421);
    float _435 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _423);
    float _437 = fma(_427, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _439 = fma(_431, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _441 = fma(_415, _405, _433);
    float _443 = fma(_407, _405, _435);
    float _445 = fma(_437, _375, _441);
    float _447 = fma(_439, _375, _443);
    float _449 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].x, _445);
    float _451 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].y, _447);
    float _453 = _449 * _411;
    float _455 = _451 * _413;
    bool _457 = !_319;
    float _475;
    if (!_457)
    {
        float _459 = in.m_41.x;
        float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _467 = _465 * _461;
        float _469 = floor(_467);
        float _471 = -_469;
        float _473 = _467 + _471;
        _475 = _473;
        _477 = true;
    }
    else
    {
        float _479 = float(_79);
        float _481 = 1.0 / _479;
        float _483 = _113 * _481;
        _475 = _483;
    }
    _477 = false;
    float _485 = _475;
    float _487 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _491 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _493 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _495 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _497 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _489);
    float _499 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _491);
    float _501 = in.m_41.x;
    float _503 = in.m_41.y;
    float _505 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    float _507 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _497);
    float _509 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
    float _511 = _493 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _513 = _505 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _515 = _507 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _517 = _509 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _519 = as_type<float>(int(gl_VertexIndex));
    float _521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _523 = _513 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _527 = _515 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _531 = _517 + _529;
    float _533 = _523 * _523;
    float _535 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _539 = fma(_527, _527, _533);
    float _541 = fma(_531, _531, _539);
    bool _543 = _501 > 0.5;
    float _545 = sqrt(_541);
    bool _547 = _503 > 0.5;
    int _549 = as_type<int>(_519) & 1;
    bool _551 = _549 != 0;
    int _553 = as_type<int>(_519) & 2;
    bool _555 = _553 != 0;
    float _557 = rsqrt(_541);
    float _559 = _545 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _567 = precise::min(_511, _559);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = _557 * _567;
    float _575 = 1.0 / _563;
    out.m_46.w = _567;
    float _577 = _523 * _573;
    float _579 = _527 * _573;
    float _581 = _531 * _573;
    float _583 = -_577;
    float _585 = _523 + _583;
    float _587 = -_579;
    float _589 = _527 + _587;
    float _591 = -_581;
    float _593 = _531 + _591;
    float _595 = _585 * _585;
    float _597 = fma(_589, _589, _595);
    bool _599 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_485);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _485 + _611;
    float _615 = _571 * _575;
    float _617 = fma(_593, _593, _597);
    bool _619 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _621 = isnan(_485);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_609;
    float _633 = _631 + 1.0;
    float _635 = fma(_615, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = sqrt(_617);
    float _639 = _629 * _633;
    float _641 = -_629;
    float _643 = _641 + 1.0;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = _635 * _639;
    bool _655 = !_551;
    float _657 = _655 ? (-0.5) : 0.5;
    bool _659 = !_555;
    float _661 = _659 ? (-0.5) : 0.5;
    float _663 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[115].x, _653);
    float _665 = -_657;
    int _667 = _543 ? as_type<int>(_665) : as_type<int>(_657);
    float _669 = -_661;
    int _671 = _547 ? as_type<int>(_669) : as_type<int>(_661);
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _661);
    float _675 = _557 * _637;
    bool _677 = !_647;
    float _679 = _677 ? _657 : as_type<float>(_667);
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _657);
    bool _683 = !_651;
    float _685 = _683 ? _661 : as_type<float>(_671);
    float _687 = _535 * _675;
    float _689 = _493 * _675;
    float _691 = _679 + 0.5;
    float _693 = _675 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _695 = _693 * 0.5;
    float _697 = _687 * _673;
    float _699 = _689 * _681;
    float _701 = _691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _703 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[116].x, _663);
    float _705 = _697 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _707 = _697 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _709 = _701 * _565;
    float _711 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _705);
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _707);
    float _715 = -_685;
    float _717 = _715 + 0.5;
    float _719 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[26].z, _711);
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[24].z, _713);
    float _723 = _717 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _727 = _721 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _733 = _517 + _725;
    float _735 = _515 + _727;
    float _737 = -_577;
    float _739 = _513 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _747 = _735 + _745;
    float _749 = _723 * _537;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = _743 * _743;
    float _755 = _739 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _759 = fma(_747, _747, _753);
    float _761 = -_579;
    float _763 = _515 + _761;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _767 = sqrt(_759);
    float _769 = -_581;
    float _771 = _517 + _769;
    float _773 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].x, _755);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _779 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _697 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_48.x = _709;
    out.m_48.y = _749;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[11].z, _773);
    float _789 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _763;
    out.m_50.y = _739;
    out.m_50.z = _771;
    float _793 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _703 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _785);
    out.m_52.x = _779;
    out.m_52.y = _781;
    out.m_52.z = _783;
    out.m_52.w = _731;
    float _799 = _739 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _801 = _767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _803 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[25].z, _797);
    out.m_54.x = _789;
    out.m_54.y = _791;
    out.m_54.z = _793;
    out.m_54.w = _795;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].x, _799);
    bool _807 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _809 = isnan(0.5);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[10].z, _805);
    float _829 = _827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _831 = _787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = _803 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _835 = _731;
    float _837 = _791;
    float _839 = _789;
    float _841 = _763;
    if (!_801)
    {
        _835 = _733;
    }
    float _843 = _835;
    float _845 = 1.0 / _831;
    float _847 = _513 + _833;
    float _849 = _829 + _831;
    float _851 = _843;
    if (!_801)
    {
        _837 = _735;
    }
    float _853 = _837;
    float _855 = _853;
    if (!_801)
    {
        _839 = _847;
    }
    float _857 = _839;
    bool _859 = !_801;
    float _861 = _857;
    if (!_859)
    {
        float _863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _867 = _767 + _865;
        float _869 = _847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = rsqrt(_759);
        float _873 = _867 * _863;
        float _875 = _873 * 0.15915493667125701904296875;
        float _877 = _875 * 6.283185482025146484375;
        float _879 = sin(_877);
        float _881 = _875 * 6.283185482025146484375;
        float _883 = cos(_881);
        float _885 = fma(_879, _869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _887 = _871 * _885;
        float _889 = _883 + (-1.0);
        float _891 = fma(_747, _887, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _893 = fma(_743, _887, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _895 = _889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = fma(_847, _883, _895);
        _855 = _891;
        _861 = _897;
        _851 = _893;
    }
    float _899 = _855;
    float _901 = _861;
    float _903 = _851;
    float _905 = -_579;
    float _907 = _905 + _899;
    float _909 = -_577;
    float _911 = _909 + _901;
    float _913 = -_581;
    float _915 = _913 + _903;
    float _917 = _849 * _845;
    float _919 = _917 * 0.5;
    float _921 = _911;
    float _923 = _907;
    float _925 = _915;
    if (!_815)
    {
        float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _929 = _739 + _927;
        float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _933 = _763 + _931;
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _937 = -_515;
        float _939 = _937 + _899;
        float _941 = _929 * _929;
        float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _945 = _771 + _943;
        float _947 = -_513;
        float _949 = _947 + _901;
        float _951 = -_517;
        float _953 = _951 + _903;
        float _955 = fma(_933, _933, _941);
        float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _959 = fma(_945, _945, _955);
        float _961 = sqrt(_959);
        float _963 = _935 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _965 = precise::min(_961, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _967 = _965 * _957;
        float _969 = _963 * _967;
        float _971 = fma(_939, _969, _763);
        float _973 = fma(_949, _969, _739);
        float _975 = fma(_953, _969, _771);
        _921 = _973;
        _923 = _971;
        _925 = _975;
    }
    float _977 = _921;
    float _979 = _923;
    float _981 = _925;
    float _983 = _977 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_825)
    {
        _841 = 1.0;
    }
    float _985 = _841;
    float _987 = _985;
    if (!_825)
    {
        float _989 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _991 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _989);
        float _993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _997 = 1.0 / _991;
        float _999 = 1.0 / _995;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1005 = fma(_997, _1001, _1003);
        float _1007 = _1005 * _999;
        float _1009 = precise::clamp(_1007, 0.0, 1.0);
        _987 = _1009;
    }
    float _1011 = _987;
    float _1013 = _977 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[1].x, _983);
    float _1017 = _977 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = _977 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1015);
    float _1025 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1027 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1029 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1033 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1035 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1027);
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1039);
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1041);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1043);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1057 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1049);
    float _1061 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1051);
    float _1063 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1053);
    bool _1065 = _1011 > 0.0;
    bool _1067 = isnan(_1011);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    float _1075 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1055);
    float _1077 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1079 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1059);
    float _1081 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1063);
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1061);
    float _1085 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1075);
    float _1087 = _1077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1089 = _1079 + _1081;
    float _1091 = _1083 + _1081;
    float _1093 = _1081 * 0.5;
    float _1095 = _1089 * 0.5;
    float _1097 = _1091 * 0.5;
    float _1099 = fma(_1085, -0.5, _1093);
    out.m_56.x = _689;
    out.m_58.x = _979;
    out.m_58.y = _977;
    out.m_58.z = _981;
    out.m_35.x = _1087;
    out.gl_Position.x = _1079;
    out.gl_Position.y = _1085;
    out.gl_Position.z = _1083;
    out.gl_Position.w = _1081;
    out.m_60.x = _1095;
    out.m_60.y = _1099;
    out.m_60.z = _1097;
    out.m_60.w = _1081;
    if (_1073)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1101;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

