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
    float4 m_46 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1190 = as_type<float>(_85);
        out.gl_Position.z = _1190;
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
        float _1259 = as_type<float>(_121);
        out.gl_Position.z = _1259;
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
    float _337 = 1.0 / _327;
    float _339 = _323 * _335;
    float _341 = -_323;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _331;
    float _349 = _295 * _337;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = in.m_40.x;
    float _369 = in.m_40.y;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = _361 * _343;
    float _379 = fma(_373, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _381 = _311 * _347;
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = _375 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _379 * _377;
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _387);
    float _401 = fma(_391, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_395, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _405 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _407 = fma(_401, _339, _399);
    float _409 = fma(_403, _339, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _367;
    float _417 = _413 * _369;
    bool _419 = !_345;
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
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _447 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _459;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _479 = _477 != 0;
    float _481 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _483 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = isnan(_447);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _497 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _499 = 1.0 / _463;
    float _501 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    bool _503 = _451 > 0.5;
    float _505 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _507 = _469 * _475;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
    float _519 = fma(_507, _455, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _521 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _523 = isnan(_447);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _535 = _449 > 0.5;
    float _537 = _511 * _499;
    float _539 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _517);
    float _541 = _531 * _515;
    float _543 = -_531;
    float _545 = _543 + 1.0;
    bool _547 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _549 = isnan(_447);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _519 * _541;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _447 + _561;
    float _565 = -_177;
    int _567 = _535 ? as_type<int>(_565) : as_type<int>(_177);
    float _569 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _497);
    float _571 = -_557;
    float _573 = _571 + 1.0;
    float _575 = fma(_537, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _579 = _501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _583 = !_473;
    float _585 = _583 ? _177 : as_type<float>(_567);
    float _587 = _569 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _591 = _579 + _589;
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _595 = _581 + _593;
    float _597 = _493 * _573;
    float _599 = _585 + 0.5;
    float _601 = _591 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _603 = -_181;
    int _605 = _503 ? as_type<int>(_603) : as_type<int>(_181);
    float _607 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _609 = _587 + _607;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[28].x, _601);
    float _615 = _599 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _617 = !_479;
    float _619 = _617 ? _181 : as_type<float>(_605);
    float _621 = fma(_575, _597, _577);
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[28].z, _613);
    float _625 = _615 * _533;
    float _627 = _591 * _591;
    float _629 = -_619;
    float _631 = _629 + 0.5;
    float _633 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[117].x, _621);
    bool _635 = _623 >= 0.0;
    float _637 = fma(_595, _595, _627);
    float _639 = _631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _641 = fma(_609, _609, _637);
    float _643 = _639 * _611;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _647 = rsqrt(_641);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _655 = _637;
    if (_635)
    {
        _655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _657 = _655;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _677 = as_type<int>(_657);
    if (_635)
    {
        float _679 = _657 * 5.0;
        _677 = as_type<int>(_679);
    }
    int _681 = _677;
    out.m_44.x = _625;
    out.m_44.y = _643;
    float _683 = _591 * _647;
    float _685 = _595 * _647;
    out.m_46.x = _667;
    out.m_46.y = _669;
    out.m_46.z = _671;
    out.m_48.x = _661;
    out.m_48.y = _665;
    out.m_48.z = _673;
    out.m_48.w = _675;
    float _687 = as_type<float>(_681);
    if (_635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2195 = as_type<float>(_681);
        out.gl_Position.z = _2195;
    }
    if (_635)
    {
        out.m_33.x = 0.0;
    }
    if (_635)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _689 = -_683;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _693 = _609 * _647;
    float _695 = -_685;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _699 = -_683;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _705 = _691 + _703;
    float _707 = -_693;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _697 + _711;
    float _715 = -_685;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _595);
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _723 = _709 + _721;
    float _725 = _701 * _701;
    float _727 = -_693;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _731 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _719);
    float _733 = fma(_717, _717, _725);
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[28].z, _731);
    float _737 = fma(_729, _729, _733);
    bool _739 = _735 >= 0.0;
    float _741 = sqrt(_737);
    if (_739)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _743 = _687;
    int _745 = as_type<int>(_743);
    if (_739)
    {
        out.m_33.x = 0.0;
    }
    float _747 = _647 * _741;
    if (_739)
    {
        float _749 = _743 * 5.0;
        _745 = as_type<int>(_749);
    }
    int _751 = _745;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2326 = as_type<float>(_751);
        out.gl_Position.z = _2326;
    }
    if (_739)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _753 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _761 = _747 * _753;
    float _763 = _747 * _755;
    float _765 = _747 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _767 = _765 * 0.5;
    float _769 = _757 * _761;
    float _771 = _759 * _763;
    float _773 = _691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _783 = _779 || _781;
    float _785 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _787 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _789 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _773);
    float _791 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _785);
    float _793 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _787);
    float _795 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].z, _789);
    float _797 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].z, _791);
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].z, _793);
    float _801 = _795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _803 = _797 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _805 = _799 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _807 = _587 + _803;
    float _809 = _581 + _805;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _807 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _817 = _809 + _815;
    float _819 = _813 * _813;
    float _821 = fma(_817, _817, _819);
    float _823 = _691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _825 = sqrt(_821);
    float _827 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _823);
    float _829 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _831 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].z, _827);
    float _833 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _829);
    float _835 = _831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _837 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].z, _833);
    float _839 = 1.0 / _835;
    float _841 = _837 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = _801 + _835;
    bool _845 = _825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _847 = _579 + _841;
    float _849 = _767;
    float _851 = _809;
    float _853 = _807;
    if (!_845)
    {
        _849 = _847;
    }
    float _855 = _849;
    bool _857 = !_845;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _825 + _863;
        float _867 = _847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_821);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = _877 + (-1.0);
        float _885 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _887 = fma(_881, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _889 = fma(_847, _877, _885);
        float _891 = _869 * _887;
        float _893 = fma(_817, _891, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _895 = fma(_813, _891, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _851 = _893;
        _859 = _889;
        _853 = _895;
    }
    float _897 = _851;
    float _899 = _859;
    float _901 = _853;
    bool _903 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _905 = isnan(0.5);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _911 = _907 || _909;
    float _913 = -_685;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _917 = -_683;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _921 = -_693;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _925 = _843 * _839;
    float _927 = _925 * 0.5;
    float _929 = _919;
    float _931 = _915;
    float _933 = _923;
    float _935 = _899;
    if (!_783)
    {
        float _937 = _705 * _705;
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _941 = -_587;
        float _943 = _941 + _901;
        float _945 = fma(_713, _713, _937);
        float _947 = fma(_723, _723, _945);
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _951 = sqrt(_947);
        float _953 = 1.0 / _747;
        float _955 = _949 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _957 = precise::min(_951, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _959 = _957 * _939;
        float _961 = _959 * _953;
        float _963 = -_581;
        float _965 = _963 + _897;
        float _967 = -_579;
        float _969 = _967 + _899;
        float _971 = _955 * _961;
        float _973 = _943 * _961;
        float _975 = fma(_965, _971, _697);
        float _977 = fma(_969, _971, _691);
        float _979 = fma(_955, _973, _709);
        _929 = _977;
        _931 = _975;
        _933 = _979;
    }
    float _981 = _929;
    float _983 = _931;
    float _985 = _933;
    float _987 = _981 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _989 = _981 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_911)
    {
        _935 = 1.0;
    }
    float _991 = _935;
    float _993 = _991;
    if (!_911)
    {
        float _995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _997 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _999 = _995 * 0.15915493667125701904296875;
        float _1001 = _997 * 0.15915493667125701904296875;
        float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1005 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1003);
        float _1007 = _999 * 6.283185482025146484375;
        float _1009 = cos(_1007);
        float _1011 = _999 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1009;
        float _1017 = _1001 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1001 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1005;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1031;
        float _1035 = 1.0 / _1027;
        float _1037 = 1.0 / _1033;
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1041 = _1029 * _1039;
        float _1043 = _1025 * _1035;
        float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1047 = fma(_1043, _1041, _1045);
        float _1049 = _1047 * _1037;
        float _1051 = precise::clamp(_1049, 0.0, 1.0);
        _993 = _1051;
    }
    float _1053 = _993;
    float _1055 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[1].x, _989);
    float _1057 = _981 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1059 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[0].x, _987);
    float _1061 = _981 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1063 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1055);
    float _1065 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1057);
    float _1067 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1059);
    float _1069 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1073 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1065);
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1077 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1069);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1081 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1083 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1087 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1079);
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1081);
    float _1091 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1095 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1087);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1089);
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1093);
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1097);
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1099);
    bool _1109 = _1053 > 0.0;
    bool _1111 = isnan(_1053);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1101);
    float _1121 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1123 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1103);
    float _1125 = _1105 + _1107;
    float _1127 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1119);
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1131 = _1125 * 0.5;
    out.m_33.x = _1129;
    out.gl_Position.x = _1123;
    out.gl_Position.y = _1127;
    out.gl_Position.z = _1105;
    out.gl_Position.w = _1107;
    out.m_50.z = _1131;
    out.m_50.w = _1107;
    if (_1117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1133;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1190 = as_type<float>(_85);
        out.gl_Position.z = _1190;
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
        float _1259 = as_type<float>(_121);
        out.gl_Position.z = _1259;
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
    float _337 = 1.0 / _327;
    float _339 = _323 * _335;
    float _341 = -_323;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _331;
    float _349 = _295 * _337;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = in.m_40.x;
    float _369 = in.m_40.y;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = _361 * _343;
    float _379 = fma(_373, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _381 = _311 * _347;
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = _375 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _379 * _377;
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _387);
    float _401 = fma(_391, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_395, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _405 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _407 = fma(_401, _339, _399);
    float _409 = fma(_403, _339, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _367;
    float _417 = _413 * _369;
    bool _419 = !_345;
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
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _447 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _459;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _479 = _477 != 0;
    float _481 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _483 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = isnan(_447);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _497 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _499 = 1.0 / _463;
    float _501 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    bool _503 = _451 > 0.5;
    float _505 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _507 = _469 * _475;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
    float _519 = fma(_507, _455, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _521 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _523 = isnan(_447);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _535 = _449 > 0.5;
    float _537 = _511 * _499;
    float _539 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _517);
    float _541 = _531 * _515;
    float _543 = -_531;
    float _545 = _543 + 1.0;
    bool _547 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _549 = isnan(_447);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _519 * _541;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _447 + _561;
    float _565 = -_177;
    int _567 = _535 ? as_type<int>(_565) : as_type<int>(_177);
    float _569 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _497);
    float _571 = -_557;
    float _573 = _571 + 1.0;
    float _575 = fma(_537, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _579 = _501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _583 = !_473;
    float _585 = _583 ? _177 : as_type<float>(_567);
    float _587 = _569 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _591 = _579 + _589;
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _595 = _581 + _593;
    float _597 = _493 * _573;
    float _599 = _585 + 0.5;
    float _601 = _591 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _603 = -_181;
    int _605 = _503 ? as_type<int>(_603) : as_type<int>(_181);
    float _607 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _609 = _587 + _607;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[28].x, _601);
    float _615 = _599 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _617 = !_479;
    float _619 = _617 ? _181 : as_type<float>(_605);
    float _621 = fma(_575, _597, _577);
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[28].z, _613);
    float _625 = _615 * _533;
    float _627 = _591 * _591;
    float _629 = -_619;
    float _631 = _629 + 0.5;
    float _633 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[117].x, _621);
    bool _635 = _623 >= 0.0;
    float _637 = fma(_595, _595, _627);
    float _639 = _631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _641 = fma(_609, _609, _637);
    float _643 = _639 * _611;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _647 = rsqrt(_641);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _655 = _637;
    if (_635)
    {
        _655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _657 = _655;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _677 = as_type<int>(_657);
    if (_635)
    {
        float _679 = _657 * 5.0;
        _677 = as_type<int>(_679);
    }
    int _681 = _677;
    out.m_44.x = _625;
    out.m_44.y = _643;
    float _683 = _591 * _647;
    float _685 = _595 * _647;
    out.m_46.x = _667;
    out.m_46.y = _669;
    out.m_46.z = _671;
    out.m_48.x = _661;
    out.m_48.y = _665;
    out.m_48.z = _673;
    out.m_48.w = _675;
    float _687 = as_type<float>(_681);
    if (_635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2195 = as_type<float>(_681);
        out.gl_Position.z = _2195;
    }
    if (_635)
    {
        out.m_33.x = 0.0;
    }
    if (_635)
    {
        return out;
    }
    float _689 = -_683;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _693 = _609 * _647;
    float _695 = -_685;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _699 = -_683;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _705 = _691 + _703;
    float _707 = -_693;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _697 + _711;
    float _715 = -_685;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _595);
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _723 = _709 + _721;
    float _725 = _701 * _701;
    float _727 = -_693;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _731 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _719);
    float _733 = fma(_717, _717, _725);
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[28].z, _731);
    float _737 = fma(_729, _729, _733);
    bool _739 = _735 >= 0.0;
    float _741 = sqrt(_737);
    if (_739)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _743 = _687;
    int _745 = as_type<int>(_743);
    if (_739)
    {
        out.m_33.x = 0.0;
    }
    float _747 = _647 * _741;
    if (_739)
    {
        float _749 = _743 * 5.0;
        _745 = as_type<int>(_749);
    }
    int _751 = _745;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2326 = as_type<float>(_751);
        out.gl_Position.z = _2326;
    }
    if (_739)
    {
        return out;
    }
    float _753 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _761 = _747 * _753;
    float _763 = _747 * _755;
    float _765 = _747 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _767 = _765 * 0.5;
    float _769 = _757 * _761;
    float _771 = _759 * _763;
    float _773 = _691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _783 = _779 || _781;
    float _785 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _787 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _789 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _773);
    float _791 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _785);
    float _793 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _787);
    float _795 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].z, _789);
    float _797 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].z, _791);
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].z, _793);
    float _801 = _795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _803 = _797 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _805 = _799 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _807 = _587 + _803;
    float _809 = _581 + _805;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _807 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _817 = _809 + _815;
    float _819 = _813 * _813;
    float _821 = fma(_817, _817, _819);
    float _823 = _691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _825 = sqrt(_821);
    float _827 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _823);
    float _829 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _831 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].z, _827);
    float _833 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _829);
    float _835 = _831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _837 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].z, _833);
    float _839 = 1.0 / _835;
    float _841 = _837 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = _801 + _835;
    bool _845 = _825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _847 = _579 + _841;
    float _849 = _767;
    float _851 = _809;
    float _853 = _807;
    if (!_845)
    {
        _849 = _847;
    }
    float _855 = _849;
    bool _857 = !_845;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _825 + _863;
        float _867 = _847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_821);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = _877 + (-1.0);
        float _885 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _887 = fma(_881, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _889 = fma(_847, _877, _885);
        float _891 = _869 * _887;
        float _893 = fma(_817, _891, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _895 = fma(_813, _891, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _851 = _893;
        _859 = _889;
        _853 = _895;
    }
    float _897 = _851;
    float _899 = _859;
    float _901 = _853;
    bool _903 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _905 = isnan(0.5);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _911 = _907 || _909;
    float _913 = -_685;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _917 = -_683;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _921 = -_693;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _925 = _843 * _839;
    float _927 = _925 * 0.5;
    float _929 = _919;
    float _931 = _915;
    float _933 = _923;
    float _935 = _899;
    if (!_783)
    {
        float _937 = _705 * _705;
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _941 = -_587;
        float _943 = _941 + _901;
        float _945 = fma(_713, _713, _937);
        float _947 = fma(_723, _723, _945);
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _951 = sqrt(_947);
        float _953 = 1.0 / _747;
        float _955 = _949 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _957 = precise::min(_951, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _959 = _957 * _939;
        float _961 = _959 * _953;
        float _963 = -_581;
        float _965 = _963 + _897;
        float _967 = -_579;
        float _969 = _967 + _899;
        float _971 = _955 * _961;
        float _973 = _943 * _961;
        float _975 = fma(_965, _971, _697);
        float _977 = fma(_969, _971, _691);
        float _979 = fma(_955, _973, _709);
        _929 = _977;
        _931 = _975;
        _933 = _979;
    }
    float _981 = _929;
    float _983 = _931;
    float _985 = _933;
    float _987 = _981 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _989 = _981 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_911)
    {
        _935 = 1.0;
    }
    float _991 = _935;
    float _993 = _991;
    if (!_911)
    {
        float _995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _997 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _999 = _995 * 0.15915493667125701904296875;
        float _1001 = _997 * 0.15915493667125701904296875;
        float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1005 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1003);
        float _1007 = _999 * 6.283185482025146484375;
        float _1009 = cos(_1007);
        float _1011 = _999 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1009;
        float _1017 = _1001 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1001 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1005;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1031;
        float _1035 = 1.0 / _1027;
        float _1037 = 1.0 / _1033;
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1041 = _1029 * _1039;
        float _1043 = _1025 * _1035;
        float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1047 = fma(_1043, _1041, _1045);
        float _1049 = _1047 * _1037;
        float _1051 = precise::clamp(_1049, 0.0, 1.0);
        _993 = _1051;
    }
    float _1053 = _993;
    float _1055 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[1].x, _989);
    float _1057 = _981 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1059 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[0].x, _987);
    float _1061 = _981 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1063 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1055);
    float _1065 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1057);
    float _1067 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1059);
    float _1069 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1073 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1065);
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1077 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1069);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1081 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1083 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1087 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1079);
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1081);
    float _1091 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1095 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1087);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1089);
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1093);
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1097);
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1099);
    bool _1109 = _1053 > 0.0;
    bool _1111 = isnan(_1053);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1101);
    float _1121 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1123 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1103);
    float _1125 = _1105 + _1107;
    float _1127 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1119);
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1131 = _1125 * 0.5;
    out.m_33.x = _1129;
    out.gl_Position.x = _1123;
    out.gl_Position.y = _1127;
    out.gl_Position.z = _1105;
    out.gl_Position.w = _1107;
    out.m_50.z = _1131;
    out.m_50.w = _1107;
    if (_1117)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1133;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1190 = as_type<float>(_85);
        out.gl_Position.z = _1190;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1259 = as_type<float>(_121);
        out.gl_Position.z = _1259;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _337 = 1.0 / _327;
    float _339 = _323 * _335;
    float _341 = -_323;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _331;
    float _349 = _295 * _337;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = in.m_40.x;
    float _369 = in.m_40.y;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = _361 * _343;
    float _379 = fma(_373, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _381 = _311 * _347;
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = _375 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _379 * _377;
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _387);
    float _401 = fma(_391, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_395, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _405 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _407 = fma(_401, _339, _399);
    float _409 = fma(_403, _339, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _367;
    float _417 = _413 * _369;
    bool _419 = !_345;
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
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _447 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _459;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _479 = _477 != 0;
    float _481 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _483 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = isnan(_447);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _497 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _499 = 1.0 / _463;
    float _501 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    bool _503 = _451 > 0.5;
    float _505 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _507 = _469 * _475;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
    float _519 = fma(_507, _455, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _521 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _523 = isnan(_447);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _535 = _449 > 0.5;
    float _537 = _511 * _499;
    float _539 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _517);
    float _541 = _531 * _515;
    float _543 = -_531;
    float _545 = _543 + 1.0;
    bool _547 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _549 = isnan(_447);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _519 * _541;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _447 + _561;
    float _565 = -_177;
    int _567 = _535 ? as_type<int>(_565) : as_type<int>(_177);
    float _569 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _497);
    float _571 = -_557;
    float _573 = _571 + 1.0;
    float _575 = fma(_537, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _579 = _501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _583 = !_473;
    float _585 = _583 ? _177 : as_type<float>(_567);
    float _587 = _569 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _591 = _579 + _589;
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _595 = _581 + _593;
    float _597 = _493 * _573;
    float _599 = _585 + 0.5;
    float _601 = _591 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _603 = -_181;
    int _605 = _503 ? as_type<int>(_603) : as_type<int>(_181);
    float _607 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _609 = _587 + _607;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[28].x, _601);
    float _615 = _599 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _617 = !_479;
    float _619 = _617 ? _181 : as_type<float>(_605);
    float _621 = fma(_575, _597, _577);
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[28].z, _613);
    float _625 = _615 * _533;
    float _627 = _591 * _591;
    float _629 = -_619;
    float _631 = _629 + 0.5;
    float _633 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[117].x, _621);
    bool _635 = _623 >= 0.0;
    float _637 = fma(_595, _595, _627);
    float _639 = _631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _641 = fma(_609, _609, _637);
    float _643 = _639 * _611;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _647 = rsqrt(_641);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _655 = _637;
    if (_635)
    {
        _655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _657 = _655;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _677 = as_type<int>(_657);
    if (_635)
    {
        float _679 = _657 * 5.0;
        _677 = as_type<int>(_679);
    }
    int _681 = _677;
    out.m_44.x = _625;
    out.m_44.y = _643;
    float _683 = _591 * _647;
    float _685 = _595 * _647;
    out.m_46.x = _667;
    out.m_46.y = _669;
    out.m_46.z = _671;
    out.m_48.x = _661;
    out.m_48.y = _665;
    out.m_48.z = _673;
    out.m_48.w = _675;
    float _687 = as_type<float>(_681);
    if (_635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2195 = as_type<float>(_681);
        out.gl_Position.z = _2195;
    }
    if (_635)
    {
        out.m_33.x = 0.0;
    }
    if (_635)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _689 = -_683;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _693 = _609 * _647;
    float _695 = -_685;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _699 = -_683;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _705 = _691 + _703;
    float _707 = -_693;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _697 + _711;
    float _715 = -_685;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _595);
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _723 = _709 + _721;
    float _725 = _701 * _701;
    float _727 = -_693;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _731 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _719);
    float _733 = fma(_717, _717, _725);
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[28].z, _731);
    float _737 = fma(_729, _729, _733);
    bool _739 = _735 >= 0.0;
    float _741 = sqrt(_737);
    if (_739)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _743 = _687;
    int _745 = as_type<int>(_743);
    if (_739)
    {
        out.m_33.x = 0.0;
    }
    float _747 = _647 * _741;
    if (_739)
    {
        float _749 = _743 * 5.0;
        _745 = as_type<int>(_749);
    }
    int _751 = _745;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2326 = as_type<float>(_751);
        out.gl_Position.z = _2326;
    }
    if (_739)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _753 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _761 = _747 * _753;
    float _763 = _747 * _755;
    float _765 = _747 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _767 = _765 * 0.5;
    float _769 = _757 * _761;
    float _771 = _759 * _763;
    float _773 = _691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _783 = _779 || _781;
    float _785 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _787 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _789 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _773);
    float _791 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _785);
    float _793 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _787);
    float _795 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].z, _789);
    float _797 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].z, _791);
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].z, _793);
    float _801 = _795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _803 = _797 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _805 = _799 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _807 = _587 + _803;
    float _809 = _581 + _805;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _807 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _817 = _809 + _815;
    float _819 = _813 * _813;
    float _821 = fma(_817, _817, _819);
    float _823 = _691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _825 = sqrt(_821);
    float _827 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _823);
    float _829 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _831 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].z, _827);
    float _833 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _829);
    float _835 = _831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _837 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].z, _833);
    float _839 = 1.0 / _835;
    float _841 = _837 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = _801 + _835;
    bool _845 = _825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _847 = _579 + _841;
    float _849 = _767;
    float _851 = _809;
    float _853 = _807;
    if (!_845)
    {
        _849 = _847;
    }
    float _855 = _849;
    bool _857 = !_845;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _825 + _863;
        float _867 = _847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_821);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = _877 + (-1.0);
        float _885 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _887 = fma(_881, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _889 = fma(_847, _877, _885);
        float _891 = _869 * _887;
        float _893 = fma(_817, _891, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _895 = fma(_813, _891, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _851 = _893;
        _859 = _889;
        _853 = _895;
    }
    float _897 = _851;
    float _899 = _859;
    float _901 = _853;
    bool _903 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _905 = isnan(0.5);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _911 = _907 || _909;
    float _913 = -_685;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _917 = -_683;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _921 = -_693;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _925 = _843 * _839;
    float _927 = _925 * 0.5;
    float _929 = _919;
    float _931 = _915;
    float _933 = _923;
    float _935 = _899;
    if (!_783)
    {
        float _937 = _705 * _705;
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _941 = -_587;
        float _943 = _941 + _901;
        float _945 = fma(_713, _713, _937);
        float _947 = fma(_723, _723, _945);
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _951 = sqrt(_947);
        float _953 = 1.0 / _747;
        float _955 = _949 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _957 = precise::min(_951, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _959 = _957 * _939;
        float _961 = _959 * _953;
        float _963 = -_581;
        float _965 = _963 + _897;
        float _967 = -_579;
        float _969 = _967 + _899;
        float _971 = _955 * _961;
        float _973 = _943 * _961;
        float _975 = fma(_965, _971, _697);
        float _977 = fma(_969, _971, _691);
        float _979 = fma(_955, _973, _709);
        _929 = _977;
        _931 = _975;
        _933 = _979;
    }
    float _981 = _929;
    float _983 = _931;
    float _985 = _933;
    float _987 = _981 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _989 = _981 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_911)
    {
        _935 = 1.0;
    }
    float _991 = _935;
    float _993 = _991;
    if (!_911)
    {
        float _995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _997 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _999 = _995 * 0.15915493667125701904296875;
        float _1001 = _997 * 0.15915493667125701904296875;
        float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1005 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1003);
        float _1007 = _999 * 6.283185482025146484375;
        float _1009 = cos(_1007);
        float _1011 = _999 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1009;
        float _1017 = _1001 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1001 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1005;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1031;
        float _1035 = 1.0 / _1027;
        float _1037 = 1.0 / _1033;
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1041 = _1029 * _1039;
        float _1043 = _1025 * _1035;
        float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1047 = fma(_1043, _1041, _1045);
        float _1049 = _1047 * _1037;
        float _1051 = precise::clamp(_1049, 0.0, 1.0);
        _993 = _1051;
    }
    float _1053 = _993;
    float _1055 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[1].x, _989);
    float _1057 = _981 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1059 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[0].x, _987);
    float _1061 = _981 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1063 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1055);
    float _1065 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1057);
    float _1067 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1059);
    float _1069 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1073 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1065);
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1077 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1069);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1081 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1083 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1087 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1079);
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1081);
    float _1091 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1095 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1087);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1089);
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1093);
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1097);
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1099);
    bool _1109 = _1053 > 0.0;
    bool _1111 = isnan(_1053);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1101);
    float _1121 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1123 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1103);
    float _1125 = _1105 + _1107;
    float _1127 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1119);
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1131 = _1125 * 0.5;
    out.m_33.x = _1129;
    out.gl_Position.x = _1123;
    out.gl_Position.y = _1127;
    out.gl_Position.z = _1105;
    out.gl_Position.w = _1107;
    out.m_50.z = _1131;
    out.m_50.w = _1107;
    if (_1117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1133;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

