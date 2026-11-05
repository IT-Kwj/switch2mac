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
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _439 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1144 = as_type<float>(_85);
        out.gl_Position.z = _1144;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1213 = as_type<float>(_121);
        out.gl_Position.z = _1213;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _291 + _309;
    bool _313 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_291);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _331;
    bool _339 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_291);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _323 * _335;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _359 = _349 * _355;
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _311 * _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = fma(_373, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _295 * _361;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = in.m_40.x;
    float _393 = in.m_40.y;
    float _395 = fma(_365, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _395 * _359;
    float _401 = _397 * _359;
    float _403 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _405 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _407 = fma(_383, _351, _403);
    float _409 = fma(_381, _351, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _391;
    float _417 = _413 * _393;
    bool _419 = !_357;
    float _437;
    if (!_419)
    {
        float _421 = in.m_42.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_69);
        float _443 = 1.0 / _441;
        float _445 = _103 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = in.m_42.x;
    float _451 = in.m_42.y;
    float _453 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _467 = 1.0 / _459;
    float _469 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _471 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _463;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _483 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _485 = isnan(_447);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _497 = _495 != 0;
    bool _499 = _449 > 0.5;
    float _501 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _503 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _505 = isnan(_447);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _481;
    bool _517 = _451 > 0.5;
    float _519 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _521;
    float _525 = -_513;
    float _527 = _525 + 1.0;
    bool _529 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = isnan(_447);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
    float _543 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _545 = _493 * _527;
    float _547 = _523 * _467;
    float _549 = -_493;
    float _551 = _549 + 1.0;
    bool _553 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _555 = isnan(_447);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _447 + _565;
    float _569 = -_539;
    float _571 = _569 + 1.0;
    float _573 = _539 * _551;
    float _575 = fma(_547, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _581 = _563 * _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _583;
    float _587 = _543 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _589 = _579 * _477;
    float _591 = _575 * _581;
    float _593 = _585 * _515;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _447 + _595;
    float _599 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _603 = _587 + _601;
    float _605 = -_563;
    float _607 = _605 + 1.0;
    float _609 = fma(_589, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _613 = _599 + _611;
    float _615 = _603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _617 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[115].x, _591);
    float _619 = -_177;
    int _621 = _499 ? as_type<int>(_619) : as_type<int>(_177);
    float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _625 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[28].x, _615);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _629 = _447 + _627;
    float _631 = _471 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _633 = !_475;
    float _635 = _633 ? _177 : as_type<float>(_621);
    float _637 = fma(_609, _573, _617);
    float _639 = -_181;
    int _641 = _517 ? as_type<int>(_639) : as_type<int>(_181);
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _645 = _631 + _643;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _649 = _635 + 0.5;
    bool _651 = !_497;
    float _653 = _651 ? _181 : as_type<float>(_641);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[28].z, _625);
    float _657 = fma(_593, _629, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _661 = -_653;
    float _663 = _661 + 0.5;
    bool _665 = _655 >= 0.0;
    float _667 = _659 * _623;
    float _669 = fma(_657, _545, _637);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _673 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[118].x, _669);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = _657;
    float _683 = _545;
    float _685 = _593;
    if (_665)
    {
        _681 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _687 = _681;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = _671 * _647;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _699 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _713 = as_type<int>(_687);
    float _715 = _647;
    int _717 = as_type<int>(_703);
    if (_665)
    {
        float _719 = _687 * 5.0;
        _713 = as_type<int>(_719);
    }
    int _721 = _713;
    out.m_44.x = _699;
    out.m_44.y = _701;
    out.m_44.z = _703;
    out.m_44.w = _697;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _725 = _723 != 0;
    out.m_46.x = _667;
    out.m_46.y = _695;
    out.m_48.x = _705;
    out.m_48.y = _707;
    out.m_48.z = _709;
    out.m_48.w = _711;
    if (_665)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_721);
        out.gl_Position.z = _2207;
    }
    if (!_725)
    {
        _683 = 0.0;
    }
    float _727 = _683;
    float _729 = _727;
    if (!_725)
    {
        _685 = 0.0;
    }
    float _731 = _685;
    float _733 = _731;
    if (!_725)
    {
        _715 = 0.0;
    }
    float _735 = _715;
    bool _737 = !_725;
    float _739 = _735;
    if (!_737)
    {
        float _741 = -_587;
        float _743 = _741 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _745 = -_599;
        float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _749 = -_631;
        float _751 = _749 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _753 = _743 * _743;
        float _755 = fma(_747, _747, _753);
        float _757 = fma(_751, _751, _755);
        float _759 = rsqrt(_757);
        float _761 = _759 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _763 = _747 * _761;
        float _765 = _743 * _761;
        float _767 = _751 * _761;
        _733 = _765;
        _729 = _763;
        _739 = _767;
    }
    float _769 = _733;
    float _771 = _729;
    float _773 = _739;
    if (_665)
    {
        out.m_33.x = 0.0;
    }
    if (_665)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _775 = _587 + _769;
    float _777 = _599 + _771;
    float _779 = _631 + _773;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _783 = _775 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _787 = _777 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _791 = _779 + _789;
    float _793 = _783 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[28].x, _793);
    float _797 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[28].z, _795);
    bool _799 = _797 >= 0.0;
    float _801 = _787;
    if (_799)
    {
        _801 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _803 = _801;
    if (_799)
    {
        out.m_33.x = 0.0;
    }
    if (_799)
    {
        float _805 = _803 * 5.0;
        _717 = as_type<int>(_805);
    }
    int _807 = _717;
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2359 = as_type<float>(_807);
        out.gl_Position.z = _2359;
    }
    if (_799)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _809 = -_587;
    float _811 = _809 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _813 = -_599;
    float _815 = _813 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _817 = -_631;
    float _819 = _817 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _821 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _823 = _811 * _811;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _829 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _831 = fma(_815, _815, _823);
    float _833 = _825 * _821;
    float _835 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _837 = fma(_819, _819, _831);
    float _839 = _827 * _835;
    float _841 = rsqrt(_837);
    float _843 = _815 * _841;
    float _845 = _819 * _841;
    float _847 = _811 * _841;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _851 = _843 * _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _855 = _845 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _859 = -_851;
    float _861 = fma(_845, _857, _859);
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _865 = _847 * _863;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _869 = -_855;
    float _871 = fma(_847, _867, _869);
    float _873 = _861 * _861;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _877 = -_865;
    float _879 = fma(_843, _875, _877);
    float _881 = fma(_871, _871, _873);
    float _883 = fma(_879, _879, _881);
    float _885 = rsqrt(_883);
    float _887 = _871 * _885;
    float _889 = _861 * _885;
    float _891 = _879 * _885;
    float _893 = _887 * _847;
    float _895 = _889 * _845;
    float _897 = -_893;
    float _899 = fma(_889, _843, _897);
    float _901 = -_895;
    float _903 = fma(_891, _847, _901);
    float _905 = _833 * _899;
    float _907 = _833 * _903;
    float _909 = fma(_839, _891, _905);
    float _911 = fma(_839, _887, _907);
    float _913 = _891 * _843;
    float _915 = fma(_829, _845, _909);
    float _917 = fma(_829, _843, _911);
    float _919 = -_913;
    float _921 = fma(_887, _845, _919);
    float _923 = _631 + _915;
    float _925 = _599 + _917;
    float _927 = _833 * _921;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _931 = _923 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _935 = _925 + _933;
    float _937 = fma(_839, _889, _927);
    float _939 = _931 * _931;
    float _941 = fma(_829, _847, _937);
    float _943 = fma(_935, _935, _939);
    float _945 = _587 + _941;
    float _947 = sqrt(_943);
    bool _949 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _951 = _941;
    float _953 = _839;
    float _955 = _939;
    if (!_949)
    {
        _951 = _925;
    }
    float _957 = _951;
    float _959 = _957;
    if (!_949)
    {
        _953 = _923;
    }
    float _961 = _953;
    float _963 = _961;
    if (!_949)
    {
        _955 = _945;
    }
    float _965 = _955;
    bool _967 = !_949;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _947 + _973;
        float _977 = _945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_943);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = sin(_989);
        float _993 = _987 + (-1.0);
        float _995 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = fma(_991, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _999 = fma(_945, _987, _995);
        float _1001 = _979 * _997;
        float _1003 = fma(_935, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1005 = fma(_931, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _969 = _999;
        _959 = _1003;
        _963 = _1005;
    }
    float _1007 = _969;
    float _1009 = _959;
    float _1011 = _963;
    float _1013 = _769 + _1007;
    float _1015 = _771 + _1009;
    float _1017 = _773 + _1011;
    float _1019 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1021 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1025 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1019);
    float _1029 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1021);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1023);
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1025);
    float _1035 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1027);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1029);
    float _1039 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1031);
    float _1041 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1033);
    float _1043 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1045 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1051 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1053 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1055 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1059 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1051);
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1053);
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1055);
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1057);
    float _1067 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1059);
    float _1069 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1061);
    float _1071 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1063);
    float _1073 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1065);
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1067);
    float _1077 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1069);
    float _1079 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1071);
    float _1081 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1073);
    float _1083 = _1075 + _1077;
    float _1085 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1087 = _1083 * 0.5;
    out.m_33.x = _1085;
    out.gl_Position.x = _1079;
    out.gl_Position.y = _1081;
    out.gl_Position.z = _1075;
    out.gl_Position.w = _1077;
    out.m_50.z = _1087;
    out.m_50.w = _1077;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _439 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1144 = as_type<float>(_85);
        out.gl_Position.z = _1144;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1213 = as_type<float>(_121);
        out.gl_Position.z = _1213;
    }
    if (_113)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _291 + _309;
    bool _313 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_291);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _331;
    bool _339 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_291);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _323 * _335;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _359 = _349 * _355;
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _311 * _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = fma(_373, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _295 * _361;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = in.m_40.x;
    float _393 = in.m_40.y;
    float _395 = fma(_365, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _395 * _359;
    float _401 = _397 * _359;
    float _403 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _405 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _407 = fma(_383, _351, _403);
    float _409 = fma(_381, _351, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _391;
    float _417 = _413 * _393;
    bool _419 = !_357;
    float _437;
    if (!_419)
    {
        float _421 = in.m_42.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_69);
        float _443 = 1.0 / _441;
        float _445 = _103 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = in.m_42.x;
    float _451 = in.m_42.y;
    float _453 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _467 = 1.0 / _459;
    float _469 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _471 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _463;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _483 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _485 = isnan(_447);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _497 = _495 != 0;
    bool _499 = _449 > 0.5;
    float _501 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _503 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _505 = isnan(_447);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _481;
    bool _517 = _451 > 0.5;
    float _519 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _521;
    float _525 = -_513;
    float _527 = _525 + 1.0;
    bool _529 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = isnan(_447);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
    float _543 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _545 = _493 * _527;
    float _547 = _523 * _467;
    float _549 = -_493;
    float _551 = _549 + 1.0;
    bool _553 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _555 = isnan(_447);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _447 + _565;
    float _569 = -_539;
    float _571 = _569 + 1.0;
    float _573 = _539 * _551;
    float _575 = fma(_547, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _581 = _563 * _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _583;
    float _587 = _543 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _589 = _579 * _477;
    float _591 = _575 * _581;
    float _593 = _585 * _515;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _447 + _595;
    float _599 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _603 = _587 + _601;
    float _605 = -_563;
    float _607 = _605 + 1.0;
    float _609 = fma(_589, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _613 = _599 + _611;
    float _615 = _603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _617 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[115].x, _591);
    float _619 = -_177;
    int _621 = _499 ? as_type<int>(_619) : as_type<int>(_177);
    float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _625 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[28].x, _615);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _629 = _447 + _627;
    float _631 = _471 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _633 = !_475;
    float _635 = _633 ? _177 : as_type<float>(_621);
    float _637 = fma(_609, _573, _617);
    float _639 = -_181;
    int _641 = _517 ? as_type<int>(_639) : as_type<int>(_181);
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _645 = _631 + _643;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _649 = _635 + 0.5;
    bool _651 = !_497;
    float _653 = _651 ? _181 : as_type<float>(_641);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[28].z, _625);
    float _657 = fma(_593, _629, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _661 = -_653;
    float _663 = _661 + 0.5;
    bool _665 = _655 >= 0.0;
    float _667 = _659 * _623;
    float _669 = fma(_657, _545, _637);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _673 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[118].x, _669);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = _657;
    float _683 = _545;
    float _685 = _593;
    if (_665)
    {
        _681 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _687 = _681;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = _671 * _647;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _699 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _713 = as_type<int>(_687);
    float _715 = _647;
    int _717 = as_type<int>(_703);
    if (_665)
    {
        float _719 = _687 * 5.0;
        _713 = as_type<int>(_719);
    }
    int _721 = _713;
    out.m_44.x = _699;
    out.m_44.y = _701;
    out.m_44.z = _703;
    out.m_44.w = _697;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _725 = _723 != 0;
    out.m_46.x = _667;
    out.m_46.y = _695;
    out.m_48.x = _705;
    out.m_48.y = _707;
    out.m_48.z = _709;
    out.m_48.w = _711;
    if (_665)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_721);
        out.gl_Position.z = _2207;
    }
    if (!_725)
    {
        _683 = 0.0;
    }
    float _727 = _683;
    float _729 = _727;
    if (!_725)
    {
        _685 = 0.0;
    }
    float _731 = _685;
    float _733 = _731;
    if (!_725)
    {
        _715 = 0.0;
    }
    float _735 = _715;
    bool _737 = !_725;
    float _739 = _735;
    if (!_737)
    {
        float _741 = -_587;
        float _743 = _741 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _745 = -_599;
        float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _749 = -_631;
        float _751 = _749 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _753 = _743 * _743;
        float _755 = fma(_747, _747, _753);
        float _757 = fma(_751, _751, _755);
        float _759 = rsqrt(_757);
        float _761 = _759 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _763 = _747 * _761;
        float _765 = _743 * _761;
        float _767 = _751 * _761;
        _733 = _765;
        _729 = _763;
        _739 = _767;
    }
    float _769 = _733;
    float _771 = _729;
    float _773 = _739;
    if (_665)
    {
        out.m_33.x = 0.0;
    }
    if (_665)
    {
        return out;
    }
    float _775 = _587 + _769;
    float _777 = _599 + _771;
    float _779 = _631 + _773;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _783 = _775 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _787 = _777 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _791 = _779 + _789;
    float _793 = _783 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[28].x, _793);
    float _797 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[28].z, _795);
    bool _799 = _797 >= 0.0;
    float _801 = _787;
    if (_799)
    {
        _801 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _803 = _801;
    if (_799)
    {
        out.m_33.x = 0.0;
    }
    if (_799)
    {
        float _805 = _803 * 5.0;
        _717 = as_type<int>(_805);
    }
    int _807 = _717;
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2359 = as_type<float>(_807);
        out.gl_Position.z = _2359;
    }
    if (_799)
    {
        return out;
    }
    float _809 = -_587;
    float _811 = _809 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _813 = -_599;
    float _815 = _813 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _817 = -_631;
    float _819 = _817 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _821 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _823 = _811 * _811;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _829 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _831 = fma(_815, _815, _823);
    float _833 = _825 * _821;
    float _835 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _837 = fma(_819, _819, _831);
    float _839 = _827 * _835;
    float _841 = rsqrt(_837);
    float _843 = _815 * _841;
    float _845 = _819 * _841;
    float _847 = _811 * _841;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _851 = _843 * _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _855 = _845 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _859 = -_851;
    float _861 = fma(_845, _857, _859);
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _865 = _847 * _863;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _869 = -_855;
    float _871 = fma(_847, _867, _869);
    float _873 = _861 * _861;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _877 = -_865;
    float _879 = fma(_843, _875, _877);
    float _881 = fma(_871, _871, _873);
    float _883 = fma(_879, _879, _881);
    float _885 = rsqrt(_883);
    float _887 = _871 * _885;
    float _889 = _861 * _885;
    float _891 = _879 * _885;
    float _893 = _887 * _847;
    float _895 = _889 * _845;
    float _897 = -_893;
    float _899 = fma(_889, _843, _897);
    float _901 = -_895;
    float _903 = fma(_891, _847, _901);
    float _905 = _833 * _899;
    float _907 = _833 * _903;
    float _909 = fma(_839, _891, _905);
    float _911 = fma(_839, _887, _907);
    float _913 = _891 * _843;
    float _915 = fma(_829, _845, _909);
    float _917 = fma(_829, _843, _911);
    float _919 = -_913;
    float _921 = fma(_887, _845, _919);
    float _923 = _631 + _915;
    float _925 = _599 + _917;
    float _927 = _833 * _921;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _931 = _923 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _935 = _925 + _933;
    float _937 = fma(_839, _889, _927);
    float _939 = _931 * _931;
    float _941 = fma(_829, _847, _937);
    float _943 = fma(_935, _935, _939);
    float _945 = _587 + _941;
    float _947 = sqrt(_943);
    bool _949 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _951 = _941;
    float _953 = _839;
    float _955 = _939;
    if (!_949)
    {
        _951 = _925;
    }
    float _957 = _951;
    float _959 = _957;
    if (!_949)
    {
        _953 = _923;
    }
    float _961 = _953;
    float _963 = _961;
    if (!_949)
    {
        _955 = _945;
    }
    float _965 = _955;
    bool _967 = !_949;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _947 + _973;
        float _977 = _945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_943);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = sin(_989);
        float _993 = _987 + (-1.0);
        float _995 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = fma(_991, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _999 = fma(_945, _987, _995);
        float _1001 = _979 * _997;
        float _1003 = fma(_935, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1005 = fma(_931, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _969 = _999;
        _959 = _1003;
        _963 = _1005;
    }
    float _1007 = _969;
    float _1009 = _959;
    float _1011 = _963;
    float _1013 = _769 + _1007;
    float _1015 = _771 + _1009;
    float _1017 = _773 + _1011;
    float _1019 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1021 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1025 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1019);
    float _1029 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1021);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1023);
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1025);
    float _1035 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1027);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1029);
    float _1039 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1031);
    float _1041 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1033);
    float _1043 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1045 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1051 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1053 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1055 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1059 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1051);
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1053);
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1055);
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1057);
    float _1067 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1059);
    float _1069 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1061);
    float _1071 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1063);
    float _1073 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1065);
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1067);
    float _1077 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1069);
    float _1079 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1071);
    float _1081 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1073);
    float _1083 = _1075 + _1077;
    float _1085 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1087 = _1083 * 0.5;
    out.m_33.x = _1085;
    out.gl_Position.x = _1079;
    out.gl_Position.y = _1081;
    out.gl_Position.z = _1075;
    out.gl_Position.w = _1077;
    out.m_50.z = _1087;
    out.m_50.w = _1077;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _439 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1144 = as_type<float>(_85);
        out.gl_Position.z = _1144;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1213 = as_type<float>(_121);
        out.gl_Position.z = _1213;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _291 + _309;
    bool _313 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_291);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _331;
    bool _339 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_291);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _323 * _335;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _359 = _349 * _355;
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _311 * _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = fma(_373, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _295 * _361;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = in.m_40.x;
    float _393 = in.m_40.y;
    float _395 = fma(_365, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _395 * _359;
    float _401 = _397 * _359;
    float _403 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _405 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _407 = fma(_383, _351, _403);
    float _409 = fma(_381, _351, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _391;
    float _417 = _413 * _393;
    bool _419 = !_357;
    float _437;
    if (!_419)
    {
        float _421 = in.m_42.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_69);
        float _443 = 1.0 / _441;
        float _445 = _103 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = in.m_42.x;
    float _451 = in.m_42.y;
    float _453 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _467 = 1.0 / _459;
    float _469 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _471 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _463;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _483 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _485 = isnan(_447);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _497 = _495 != 0;
    bool _499 = _449 > 0.5;
    float _501 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _503 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _505 = isnan(_447);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _481;
    bool _517 = _451 > 0.5;
    float _519 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _521;
    float _525 = -_513;
    float _527 = _525 + 1.0;
    bool _529 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = isnan(_447);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
    float _543 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _545 = _493 * _527;
    float _547 = _523 * _467;
    float _549 = -_493;
    float _551 = _549 + 1.0;
    bool _553 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _555 = isnan(_447);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _447 + _565;
    float _569 = -_539;
    float _571 = _569 + 1.0;
    float _573 = _539 * _551;
    float _575 = fma(_547, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _581 = _563 * _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _583;
    float _587 = _543 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _589 = _579 * _477;
    float _591 = _575 * _581;
    float _593 = _585 * _515;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _447 + _595;
    float _599 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _603 = _587 + _601;
    float _605 = -_563;
    float _607 = _605 + 1.0;
    float _609 = fma(_589, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _613 = _599 + _611;
    float _615 = _603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _617 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[115].x, _591);
    float _619 = -_177;
    int _621 = _499 ? as_type<int>(_619) : as_type<int>(_177);
    float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _625 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[28].x, _615);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _629 = _447 + _627;
    float _631 = _471 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _633 = !_475;
    float _635 = _633 ? _177 : as_type<float>(_621);
    float _637 = fma(_609, _573, _617);
    float _639 = -_181;
    int _641 = _517 ? as_type<int>(_639) : as_type<int>(_181);
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _645 = _631 + _643;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _649 = _635 + 0.5;
    bool _651 = !_497;
    float _653 = _651 ? _181 : as_type<float>(_641);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[28].z, _625);
    float _657 = fma(_593, _629, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _661 = -_653;
    float _663 = _661 + 0.5;
    bool _665 = _655 >= 0.0;
    float _667 = _659 * _623;
    float _669 = fma(_657, _545, _637);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _673 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[118].x, _669);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = _657;
    float _683 = _545;
    float _685 = _593;
    if (_665)
    {
        _681 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _687 = _681;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = _671 * _647;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _699 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _713 = as_type<int>(_687);
    float _715 = _647;
    int _717 = as_type<int>(_703);
    if (_665)
    {
        float _719 = _687 * 5.0;
        _713 = as_type<int>(_719);
    }
    int _721 = _713;
    out.m_44.x = _699;
    out.m_44.y = _701;
    out.m_44.z = _703;
    out.m_44.w = _697;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _725 = _723 != 0;
    out.m_46.x = _667;
    out.m_46.y = _695;
    out.m_48.x = _705;
    out.m_48.y = _707;
    out.m_48.z = _709;
    out.m_48.w = _711;
    if (_665)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_721);
        out.gl_Position.z = _2207;
    }
    if (!_725)
    {
        _683 = 0.0;
    }
    float _727 = _683;
    float _729 = _727;
    if (!_725)
    {
        _685 = 0.0;
    }
    float _731 = _685;
    float _733 = _731;
    if (!_725)
    {
        _715 = 0.0;
    }
    float _735 = _715;
    bool _737 = !_725;
    float _739 = _735;
    if (!_737)
    {
        float _741 = -_587;
        float _743 = _741 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _745 = -_599;
        float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _749 = -_631;
        float _751 = _749 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _753 = _743 * _743;
        float _755 = fma(_747, _747, _753);
        float _757 = fma(_751, _751, _755);
        float _759 = rsqrt(_757);
        float _761 = _759 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _763 = _747 * _761;
        float _765 = _743 * _761;
        float _767 = _751 * _761;
        _733 = _765;
        _729 = _763;
        _739 = _767;
    }
    float _769 = _733;
    float _771 = _729;
    float _773 = _739;
    if (_665)
    {
        out.m_33.x = 0.0;
    }
    if (_665)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _775 = _587 + _769;
    float _777 = _599 + _771;
    float _779 = _631 + _773;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _783 = _775 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _787 = _777 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _791 = _779 + _789;
    float _793 = _783 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[28].x, _793);
    float _797 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[28].z, _795);
    bool _799 = _797 >= 0.0;
    float _801 = _787;
    if (_799)
    {
        _801 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _803 = _801;
    if (_799)
    {
        out.m_33.x = 0.0;
    }
    if (_799)
    {
        float _805 = _803 * 5.0;
        _717 = as_type<int>(_805);
    }
    int _807 = _717;
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2359 = as_type<float>(_807);
        out.gl_Position.z = _2359;
    }
    if (_799)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _809 = -_587;
    float _811 = _809 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _813 = -_599;
    float _815 = _813 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _817 = -_631;
    float _819 = _817 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _821 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _823 = _811 * _811;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _829 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _831 = fma(_815, _815, _823);
    float _833 = _825 * _821;
    float _835 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _837 = fma(_819, _819, _831);
    float _839 = _827 * _835;
    float _841 = rsqrt(_837);
    float _843 = _815 * _841;
    float _845 = _819 * _841;
    float _847 = _811 * _841;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _851 = _843 * _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _855 = _845 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _859 = -_851;
    float _861 = fma(_845, _857, _859);
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _865 = _847 * _863;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _869 = -_855;
    float _871 = fma(_847, _867, _869);
    float _873 = _861 * _861;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _877 = -_865;
    float _879 = fma(_843, _875, _877);
    float _881 = fma(_871, _871, _873);
    float _883 = fma(_879, _879, _881);
    float _885 = rsqrt(_883);
    float _887 = _871 * _885;
    float _889 = _861 * _885;
    float _891 = _879 * _885;
    float _893 = _887 * _847;
    float _895 = _889 * _845;
    float _897 = -_893;
    float _899 = fma(_889, _843, _897);
    float _901 = -_895;
    float _903 = fma(_891, _847, _901);
    float _905 = _833 * _899;
    float _907 = _833 * _903;
    float _909 = fma(_839, _891, _905);
    float _911 = fma(_839, _887, _907);
    float _913 = _891 * _843;
    float _915 = fma(_829, _845, _909);
    float _917 = fma(_829, _843, _911);
    float _919 = -_913;
    float _921 = fma(_887, _845, _919);
    float _923 = _631 + _915;
    float _925 = _599 + _917;
    float _927 = _833 * _921;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _931 = _923 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _935 = _925 + _933;
    float _937 = fma(_839, _889, _927);
    float _939 = _931 * _931;
    float _941 = fma(_829, _847, _937);
    float _943 = fma(_935, _935, _939);
    float _945 = _587 + _941;
    float _947 = sqrt(_943);
    bool _949 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _951 = _941;
    float _953 = _839;
    float _955 = _939;
    if (!_949)
    {
        _951 = _925;
    }
    float _957 = _951;
    float _959 = _957;
    if (!_949)
    {
        _953 = _923;
    }
    float _961 = _953;
    float _963 = _961;
    if (!_949)
    {
        _955 = _945;
    }
    float _965 = _955;
    bool _967 = !_949;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _947 + _973;
        float _977 = _945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_943);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = sin(_989);
        float _993 = _987 + (-1.0);
        float _995 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = fma(_991, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _999 = fma(_945, _987, _995);
        float _1001 = _979 * _997;
        float _1003 = fma(_935, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1005 = fma(_931, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _969 = _999;
        _959 = _1003;
        _963 = _1005;
    }
    float _1007 = _969;
    float _1009 = _959;
    float _1011 = _963;
    float _1013 = _769 + _1007;
    float _1015 = _771 + _1009;
    float _1017 = _773 + _1011;
    float _1019 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1021 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1025 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1019);
    float _1029 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1021);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1023);
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1025);
    float _1035 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1027);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1029);
    float _1039 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1031);
    float _1041 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1033);
    float _1043 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1045 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1051 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1053 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1055 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1059 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1051);
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1053);
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1055);
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1057);
    float _1067 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1059);
    float _1069 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1061);
    float _1071 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1063);
    float _1073 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1065);
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1067);
    float _1077 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1069);
    float _1079 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1071);
    float _1081 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1073);
    float _1083 = _1075 + _1077;
    float _1085 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1087 = _1083 * 0.5;
    out.m_33.x = _1085;
    out.gl_Position.x = _1079;
    out.gl_Position.y = _1081;
    out.gl_Position.z = _1075;
    out.gl_Position.w = _1077;
    out.m_50.z = _1087;
    out.m_50.w = _1077;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

