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
    float4 m_46 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_40 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _311 = false;
    bool _163 = false;
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
        float _1076 = as_type<float>(_85);
        out.gl_Position.z = _1076;
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
        float _1145 = as_type<float>(_121);
        out.gl_Position.z = _1145;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _161;
    if (!_143)
    {
        float _145 = in.m_40.x;
        float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _149 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _153 = _151 * _147;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _159;
        _163 = true;
    }
    else
    {
        float _165 = float(_69);
        float _167 = 1.0 / _165;
        float _169 = _103 * _167;
        _161 = _169;
    }
    _163 = false;
    float _171 = _161;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = _171 + _173;
    bool _177 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _179 = isnan(_171);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _185 = _181 || _183;
    float _187 = float(_185);
    bool _189 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _191 = isnan(_171);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _197 = _193 || _195;
    float _199 = float(_197);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -_187;
    float _211 = _209 + 1.0;
    float _213 = 1.0 / _203;
    bool _215 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _217 = isnan(_171);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = _199 * _211;
    float _229 = -_199;
    float _231 = _229 + 1.0;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _235 = _225 * _231;
    float _237 = 1.0 / _207;
    float _239 = -_225;
    float _241 = _239 + 1.0;
    float _243 = _175 * _213;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _171 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = fma(_251, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _259 = fma(_255, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _247 * _237;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _267 = _257 * _235;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _273 = _259 * _235;
    float _275 = fma(_265, _261, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _277 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _279 = fma(_271, _261, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _281 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _283 = fma(_275, _227, _277);
    float _285 = fma(_279, _227, _281);
    float _287 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[145].x, _283);
    float _289 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[145].y, _285);
    bool _291 = !_233;
    float _309;
    if (!_291)
    {
        float _293 = in.m_40.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        float _313 = float(_69);
        float _315 = 1.0 / _313;
        float _317 = _103 * _315;
        _309 = _317;
    }
    _311 = false;
    float _319 = _309;
    float _321 = in.m_40.x;
    float _323 = in.m_40.y;
    float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _327 = in.m_30.x;
    float _329 = in.m_30.y;
    float _331 = in.m_30.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _341;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _347 = _345 != 0;
    float _349 = 1.0 / _335;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _353 = _351 != 0;
    float _355 = 1.0 / _339;
    bool _357 = _323 > 0.5;
    bool _359 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _361 = isnan(_319);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    bool _371 = _321 > 0.5;
    float _373 = _343 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _377 = _319 + _375;
    bool _379 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _381 = isnan(_319);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -_369;
    float _393 = _391 + 1.0;
    float _395 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = fma(_373, _377, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _399 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_319);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = _389 * _393;
    float _413 = -_389;
    float _415 = _413 + 1.0;
    float _417 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = _409 * _415;
    float _427 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _429 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _431 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _433 = _423 * _355;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _319 + _435;
    float _439 = _397 * _425;
    float _441 = -_409;
    float _443 = _441 + 1.0;
    float _445 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
    float _447 = fma(_433, _437, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _451 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[115].x, _439);
    float _453 = _445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = -_137;
    int _457 = _371 ? as_type<int>(_455) : as_type<int>(_137);
    float _459 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    float _461 = _449 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _465 = _453 + _463;
    bool _467 = !_347;
    float _469 = _467 ? _137 : as_type<float>(_457);
    float _471 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _473 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _475 = _461 + _473;
    float _477 = _465 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _479 = -_141;
    int _481 = _357 ? as_type<int>(_479) : as_type<int>(_141);
    float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _485 = _469 + 0.5;
    float _487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _489 = _471 + _487;
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[28].x, _477);
    bool _493 = !_353;
    float _495 = _493 ? _141 : as_type<float>(_481);
    float _497 = _485 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _499 = fma(_447, _411, _451);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[28].z, _491);
    float _503 = -_495;
    float _505 = _503 + 0.5;
    float _507 = _497 * _325;
    float _509 = _465 * _465;
    bool _511 = _501 >= 0.0;
    float _513 = _505 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _515 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[117].x, _499);
    float _517 = fma(_475, _475, _509);
    float _519 = _513 * _483;
    float _521 = fma(_489, _489, _517);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _525 = rsqrt(_521);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = _517;
    if (_511)
    {
        _529 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _531 = _529;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _541 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _555 = as_type<int>(_531);
    if (_511)
    {
        float _557 = _531 * 5.0;
        _555 = as_type<int>(_557);
    }
    int _559 = _555;
    out.m_42.x = _507;
    out.m_42.y = _519;
    float _561 = _465 * _525;
    float _563 = _475 * _525;
    out.m_44.x = _545;
    out.m_44.y = _547;
    out.m_44.z = _549;
    out.m_46.x = _541;
    out.m_46.y = _543;
    out.m_46.z = _551;
    out.m_46.w = _553;
    float _565 = as_type<float>(_559);
    if (_511)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_559);
        out.gl_Position.z = _1903;
    }
    if (_511)
    {
        out.m_33.x = 0.0;
    }
    if (_511)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _567 = -_561;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _571 = _489 * _525;
    float _573 = -_563;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _461);
    float _577 = -_561;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _465);
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _583 = _569 + _581;
    float _585 = -_571;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _471);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _575 + _589;
    float _593 = -_563;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    float _597 = _583 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _587 + _599;
    float _603 = _579 * _579;
    float _605 = in.m_48.x;
    float _607 = in.m_48.y;
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _597);
    float _611 = -_571;
    float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[18].w, _489);
    float _615 = fma(_595, _595, _603);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _609);
    float _619 = fma(_613, _613, _615);
    bool _621 = _617 >= 0.0;
    float _623 = sqrt(_619);
    if (_621)
    {
        _565 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _565;
    int _627 = as_type<int>(_625);
    if (_621)
    {
        out.m_33.x = 0.0;
    }
    float _629 = _287 * _605;
    float _631 = _289 * _607;
    float _633 = _525 * _623;
    if (_621)
    {
        float _635 = _625 * 5.0;
        _627 = as_type<int>(_635);
    }
    int _637 = _627;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2044 = as_type<float>(_637);
        out.gl_Position.z = _2044;
    }
    if (_621)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _639 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _641 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _647 = _639 * _633;
    float _649 = _641 * _633;
    float _651 = _633 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _653 = _651 * 0.5;
    float _655 = _643 * _647;
    float _657 = _645 * _649;
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _667 = _663 || _665;
    float _669 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _677 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _675);
    float _683 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _677);
    float _685 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _679);
    float _687 = _681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _689 = _683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _691 = _685 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _693 = _471 + _687;
    float _695 = _461 + _689;
    float _697 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _699 = _453 + _691;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _693 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _707 = _695 + _705;
    float _709 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _697);
    float _711 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _713 = _703 * _703;
    float _715 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[11].z, _709);
    float _717 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _711);
    float _719 = fma(_707, _707, _713);
    float _721 = _715 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _723 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[10].z, _717);
    float _725 = sqrt(_719);
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _729 = _727 + _721;
    float _731 = 1.0 / _721;
    bool _733 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _653;
    float _737 = _695;
    float _739 = _693;
    if (!_733)
    {
        _735 = _699;
    }
    float _741 = _735;
    bool _743 = !_733;
    float _745 = _741;
    if (!_743)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _751 = _725 + _749;
        float _753 = _699 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = rsqrt(_719);
        float _757 = _751 * _747;
        float _759 = _757 * 0.15915493667125701904296875;
        float _761 = _759 * 6.283185482025146484375;
        float _763 = sin(_761);
        float _765 = _759 * 6.283185482025146484375;
        float _767 = cos(_765);
        float _769 = fma(_763, _753, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _771 = _755 * _769;
        float _773 = _767 + (-1.0);
        float _775 = fma(_707, _771, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _777 = fma(_703, _771, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _779 = _773 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _781 = fma(_699, _767, _779);
        _737 = _775;
        _745 = _781;
        _739 = _777;
    }
    float _783 = _737;
    float _785 = _745;
    float _787 = _739;
    bool _789 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _791 = isnan(0.5);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _797 = _793 || _795;
    float _799 = -_563;
    float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _783);
    float _803 = -_561;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _807 = -_571;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _811 = _729 * _731;
    float _813 = _811 * 0.5;
    float _815 = _805;
    float _817 = _801;
    float _819 = _809;
    float _821 = _785;
    if (!_667)
    {
        float _823 = _583 * _583;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _827 = -_471;
        float _829 = _827 + _787;
        float _831 = fma(_591, _591, _823);
        float _833 = fma(_601, _601, _831);
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _837 = sqrt(_833);
        float _839 = 1.0 / _633;
        float _841 = _835 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _843 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _845 = _843 * _825;
        float _847 = -_461;
        float _849 = _847 + _783;
        float _851 = _845 * _839;
        float _853 = -_453;
        float _855 = _853 + _785;
        float _857 = _841 * _851;
        float _859 = _829 * _851;
        float _861 = fma(_855, _857, _569);
        float _863 = fma(_849, _857, _575);
        float _865 = fma(_841, _859, _587);
        _815 = _861;
        _817 = _863;
        _819 = _865;
    }
    float _867 = _815;
    float _869 = _817;
    float _871 = _819;
    float _873 = _867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _875 = _867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_797)
    {
        _821 = 1.0;
    }
    float _877 = _821;
    float _879 = _877;
    if (!_797)
    {
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _883 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _885 = _881 * 0.15915493667125701904296875;
        float _887 = _883 * 0.15915493667125701904296875;
        float _889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _891 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _889);
        float _893 = _885 * 6.283185482025146484375;
        float _895 = cos(_893);
        float _897 = _885 * 6.283185482025146484375;
        float _899 = sin(_897);
        float _901 = 1.0 / _895;
        float _903 = _887 * 6.283185482025146484375;
        float _905 = cos(_903);
        float _907 = _899 * _901;
        float _909 = _887 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _905 * _907;
        float _915 = 1.0 / _891;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _917;
        float _921 = 1.0 / _913;
        float _923 = 1.0 / _919;
        float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _927 = _915 * _925;
        float _929 = _911 * _921;
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = fma(_929, _927, _931);
        float _935 = _933 * _923;
        float _937 = precise::clamp(_935, 0.0, 1.0);
        _879 = _937;
    }
    float _939 = _879;
    float _941 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _875);
    float _943 = _867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = _867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _873);
    float _949 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _941);
    float _951 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _953 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _955 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _947);
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _959 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _951);
    float _961 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _953);
    float _963 = _955 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _969 = _957 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _971 = _959 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[6].x, _965);
    float _975 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[7].x, _967);
    float _977 = _957 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _979 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[4].x, _969);
    float _981 = _961 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[6].z, _973);
    float _985 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[7].z, _975);
    float _987 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[5].x, _977);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[4].z, _979);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[6].w, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[7].w, _985);
    bool _995 = _939 > 0.0;
    bool _997 = isnan(_939);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[5].z, _987);
    float _1007 = _939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1009 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[4].w, _989);
    float _1011 = _991 + _993;
    float _1013 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1005);
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1017 = _1011 * 0.5;
    out.m_33.x = _1015;
    out.gl_Position.x = _1009;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _991;
    out.gl_Position.w = _993;
    out.m_50.z = _1017;
    out.m_50.w = _993;
    if (_1003)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1019;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _311 = false;
    bool _163 = false;
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
        float _1076 = as_type<float>(_85);
        out.gl_Position.z = _1076;
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
        float _1145 = as_type<float>(_121);
        out.gl_Position.z = _1145;
    }
    if (_113)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _161;
    if (!_143)
    {
        float _145 = in.m_40.x;
        float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _149 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _153 = _151 * _147;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _159;
        _163 = true;
    }
    else
    {
        float _165 = float(_69);
        float _167 = 1.0 / _165;
        float _169 = _103 * _167;
        _161 = _169;
    }
    _163 = false;
    float _171 = _161;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = _171 + _173;
    bool _177 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _179 = isnan(_171);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _185 = _181 || _183;
    float _187 = float(_185);
    bool _189 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _191 = isnan(_171);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _197 = _193 || _195;
    float _199 = float(_197);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -_187;
    float _211 = _209 + 1.0;
    float _213 = 1.0 / _203;
    bool _215 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _217 = isnan(_171);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = _199 * _211;
    float _229 = -_199;
    float _231 = _229 + 1.0;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _235 = _225 * _231;
    float _237 = 1.0 / _207;
    float _239 = -_225;
    float _241 = _239 + 1.0;
    float _243 = _175 * _213;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _171 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = fma(_251, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _259 = fma(_255, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _247 * _237;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _267 = _257 * _235;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _273 = _259 * _235;
    float _275 = fma(_265, _261, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _277 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _279 = fma(_271, _261, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _281 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _283 = fma(_275, _227, _277);
    float _285 = fma(_279, _227, _281);
    float _287 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[145].x, _283);
    float _289 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[145].y, _285);
    bool _291 = !_233;
    float _309;
    if (!_291)
    {
        float _293 = in.m_40.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        float _313 = float(_69);
        float _315 = 1.0 / _313;
        float _317 = _103 * _315;
        _309 = _317;
    }
    _311 = false;
    float _319 = _309;
    float _321 = in.m_40.x;
    float _323 = in.m_40.y;
    float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _327 = in.m_30.x;
    float _329 = in.m_30.y;
    float _331 = in.m_30.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _341;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _347 = _345 != 0;
    float _349 = 1.0 / _335;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _353 = _351 != 0;
    float _355 = 1.0 / _339;
    bool _357 = _323 > 0.5;
    bool _359 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _361 = isnan(_319);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    bool _371 = _321 > 0.5;
    float _373 = _343 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _377 = _319 + _375;
    bool _379 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _381 = isnan(_319);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -_369;
    float _393 = _391 + 1.0;
    float _395 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = fma(_373, _377, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _399 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_319);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = _389 * _393;
    float _413 = -_389;
    float _415 = _413 + 1.0;
    float _417 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = _409 * _415;
    float _427 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _429 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _431 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _433 = _423 * _355;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _319 + _435;
    float _439 = _397 * _425;
    float _441 = -_409;
    float _443 = _441 + 1.0;
    float _445 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
    float _447 = fma(_433, _437, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _451 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[115].x, _439);
    float _453 = _445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = -_137;
    int _457 = _371 ? as_type<int>(_455) : as_type<int>(_137);
    float _459 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    float _461 = _449 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _465 = _453 + _463;
    bool _467 = !_347;
    float _469 = _467 ? _137 : as_type<float>(_457);
    float _471 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _473 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _475 = _461 + _473;
    float _477 = _465 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _479 = -_141;
    int _481 = _357 ? as_type<int>(_479) : as_type<int>(_141);
    float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _485 = _469 + 0.5;
    float _487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _489 = _471 + _487;
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[28].x, _477);
    bool _493 = !_353;
    float _495 = _493 ? _141 : as_type<float>(_481);
    float _497 = _485 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _499 = fma(_447, _411, _451);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[28].z, _491);
    float _503 = -_495;
    float _505 = _503 + 0.5;
    float _507 = _497 * _325;
    float _509 = _465 * _465;
    bool _511 = _501 >= 0.0;
    float _513 = _505 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _515 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[117].x, _499);
    float _517 = fma(_475, _475, _509);
    float _519 = _513 * _483;
    float _521 = fma(_489, _489, _517);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _525 = rsqrt(_521);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = _517;
    if (_511)
    {
        _529 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _531 = _529;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _541 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _555 = as_type<int>(_531);
    if (_511)
    {
        float _557 = _531 * 5.0;
        _555 = as_type<int>(_557);
    }
    int _559 = _555;
    out.m_42.x = _507;
    out.m_42.y = _519;
    float _561 = _465 * _525;
    float _563 = _475 * _525;
    out.m_44.x = _545;
    out.m_44.y = _547;
    out.m_44.z = _549;
    out.m_46.x = _541;
    out.m_46.y = _543;
    out.m_46.z = _551;
    out.m_46.w = _553;
    float _565 = as_type<float>(_559);
    if (_511)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_559);
        out.gl_Position.z = _1903;
    }
    if (_511)
    {
        out.m_33.x = 0.0;
    }
    if (_511)
    {
        return out;
    }
    float _567 = -_561;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _571 = _489 * _525;
    float _573 = -_563;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _461);
    float _577 = -_561;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _465);
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _583 = _569 + _581;
    float _585 = -_571;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _471);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _575 + _589;
    float _593 = -_563;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    float _597 = _583 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _587 + _599;
    float _603 = _579 * _579;
    float _605 = in.m_48.x;
    float _607 = in.m_48.y;
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _597);
    float _611 = -_571;
    float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[18].w, _489);
    float _615 = fma(_595, _595, _603);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _609);
    float _619 = fma(_613, _613, _615);
    bool _621 = _617 >= 0.0;
    float _623 = sqrt(_619);
    if (_621)
    {
        _565 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _565;
    int _627 = as_type<int>(_625);
    if (_621)
    {
        out.m_33.x = 0.0;
    }
    float _629 = _287 * _605;
    float _631 = _289 * _607;
    float _633 = _525 * _623;
    if (_621)
    {
        float _635 = _625 * 5.0;
        _627 = as_type<int>(_635);
    }
    int _637 = _627;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2044 = as_type<float>(_637);
        out.gl_Position.z = _2044;
    }
    if (_621)
    {
        return out;
    }
    float _639 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _641 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _647 = _639 * _633;
    float _649 = _641 * _633;
    float _651 = _633 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _653 = _651 * 0.5;
    float _655 = _643 * _647;
    float _657 = _645 * _649;
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _667 = _663 || _665;
    float _669 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _677 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _675);
    float _683 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _677);
    float _685 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _679);
    float _687 = _681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _689 = _683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _691 = _685 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _693 = _471 + _687;
    float _695 = _461 + _689;
    float _697 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _699 = _453 + _691;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _693 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _707 = _695 + _705;
    float _709 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _697);
    float _711 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _713 = _703 * _703;
    float _715 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[11].z, _709);
    float _717 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _711);
    float _719 = fma(_707, _707, _713);
    float _721 = _715 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _723 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[10].z, _717);
    float _725 = sqrt(_719);
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _729 = _727 + _721;
    float _731 = 1.0 / _721;
    bool _733 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _653;
    float _737 = _695;
    float _739 = _693;
    if (!_733)
    {
        _735 = _699;
    }
    float _741 = _735;
    bool _743 = !_733;
    float _745 = _741;
    if (!_743)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _751 = _725 + _749;
        float _753 = _699 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = rsqrt(_719);
        float _757 = _751 * _747;
        float _759 = _757 * 0.15915493667125701904296875;
        float _761 = _759 * 6.283185482025146484375;
        float _763 = sin(_761);
        float _765 = _759 * 6.283185482025146484375;
        float _767 = cos(_765);
        float _769 = fma(_763, _753, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _771 = _755 * _769;
        float _773 = _767 + (-1.0);
        float _775 = fma(_707, _771, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _777 = fma(_703, _771, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _779 = _773 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _781 = fma(_699, _767, _779);
        _737 = _775;
        _745 = _781;
        _739 = _777;
    }
    float _783 = _737;
    float _785 = _745;
    float _787 = _739;
    bool _789 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _791 = isnan(0.5);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _797 = _793 || _795;
    float _799 = -_563;
    float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _783);
    float _803 = -_561;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _807 = -_571;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _811 = _729 * _731;
    float _813 = _811 * 0.5;
    float _815 = _805;
    float _817 = _801;
    float _819 = _809;
    float _821 = _785;
    if (!_667)
    {
        float _823 = _583 * _583;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _827 = -_471;
        float _829 = _827 + _787;
        float _831 = fma(_591, _591, _823);
        float _833 = fma(_601, _601, _831);
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _837 = sqrt(_833);
        float _839 = 1.0 / _633;
        float _841 = _835 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _843 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _845 = _843 * _825;
        float _847 = -_461;
        float _849 = _847 + _783;
        float _851 = _845 * _839;
        float _853 = -_453;
        float _855 = _853 + _785;
        float _857 = _841 * _851;
        float _859 = _829 * _851;
        float _861 = fma(_855, _857, _569);
        float _863 = fma(_849, _857, _575);
        float _865 = fma(_841, _859, _587);
        _815 = _861;
        _817 = _863;
        _819 = _865;
    }
    float _867 = _815;
    float _869 = _817;
    float _871 = _819;
    float _873 = _867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _875 = _867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_797)
    {
        _821 = 1.0;
    }
    float _877 = _821;
    float _879 = _877;
    if (!_797)
    {
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _883 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _885 = _881 * 0.15915493667125701904296875;
        float _887 = _883 * 0.15915493667125701904296875;
        float _889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _891 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _889);
        float _893 = _885 * 6.283185482025146484375;
        float _895 = cos(_893);
        float _897 = _885 * 6.283185482025146484375;
        float _899 = sin(_897);
        float _901 = 1.0 / _895;
        float _903 = _887 * 6.283185482025146484375;
        float _905 = cos(_903);
        float _907 = _899 * _901;
        float _909 = _887 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _905 * _907;
        float _915 = 1.0 / _891;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _917;
        float _921 = 1.0 / _913;
        float _923 = 1.0 / _919;
        float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _927 = _915 * _925;
        float _929 = _911 * _921;
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = fma(_929, _927, _931);
        float _935 = _933 * _923;
        float _937 = precise::clamp(_935, 0.0, 1.0);
        _879 = _937;
    }
    float _939 = _879;
    float _941 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _875);
    float _943 = _867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = _867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _873);
    float _949 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _941);
    float _951 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _953 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _955 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _947);
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _959 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _951);
    float _961 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _953);
    float _963 = _955 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _969 = _957 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _971 = _959 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[6].x, _965);
    float _975 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[7].x, _967);
    float _977 = _957 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _979 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[4].x, _969);
    float _981 = _961 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[6].z, _973);
    float _985 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[7].z, _975);
    float _987 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[5].x, _977);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[4].z, _979);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[6].w, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[7].w, _985);
    bool _995 = _939 > 0.0;
    bool _997 = isnan(_939);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[5].z, _987);
    float _1007 = _939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1009 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[4].w, _989);
    float _1011 = _991 + _993;
    float _1013 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1005);
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1017 = _1011 * 0.5;
    out.m_33.x = _1015;
    out.gl_Position.x = _1009;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _991;
    out.gl_Position.w = _993;
    out.m_50.z = _1017;
    out.m_50.w = _993;
    if (_1003)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1019;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _311 = false;
    bool _163 = false;
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
        float _1076 = as_type<float>(_85);
        out.gl_Position.z = _1076;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1145 = as_type<float>(_121);
        out.gl_Position.z = _1145;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _161;
    if (!_143)
    {
        float _145 = in.m_40.x;
        float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _149 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _153 = _151 * _147;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _159;
        _163 = true;
    }
    else
    {
        float _165 = float(_69);
        float _167 = 1.0 / _165;
        float _169 = _103 * _167;
        _161 = _169;
    }
    _163 = false;
    float _171 = _161;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = _171 + _173;
    bool _177 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _179 = isnan(_171);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _185 = _181 || _183;
    float _187 = float(_185);
    bool _189 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _191 = isnan(_171);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _197 = _193 || _195;
    float _199 = float(_197);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -_187;
    float _211 = _209 + 1.0;
    float _213 = 1.0 / _203;
    bool _215 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _217 = isnan(_171);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = _199 * _211;
    float _229 = -_199;
    float _231 = _229 + 1.0;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _235 = _225 * _231;
    float _237 = 1.0 / _207;
    float _239 = -_225;
    float _241 = _239 + 1.0;
    float _243 = _175 * _213;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _171 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = fma(_251, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _259 = fma(_255, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _247 * _237;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _267 = _257 * _235;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _273 = _259 * _235;
    float _275 = fma(_265, _261, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _277 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _279 = fma(_271, _261, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _281 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _283 = fma(_275, _227, _277);
    float _285 = fma(_279, _227, _281);
    float _287 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[145].x, _283);
    float _289 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[145].y, _285);
    bool _291 = !_233;
    float _309;
    if (!_291)
    {
        float _293 = in.m_40.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        float _313 = float(_69);
        float _315 = 1.0 / _313;
        float _317 = _103 * _315;
        _309 = _317;
    }
    _311 = false;
    float _319 = _309;
    float _321 = in.m_40.x;
    float _323 = in.m_40.y;
    float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _327 = in.m_30.x;
    float _329 = in.m_30.y;
    float _331 = in.m_30.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _341;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _347 = _345 != 0;
    float _349 = 1.0 / _335;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _353 = _351 != 0;
    float _355 = 1.0 / _339;
    bool _357 = _323 > 0.5;
    bool _359 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _361 = isnan(_319);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    bool _371 = _321 > 0.5;
    float _373 = _343 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _377 = _319 + _375;
    bool _379 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _381 = isnan(_319);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -_369;
    float _393 = _391 + 1.0;
    float _395 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = fma(_373, _377, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _399 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_319);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = _389 * _393;
    float _413 = -_389;
    float _415 = _413 + 1.0;
    float _417 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = _409 * _415;
    float _427 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _429 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _431 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _433 = _423 * _355;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _319 + _435;
    float _439 = _397 * _425;
    float _441 = -_409;
    float _443 = _441 + 1.0;
    float _445 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
    float _447 = fma(_433, _437, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _451 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[115].x, _439);
    float _453 = _445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = -_137;
    int _457 = _371 ? as_type<int>(_455) : as_type<int>(_137);
    float _459 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    float _461 = _449 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _465 = _453 + _463;
    bool _467 = !_347;
    float _469 = _467 ? _137 : as_type<float>(_457);
    float _471 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _473 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _475 = _461 + _473;
    float _477 = _465 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _479 = -_141;
    int _481 = _357 ? as_type<int>(_479) : as_type<int>(_141);
    float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _485 = _469 + 0.5;
    float _487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _489 = _471 + _487;
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[28].x, _477);
    bool _493 = !_353;
    float _495 = _493 ? _141 : as_type<float>(_481);
    float _497 = _485 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _499 = fma(_447, _411, _451);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[28].z, _491);
    float _503 = -_495;
    float _505 = _503 + 0.5;
    float _507 = _497 * _325;
    float _509 = _465 * _465;
    bool _511 = _501 >= 0.0;
    float _513 = _505 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _515 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[117].x, _499);
    float _517 = fma(_475, _475, _509);
    float _519 = _513 * _483;
    float _521 = fma(_489, _489, _517);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _525 = rsqrt(_521);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = _517;
    if (_511)
    {
        _529 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _531 = _529;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _541 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _555 = as_type<int>(_531);
    if (_511)
    {
        float _557 = _531 * 5.0;
        _555 = as_type<int>(_557);
    }
    int _559 = _555;
    out.m_42.x = _507;
    out.m_42.y = _519;
    float _561 = _465 * _525;
    float _563 = _475 * _525;
    out.m_44.x = _545;
    out.m_44.y = _547;
    out.m_44.z = _549;
    out.m_46.x = _541;
    out.m_46.y = _543;
    out.m_46.z = _551;
    out.m_46.w = _553;
    float _565 = as_type<float>(_559);
    if (_511)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_559);
        out.gl_Position.z = _1903;
    }
    if (_511)
    {
        out.m_33.x = 0.0;
    }
    if (_511)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _567 = -_561;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _571 = _489 * _525;
    float _573 = -_563;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _461);
    float _577 = -_561;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _465);
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _583 = _569 + _581;
    float _585 = -_571;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _471);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _575 + _589;
    float _593 = -_563;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    float _597 = _583 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _587 + _599;
    float _603 = _579 * _579;
    float _605 = in.m_48.x;
    float _607 = in.m_48.y;
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _597);
    float _611 = -_571;
    float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[18].w, _489);
    float _615 = fma(_595, _595, _603);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _609);
    float _619 = fma(_613, _613, _615);
    bool _621 = _617 >= 0.0;
    float _623 = sqrt(_619);
    if (_621)
    {
        _565 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _565;
    int _627 = as_type<int>(_625);
    if (_621)
    {
        out.m_33.x = 0.0;
    }
    float _629 = _287 * _605;
    float _631 = _289 * _607;
    float _633 = _525 * _623;
    if (_621)
    {
        float _635 = _625 * 5.0;
        _627 = as_type<int>(_635);
    }
    int _637 = _627;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2044 = as_type<float>(_637);
        out.gl_Position.z = _2044;
    }
    if (_621)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _639 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _641 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _647 = _639 * _633;
    float _649 = _641 * _633;
    float _651 = _633 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _653 = _651 * 0.5;
    float _655 = _643 * _647;
    float _657 = _645 * _649;
    bool _659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _667 = _663 || _665;
    float _669 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _677 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _675);
    float _683 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _677);
    float _685 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _679);
    float _687 = _681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _689 = _683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _691 = _685 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _693 = _471 + _687;
    float _695 = _461 + _689;
    float _697 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _699 = _453 + _691;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _693 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _707 = _695 + _705;
    float _709 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _697);
    float _711 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _713 = _703 * _703;
    float _715 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[11].z, _709);
    float _717 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _711);
    float _719 = fma(_707, _707, _713);
    float _721 = _715 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _723 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[10].z, _717);
    float _725 = sqrt(_719);
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _729 = _727 + _721;
    float _731 = 1.0 / _721;
    bool _733 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _653;
    float _737 = _695;
    float _739 = _693;
    if (!_733)
    {
        _735 = _699;
    }
    float _741 = _735;
    bool _743 = !_733;
    float _745 = _741;
    if (!_743)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _751 = _725 + _749;
        float _753 = _699 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = rsqrt(_719);
        float _757 = _751 * _747;
        float _759 = _757 * 0.15915493667125701904296875;
        float _761 = _759 * 6.283185482025146484375;
        float _763 = sin(_761);
        float _765 = _759 * 6.283185482025146484375;
        float _767 = cos(_765);
        float _769 = fma(_763, _753, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _771 = _755 * _769;
        float _773 = _767 + (-1.0);
        float _775 = fma(_707, _771, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _777 = fma(_703, _771, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _779 = _773 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _781 = fma(_699, _767, _779);
        _737 = _775;
        _745 = _781;
        _739 = _777;
    }
    float _783 = _737;
    float _785 = _745;
    float _787 = _739;
    bool _789 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _791 = isnan(0.5);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _797 = _793 || _795;
    float _799 = -_563;
    float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _783);
    float _803 = -_561;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _807 = -_571;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _811 = _729 * _731;
    float _813 = _811 * 0.5;
    float _815 = _805;
    float _817 = _801;
    float _819 = _809;
    float _821 = _785;
    if (!_667)
    {
        float _823 = _583 * _583;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _827 = -_471;
        float _829 = _827 + _787;
        float _831 = fma(_591, _591, _823);
        float _833 = fma(_601, _601, _831);
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _837 = sqrt(_833);
        float _839 = 1.0 / _633;
        float _841 = _835 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _843 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _845 = _843 * _825;
        float _847 = -_461;
        float _849 = _847 + _783;
        float _851 = _845 * _839;
        float _853 = -_453;
        float _855 = _853 + _785;
        float _857 = _841 * _851;
        float _859 = _829 * _851;
        float _861 = fma(_855, _857, _569);
        float _863 = fma(_849, _857, _575);
        float _865 = fma(_841, _859, _587);
        _815 = _861;
        _817 = _863;
        _819 = _865;
    }
    float _867 = _815;
    float _869 = _817;
    float _871 = _819;
    float _873 = _867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _875 = _867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_797)
    {
        _821 = 1.0;
    }
    float _877 = _821;
    float _879 = _877;
    if (!_797)
    {
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _883 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _885 = _881 * 0.15915493667125701904296875;
        float _887 = _883 * 0.15915493667125701904296875;
        float _889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _891 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _889);
        float _893 = _885 * 6.283185482025146484375;
        float _895 = cos(_893);
        float _897 = _885 * 6.283185482025146484375;
        float _899 = sin(_897);
        float _901 = 1.0 / _895;
        float _903 = _887 * 6.283185482025146484375;
        float _905 = cos(_903);
        float _907 = _899 * _901;
        float _909 = _887 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _905 * _907;
        float _915 = 1.0 / _891;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _917;
        float _921 = 1.0 / _913;
        float _923 = 1.0 / _919;
        float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _927 = _915 * _925;
        float _929 = _911 * _921;
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = fma(_929, _927, _931);
        float _935 = _933 * _923;
        float _937 = precise::clamp(_935, 0.0, 1.0);
        _879 = _937;
    }
    float _939 = _879;
    float _941 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _875);
    float _943 = _867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = _867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _873);
    float _949 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _941);
    float _951 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _953 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _955 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _947);
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _959 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _951);
    float _961 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _953);
    float _963 = _955 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _969 = _957 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _971 = _959 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[6].x, _965);
    float _975 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[7].x, _967);
    float _977 = _957 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _979 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[4].x, _969);
    float _981 = _961 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[6].z, _973);
    float _985 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[7].z, _975);
    float _987 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[5].x, _977);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[4].z, _979);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[6].w, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[7].w, _985);
    bool _995 = _939 > 0.0;
    bool _997 = isnan(_939);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[5].z, _987);
    float _1007 = _939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1009 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[4].w, _989);
    float _1011 = _991 + _993;
    float _1013 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1005);
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1017 = _1011 * 0.5;
    out.m_33.x = _1015;
    out.gl_Position.x = _1009;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _991;
    out.gl_Position.w = _993;
    out.m_50.z = _1017;
    out.m_50.w = _993;
    if (_1003)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1019;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

