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
    float4 m_50 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _865 = false;
    bool _461 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1244 = as_type<float>(_87);
        out.gl_Position.z = _1244;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1313 = as_type<float>(_123);
        out.gl_Position.z = _1313;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = _275 + _281;
    bool _285 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_275);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _275 + _309;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _317 = 1.0 / _307;
    float _319 = 1.0 / _303;
    float _321 = _279 * _313;
    bool _323 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_275);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_295;
    float _337 = _335 + 1.0;
    float _339 = _333 * _337;
    float _341 = _283 * _317;
    bool _343 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_275);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = _311 * _319;
    bool _365 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_275);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _353 * _357;
    float _383 = -_353;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = fma(_379, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _375 * _385;
    float _395 = fma(_389, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = -_375;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = _391 * _393;
    float _407 = _395 * _393;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_361, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _417 = fma(_403, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _419;
    float _423 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _425 = fma(_411, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_413, _381, _415);
    float _429 = fma(_421, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _431 = fma(_417, _381, _423);
    float _433 = fma(_425, _339, _427);
    float _435 = fma(_429, _339, _431);
    float _437 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _433);
    float _439 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _435);
    bool _441 = !_315;
    float _459;
    if (!_441)
    {
        float _443 = in.m_41.x;
        float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _447 = _443 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _451 = _449 * _445;
        float _453 = floor(_451);
        float _455 = -_453;
        float _457 = _451 + _455;
        _459 = _457;
        _461 = true;
    }
    else
    {
        float _463 = float(_71);
        float _465 = 1.0 / _463;
        float _467 = _105 * _465;
        _459 = _467;
    }
    _461 = false;
    float _469 = _459;
    float _471 = as_type<float>(int(gl_VertexIndex));
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _475 = in.m_39.x;
    float _477 = in.m_39.y;
    float _479 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _481 = in.m_41.x;
    float _483 = in.m_41.y;
    int _485 = as_type<int>(_471) & 1;
    bool _487 = _485 != 0;
    int _489 = as_type<int>(_471) & 2;
    bool _491 = _489 != 0;
    float _493 = _437 * _475;
    float _495 = _439 * _477;
    bool _497 = !_491;
    float _499 = _497 ? (-0.5) : 0.5;
    bool _501 = !_487;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = _495 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _507 = _493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _499);
    bool _511 = _481 > 0.5;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _503);
    bool _515 = _483 > 0.5;
    float _517 = _505 * _509;
    float _519 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = _507 * _513;
    float _523 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _531 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
    float _533 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _525);
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _537 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _529);
    float _539 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
    float _541 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _533);
    float _543 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _535);
    float _545 = _537 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _547 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _549 = _541 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _551 = _543 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = _547 + _549;
    float _557 = _545 + _551;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _555 + _563;
    float _567 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _569 = _557 + _567;
    float _571 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _573 = _565 * _565;
    float _575 = _569 * _569;
    float _577 = 1.0 / _561;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _581 = _579 != 0;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    float _587 = _573 + _575;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _591 = _589 != 0;
    float _593 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
    float _595 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _597 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = isnan(_469);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = sqrt(_587);
    float _611 = -_499;
    int _613 = _515 ? as_type<int>(_611) : as_type<int>(_499);
    float _615 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _595);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _469 + _617;
    bool _621 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_469);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_607;
    float _635 = _633 + 1.0;
    float _637 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _615);
    bool _639 = !_591;
    float _641 = _639 ? _499 : as_type<float>(_613);
    float _643 = _585 * _577;
    float _645 = _631 * _635;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _649 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _651 = fma(_643, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _653 = _593 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _655 = -_503;
    float _657 = _511 ? _655 : _503;
    bool _659 = _609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _661 = _653 + _649;
    bool _663 = !_581;
    float _665 = _663 ? _503 : _657;
    float _667 = _651 * _645;
    float _669 = _657;
    float _671 = _503;
    float _673 = _645;
    float _675 = _651;
    float _677 = _499;
    if (!_659)
    {
        _669 = _575;
    }
    float _679 = _669;
    float _681 = _679;
    if (!_659)
    {
        _671 = _573;
    }
    float _683 = _671;
    float _685 = _683;
    if (!_659)
    {
        _673 = _555;
    }
    float _687 = _673;
    float _689 = _687;
    if (!_659)
    {
        _675 = _557;
    }
    float _691 = _675;
    float _693 = _691;
    if (!_659)
    {
        _677 = _661;
    }
    float _695 = _677;
    bool _697 = !_659;
    float _699 = _695;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _705 = _609 + _703;
        float _707 = _661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _709 = rsqrt(_587);
        float _711 = _705 * _701;
        float _713 = _711 * 0.15915493667125701904296875;
        float _715 = _713 * 6.283185482025146484375;
        float _717 = sin(_715);
        float _719 = _713 * 6.283185482025146484375;
        float _721 = cos(_719);
        float _723 = fma(_717, _707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _725 = _709 * _723;
        float _727 = _721 + (-1.0);
        float _729 = fma(_565, _725, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _731 = fma(_569, _725, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _733 = _727 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _737 = _729 + _735;
        float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _741 = _731 + _739;
        float _743 = fma(_661, _721, _733);
        float _745 = _737 * _737;
        float _747 = _741 * _741;
        _699 = _743;
        _685 = _745;
        _681 = _747;
        _693 = _731;
        _689 = _729;
    }
    float _749 = _699;
    float _751 = _685;
    float _753 = _681;
    float _755 = _693;
    float _757 = _689;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _761 = _749 + _759;
    float _763 = -_631;
    float _765 = _763 + 1.0;
    float _767 = _665 + 0.5;
    float _769 = fma(_761, _761, _751);
    float _771 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _775 = _769 + _753;
    float _777 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[116].x, _771);
    float _779 = _773 * _647;
    float _781 = -_641;
    float _783 = _781 + 0.5;
    float _785 = sqrt(_775);
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _789 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _789 * _473;
    float _805 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _779;
    out.m_46.y = _803;
    bool _817 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _819 = isnan(_785);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _825 = _821 || _823;
    out.m_48.x = _809;
    out.m_48.y = _811;
    out.m_48.z = _801;
    out.m_50.x = _805;
    out.m_50.y = _807;
    out.m_50.z = _813;
    out.m_50.w = _815;
    float _827 = _797;
    float _829 = _757;
    if (!_825)
    {
        _827 = 1.0;
    }
    float _831 = _827;
    bool _833 = !_825;
    float _835 = _831;
    if (!_833)
    {
        bool _837 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _839 = isnan(_785);
        bool _841 = _837 || _839;
        bool _843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _845 = _841 || _843;
        if (!_845)
        {
            float _847 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _849 = _785 + _847;
            float _851 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _853 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _851;
            float _855 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _857 = _855 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _859 = 1.0 / _853;
            float _861 = _849 * _859;
            float _863 = fma(_861, _857, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _835 = _863;
            _865 = true;
        }
        else
        {
            bool _867 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _869 = isnan(_785);
            bool _871 = _867 || _869;
            bool _873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _875 = _871 || _873;
            if (!_875)
            {
                float _877 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _879 = _785 + _877;
                float _881 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _883 = _881 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _885 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _887 = _885 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _889 = 1.0 / _883;
                float _891 = _879 * _889;
                float _893 = fma(_891, _887, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _835 = _893;
                _865 = true;
            }
            else
            {
                _835 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _865 = false;
    float _895 = _835;
    float _897 = _653 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _899 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _901 = _749 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _905 = _755 + _903;
    float _907 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _897);
    float _909 = _653 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _911 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _913 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.5);
    bool _919 = _915 || _917;
    float _921 = fma(_901, _895, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _923 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _907);
    float _925 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _909);
    float _927 = fma(_905, _895, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _929 = _923 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _931 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _933 = _757 + _931;
    float _935 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _925);
    bool _937 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _939 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    float _947 = 1.0 / _929;
    float _949 = fma(_933, _895, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _951 = _935 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _953 = _905;
    float _955 = _901;
    if (_919)
    {
        _829 = _921;
    }
    float _957 = _829;
    float _959 = _957;
    if (_919)
    {
        _953 = _927;
    }
    float _961 = _953;
    float _963 = _951 + _929;
    float _965 = _961;
    if (_919)
    {
        _955 = _949;
    }
    float _967 = _955;
    float _969 = _967;
    if (!_919)
    {
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _973 = _653 + _971;
        float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _977 = _547 + _975;
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _981 = -_545;
        float _983 = _981 + _927;
        float _985 = _973 * _973;
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _989 = _545 + _987;
        float _991 = fma(_977, _977, _985);
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _995 = fma(_989, _989, _991);
        float _997 = sqrt(_995);
        float _999 = _979 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1001 = precise::min(_997, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1003 = _1001 * _993;
        float _1005 = -_547;
        float _1007 = _1005 + _949;
        float _1009 = -_653;
        float _1011 = _1009 + _921;
        float _1013 = _999 * _1003;
        float _1015 = fma(_1007, _1013, _547);
        float _1017 = fma(_1011, _1013, _653);
        float _1019 = fma(_983, _1013, _545);
        _959 = _1017;
        _969 = _1015;
        _965 = _1019;
    }
    float _1021 = _959;
    float _1023 = _969;
    float _1025 = _965;
    float _1027 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1027);
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1037);
    float _1047 = _963 * _947;
    float _1049 = _1047 * 0.5;
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1039);
    float _1053 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1055 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1057 = _1037;
    if (_945)
    {
        _1057 = 1.0;
    }
    float _1059 = _1057;
    float _1061 = _1059;
    if (!_945)
    {
        float _1063 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1065);
        float _1069 = _1063 * 0.15915493667125701904296875;
        float _1071 = _1069 * 6.283185482025146484375;
        float _1073 = cos(_1071);
        float _1075 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1077 = _1075 * 0.15915493667125701904296875;
        float _1079 = _1069 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = 1.0 / _1073;
        float _1085 = _1077 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1081 * _1083;
        float _1091 = 1.0 / _1067;
        float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1095 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1093;
        float _1097 = _1087 * _1089;
        float _1099 = _1077 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        float _1103 = 1.0 / _1097;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1107 = _1091 * _1105;
        float _1109 = 1.0 / _1095;
        float _1111 = _1101 * _1103;
        float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1115 = fma(_1111, _1107, _1113);
        float _1117 = _1115 * _1109;
        float _1119 = precise::clamp(_1117, 0.0, 1.0);
        _1061 = _1119;
    }
    float _1121 = _1061;
    float _1123 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1127 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1129 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1131 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1133 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1125);
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1127);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1129);
    float _1141 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1131);
    float _1143 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1135);
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1137);
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1139);
    float _1151 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1141);
    bool _1153 = _1121 > 0.0;
    bool _1155 = isnan(_1121);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    float _1163 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1165 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1145);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1169 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1151);
    float _1171 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1149);
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1175 = _1165 + _1169;
    float _1177 = _1171 + _1169;
    float _1179 = _1169 * 0.5;
    float _1181 = _1175 * 0.5;
    float _1183 = _1177 * 0.5;
    float _1185 = fma(_1167, -0.5, _1179);
    out.m_35.x = _1173;
    out.gl_Position.x = _1165;
    out.gl_Position.y = _1167;
    out.gl_Position.z = _1171;
    out.gl_Position.w = _1169;
    out.m_52.x = _1181;
    out.m_52.y = _1185;
    out.m_52.z = _1183;
    out.m_52.w = _1169;
    if (_1161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1187 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1187;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _865 = false;
    bool _461 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1244 = as_type<float>(_87);
        out.gl_Position.z = _1244;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1313 = as_type<float>(_123);
        out.gl_Position.z = _1313;
    }
    if (_115)
    {
        return out;
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = _275 + _281;
    bool _285 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_275);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _275 + _309;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _317 = 1.0 / _307;
    float _319 = 1.0 / _303;
    float _321 = _279 * _313;
    bool _323 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_275);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_295;
    float _337 = _335 + 1.0;
    float _339 = _333 * _337;
    float _341 = _283 * _317;
    bool _343 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_275);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = _311 * _319;
    bool _365 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_275);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _353 * _357;
    float _383 = -_353;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = fma(_379, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _375 * _385;
    float _395 = fma(_389, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = -_375;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = _391 * _393;
    float _407 = _395 * _393;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_361, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _417 = fma(_403, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _419;
    float _423 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _425 = fma(_411, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_413, _381, _415);
    float _429 = fma(_421, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _431 = fma(_417, _381, _423);
    float _433 = fma(_425, _339, _427);
    float _435 = fma(_429, _339, _431);
    float _437 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _433);
    float _439 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _435);
    bool _441 = !_315;
    float _459;
    if (!_441)
    {
        float _443 = in.m_41.x;
        float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _447 = _443 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _451 = _449 * _445;
        float _453 = floor(_451);
        float _455 = -_453;
        float _457 = _451 + _455;
        _459 = _457;
        _461 = true;
    }
    else
    {
        float _463 = float(_71);
        float _465 = 1.0 / _463;
        float _467 = _105 * _465;
        _459 = _467;
    }
    _461 = false;
    float _469 = _459;
    float _471 = as_type<float>(int(gl_VertexIndex));
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _475 = in.m_39.x;
    float _477 = in.m_39.y;
    float _479 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _481 = in.m_41.x;
    float _483 = in.m_41.y;
    int _485 = as_type<int>(_471) & 1;
    bool _487 = _485 != 0;
    int _489 = as_type<int>(_471) & 2;
    bool _491 = _489 != 0;
    float _493 = _437 * _475;
    float _495 = _439 * _477;
    bool _497 = !_491;
    float _499 = _497 ? (-0.5) : 0.5;
    bool _501 = !_487;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = _495 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _507 = _493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _499);
    bool _511 = _481 > 0.5;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _503);
    bool _515 = _483 > 0.5;
    float _517 = _505 * _509;
    float _519 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = _507 * _513;
    float _523 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _531 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
    float _533 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _525);
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _537 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _529);
    float _539 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
    float _541 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _533);
    float _543 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _535);
    float _545 = _537 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _547 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _549 = _541 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _551 = _543 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = _547 + _549;
    float _557 = _545 + _551;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _555 + _563;
    float _567 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _569 = _557 + _567;
    float _571 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _573 = _565 * _565;
    float _575 = _569 * _569;
    float _577 = 1.0 / _561;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _581 = _579 != 0;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    float _587 = _573 + _575;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _591 = _589 != 0;
    float _593 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
    float _595 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _597 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = isnan(_469);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = sqrt(_587);
    float _611 = -_499;
    int _613 = _515 ? as_type<int>(_611) : as_type<int>(_499);
    float _615 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _595);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _469 + _617;
    bool _621 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_469);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_607;
    float _635 = _633 + 1.0;
    float _637 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _615);
    bool _639 = !_591;
    float _641 = _639 ? _499 : as_type<float>(_613);
    float _643 = _585 * _577;
    float _645 = _631 * _635;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _649 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _651 = fma(_643, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _653 = _593 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _655 = -_503;
    float _657 = _511 ? _655 : _503;
    bool _659 = _609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _661 = _653 + _649;
    bool _663 = !_581;
    float _665 = _663 ? _503 : _657;
    float _667 = _651 * _645;
    float _669 = _657;
    float _671 = _503;
    float _673 = _645;
    float _675 = _651;
    float _677 = _499;
    if (!_659)
    {
        _669 = _575;
    }
    float _679 = _669;
    float _681 = _679;
    if (!_659)
    {
        _671 = _573;
    }
    float _683 = _671;
    float _685 = _683;
    if (!_659)
    {
        _673 = _555;
    }
    float _687 = _673;
    float _689 = _687;
    if (!_659)
    {
        _675 = _557;
    }
    float _691 = _675;
    float _693 = _691;
    if (!_659)
    {
        _677 = _661;
    }
    float _695 = _677;
    bool _697 = !_659;
    float _699 = _695;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _705 = _609 + _703;
        float _707 = _661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _709 = rsqrt(_587);
        float _711 = _705 * _701;
        float _713 = _711 * 0.15915493667125701904296875;
        float _715 = _713 * 6.283185482025146484375;
        float _717 = sin(_715);
        float _719 = _713 * 6.283185482025146484375;
        float _721 = cos(_719);
        float _723 = fma(_717, _707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _725 = _709 * _723;
        float _727 = _721 + (-1.0);
        float _729 = fma(_565, _725, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _731 = fma(_569, _725, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _733 = _727 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _737 = _729 + _735;
        float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _741 = _731 + _739;
        float _743 = fma(_661, _721, _733);
        float _745 = _737 * _737;
        float _747 = _741 * _741;
        _699 = _743;
        _685 = _745;
        _681 = _747;
        _693 = _731;
        _689 = _729;
    }
    float _749 = _699;
    float _751 = _685;
    float _753 = _681;
    float _755 = _693;
    float _757 = _689;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _761 = _749 + _759;
    float _763 = -_631;
    float _765 = _763 + 1.0;
    float _767 = _665 + 0.5;
    float _769 = fma(_761, _761, _751);
    float _771 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _775 = _769 + _753;
    float _777 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[116].x, _771);
    float _779 = _773 * _647;
    float _781 = -_641;
    float _783 = _781 + 0.5;
    float _785 = sqrt(_775);
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _789 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _789 * _473;
    float _805 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _779;
    out.m_46.y = _803;
    bool _817 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _819 = isnan(_785);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _825 = _821 || _823;
    out.m_48.x = _809;
    out.m_48.y = _811;
    out.m_48.z = _801;
    out.m_50.x = _805;
    out.m_50.y = _807;
    out.m_50.z = _813;
    out.m_50.w = _815;
    float _827 = _797;
    float _829 = _757;
    if (!_825)
    {
        _827 = 1.0;
    }
    float _831 = _827;
    bool _833 = !_825;
    float _835 = _831;
    if (!_833)
    {
        bool _837 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _839 = isnan(_785);
        bool _841 = _837 || _839;
        bool _843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _845 = _841 || _843;
        if (!_845)
        {
            float _847 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _849 = _785 + _847;
            float _851 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _853 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _851;
            float _855 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _857 = _855 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _859 = 1.0 / _853;
            float _861 = _849 * _859;
            float _863 = fma(_861, _857, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _835 = _863;
            _865 = true;
        }
        else
        {
            bool _867 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _869 = isnan(_785);
            bool _871 = _867 || _869;
            bool _873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _875 = _871 || _873;
            if (!_875)
            {
                float _877 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _879 = _785 + _877;
                float _881 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _883 = _881 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _885 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _887 = _885 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _889 = 1.0 / _883;
                float _891 = _879 * _889;
                float _893 = fma(_891, _887, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _835 = _893;
                _865 = true;
            }
            else
            {
                _835 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _865 = false;
    float _895 = _835;
    float _897 = _653 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _899 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _901 = _749 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _905 = _755 + _903;
    float _907 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _897);
    float _909 = _653 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _911 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _913 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.5);
    bool _919 = _915 || _917;
    float _921 = fma(_901, _895, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _923 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _907);
    float _925 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _909);
    float _927 = fma(_905, _895, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _929 = _923 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _931 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _933 = _757 + _931;
    float _935 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _925);
    bool _937 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _939 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    float _947 = 1.0 / _929;
    float _949 = fma(_933, _895, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _951 = _935 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _953 = _905;
    float _955 = _901;
    if (_919)
    {
        _829 = _921;
    }
    float _957 = _829;
    float _959 = _957;
    if (_919)
    {
        _953 = _927;
    }
    float _961 = _953;
    float _963 = _951 + _929;
    float _965 = _961;
    if (_919)
    {
        _955 = _949;
    }
    float _967 = _955;
    float _969 = _967;
    if (!_919)
    {
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _973 = _653 + _971;
        float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _977 = _547 + _975;
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _981 = -_545;
        float _983 = _981 + _927;
        float _985 = _973 * _973;
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _989 = _545 + _987;
        float _991 = fma(_977, _977, _985);
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _995 = fma(_989, _989, _991);
        float _997 = sqrt(_995);
        float _999 = _979 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1001 = precise::min(_997, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1003 = _1001 * _993;
        float _1005 = -_547;
        float _1007 = _1005 + _949;
        float _1009 = -_653;
        float _1011 = _1009 + _921;
        float _1013 = _999 * _1003;
        float _1015 = fma(_1007, _1013, _547);
        float _1017 = fma(_1011, _1013, _653);
        float _1019 = fma(_983, _1013, _545);
        _959 = _1017;
        _969 = _1015;
        _965 = _1019;
    }
    float _1021 = _959;
    float _1023 = _969;
    float _1025 = _965;
    float _1027 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1027);
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1037);
    float _1047 = _963 * _947;
    float _1049 = _1047 * 0.5;
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1039);
    float _1053 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1055 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1057 = _1037;
    if (_945)
    {
        _1057 = 1.0;
    }
    float _1059 = _1057;
    float _1061 = _1059;
    if (!_945)
    {
        float _1063 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1065);
        float _1069 = _1063 * 0.15915493667125701904296875;
        float _1071 = _1069 * 6.283185482025146484375;
        float _1073 = cos(_1071);
        float _1075 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1077 = _1075 * 0.15915493667125701904296875;
        float _1079 = _1069 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = 1.0 / _1073;
        float _1085 = _1077 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1081 * _1083;
        float _1091 = 1.0 / _1067;
        float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1095 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1093;
        float _1097 = _1087 * _1089;
        float _1099 = _1077 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        float _1103 = 1.0 / _1097;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1107 = _1091 * _1105;
        float _1109 = 1.0 / _1095;
        float _1111 = _1101 * _1103;
        float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1115 = fma(_1111, _1107, _1113);
        float _1117 = _1115 * _1109;
        float _1119 = precise::clamp(_1117, 0.0, 1.0);
        _1061 = _1119;
    }
    float _1121 = _1061;
    float _1123 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1127 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1129 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1131 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1133 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1125);
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1127);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1129);
    float _1141 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1131);
    float _1143 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1135);
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1137);
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1139);
    float _1151 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1141);
    bool _1153 = _1121 > 0.0;
    bool _1155 = isnan(_1121);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    float _1163 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1165 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1145);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1169 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1151);
    float _1171 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1149);
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1175 = _1165 + _1169;
    float _1177 = _1171 + _1169;
    float _1179 = _1169 * 0.5;
    float _1181 = _1175 * 0.5;
    float _1183 = _1177 * 0.5;
    float _1185 = fma(_1167, -0.5, _1179);
    out.m_35.x = _1173;
    out.gl_Position.x = _1165;
    out.gl_Position.y = _1167;
    out.gl_Position.z = _1171;
    out.gl_Position.w = _1169;
    out.m_52.x = _1181;
    out.m_52.y = _1185;
    out.m_52.z = _1183;
    out.m_52.w = _1169;
    if (_1161)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1187 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1187;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _865 = false;
    bool _461 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1244 = as_type<float>(_87);
        out.gl_Position.z = _1244;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1313 = as_type<float>(_123);
        out.gl_Position.z = _1313;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = _275 + _281;
    bool _285 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_275);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _275 + _309;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _317 = 1.0 / _307;
    float _319 = 1.0 / _303;
    float _321 = _279 * _313;
    bool _323 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_275);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_295;
    float _337 = _335 + 1.0;
    float _339 = _333 * _337;
    float _341 = _283 * _317;
    bool _343 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_275);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = _311 * _319;
    bool _365 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_275);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _353 * _357;
    float _383 = -_353;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = fma(_379, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _375 * _385;
    float _395 = fma(_389, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = -_375;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = _391 * _393;
    float _407 = _395 * _393;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_361, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _417 = fma(_403, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _419;
    float _423 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _425 = fma(_411, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_413, _381, _415);
    float _429 = fma(_421, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _431 = fma(_417, _381, _423);
    float _433 = fma(_425, _339, _427);
    float _435 = fma(_429, _339, _431);
    float _437 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _433);
    float _439 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _435);
    bool _441 = !_315;
    float _459;
    if (!_441)
    {
        float _443 = in.m_41.x;
        float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _447 = _443 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _451 = _449 * _445;
        float _453 = floor(_451);
        float _455 = -_453;
        float _457 = _451 + _455;
        _459 = _457;
        _461 = true;
    }
    else
    {
        float _463 = float(_71);
        float _465 = 1.0 / _463;
        float _467 = _105 * _465;
        _459 = _467;
    }
    _461 = false;
    float _469 = _459;
    float _471 = as_type<float>(int(gl_VertexIndex));
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _475 = in.m_39.x;
    float _477 = in.m_39.y;
    float _479 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _481 = in.m_41.x;
    float _483 = in.m_41.y;
    int _485 = as_type<int>(_471) & 1;
    bool _487 = _485 != 0;
    int _489 = as_type<int>(_471) & 2;
    bool _491 = _489 != 0;
    float _493 = _437 * _475;
    float _495 = _439 * _477;
    bool _497 = !_491;
    float _499 = _497 ? (-0.5) : 0.5;
    bool _501 = !_487;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = _495 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _507 = _493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _499);
    bool _511 = _481 > 0.5;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _503);
    bool _515 = _483 > 0.5;
    float _517 = _505 * _509;
    float _519 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = _507 * _513;
    float _523 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _531 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
    float _533 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _525);
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _537 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _529);
    float _539 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
    float _541 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _533);
    float _543 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _535);
    float _545 = _537 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _547 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _549 = _541 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _551 = _543 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = _547 + _549;
    float _557 = _545 + _551;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _555 + _563;
    float _567 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _569 = _557 + _567;
    float _571 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _573 = _565 * _565;
    float _575 = _569 * _569;
    float _577 = 1.0 / _561;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _581 = _579 != 0;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    float _587 = _573 + _575;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _591 = _589 != 0;
    float _593 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
    float _595 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _597 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = isnan(_469);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = sqrt(_587);
    float _611 = -_499;
    int _613 = _515 ? as_type<int>(_611) : as_type<int>(_499);
    float _615 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _595);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _469 + _617;
    bool _621 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_469);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_607;
    float _635 = _633 + 1.0;
    float _637 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _615);
    bool _639 = !_591;
    float _641 = _639 ? _499 : as_type<float>(_613);
    float _643 = _585 * _577;
    float _645 = _631 * _635;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _649 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _651 = fma(_643, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _653 = _593 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _655 = -_503;
    float _657 = _511 ? _655 : _503;
    bool _659 = _609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _661 = _653 + _649;
    bool _663 = !_581;
    float _665 = _663 ? _503 : _657;
    float _667 = _651 * _645;
    float _669 = _657;
    float _671 = _503;
    float _673 = _645;
    float _675 = _651;
    float _677 = _499;
    if (!_659)
    {
        _669 = _575;
    }
    float _679 = _669;
    float _681 = _679;
    if (!_659)
    {
        _671 = _573;
    }
    float _683 = _671;
    float _685 = _683;
    if (!_659)
    {
        _673 = _555;
    }
    float _687 = _673;
    float _689 = _687;
    if (!_659)
    {
        _675 = _557;
    }
    float _691 = _675;
    float _693 = _691;
    if (!_659)
    {
        _677 = _661;
    }
    float _695 = _677;
    bool _697 = !_659;
    float _699 = _695;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _705 = _609 + _703;
        float _707 = _661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _709 = rsqrt(_587);
        float _711 = _705 * _701;
        float _713 = _711 * 0.15915493667125701904296875;
        float _715 = _713 * 6.283185482025146484375;
        float _717 = sin(_715);
        float _719 = _713 * 6.283185482025146484375;
        float _721 = cos(_719);
        float _723 = fma(_717, _707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _725 = _709 * _723;
        float _727 = _721 + (-1.0);
        float _729 = fma(_565, _725, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _731 = fma(_569, _725, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _733 = _727 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _737 = _729 + _735;
        float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _741 = _731 + _739;
        float _743 = fma(_661, _721, _733);
        float _745 = _737 * _737;
        float _747 = _741 * _741;
        _699 = _743;
        _685 = _745;
        _681 = _747;
        _693 = _731;
        _689 = _729;
    }
    float _749 = _699;
    float _751 = _685;
    float _753 = _681;
    float _755 = _693;
    float _757 = _689;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _761 = _749 + _759;
    float _763 = -_631;
    float _765 = _763 + 1.0;
    float _767 = _665 + 0.5;
    float _769 = fma(_761, _761, _751);
    float _771 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _775 = _769 + _753;
    float _777 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[116].x, _771);
    float _779 = _773 * _647;
    float _781 = -_641;
    float _783 = _781 + 0.5;
    float _785 = sqrt(_775);
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _789 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _789 * _473;
    float _805 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _779;
    out.m_46.y = _803;
    bool _817 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _819 = isnan(_785);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _825 = _821 || _823;
    out.m_48.x = _809;
    out.m_48.y = _811;
    out.m_48.z = _801;
    out.m_50.x = _805;
    out.m_50.y = _807;
    out.m_50.z = _813;
    out.m_50.w = _815;
    float _827 = _797;
    float _829 = _757;
    if (!_825)
    {
        _827 = 1.0;
    }
    float _831 = _827;
    bool _833 = !_825;
    float _835 = _831;
    if (!_833)
    {
        bool _837 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _839 = isnan(_785);
        bool _841 = _837 || _839;
        bool _843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _845 = _841 || _843;
        if (!_845)
        {
            float _847 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _849 = _785 + _847;
            float _851 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _853 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _851;
            float _855 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _857 = _855 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _859 = 1.0 / _853;
            float _861 = _849 * _859;
            float _863 = fma(_861, _857, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _835 = _863;
            _865 = true;
        }
        else
        {
            bool _867 = _785 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _869 = isnan(_785);
            bool _871 = _867 || _869;
            bool _873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _875 = _871 || _873;
            if (!_875)
            {
                float _877 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _879 = _785 + _877;
                float _881 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _883 = _881 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _885 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _887 = _885 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _889 = 1.0 / _883;
                float _891 = _879 * _889;
                float _893 = fma(_891, _887, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _835 = _893;
                _865 = true;
            }
            else
            {
                _835 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _865 = false;
    float _895 = _835;
    float _897 = _653 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _899 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _901 = _749 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _905 = _755 + _903;
    float _907 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _897);
    float _909 = _653 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _911 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _913 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.5);
    bool _919 = _915 || _917;
    float _921 = fma(_901, _895, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _923 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _907);
    float _925 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _909);
    float _927 = fma(_905, _895, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _929 = _923 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _931 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _933 = _757 + _931;
    float _935 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _925);
    bool _937 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _939 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    float _947 = 1.0 / _929;
    float _949 = fma(_933, _895, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _951 = _935 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _953 = _905;
    float _955 = _901;
    if (_919)
    {
        _829 = _921;
    }
    float _957 = _829;
    float _959 = _957;
    if (_919)
    {
        _953 = _927;
    }
    float _961 = _953;
    float _963 = _951 + _929;
    float _965 = _961;
    if (_919)
    {
        _955 = _949;
    }
    float _967 = _955;
    float _969 = _967;
    if (!_919)
    {
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _973 = _653 + _971;
        float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _977 = _547 + _975;
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _981 = -_545;
        float _983 = _981 + _927;
        float _985 = _973 * _973;
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _989 = _545 + _987;
        float _991 = fma(_977, _977, _985);
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _995 = fma(_989, _989, _991);
        float _997 = sqrt(_995);
        float _999 = _979 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1001 = precise::min(_997, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1003 = _1001 * _993;
        float _1005 = -_547;
        float _1007 = _1005 + _949;
        float _1009 = -_653;
        float _1011 = _1009 + _921;
        float _1013 = _999 * _1003;
        float _1015 = fma(_1007, _1013, _547);
        float _1017 = fma(_1011, _1013, _653);
        float _1019 = fma(_983, _1013, _545);
        _959 = _1017;
        _969 = _1015;
        _965 = _1019;
    }
    float _1021 = _959;
    float _1023 = _969;
    float _1025 = _965;
    float _1027 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1027);
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1037);
    float _1047 = _963 * _947;
    float _1049 = _1047 * 0.5;
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1039);
    float _1053 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1055 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1057 = _1037;
    if (_945)
    {
        _1057 = 1.0;
    }
    float _1059 = _1057;
    float _1061 = _1059;
    if (!_945)
    {
        float _1063 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1065);
        float _1069 = _1063 * 0.15915493667125701904296875;
        float _1071 = _1069 * 6.283185482025146484375;
        float _1073 = cos(_1071);
        float _1075 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1077 = _1075 * 0.15915493667125701904296875;
        float _1079 = _1069 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = 1.0 / _1073;
        float _1085 = _1077 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1081 * _1083;
        float _1091 = 1.0 / _1067;
        float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1095 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1093;
        float _1097 = _1087 * _1089;
        float _1099 = _1077 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        float _1103 = 1.0 / _1097;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1107 = _1091 * _1105;
        float _1109 = 1.0 / _1095;
        float _1111 = _1101 * _1103;
        float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1115 = fma(_1111, _1107, _1113);
        float _1117 = _1115 * _1109;
        float _1119 = precise::clamp(_1117, 0.0, 1.0);
        _1061 = _1119;
    }
    float _1121 = _1061;
    float _1123 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1127 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1129 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1131 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1133 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1125);
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1127);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1129);
    float _1141 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1131);
    float _1143 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1135);
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1137);
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1139);
    float _1151 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1141);
    bool _1153 = _1121 > 0.0;
    bool _1155 = isnan(_1121);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    float _1163 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1165 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1145);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1169 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1151);
    float _1171 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1149);
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1175 = _1165 + _1169;
    float _1177 = _1171 + _1169;
    float _1179 = _1169 * 0.5;
    float _1181 = _1175 * 0.5;
    float _1183 = _1177 * 0.5;
    float _1185 = fma(_1167, -0.5, _1179);
    out.m_35.x = _1173;
    out.gl_Position.x = _1165;
    out.gl_Position.y = _1167;
    out.gl_Position.z = _1171;
    out.gl_Position.w = _1169;
    out.m_52.x = _1181;
    out.m_52.y = _1185;
    out.m_52.z = _1183;
    out.m_52.w = _1169;
    if (_1161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1187 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1187;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

