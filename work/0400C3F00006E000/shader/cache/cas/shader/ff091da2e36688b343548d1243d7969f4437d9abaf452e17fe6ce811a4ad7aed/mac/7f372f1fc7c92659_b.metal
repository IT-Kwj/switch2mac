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
    float4 m_43 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _995 = false;
    bool _611 = false;
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
        float _1374 = as_type<float>(_87);
        out.gl_Position.z = _1374;
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
        float _1443 = as_type<float>(_123);
        out.gl_Position.z = _1443;
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
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _469 + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = isnan(_469);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _495 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _497 = isnan(_469);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _507;
    bool _511 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_469);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = 1.0 / _477;
    float _525 = -_489;
    float _527 = _525 + 1.0;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _493;
    float _533 = _509 * _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = -_521;
    float _541 = _539 + 1.0;
    float _543 = fma(_533, _473, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = _505 * _527;
    float _547 = -_505;
    float _549 = _547 + 1.0;
    float _551 = _489 * _541;
    float _553 = _537 * _531;
    float _555 = _543 * _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _469 + _557;
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[115].x, _555);
    float _563 = fma(_553, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _567 = fma(_563, _551, _561);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _571 = in.m_39.x;
    float _573 = in.m_39.y;
    float _575 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[117].x, _567);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_43.x = _579;
    out.m_43.y = _581;
    out.m_43.z = _585;
    out.m_43.w = _583;
    float _587 = _439 * _573;
    float _589 = _437 * _571;
    bool _591 = !_529;
    float _609;
    if (!_591)
    {
        float _593 = in.m_41.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_71);
        float _615 = 1.0 / _613;
        float _617 = _105 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = as_type<float>(int(gl_VertexIndex));
    float _623 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _625 = in.m_41.x;
    float _627 = in.m_41.y;
    int _629 = as_type<int>(_621) & 1;
    bool _631 = _629 != 0;
    int _633 = as_type<int>(_621) & 2;
    bool _635 = _633 != 0;
    float _637 = _589 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _641 = _625 > 0.5;
    bool _643 = !_635;
    float _645 = _643 ? (-0.5) : 0.5;
    bool _647 = !_631;
    float _649 = _647 ? (-0.5) : 0.5;
    bool _651 = _627 > 0.5;
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _645);
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _649);
    float _657 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _659 = _623 * _653;
    float _661 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _663 = _637 * _655;
    float _665 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _669 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _661);
    float _673 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[24].x, _667);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _679 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _681 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _673);
    float _683 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _675);
    float _685 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _677);
    float _687 = _679 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _691 = _683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _701 = _689 + _691;
    float _703 = _687 + _693;
    float _705 = 1.0 / _697;
    float _707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _709 = _701 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _703 + _711;
    float _715 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _717 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[25].x, _699);
    float _719 = _709 * _709;
    float _721 = _713 * _713;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _723;
    bool _727 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _729 = isnan(_619);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _715);
    float _741 = _719 + _721;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _619 + _743;
    bool _747 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _749 = isnan(_619);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -_737;
    float _761 = _759 + 1.0;
    float _763 = sqrt(_741);
    float _765 = _725 * _705;
    float _767 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _739);
    float _769 = _757 * _761;
    float _771 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _717);
    float _773 = fma(_765, _745, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _775 = -_757;
    float _777 = _775 + 1.0;
    float _779 = _771 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _781 = _773 * _769;
    float _783 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = -_649;
    float _791 = _641 ? _789 : _649;
    float _793 = _783 + _779;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[131].x, _781);
    bool _801 = _763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _803 = !_787;
    float _805 = _803 ? _649 : _791;
    float _807 = _781;
    float _809 = _777;
    float _811 = _791;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _815 = _649;
    if (!_801)
    {
        _807 = _721;
    }
    float _817 = _807;
    float _819 = _817;
    if (!_801)
    {
        _809 = _719;
    }
    float _821 = _809;
    float _823 = _821;
    if (!_801)
    {
        _811 = _701;
    }
    float _825 = _811;
    float _827 = _825;
    if (!_801)
    {
        _813 = _703;
    }
    float _829 = _813;
    float _831 = _829;
    if (!_801)
    {
        _815 = _793;
    }
    float _833 = _815;
    bool _835 = !_801;
    float _837 = _833;
    if (!_835)
    {
        float _839 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _843 = _763 + _841;
        float _845 = _793 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _847 = rsqrt(_741);
        float _849 = _843 * _839;
        float _851 = _849 * 0.15915493667125701904296875;
        float _853 = _851 * 6.283185482025146484375;
        float _855 = sin(_853);
        float _857 = _851 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = fma(_855, _845, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _863 = _847 * _861;
        float _865 = _859 + (-1.0);
        float _867 = fma(_709, _863, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _869 = fma(_713, _863, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _871 = _865 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _875 = _867 + _873;
        float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _879 = _869 + _877;
        float _881 = fma(_793, _859, _871);
        float _883 = _875 * _875;
        float _885 = _879 * _879;
        _837 = _881;
        _823 = _883;
        _819 = _885;
        _827 = _867;
        _831 = _869;
    }
    float _887 = _837;
    float _889 = _823;
    float _891 = _819;
    float _893 = _827;
    float _895 = _831;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _899 = _887 + _897;
    float _901 = -_645;
    int _903 = _651 ? as_type<int>(_901) : as_type<int>(_645);
    float _905 = _805 + 0.5;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _909 = fma(_899, _899, _889);
    bool _911 = !_797;
    float _913 = _911 ? _645 : as_type<float>(_903);
    float _915 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _917 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[132].x, _799);
    float _919 = _909 + _891;
    float _921 = _915 * _639;
    float _923 = -_913;
    float _925 = _923 + 0.5;
    float _927 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _929 = sqrt(_919);
    float _931 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _939 = _931 * _907;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _921;
    out.m_48.y = _939;
    out.m_50.x = _941;
    out.m_50.y = _943;
    out.m_50.z = _945;
    out.m_50.w = _927;
    bool _947 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _949 = isnan(_929);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _955 = _951 || _953;
    float _957 = _933;
    float _959 = _895;
    if (!_955)
    {
        _957 = 1.0;
    }
    float _961 = _957;
    bool _963 = !_955;
    float _965 = _961;
    if (!_963)
    {
        bool _967 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _969 = isnan(_929);
        bool _971 = _967 || _969;
        bool _973 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _975 = _971 || _973;
        if (!_975)
        {
            float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _979 = _929 + _977;
            float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _983 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _981;
            float _985 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _989 = 1.0 / _983;
            float _991 = _979 * _989;
            float _993 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _965 = _993;
            _995 = true;
        }
        else
        {
            bool _997 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _999 = isnan(_929);
            bool _1001 = _997 || _999;
            bool _1003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1005 = _1001 || _1003;
            if (!_1005)
            {
                float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1009 = _929 + _1007;
                float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1013 = _1011 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1017 = _1015 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1019 = 1.0 / _1013;
                float _1021 = _1009 * _1019;
                float _1023 = fma(_1021, _1017, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _965 = _1023;
                _995 = true;
            }
            else
            {
                _965 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _995 = false;
    float _1025 = _965;
    float _1027 = _783 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1031 = _893 + _1029;
    float _1033 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    bool _1035 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    float _1045 = _783 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1047 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan(0.5);
    bool _1055 = _1051 || _1053;
    float _1057 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1033);
    float _1059 = fma(_1031, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1061 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1045);
    float _1063 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1065 = _887 + _1063;
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1069 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1071 = _895 + _1069;
    float _1073 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1061);
    float _1075 = fma(_1065, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1077 = 1.0 / _1067;
    float _1079 = fma(_1071, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1083 = _1025;
    float _1085 = _1031;
    if (_1043)
    {
        _1083 = _1059;
    }
    float _1087 = _1083;
    float _1089 = _1087;
    if (_1043)
    {
        _1085 = _1075;
    }
    float _1091 = _1085;
    float _1093 = _1081 + _1067;
    float _1095 = _1091;
    if (_1043)
    {
        _959 = _1079;
    }
    float _1097 = _959;
    float _1099 = _1097;
    if (!_1043)
    {
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1103 = _783 + _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1107 = _689 + _1105;
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1111 = -_687;
        float _1113 = _1111 + _1079;
        float _1115 = _1103 * _1103;
        float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1119 = _687 + _1117;
        float _1121 = fma(_1107, _1107, _1115);
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1125 = fma(_1119, _1119, _1121);
        float _1127 = sqrt(_1125);
        float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1131 = precise::min(_1127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1133 = _1131 * _1123;
        float _1135 = -_689;
        float _1137 = _1135 + _1059;
        float _1139 = -_783;
        float _1141 = _1139 + _1075;
        float _1143 = _1129 * _1133;
        float _1145 = fma(_1137, _1143, _689);
        float _1147 = fma(_1141, _1143, _783);
        float _1149 = fma(_1113, _1143, _687);
        _1095 = _1147;
        _1089 = _1145;
        _1099 = _1149;
    }
    float _1151 = _1095;
    float _1153 = _1089;
    float _1155 = _1099;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1165 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1157);
    float _1167 = _1093 * _1077;
    float _1169 = _1167 * 0.5;
    float _1171 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1161);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1163);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1179 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1173);
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1175);
    float _1185 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1187 = _1171;
    if (_1055)
    {
        _1187 = 1.0;
    }
    float _1189 = _1187;
    float _1191 = _1189;
    if (!_1055)
    {
        float _1193 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1197 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1195);
        float _1199 = _1193 * 0.15915493667125701904296875;
        float _1201 = _1199 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1207 = _1205 * 0.15915493667125701904296875;
        float _1209 = _1199 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = 1.0 / _1203;
        float _1215 = _1207 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1211 * _1213;
        float _1221 = 1.0 / _1197;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1225 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1223;
        float _1227 = _1217 * _1219;
        float _1229 = _1207 * 6.283185482025146484375;
        float _1231 = sin(_1229);
        float _1233 = 1.0 / _1227;
        float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1237 = _1221 * _1235;
        float _1239 = 1.0 / _1225;
        float _1241 = _1231 * _1233;
        float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1245 = fma(_1241, _1237, _1243);
        float _1247 = _1245 * _1239;
        float _1249 = precise::clamp(_1247, 0.0, 1.0);
        _1191 = _1249;
    }
    float _1251 = _1191;
    float _1253 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1257 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1261 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1263 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1255);
    float _1267 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1257);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1259);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1261);
    float _1273 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1267);
    float _1279 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1269);
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1271);
    bool _1283 = _1251 > 0.0;
    bool _1285 = isnan(_1251);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    float _1293 = _1251 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1295 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1275);
    float _1297 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1277);
    float _1299 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1281);
    float _1301 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1303 = _1293 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1305 = _1295 + _1299;
    float _1307 = _1301 + _1299;
    float _1309 = _1299 * 0.5;
    float _1311 = _1305 * 0.5;
    float _1313 = _1307 * 0.5;
    float _1315 = fma(_1297, -0.5, _1309);
    out.m_35.x = _1303;
    out.gl_Position.x = _1295;
    out.gl_Position.y = _1297;
    out.gl_Position.z = _1301;
    out.gl_Position.w = _1299;
    out.m_52.x = _1311;
    out.m_52.y = _1315;
    out.m_52.z = _1313;
    out.m_52.w = _1299;
    if (_1291)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1317;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _995 = false;
    bool _611 = false;
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
        float _1374 = as_type<float>(_87);
        out.gl_Position.z = _1374;
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
        float _1443 = as_type<float>(_123);
        out.gl_Position.z = _1443;
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
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _469 + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = isnan(_469);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _495 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _497 = isnan(_469);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _507;
    bool _511 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_469);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = 1.0 / _477;
    float _525 = -_489;
    float _527 = _525 + 1.0;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _493;
    float _533 = _509 * _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = -_521;
    float _541 = _539 + 1.0;
    float _543 = fma(_533, _473, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = _505 * _527;
    float _547 = -_505;
    float _549 = _547 + 1.0;
    float _551 = _489 * _541;
    float _553 = _537 * _531;
    float _555 = _543 * _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _469 + _557;
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[115].x, _555);
    float _563 = fma(_553, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _567 = fma(_563, _551, _561);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _571 = in.m_39.x;
    float _573 = in.m_39.y;
    float _575 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[117].x, _567);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_43.x = _579;
    out.m_43.y = _581;
    out.m_43.z = _585;
    out.m_43.w = _583;
    float _587 = _439 * _573;
    float _589 = _437 * _571;
    bool _591 = !_529;
    float _609;
    if (!_591)
    {
        float _593 = in.m_41.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_71);
        float _615 = 1.0 / _613;
        float _617 = _105 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = as_type<float>(int(gl_VertexIndex));
    float _623 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _625 = in.m_41.x;
    float _627 = in.m_41.y;
    int _629 = as_type<int>(_621) & 1;
    bool _631 = _629 != 0;
    int _633 = as_type<int>(_621) & 2;
    bool _635 = _633 != 0;
    float _637 = _589 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _641 = _625 > 0.5;
    bool _643 = !_635;
    float _645 = _643 ? (-0.5) : 0.5;
    bool _647 = !_631;
    float _649 = _647 ? (-0.5) : 0.5;
    bool _651 = _627 > 0.5;
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _645);
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _649);
    float _657 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _659 = _623 * _653;
    float _661 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _663 = _637 * _655;
    float _665 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _669 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _661);
    float _673 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[24].x, _667);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _679 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _681 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _673);
    float _683 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _675);
    float _685 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _677);
    float _687 = _679 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _691 = _683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _701 = _689 + _691;
    float _703 = _687 + _693;
    float _705 = 1.0 / _697;
    float _707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _709 = _701 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _703 + _711;
    float _715 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _717 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[25].x, _699);
    float _719 = _709 * _709;
    float _721 = _713 * _713;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _723;
    bool _727 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _729 = isnan(_619);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _715);
    float _741 = _719 + _721;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _619 + _743;
    bool _747 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _749 = isnan(_619);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -_737;
    float _761 = _759 + 1.0;
    float _763 = sqrt(_741);
    float _765 = _725 * _705;
    float _767 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _739);
    float _769 = _757 * _761;
    float _771 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _717);
    float _773 = fma(_765, _745, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _775 = -_757;
    float _777 = _775 + 1.0;
    float _779 = _771 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _781 = _773 * _769;
    float _783 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = -_649;
    float _791 = _641 ? _789 : _649;
    float _793 = _783 + _779;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[131].x, _781);
    bool _801 = _763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _803 = !_787;
    float _805 = _803 ? _649 : _791;
    float _807 = _781;
    float _809 = _777;
    float _811 = _791;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _815 = _649;
    if (!_801)
    {
        _807 = _721;
    }
    float _817 = _807;
    float _819 = _817;
    if (!_801)
    {
        _809 = _719;
    }
    float _821 = _809;
    float _823 = _821;
    if (!_801)
    {
        _811 = _701;
    }
    float _825 = _811;
    float _827 = _825;
    if (!_801)
    {
        _813 = _703;
    }
    float _829 = _813;
    float _831 = _829;
    if (!_801)
    {
        _815 = _793;
    }
    float _833 = _815;
    bool _835 = !_801;
    float _837 = _833;
    if (!_835)
    {
        float _839 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _843 = _763 + _841;
        float _845 = _793 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _847 = rsqrt(_741);
        float _849 = _843 * _839;
        float _851 = _849 * 0.15915493667125701904296875;
        float _853 = _851 * 6.283185482025146484375;
        float _855 = sin(_853);
        float _857 = _851 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = fma(_855, _845, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _863 = _847 * _861;
        float _865 = _859 + (-1.0);
        float _867 = fma(_709, _863, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _869 = fma(_713, _863, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _871 = _865 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _875 = _867 + _873;
        float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _879 = _869 + _877;
        float _881 = fma(_793, _859, _871);
        float _883 = _875 * _875;
        float _885 = _879 * _879;
        _837 = _881;
        _823 = _883;
        _819 = _885;
        _827 = _867;
        _831 = _869;
    }
    float _887 = _837;
    float _889 = _823;
    float _891 = _819;
    float _893 = _827;
    float _895 = _831;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _899 = _887 + _897;
    float _901 = -_645;
    int _903 = _651 ? as_type<int>(_901) : as_type<int>(_645);
    float _905 = _805 + 0.5;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _909 = fma(_899, _899, _889);
    bool _911 = !_797;
    float _913 = _911 ? _645 : as_type<float>(_903);
    float _915 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _917 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[132].x, _799);
    float _919 = _909 + _891;
    float _921 = _915 * _639;
    float _923 = -_913;
    float _925 = _923 + 0.5;
    float _927 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _929 = sqrt(_919);
    float _931 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _939 = _931 * _907;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _921;
    out.m_48.y = _939;
    out.m_50.x = _941;
    out.m_50.y = _943;
    out.m_50.z = _945;
    out.m_50.w = _927;
    bool _947 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _949 = isnan(_929);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _955 = _951 || _953;
    float _957 = _933;
    float _959 = _895;
    if (!_955)
    {
        _957 = 1.0;
    }
    float _961 = _957;
    bool _963 = !_955;
    float _965 = _961;
    if (!_963)
    {
        bool _967 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _969 = isnan(_929);
        bool _971 = _967 || _969;
        bool _973 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _975 = _971 || _973;
        if (!_975)
        {
            float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _979 = _929 + _977;
            float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _983 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _981;
            float _985 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _989 = 1.0 / _983;
            float _991 = _979 * _989;
            float _993 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _965 = _993;
            _995 = true;
        }
        else
        {
            bool _997 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _999 = isnan(_929);
            bool _1001 = _997 || _999;
            bool _1003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1005 = _1001 || _1003;
            if (!_1005)
            {
                float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1009 = _929 + _1007;
                float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1013 = _1011 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1017 = _1015 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1019 = 1.0 / _1013;
                float _1021 = _1009 * _1019;
                float _1023 = fma(_1021, _1017, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _965 = _1023;
                _995 = true;
            }
            else
            {
                _965 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _995 = false;
    float _1025 = _965;
    float _1027 = _783 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1031 = _893 + _1029;
    float _1033 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    bool _1035 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    float _1045 = _783 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1047 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan(0.5);
    bool _1055 = _1051 || _1053;
    float _1057 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1033);
    float _1059 = fma(_1031, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1061 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1045);
    float _1063 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1065 = _887 + _1063;
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1069 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1071 = _895 + _1069;
    float _1073 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1061);
    float _1075 = fma(_1065, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1077 = 1.0 / _1067;
    float _1079 = fma(_1071, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1083 = _1025;
    float _1085 = _1031;
    if (_1043)
    {
        _1083 = _1059;
    }
    float _1087 = _1083;
    float _1089 = _1087;
    if (_1043)
    {
        _1085 = _1075;
    }
    float _1091 = _1085;
    float _1093 = _1081 + _1067;
    float _1095 = _1091;
    if (_1043)
    {
        _959 = _1079;
    }
    float _1097 = _959;
    float _1099 = _1097;
    if (!_1043)
    {
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1103 = _783 + _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1107 = _689 + _1105;
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1111 = -_687;
        float _1113 = _1111 + _1079;
        float _1115 = _1103 * _1103;
        float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1119 = _687 + _1117;
        float _1121 = fma(_1107, _1107, _1115);
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1125 = fma(_1119, _1119, _1121);
        float _1127 = sqrt(_1125);
        float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1131 = precise::min(_1127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1133 = _1131 * _1123;
        float _1135 = -_689;
        float _1137 = _1135 + _1059;
        float _1139 = -_783;
        float _1141 = _1139 + _1075;
        float _1143 = _1129 * _1133;
        float _1145 = fma(_1137, _1143, _689);
        float _1147 = fma(_1141, _1143, _783);
        float _1149 = fma(_1113, _1143, _687);
        _1095 = _1147;
        _1089 = _1145;
        _1099 = _1149;
    }
    float _1151 = _1095;
    float _1153 = _1089;
    float _1155 = _1099;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1165 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1157);
    float _1167 = _1093 * _1077;
    float _1169 = _1167 * 0.5;
    float _1171 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1161);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1163);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1179 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1173);
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1175);
    float _1185 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1187 = _1171;
    if (_1055)
    {
        _1187 = 1.0;
    }
    float _1189 = _1187;
    float _1191 = _1189;
    if (!_1055)
    {
        float _1193 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1197 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1195);
        float _1199 = _1193 * 0.15915493667125701904296875;
        float _1201 = _1199 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1207 = _1205 * 0.15915493667125701904296875;
        float _1209 = _1199 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = 1.0 / _1203;
        float _1215 = _1207 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1211 * _1213;
        float _1221 = 1.0 / _1197;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1225 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1223;
        float _1227 = _1217 * _1219;
        float _1229 = _1207 * 6.283185482025146484375;
        float _1231 = sin(_1229);
        float _1233 = 1.0 / _1227;
        float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1237 = _1221 * _1235;
        float _1239 = 1.0 / _1225;
        float _1241 = _1231 * _1233;
        float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1245 = fma(_1241, _1237, _1243);
        float _1247 = _1245 * _1239;
        float _1249 = precise::clamp(_1247, 0.0, 1.0);
        _1191 = _1249;
    }
    float _1251 = _1191;
    float _1253 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1257 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1261 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1263 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1255);
    float _1267 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1257);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1259);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1261);
    float _1273 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1267);
    float _1279 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1269);
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1271);
    bool _1283 = _1251 > 0.0;
    bool _1285 = isnan(_1251);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    float _1293 = _1251 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1295 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1275);
    float _1297 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1277);
    float _1299 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1281);
    float _1301 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1303 = _1293 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1305 = _1295 + _1299;
    float _1307 = _1301 + _1299;
    float _1309 = _1299 * 0.5;
    float _1311 = _1305 * 0.5;
    float _1313 = _1307 * 0.5;
    float _1315 = fma(_1297, -0.5, _1309);
    out.m_35.x = _1303;
    out.gl_Position.x = _1295;
    out.gl_Position.y = _1297;
    out.gl_Position.z = _1301;
    out.gl_Position.w = _1299;
    out.m_52.x = _1311;
    out.m_52.y = _1315;
    out.m_52.z = _1313;
    out.m_52.w = _1299;
    if (_1291)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1317;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _995 = false;
    bool _611 = false;
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
        float _1374 = as_type<float>(_87);
        out.gl_Position.z = _1374;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1443 = as_type<float>(_123);
        out.gl_Position.z = _1443;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _469 + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = isnan(_469);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _495 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _497 = isnan(_469);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _507;
    bool _511 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_469);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = 1.0 / _477;
    float _525 = -_489;
    float _527 = _525 + 1.0;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _493;
    float _533 = _509 * _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = -_521;
    float _541 = _539 + 1.0;
    float _543 = fma(_533, _473, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = _505 * _527;
    float _547 = -_505;
    float _549 = _547 + 1.0;
    float _551 = _489 * _541;
    float _553 = _537 * _531;
    float _555 = _543 * _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _469 + _557;
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[115].x, _555);
    float _563 = fma(_553, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _567 = fma(_563, _551, _561);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _571 = in.m_39.x;
    float _573 = in.m_39.y;
    float _575 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[117].x, _567);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_43.x = _579;
    out.m_43.y = _581;
    out.m_43.z = _585;
    out.m_43.w = _583;
    float _587 = _439 * _573;
    float _589 = _437 * _571;
    bool _591 = !_529;
    float _609;
    if (!_591)
    {
        float _593 = in.m_41.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_71);
        float _615 = 1.0 / _613;
        float _617 = _105 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = as_type<float>(int(gl_VertexIndex));
    float _623 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _625 = in.m_41.x;
    float _627 = in.m_41.y;
    int _629 = as_type<int>(_621) & 1;
    bool _631 = _629 != 0;
    int _633 = as_type<int>(_621) & 2;
    bool _635 = _633 != 0;
    float _637 = _589 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _641 = _625 > 0.5;
    bool _643 = !_635;
    float _645 = _643 ? (-0.5) : 0.5;
    bool _647 = !_631;
    float _649 = _647 ? (-0.5) : 0.5;
    bool _651 = _627 > 0.5;
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _645);
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _649);
    float _657 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _659 = _623 * _653;
    float _661 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _663 = _637 * _655;
    float _665 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _669 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _661);
    float _673 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[24].x, _667);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _679 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _681 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _673);
    float _683 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _675);
    float _685 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _677);
    float _687 = _679 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _691 = _683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _701 = _689 + _691;
    float _703 = _687 + _693;
    float _705 = 1.0 / _697;
    float _707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _709 = _701 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _703 + _711;
    float _715 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _717 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[25].x, _699);
    float _719 = _709 * _709;
    float _721 = _713 * _713;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _723;
    bool _727 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _729 = isnan(_619);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _715);
    float _741 = _719 + _721;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _619 + _743;
    bool _747 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _749 = isnan(_619);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -_737;
    float _761 = _759 + 1.0;
    float _763 = sqrt(_741);
    float _765 = _725 * _705;
    float _767 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _739);
    float _769 = _757 * _761;
    float _771 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _717);
    float _773 = fma(_765, _745, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _775 = -_757;
    float _777 = _775 + 1.0;
    float _779 = _771 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _781 = _773 * _769;
    float _783 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = -_649;
    float _791 = _641 ? _789 : _649;
    float _793 = _783 + _779;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[131].x, _781);
    bool _801 = _763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _803 = !_787;
    float _805 = _803 ? _649 : _791;
    float _807 = _781;
    float _809 = _777;
    float _811 = _791;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _815 = _649;
    if (!_801)
    {
        _807 = _721;
    }
    float _817 = _807;
    float _819 = _817;
    if (!_801)
    {
        _809 = _719;
    }
    float _821 = _809;
    float _823 = _821;
    if (!_801)
    {
        _811 = _701;
    }
    float _825 = _811;
    float _827 = _825;
    if (!_801)
    {
        _813 = _703;
    }
    float _829 = _813;
    float _831 = _829;
    if (!_801)
    {
        _815 = _793;
    }
    float _833 = _815;
    bool _835 = !_801;
    float _837 = _833;
    if (!_835)
    {
        float _839 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _843 = _763 + _841;
        float _845 = _793 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _847 = rsqrt(_741);
        float _849 = _843 * _839;
        float _851 = _849 * 0.15915493667125701904296875;
        float _853 = _851 * 6.283185482025146484375;
        float _855 = sin(_853);
        float _857 = _851 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = fma(_855, _845, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _863 = _847 * _861;
        float _865 = _859 + (-1.0);
        float _867 = fma(_709, _863, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _869 = fma(_713, _863, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _871 = _865 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _875 = _867 + _873;
        float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _879 = _869 + _877;
        float _881 = fma(_793, _859, _871);
        float _883 = _875 * _875;
        float _885 = _879 * _879;
        _837 = _881;
        _823 = _883;
        _819 = _885;
        _827 = _867;
        _831 = _869;
    }
    float _887 = _837;
    float _889 = _823;
    float _891 = _819;
    float _893 = _827;
    float _895 = _831;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _899 = _887 + _897;
    float _901 = -_645;
    int _903 = _651 ? as_type<int>(_901) : as_type<int>(_645);
    float _905 = _805 + 0.5;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _909 = fma(_899, _899, _889);
    bool _911 = !_797;
    float _913 = _911 ? _645 : as_type<float>(_903);
    float _915 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _917 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[132].x, _799);
    float _919 = _909 + _891;
    float _921 = _915 * _639;
    float _923 = -_913;
    float _925 = _923 + 0.5;
    float _927 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _929 = sqrt(_919);
    float _931 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _939 = _931 * _907;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _921;
    out.m_48.y = _939;
    out.m_50.x = _941;
    out.m_50.y = _943;
    out.m_50.z = _945;
    out.m_50.w = _927;
    bool _947 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _949 = isnan(_929);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _955 = _951 || _953;
    float _957 = _933;
    float _959 = _895;
    if (!_955)
    {
        _957 = 1.0;
    }
    float _961 = _957;
    bool _963 = !_955;
    float _965 = _961;
    if (!_963)
    {
        bool _967 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _969 = isnan(_929);
        bool _971 = _967 || _969;
        bool _973 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _975 = _971 || _973;
        if (!_975)
        {
            float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _979 = _929 + _977;
            float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _983 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _981;
            float _985 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _989 = 1.0 / _983;
            float _991 = _979 * _989;
            float _993 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _965 = _993;
            _995 = true;
        }
        else
        {
            bool _997 = _929 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _999 = isnan(_929);
            bool _1001 = _997 || _999;
            bool _1003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1005 = _1001 || _1003;
            if (!_1005)
            {
                float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1009 = _929 + _1007;
                float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1013 = _1011 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1017 = _1015 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1019 = 1.0 / _1013;
                float _1021 = _1009 * _1019;
                float _1023 = fma(_1021, _1017, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _965 = _1023;
                _995 = true;
            }
            else
            {
                _965 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _995 = false;
    float _1025 = _965;
    float _1027 = _783 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1031 = _893 + _1029;
    float _1033 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    bool _1035 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    float _1045 = _783 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1047 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan(0.5);
    bool _1055 = _1051 || _1053;
    float _1057 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1033);
    float _1059 = fma(_1031, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1061 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1045);
    float _1063 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1065 = _887 + _1063;
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1069 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1071 = _895 + _1069;
    float _1073 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1061);
    float _1075 = fma(_1065, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1077 = 1.0 / _1067;
    float _1079 = fma(_1071, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1083 = _1025;
    float _1085 = _1031;
    if (_1043)
    {
        _1083 = _1059;
    }
    float _1087 = _1083;
    float _1089 = _1087;
    if (_1043)
    {
        _1085 = _1075;
    }
    float _1091 = _1085;
    float _1093 = _1081 + _1067;
    float _1095 = _1091;
    if (_1043)
    {
        _959 = _1079;
    }
    float _1097 = _959;
    float _1099 = _1097;
    if (!_1043)
    {
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1103 = _783 + _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1107 = _689 + _1105;
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1111 = -_687;
        float _1113 = _1111 + _1079;
        float _1115 = _1103 * _1103;
        float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1119 = _687 + _1117;
        float _1121 = fma(_1107, _1107, _1115);
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1125 = fma(_1119, _1119, _1121);
        float _1127 = sqrt(_1125);
        float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1131 = precise::min(_1127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1133 = _1131 * _1123;
        float _1135 = -_689;
        float _1137 = _1135 + _1059;
        float _1139 = -_783;
        float _1141 = _1139 + _1075;
        float _1143 = _1129 * _1133;
        float _1145 = fma(_1137, _1143, _689);
        float _1147 = fma(_1141, _1143, _783);
        float _1149 = fma(_1113, _1143, _687);
        _1095 = _1147;
        _1089 = _1145;
        _1099 = _1149;
    }
    float _1151 = _1095;
    float _1153 = _1089;
    float _1155 = _1099;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1165 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1157);
    float _1167 = _1093 * _1077;
    float _1169 = _1167 * 0.5;
    float _1171 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1161);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1163);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1179 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1173);
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1175);
    float _1185 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1187 = _1171;
    if (_1055)
    {
        _1187 = 1.0;
    }
    float _1189 = _1187;
    float _1191 = _1189;
    if (!_1055)
    {
        float _1193 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1197 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1195);
        float _1199 = _1193 * 0.15915493667125701904296875;
        float _1201 = _1199 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1207 = _1205 * 0.15915493667125701904296875;
        float _1209 = _1199 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = 1.0 / _1203;
        float _1215 = _1207 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1211 * _1213;
        float _1221 = 1.0 / _1197;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1225 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1223;
        float _1227 = _1217 * _1219;
        float _1229 = _1207 * 6.283185482025146484375;
        float _1231 = sin(_1229);
        float _1233 = 1.0 / _1227;
        float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1237 = _1221 * _1235;
        float _1239 = 1.0 / _1225;
        float _1241 = _1231 * _1233;
        float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1245 = fma(_1241, _1237, _1243);
        float _1247 = _1245 * _1239;
        float _1249 = precise::clamp(_1247, 0.0, 1.0);
        _1191 = _1249;
    }
    float _1251 = _1191;
    float _1253 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1257 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1261 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1263 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1255);
    float _1267 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1257);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1259);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1261);
    float _1273 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1267);
    float _1279 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1269);
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1271);
    bool _1283 = _1251 > 0.0;
    bool _1285 = isnan(_1251);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    float _1293 = _1251 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1295 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1275);
    float _1297 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1277);
    float _1299 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1281);
    float _1301 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1303 = _1293 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1305 = _1295 + _1299;
    float _1307 = _1301 + _1299;
    float _1309 = _1299 * 0.5;
    float _1311 = _1305 * 0.5;
    float _1313 = _1307 * 0.5;
    float _1315 = fma(_1297, -0.5, _1309);
    out.m_35.x = _1303;
    out.gl_Position.x = _1295;
    out.gl_Position.y = _1297;
    out.gl_Position.z = _1301;
    out.gl_Position.w = _1299;
    out.m_52.x = _1311;
    out.m_52.y = _1315;
    out.m_52.z = _1313;
    out.m_52.w = _1299;
    if (_1291)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1317;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

