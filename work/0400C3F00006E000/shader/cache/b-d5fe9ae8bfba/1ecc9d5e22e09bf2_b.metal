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
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_31 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(2)]];
    float4 m_33 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _241 = false;
    bool _139 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _728 = as_type<float>(_79);
        out.gl_Position.z = _728;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _797 = as_type<float>(_115);
        out.gl_Position.z = _797;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _129 = _127 * _123;
        float _131 = floor(_129);
        float _133 = -_131;
        float _135 = _129 + _133;
        _137 = _135;
        _139 = true;
    }
    else
    {
        float _141 = float(_63);
        float _143 = 1.0 / _141;
        float _145 = _97 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _165;
    float _169 = -_163;
    float _171 = _169 + 1.0;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _175 = 1.0 / _167;
    float _177 = _151 * _175;
    bool _179 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _181 = isnan(_147);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _195;
    float _199 = _189 * _171;
    float _201 = fma(_193, _177, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _203 = fma(_197, _177, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _205 = -_189;
    float _207 = _205 + 1.0;
    float _209 = _201 * _199;
    float _211 = _203 * _199;
    float _213 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[143].x, _209);
    float _215 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[143].y, _211);
    float _217 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[144].x, _213);
    float _219 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[144].y, _215);
    bool _221 = !_173;
    float _239;
    if (!_221)
    {
        float _223 = in.m_35.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        float _243 = float(_63);
        float _245 = 1.0 / _243;
        float _247 = _97 * _245;
        _239 = _247;
    }
    _241 = false;
    float _249 = _239;
    float _251 = as_type<float>(int(gl_VertexIndex));
    float _253 = in.m_40.x;
    float _255 = in.m_40.y;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _261 = in.m_28.x;
    float _263 = in.m_28.y;
    float _265 = in.m_28.z;
    float _267 = 1.0 / _259;
    int _269 = as_type<int>(_251) & 1;
    bool _271 = _269 != 0;
    int _273 = as_type<int>(_251) & 2;
    bool _275 = _273 != 0;
    float _277 = _217 * _253;
    float _279 = _219 * _255;
    float _281 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _283 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _285 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _287;
    float _291 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _281);
    float _293 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _283);
    float _295 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _285);
    float _297 = _289 * _267;
    bool _299 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _301 = isnan(_249);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    bool _313 = !_271;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _249 + _317;
    bool _321 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _323 = isnan(_249);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _277 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _315);
    float _341 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _291);
    float _343 = _311 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _345 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _295);
    float _347 = fma(_297, _319, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _349 = _331 * _335;
    float _351 = _337 * _339;
    bool _353 = !_275;
    float _355 = _353 ? (-0.5) : 0.5;
    float _357 = _341 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _359 = _343 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _361 = _347 * _349;
    float _363 = -_331;
    float _365 = _363 + 1.0;
    float _367 = _345 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _369 = fma(_357, (*spvDescriptorSet0.vp_c8)._m0[11].x, _359);
    float _371 = _279 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _355);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[115].x, _361);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c8)._m0[11].z, _369);
    float _379 = _343 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _381 = _371 * _373;
    float _383 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _385 = _377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c8)._m0[10].x, _379);
    float _389 = _381 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _391 = _381 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _393 = 1.0 / _385;
    float _395 = _381 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _397 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[25].x, _389);
    float _399 = fma(_367, (*spvDescriptorSet0.vp_c8)._m0[10].z, _387);
    float _401 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[24].x, _391);
    float _403 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _397);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[26].x, _395);
    float _409 = _399 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _401);
    float _413 = _405 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _407);
    float _417 = _409 + _385;
    float _419 = _411 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _421 = _343 + _413;
    float _423 = _415 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _425 = _417 * _393;
    float _427 = _425 * 0.5;
    float _429 = _357 + _419;
    float _431 = _421 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _433 = _367 + _423;
    float _435 = _421 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _437 = _421 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[1].x, _431);
    float _441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[30].w, _441);
    float _445 = _421 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[0].x, _435);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[1].z, _439);
    float _451 = 1.0 / _443;
    bool _453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _455 = isnan(0.5);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _461 = _457 || _459;
    float _463 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[2].x, _437);
    float _465 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[3].x, _445);
    float _467 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[0].z, _447);
    float _469 = _449 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _471 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[2].z, _463);
    float _473 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[3].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _481 = _469 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _483 = _469 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _485 = _471 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _479);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _481);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _483);
    float _495 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _487);
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _489);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _491);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _493);
    float _503 = _487;
    float _505 = _475;
    if (_461)
    {
        _503 = 1.0;
    }
    float _507 = _503;
    float _509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _511 = _451 * _509;
    float _513 = _507;
    if (_461)
    {
        _505 = 1.0;
    }
    float _515 = _505;
    float _517 = _515;
    if (!_461)
    {
        float _519 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _521 = _519 * 0.15915493667125701904296875;
        float _523 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _525 = _521 * 6.283185482025146484375;
        float _527 = cos(_525);
        float _529 = _523 * 0.15915493667125701904296875;
        float _531 = _521 * 6.283185482025146484375;
        float _533 = sin(_531);
        float _535 = 1.0 / _527;
        float _537 = _529 * 6.283185482025146484375;
        float _539 = cos(_537);
        float _541 = _533 * _535;
        float _543 = _529 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _549 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _547;
        float _551 = _539 * _541;
        float _553 = 1.0 / _551;
        float _555 = 1.0 / _549;
        float _557 = _545 * _553;
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _561 = fma(_511, _557, _559);
        float _563 = _561 * _555;
        float _565 = precise::clamp(_563, 0.0, 1.0);
        _513 = _565;
    }
    float _567 = _513;
    if (!_461)
    {
        float _569 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _573 = _569 * 0.15915493667125701904296875;
        float _575 = _571 * 0.15915493667125701904296875;
        float _577 = _573 * 6.283185482025146484375;
        float _579 = cos(_577);
        float _581 = _573 * 6.283185482025146484375;
        float _583 = sin(_581);
        float _585 = 1.0 / _579;
        float _587 = _575 * 6.283185482025146484375;
        float _589 = cos(_587);
        float _591 = _583 * _585;
        float _593 = _575 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _589 * _591;
        float _599 = 1.0 / _597;
        float _601 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _603 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _601;
        float _605 = 1.0 / _603;
        float _607 = _595 * _599;
        float _609 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _611 = fma(_511, _607, _609);
        float _613 = _611 * _605;
        float _615 = precise::clamp(_613, 0.0, 1.0);
        float _617 = -_615;
        float _619 = _617 + 1.0;
        _517 = _619;
    }
    float _621 = _517;
    float _623 = _567 * _621;
    bool _625 = _567 > 0.0;
    bool _627 = isnan(_567);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = _473 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _639 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[6].w, _499);
    bool _641 = _621 <= 0.0;
    bool _643 = !_633;
    bool _645 = _641 || _643;
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[7].w, _501);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[4].w, _495);
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[5].w, _497);
    float _655 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _659 = _639 + _647;
    float _661 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _659 * 0.5;
    float _669 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _655;
    out.m_42.y = _665;
    out.m_42.z = _663;
    out.m_42.w = _661;
    out.gl_Position.x = _651;
    out.gl_Position.y = _653;
    out.gl_Position.z = _639;
    out.gl_Position.w = _647;
    out.m_44.z = _667;
    out.m_44.w = _647;
    out.m_31.x = _669;
    if (!_645)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _671;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _241 = false;
    bool _139 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _728 = as_type<float>(_79);
        out.gl_Position.z = _728;
    }
    if (!_67)
    {
        return out;
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _797 = as_type<float>(_115);
        out.gl_Position.z = _797;
    }
    if (_107)
    {
        return out;
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _129 = _127 * _123;
        float _131 = floor(_129);
        float _133 = -_131;
        float _135 = _129 + _133;
        _137 = _135;
        _139 = true;
    }
    else
    {
        float _141 = float(_63);
        float _143 = 1.0 / _141;
        float _145 = _97 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _165;
    float _169 = -_163;
    float _171 = _169 + 1.0;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _175 = 1.0 / _167;
    float _177 = _151 * _175;
    bool _179 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _181 = isnan(_147);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _195;
    float _199 = _189 * _171;
    float _201 = fma(_193, _177, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _203 = fma(_197, _177, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _205 = -_189;
    float _207 = _205 + 1.0;
    float _209 = _201 * _199;
    float _211 = _203 * _199;
    float _213 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[143].x, _209);
    float _215 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[143].y, _211);
    float _217 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[144].x, _213);
    float _219 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[144].y, _215);
    bool _221 = !_173;
    float _239;
    if (!_221)
    {
        float _223 = in.m_35.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        float _243 = float(_63);
        float _245 = 1.0 / _243;
        float _247 = _97 * _245;
        _239 = _247;
    }
    _241 = false;
    float _249 = _239;
    float _251 = as_type<float>(int(gl_VertexIndex));
    float _253 = in.m_40.x;
    float _255 = in.m_40.y;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _261 = in.m_28.x;
    float _263 = in.m_28.y;
    float _265 = in.m_28.z;
    float _267 = 1.0 / _259;
    int _269 = as_type<int>(_251) & 1;
    bool _271 = _269 != 0;
    int _273 = as_type<int>(_251) & 2;
    bool _275 = _273 != 0;
    float _277 = _217 * _253;
    float _279 = _219 * _255;
    float _281 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _283 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _285 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _287;
    float _291 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _281);
    float _293 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _283);
    float _295 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _285);
    float _297 = _289 * _267;
    bool _299 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _301 = isnan(_249);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    bool _313 = !_271;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _249 + _317;
    bool _321 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _323 = isnan(_249);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _277 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _315);
    float _341 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _291);
    float _343 = _311 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _345 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _295);
    float _347 = fma(_297, _319, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _349 = _331 * _335;
    float _351 = _337 * _339;
    bool _353 = !_275;
    float _355 = _353 ? (-0.5) : 0.5;
    float _357 = _341 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _359 = _343 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _361 = _347 * _349;
    float _363 = -_331;
    float _365 = _363 + 1.0;
    float _367 = _345 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _369 = fma(_357, (*spvDescriptorSet0.vp_c8)._m0[11].x, _359);
    float _371 = _279 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _355);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[115].x, _361);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c8)._m0[11].z, _369);
    float _379 = _343 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _381 = _371 * _373;
    float _383 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _385 = _377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c8)._m0[10].x, _379);
    float _389 = _381 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _391 = _381 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _393 = 1.0 / _385;
    float _395 = _381 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _397 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[25].x, _389);
    float _399 = fma(_367, (*spvDescriptorSet0.vp_c8)._m0[10].z, _387);
    float _401 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[24].x, _391);
    float _403 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _397);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[26].x, _395);
    float _409 = _399 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _401);
    float _413 = _405 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _407);
    float _417 = _409 + _385;
    float _419 = _411 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _421 = _343 + _413;
    float _423 = _415 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _425 = _417 * _393;
    float _427 = _425 * 0.5;
    float _429 = _357 + _419;
    float _431 = _421 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _433 = _367 + _423;
    float _435 = _421 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _437 = _421 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[1].x, _431);
    float _441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[30].w, _441);
    float _445 = _421 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[0].x, _435);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[1].z, _439);
    float _451 = 1.0 / _443;
    bool _453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _455 = isnan(0.5);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _461 = _457 || _459;
    float _463 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[2].x, _437);
    float _465 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[3].x, _445);
    float _467 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[0].z, _447);
    float _469 = _449 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _471 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[2].z, _463);
    float _473 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[3].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _481 = _469 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _483 = _469 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _485 = _471 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _479);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _481);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _483);
    float _495 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _487);
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _489);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _491);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _493);
    float _503 = _487;
    float _505 = _475;
    if (_461)
    {
        _503 = 1.0;
    }
    float _507 = _503;
    float _509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _511 = _451 * _509;
    float _513 = _507;
    if (_461)
    {
        _505 = 1.0;
    }
    float _515 = _505;
    float _517 = _515;
    if (!_461)
    {
        float _519 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _521 = _519 * 0.15915493667125701904296875;
        float _523 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _525 = _521 * 6.283185482025146484375;
        float _527 = cos(_525);
        float _529 = _523 * 0.15915493667125701904296875;
        float _531 = _521 * 6.283185482025146484375;
        float _533 = sin(_531);
        float _535 = 1.0 / _527;
        float _537 = _529 * 6.283185482025146484375;
        float _539 = cos(_537);
        float _541 = _533 * _535;
        float _543 = _529 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _549 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _547;
        float _551 = _539 * _541;
        float _553 = 1.0 / _551;
        float _555 = 1.0 / _549;
        float _557 = _545 * _553;
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _561 = fma(_511, _557, _559);
        float _563 = _561 * _555;
        float _565 = precise::clamp(_563, 0.0, 1.0);
        _513 = _565;
    }
    float _567 = _513;
    if (!_461)
    {
        float _569 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _573 = _569 * 0.15915493667125701904296875;
        float _575 = _571 * 0.15915493667125701904296875;
        float _577 = _573 * 6.283185482025146484375;
        float _579 = cos(_577);
        float _581 = _573 * 6.283185482025146484375;
        float _583 = sin(_581);
        float _585 = 1.0 / _579;
        float _587 = _575 * 6.283185482025146484375;
        float _589 = cos(_587);
        float _591 = _583 * _585;
        float _593 = _575 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _589 * _591;
        float _599 = 1.0 / _597;
        float _601 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _603 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _601;
        float _605 = 1.0 / _603;
        float _607 = _595 * _599;
        float _609 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _611 = fma(_511, _607, _609);
        float _613 = _611 * _605;
        float _615 = precise::clamp(_613, 0.0, 1.0);
        float _617 = -_615;
        float _619 = _617 + 1.0;
        _517 = _619;
    }
    float _621 = _517;
    float _623 = _567 * _621;
    bool _625 = _567 > 0.0;
    bool _627 = isnan(_567);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = _473 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _639 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[6].w, _499);
    bool _641 = _621 <= 0.0;
    bool _643 = !_633;
    bool _645 = _641 || _643;
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[7].w, _501);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[4].w, _495);
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[5].w, _497);
    float _655 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _659 = _639 + _647;
    float _661 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _659 * 0.5;
    float _669 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _655;
    out.m_42.y = _665;
    out.m_42.z = _663;
    out.m_42.w = _661;
    out.gl_Position.x = _651;
    out.gl_Position.y = _653;
    out.gl_Position.z = _639;
    out.gl_Position.w = _647;
    out.m_44.z = _667;
    out.m_44.w = _647;
    out.m_31.x = _669;
    if (!_645)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _671;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _241 = false;
    bool _139 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _728 = as_type<float>(_79);
        out.gl_Position.z = _728;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _797 = as_type<float>(_115);
        out.gl_Position.z = _797;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _129 = _127 * _123;
        float _131 = floor(_129);
        float _133 = -_131;
        float _135 = _129 + _133;
        _137 = _135;
        _139 = true;
    }
    else
    {
        float _141 = float(_63);
        float _143 = 1.0 / _141;
        float _145 = _97 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _165;
    float _169 = -_163;
    float _171 = _169 + 1.0;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _175 = 1.0 / _167;
    float _177 = _151 * _175;
    bool _179 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _181 = isnan(_147);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _195;
    float _199 = _189 * _171;
    float _201 = fma(_193, _177, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _203 = fma(_197, _177, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _205 = -_189;
    float _207 = _205 + 1.0;
    float _209 = _201 * _199;
    float _211 = _203 * _199;
    float _213 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[143].x, _209);
    float _215 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[143].y, _211);
    float _217 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[144].x, _213);
    float _219 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[144].y, _215);
    bool _221 = !_173;
    float _239;
    if (!_221)
    {
        float _223 = in.m_35.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        float _243 = float(_63);
        float _245 = 1.0 / _243;
        float _247 = _97 * _245;
        _239 = _247;
    }
    _241 = false;
    float _249 = _239;
    float _251 = as_type<float>(int(gl_VertexIndex));
    float _253 = in.m_40.x;
    float _255 = in.m_40.y;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _261 = in.m_28.x;
    float _263 = in.m_28.y;
    float _265 = in.m_28.z;
    float _267 = 1.0 / _259;
    int _269 = as_type<int>(_251) & 1;
    bool _271 = _269 != 0;
    int _273 = as_type<int>(_251) & 2;
    bool _275 = _273 != 0;
    float _277 = _217 * _253;
    float _279 = _219 * _255;
    float _281 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _283 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _285 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _287;
    float _291 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _281);
    float _293 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _283);
    float _295 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _285);
    float _297 = _289 * _267;
    bool _299 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _301 = isnan(_249);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    bool _313 = !_271;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _249 + _317;
    bool _321 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _323 = isnan(_249);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _277 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _315);
    float _341 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _291);
    float _343 = _311 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _345 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _295);
    float _347 = fma(_297, _319, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _349 = _331 * _335;
    float _351 = _337 * _339;
    bool _353 = !_275;
    float _355 = _353 ? (-0.5) : 0.5;
    float _357 = _341 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _359 = _343 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _361 = _347 * _349;
    float _363 = -_331;
    float _365 = _363 + 1.0;
    float _367 = _345 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _369 = fma(_357, (*spvDescriptorSet0.vp_c8)._m0[11].x, _359);
    float _371 = _279 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _355);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[115].x, _361);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c8)._m0[11].z, _369);
    float _379 = _343 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _381 = _371 * _373;
    float _383 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _385 = _377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c8)._m0[10].x, _379);
    float _389 = _381 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _391 = _381 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _393 = 1.0 / _385;
    float _395 = _381 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _397 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[25].x, _389);
    float _399 = fma(_367, (*spvDescriptorSet0.vp_c8)._m0[10].z, _387);
    float _401 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[24].x, _391);
    float _403 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _397);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[26].x, _395);
    float _409 = _399 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _401);
    float _413 = _405 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _407);
    float _417 = _409 + _385;
    float _419 = _411 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _421 = _343 + _413;
    float _423 = _415 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _425 = _417 * _393;
    float _427 = _425 * 0.5;
    float _429 = _357 + _419;
    float _431 = _421 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _433 = _367 + _423;
    float _435 = _421 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _437 = _421 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[1].x, _431);
    float _441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[30].w, _441);
    float _445 = _421 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[0].x, _435);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[1].z, _439);
    float _451 = 1.0 / _443;
    bool _453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _455 = isnan(0.5);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _461 = _457 || _459;
    float _463 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[2].x, _437);
    float _465 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[3].x, _445);
    float _467 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[0].z, _447);
    float _469 = _449 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _471 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[2].z, _463);
    float _473 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[3].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _481 = _469 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _483 = _469 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _485 = _471 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _479);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _481);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _483);
    float _495 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _487);
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _489);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _491);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _493);
    float _503 = _487;
    float _505 = _475;
    if (_461)
    {
        _503 = 1.0;
    }
    float _507 = _503;
    float _509 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _511 = _451 * _509;
    float _513 = _507;
    if (_461)
    {
        _505 = 1.0;
    }
    float _515 = _505;
    float _517 = _515;
    if (!_461)
    {
        float _519 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _521 = _519 * 0.15915493667125701904296875;
        float _523 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _525 = _521 * 6.283185482025146484375;
        float _527 = cos(_525);
        float _529 = _523 * 0.15915493667125701904296875;
        float _531 = _521 * 6.283185482025146484375;
        float _533 = sin(_531);
        float _535 = 1.0 / _527;
        float _537 = _529 * 6.283185482025146484375;
        float _539 = cos(_537);
        float _541 = _533 * _535;
        float _543 = _529 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _549 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _547;
        float _551 = _539 * _541;
        float _553 = 1.0 / _551;
        float _555 = 1.0 / _549;
        float _557 = _545 * _553;
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _561 = fma(_511, _557, _559);
        float _563 = _561 * _555;
        float _565 = precise::clamp(_563, 0.0, 1.0);
        _513 = _565;
    }
    float _567 = _513;
    if (!_461)
    {
        float _569 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _573 = _569 * 0.15915493667125701904296875;
        float _575 = _571 * 0.15915493667125701904296875;
        float _577 = _573 * 6.283185482025146484375;
        float _579 = cos(_577);
        float _581 = _573 * 6.283185482025146484375;
        float _583 = sin(_581);
        float _585 = 1.0 / _579;
        float _587 = _575 * 6.283185482025146484375;
        float _589 = cos(_587);
        float _591 = _583 * _585;
        float _593 = _575 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _589 * _591;
        float _599 = 1.0 / _597;
        float _601 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _603 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _601;
        float _605 = 1.0 / _603;
        float _607 = _595 * _599;
        float _609 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _611 = fma(_511, _607, _609);
        float _613 = _611 * _605;
        float _615 = precise::clamp(_613, 0.0, 1.0);
        float _617 = -_615;
        float _619 = _617 + 1.0;
        _517 = _619;
    }
    float _621 = _517;
    float _623 = _567 * _621;
    bool _625 = _567 > 0.0;
    bool _627 = isnan(_567);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = _473 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _639 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[6].w, _499);
    bool _641 = _621 <= 0.0;
    bool _643 = !_633;
    bool _645 = _641 || _643;
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[7].w, _501);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[4].w, _495);
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[5].w, _497);
    float _655 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _659 = _639 + _647;
    float _661 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _659 * 0.5;
    float _669 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _655;
    out.m_42.y = _665;
    out.m_42.z = _663;
    out.m_42.w = _661;
    out.gl_Position.x = _651;
    out.gl_Position.y = _653;
    out.gl_Position.z = _639;
    out.gl_Position.w = _647;
    out.m_44.z = _667;
    out.m_44.w = _647;
    out.m_31.x = _669;
    if (!_645)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _671;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

