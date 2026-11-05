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
    float4 m_48 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_50 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _847 = false;
    bool _313 = false;
    bool _165 = false;
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
        float _1218 = as_type<float>(_87);
        out.gl_Position.z = _1218;
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
        float _1287 = as_type<float>(_123);
        out.gl_Position.z = _1287;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    bool _127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _129 = as_type<int>(_125) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_125) & 2;
    bool _135 = _133 != 0;
    bool _137 = !_131;
    float _139 = _137 ? (-0.5) : 0.5;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_127;
    float _163;
    if (!_145)
    {
        float _147 = in.m_42.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_71);
        float _169 = 1.0 / _167;
        float _171 = _105 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    bool _179 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _181 = isnan(_173);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    bool _191 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_173);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _207 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = -_189;
    float _213 = _211 + 1.0;
    float _215 = 1.0 / _205;
    bool _217 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _219 = isnan(_173);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = _201 * _213;
    float _231 = -_201;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = _227 * _233;
    float _239 = 1.0 / _209;
    float _241 = -_227;
    float _243 = _241 + 1.0;
    float _245 = _177 * _215;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _173 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_253, _245, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _245, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _249 * _239;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _269 = _259 * _237;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _275 = _261 * _237;
    float _277 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _279 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _281 = fma(_273, _263, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _283 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _285 = fma(_277, _229, _279);
    float _287 = fma(_281, _229, _283);
    float _289 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[145].x, _285);
    float _291 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[145].y, _287);
    bool _293 = !_235;
    float _311;
    if (!_293)
    {
        float _295 = in.m_42.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_71);
        float _317 = 1.0 / _315;
        float _319 = _105 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_42.x;
    float _325 = in.m_42.y;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _329 = in.m_32.x;
    float _331 = in.m_32.y;
    float _333 = in.m_32.z;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _349 = _347 != 0;
    float _351 = 1.0 / _337;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _355 = _353 != 0;
    float _357 = 1.0 / _341;
    bool _359 = _325 > 0.5;
    bool _361 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = isnan(_321);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    bool _373 = _323 > 0.5;
    float _375 = _345 * _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _379 = _321 + _377;
    bool _381 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _383 = isnan(_321);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -_371;
    float _395 = _393 + 1.0;
    float _397 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_375, _379, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _401 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_321);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _391 * _395;
    float _415 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _417 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = -_391;
    float _421 = _419 + 1.0;
    float _423 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _429 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
    float _431 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _433 = _411 * _421;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _321 + _435;
    float _439 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _441 = _427 * _357;
    float _443 = _399 * _433;
    float _445 = -_411;
    float _447 = _445 + 1.0;
    float _449 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _451 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _453 = -_139;
    int _455 = _373 ? as_type<int>(_453) : as_type<int>(_139);
    float _457 = fma(_441, _437, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _463 = _449 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _467 = _451 + _465;
    bool _469 = !_349;
    float _471 = _469 ? _139 : as_type<float>(_455);
    float _473 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _477 = _463 + _475;
    float _479 = _467 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _481 = -_143;
    int _483 = _359 ? as_type<int>(_481) : as_type<int>(_143);
    float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _487 = _471 + 0.5;
    float _489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _491 = _473 + _489;
    float _493 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[28].x, _479);
    bool _495 = !_355;
    float _497 = _495 ? _143 : as_type<float>(_483);
    float _499 = _487 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _501 = fma(_457, _413, _461);
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[28].z, _493);
    float _505 = -_497;
    float _507 = _505 + 0.5;
    float _509 = _499 * _327;
    float _511 = _467 * _467;
    bool _513 = _503 >= 0.0;
    float _515 = _507 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _517 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[117].x, _501);
    float _519 = fma(_477, _477, _511);
    float _521 = _515 * _485;
    float _523 = fma(_491, _491, _519);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = rsqrt(_523);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = _519;
    if (_513)
    {
        _531 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _533 = _531;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _543 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _557 = as_type<int>(_533);
    if (_513)
    {
        float _559 = _533 * 5.0;
        _557 = as_type<int>(_559);
    }
    int _561 = _557;
    out.m_44.x = _509;
    out.m_44.y = _521;
    float _563 = _467 * _527;
    float _565 = _477 * _527;
    out.m_46.x = _547;
    out.m_46.y = _549;
    out.m_46.z = _551;
    out.m_48.x = _543;
    out.m_48.y = _545;
    out.m_48.z = _553;
    out.m_48.w = _555;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2043 = as_type<float>(_561);
        out.gl_Position.z = _2043;
    }
    if (_513)
    {
        out.m_35.x = 0.0;
    }
    if (_513)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _567 = -_563;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _451);
    float _571 = _491 * _527;
    float _573 = -_565;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _463);
    float _577 = -_563;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _583 = _569 + _581;
    float _585 = -_571;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _473);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _575 + _589;
    float _593 = -_565;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _477);
    float _597 = _583 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _587 + _599;
    float _603 = _579 * _579;
    float _605 = -_571;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _491);
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _597);
    float _611 = in.m_50.x;
    float _613 = in.m_50.y;
    float _615 = fma(_595, _595, _603);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _609);
    float _619 = fma(_607, _607, _615);
    bool _621 = _617 >= 0.0;
    float _623 = sqrt(_619);
    float _625 = _617;
    if (_621)
    {
        _625 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _627 = _625;
    int _629 = as_type<int>(_627);
    if (_621)
    {
        out.m_35.x = 0.0;
    }
    float _631 = _289 * _611;
    float _633 = _291 * _613;
    if (_621)
    {
        float _635 = _627 * 5.0;
        _629 = as_type<int>(_635);
    }
    int _637 = _629;
    float _639 = _527 * _623;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_637);
        out.gl_Position.z = _2185;
    }
    if (_621)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _641 = _633 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _139);
    float _649 = _641 * _639;
    float _651 = _643 * _639;
    float _653 = _639 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _655 = _653 * 0.5;
    float _657 = _645 * _649;
    float _659 = _647 * _651;
    float _661 = _657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _663 = _657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _671 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].z, _667);
    float _675 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].z, _671);
    float _679 = _673 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _685 = _463 + _679;
    float _687 = _473 + _681;
    float _689 = _451 + _683;
    float _691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _697 = _687 + _695;
    float _699 = _693 * _693;
    float _701 = _697 * _697;
    float _703 = _699 + _701;
    float _705 = sqrt(_703);
    bool _707 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _709 = _683;
    float _711 = _677;
    float _713 = _655;
    float _715 = _701;
    float _717 = _685;
    if (!_707)
    {
        _709 = _699;
    }
    float _719 = _709;
    float _721 = _719;
    if (!_707)
    {
        _711 = _687;
    }
    float _723 = _711;
    float _725 = _723;
    if (!_707)
    {
        _713 = _689;
    }
    float _727 = _713;
    bool _729 = !_707;
    float _731 = _727;
    if (!_729)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _737 = _705 + _735;
        float _739 = rsqrt(_703);
        float _741 = _737 * _733;
        float _743 = _689 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _745 = _741 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = cos(_751);
        float _755 = fma(_749, _743, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = _739 * _755;
        float _759 = _753 + (-1.0);
        float _761 = fma(_693, _757, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _763 = fma(_697, _757, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _765 = _759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _769 = _761 + _767;
        float _771 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _773 = _763 + _771;
        float _775 = fma(_689, _753, _765);
        float _777 = _769 * _769;
        float _779 = _773 * _773;
        _731 = _775;
        _721 = _777;
        _715 = _779;
        _717 = _761;
        _725 = _763;
    }
    float _781 = _731;
    float _783 = _721;
    float _785 = _715;
    float _787 = _717;
    float _789 = _725;
    float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _793 = _781 + _791;
    float _795 = fma(_793, _793, _783);
    float _797 = _795 + _785;
    float _799 = sqrt(_797);
    bool _801 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _803 = isnan(_799);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _809 = _805 || _807;
    float _811 = _783;
    if (!_809)
    {
        _811 = 1.0;
    }
    float _813 = _811;
    bool _815 = !_809;
    float _817 = _813;
    if (!_815)
    {
        bool _819 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _821 = isnan(_799);
        bool _823 = _819 || _821;
        bool _825 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _827 = _823 || _825;
        if (!_827)
        {
            float _829 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _831 = _799 + _829;
            float _833 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _835 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _833;
            float _837 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _839 = _837 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _841 = 1.0 / _835;
            float _843 = _831 * _841;
            float _845 = fma(_843, _839, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _817 = _845;
            _847 = true;
        }
        else
        {
            bool _849 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _851 = isnan(_799);
            bool _853 = _849 || _851;
            bool _855 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _857 = _853 || _855;
            if (!_857)
            {
                float _859 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _861 = _799 + _859;
                float _863 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _865 = _863 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _867 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _869 = _867 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _871 = 1.0 / _865;
                float _873 = _861 * _871;
                float _875 = fma(_873, _869, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _817 = _875;
                _847 = true;
            }
            else
            {
                _817 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _847 = false;
    float _877 = _817;
    float _879 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _881 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _883 = _787 + _881;
    float _885 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _887 = _781 + _885;
    float _889 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _879);
    float _891 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = fma(_883, _877, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _895 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _897 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.5);
    bool _903 = _899 || _901;
    float _905 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[11].z, _889);
    float _907 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _909 = fma(_887, _877, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _911 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _913 = _789 + _911;
    float _915 = _905 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _919 = -_565;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _893);
    float _923 = 1.0 / _915;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = fma(_913, _877, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _929 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _931 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.5);
    bool _937 = _933 || _935;
    float _939 = -_563;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _943 = _925 + _915;
    float _945 = -_571;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _949 = _925;
    float _951 = _941;
    float _953 = _947;
    if (_903)
    {
        _949 = _921;
    }
    float _955 = _949;
    float _957 = _955;
    if (!_903)
    {
        float _959 = _583 * _583;
        float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _963 = -_473;
        float _965 = _963 + _927;
        float _967 = -_463;
        float _969 = _967 + _893;
        float _971 = fma(_591, _591, _959);
        float _973 = -_451;
        float _975 = _973 + _909;
        float _977 = fma(_601, _601, _971);
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _981 = sqrt(_977);
        float _983 = 1.0 / _639;
        float _985 = _979 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _987 = precise::min(_981, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _989 = _987 * _961;
        float _991 = _989 * _983;
        float _993 = _985 * _991;
        float _995 = _965 * _991;
        float _997 = fma(_969, _993, _575);
        float _999 = fma(_975, _993, _569);
        float _1001 = fma(_985, _995, _587);
        _951 = _999;
        _957 = _997;
        _953 = _1001;
    }
    float _1003 = _951;
    float _1005 = _957;
    float _1007 = _953;
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1015 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1017 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1009);
    float _1019 = _943 * _923;
    float _1021 = _1019 * 0.5;
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1011);
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1013);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1015);
    float _1029 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1017);
    float _1031 = _1017;
    if (_937)
    {
        _1031 = 1.0;
    }
    float _1033 = _1031;
    float _1035 = _1033;
    if (!_937)
    {
        float _1037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1041 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1039);
        float _1043 = _1037 * 0.15915493667125701904296875;
        float _1045 = _1043 * 6.283185482025146484375;
        float _1047 = cos(_1045);
        float _1049 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1051 = _1049 * 0.15915493667125701904296875;
        float _1053 = _1043 * 6.283185482025146484375;
        float _1055 = sin(_1053);
        float _1057 = 1.0 / _1047;
        float _1059 = _1051 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1055 * _1057;
        float _1065 = 1.0 / _1041;
        float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1069 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1067;
        float _1071 = _1061 * _1063;
        float _1073 = _1051 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        float _1077 = 1.0 / _1071;
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1081 = _1065 * _1079;
        float _1083 = 1.0 / _1069;
        float _1085 = _1075 * _1077;
        float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1089 = fma(_1085, _1081, _1087);
        float _1091 = _1089 * _1083;
        float _1093 = precise::clamp(_1091, 0.0, 1.0);
        _1035 = _1093;
    }
    float _1095 = _1035;
    float _1097 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1023);
    float _1099 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1103 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1027);
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1113 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1107);
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1109);
    float _1119 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1111);
    float _1123 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1125 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1115);
    float _1127 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1117);
    float _1129 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1119);
    float _1131 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1121);
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1125);
    float _1135 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1127);
    bool _1137 = _1095 > 0.0;
    bool _1139 = isnan(_1095);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.0);
    bool _1145 = _1141 || _1143;
    float _1147 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1129);
    float _1149 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1131);
    float _1153 = _1133 + _1135;
    float _1155 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1159 = _1153 * 0.5;
    out.m_35.x = _1157;
    out.gl_Position.x = _1151;
    out.gl_Position.y = _1155;
    out.gl_Position.z = _1133;
    out.gl_Position.w = _1135;
    out.m_52.z = _1159;
    out.m_52.w = _1135;
    if (_1145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1161 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1161;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _847 = false;
    bool _313 = false;
    bool _165 = false;
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
        float _1218 = as_type<float>(_87);
        out.gl_Position.z = _1218;
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
        float _1287 = as_type<float>(_123);
        out.gl_Position.z = _1287;
    }
    if (_115)
    {
        return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    bool _127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _129 = as_type<int>(_125) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_125) & 2;
    bool _135 = _133 != 0;
    bool _137 = !_131;
    float _139 = _137 ? (-0.5) : 0.5;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_127;
    float _163;
    if (!_145)
    {
        float _147 = in.m_42.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_71);
        float _169 = 1.0 / _167;
        float _171 = _105 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    bool _179 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _181 = isnan(_173);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    bool _191 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_173);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _207 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = -_189;
    float _213 = _211 + 1.0;
    float _215 = 1.0 / _205;
    bool _217 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _219 = isnan(_173);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = _201 * _213;
    float _231 = -_201;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = _227 * _233;
    float _239 = 1.0 / _209;
    float _241 = -_227;
    float _243 = _241 + 1.0;
    float _245 = _177 * _215;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _173 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_253, _245, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _245, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _249 * _239;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _269 = _259 * _237;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _275 = _261 * _237;
    float _277 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _279 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _281 = fma(_273, _263, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _283 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _285 = fma(_277, _229, _279);
    float _287 = fma(_281, _229, _283);
    float _289 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[145].x, _285);
    float _291 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[145].y, _287);
    bool _293 = !_235;
    float _311;
    if (!_293)
    {
        float _295 = in.m_42.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_71);
        float _317 = 1.0 / _315;
        float _319 = _105 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_42.x;
    float _325 = in.m_42.y;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _329 = in.m_32.x;
    float _331 = in.m_32.y;
    float _333 = in.m_32.z;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _349 = _347 != 0;
    float _351 = 1.0 / _337;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _355 = _353 != 0;
    float _357 = 1.0 / _341;
    bool _359 = _325 > 0.5;
    bool _361 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = isnan(_321);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    bool _373 = _323 > 0.5;
    float _375 = _345 * _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _379 = _321 + _377;
    bool _381 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _383 = isnan(_321);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -_371;
    float _395 = _393 + 1.0;
    float _397 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_375, _379, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _401 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_321);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _391 * _395;
    float _415 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _417 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = -_391;
    float _421 = _419 + 1.0;
    float _423 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _429 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
    float _431 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _433 = _411 * _421;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _321 + _435;
    float _439 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _441 = _427 * _357;
    float _443 = _399 * _433;
    float _445 = -_411;
    float _447 = _445 + 1.0;
    float _449 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _451 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _453 = -_139;
    int _455 = _373 ? as_type<int>(_453) : as_type<int>(_139);
    float _457 = fma(_441, _437, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _463 = _449 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _467 = _451 + _465;
    bool _469 = !_349;
    float _471 = _469 ? _139 : as_type<float>(_455);
    float _473 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _477 = _463 + _475;
    float _479 = _467 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _481 = -_143;
    int _483 = _359 ? as_type<int>(_481) : as_type<int>(_143);
    float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _487 = _471 + 0.5;
    float _489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _491 = _473 + _489;
    float _493 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[28].x, _479);
    bool _495 = !_355;
    float _497 = _495 ? _143 : as_type<float>(_483);
    float _499 = _487 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _501 = fma(_457, _413, _461);
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[28].z, _493);
    float _505 = -_497;
    float _507 = _505 + 0.5;
    float _509 = _499 * _327;
    float _511 = _467 * _467;
    bool _513 = _503 >= 0.0;
    float _515 = _507 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _517 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[117].x, _501);
    float _519 = fma(_477, _477, _511);
    float _521 = _515 * _485;
    float _523 = fma(_491, _491, _519);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = rsqrt(_523);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = _519;
    if (_513)
    {
        _531 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _533 = _531;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _543 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _557 = as_type<int>(_533);
    if (_513)
    {
        float _559 = _533 * 5.0;
        _557 = as_type<int>(_559);
    }
    int _561 = _557;
    out.m_44.x = _509;
    out.m_44.y = _521;
    float _563 = _467 * _527;
    float _565 = _477 * _527;
    out.m_46.x = _547;
    out.m_46.y = _549;
    out.m_46.z = _551;
    out.m_48.x = _543;
    out.m_48.y = _545;
    out.m_48.z = _553;
    out.m_48.w = _555;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2043 = as_type<float>(_561);
        out.gl_Position.z = _2043;
    }
    if (_513)
    {
        out.m_35.x = 0.0;
    }
    if (_513)
    {
        return out;
    }
    float _567 = -_563;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _451);
    float _571 = _491 * _527;
    float _573 = -_565;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _463);
    float _577 = -_563;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _583 = _569 + _581;
    float _585 = -_571;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _473);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _575 + _589;
    float _593 = -_565;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _477);
    float _597 = _583 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _587 + _599;
    float _603 = _579 * _579;
    float _605 = -_571;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _491);
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _597);
    float _611 = in.m_50.x;
    float _613 = in.m_50.y;
    float _615 = fma(_595, _595, _603);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _609);
    float _619 = fma(_607, _607, _615);
    bool _621 = _617 >= 0.0;
    float _623 = sqrt(_619);
    float _625 = _617;
    if (_621)
    {
        _625 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _627 = _625;
    int _629 = as_type<int>(_627);
    if (_621)
    {
        out.m_35.x = 0.0;
    }
    float _631 = _289 * _611;
    float _633 = _291 * _613;
    if (_621)
    {
        float _635 = _627 * 5.0;
        _629 = as_type<int>(_635);
    }
    int _637 = _629;
    float _639 = _527 * _623;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_637);
        out.gl_Position.z = _2185;
    }
    if (_621)
    {
        return out;
    }
    float _641 = _633 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _139);
    float _649 = _641 * _639;
    float _651 = _643 * _639;
    float _653 = _639 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _655 = _653 * 0.5;
    float _657 = _645 * _649;
    float _659 = _647 * _651;
    float _661 = _657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _663 = _657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _671 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].z, _667);
    float _675 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].z, _671);
    float _679 = _673 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _685 = _463 + _679;
    float _687 = _473 + _681;
    float _689 = _451 + _683;
    float _691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _697 = _687 + _695;
    float _699 = _693 * _693;
    float _701 = _697 * _697;
    float _703 = _699 + _701;
    float _705 = sqrt(_703);
    bool _707 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _709 = _683;
    float _711 = _677;
    float _713 = _655;
    float _715 = _701;
    float _717 = _685;
    if (!_707)
    {
        _709 = _699;
    }
    float _719 = _709;
    float _721 = _719;
    if (!_707)
    {
        _711 = _687;
    }
    float _723 = _711;
    float _725 = _723;
    if (!_707)
    {
        _713 = _689;
    }
    float _727 = _713;
    bool _729 = !_707;
    float _731 = _727;
    if (!_729)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _737 = _705 + _735;
        float _739 = rsqrt(_703);
        float _741 = _737 * _733;
        float _743 = _689 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _745 = _741 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = cos(_751);
        float _755 = fma(_749, _743, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = _739 * _755;
        float _759 = _753 + (-1.0);
        float _761 = fma(_693, _757, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _763 = fma(_697, _757, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _765 = _759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _769 = _761 + _767;
        float _771 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _773 = _763 + _771;
        float _775 = fma(_689, _753, _765);
        float _777 = _769 * _769;
        float _779 = _773 * _773;
        _731 = _775;
        _721 = _777;
        _715 = _779;
        _717 = _761;
        _725 = _763;
    }
    float _781 = _731;
    float _783 = _721;
    float _785 = _715;
    float _787 = _717;
    float _789 = _725;
    float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _793 = _781 + _791;
    float _795 = fma(_793, _793, _783);
    float _797 = _795 + _785;
    float _799 = sqrt(_797);
    bool _801 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _803 = isnan(_799);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _809 = _805 || _807;
    float _811 = _783;
    if (!_809)
    {
        _811 = 1.0;
    }
    float _813 = _811;
    bool _815 = !_809;
    float _817 = _813;
    if (!_815)
    {
        bool _819 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _821 = isnan(_799);
        bool _823 = _819 || _821;
        bool _825 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _827 = _823 || _825;
        if (!_827)
        {
            float _829 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _831 = _799 + _829;
            float _833 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _835 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _833;
            float _837 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _839 = _837 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _841 = 1.0 / _835;
            float _843 = _831 * _841;
            float _845 = fma(_843, _839, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _817 = _845;
            _847 = true;
        }
        else
        {
            bool _849 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _851 = isnan(_799);
            bool _853 = _849 || _851;
            bool _855 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _857 = _853 || _855;
            if (!_857)
            {
                float _859 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _861 = _799 + _859;
                float _863 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _865 = _863 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _867 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _869 = _867 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _871 = 1.0 / _865;
                float _873 = _861 * _871;
                float _875 = fma(_873, _869, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _817 = _875;
                _847 = true;
            }
            else
            {
                _817 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _847 = false;
    float _877 = _817;
    float _879 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _881 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _883 = _787 + _881;
    float _885 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _887 = _781 + _885;
    float _889 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _879);
    float _891 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = fma(_883, _877, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _895 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _897 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.5);
    bool _903 = _899 || _901;
    float _905 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[11].z, _889);
    float _907 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _909 = fma(_887, _877, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _911 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _913 = _789 + _911;
    float _915 = _905 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _919 = -_565;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _893);
    float _923 = 1.0 / _915;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = fma(_913, _877, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _929 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _931 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.5);
    bool _937 = _933 || _935;
    float _939 = -_563;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _943 = _925 + _915;
    float _945 = -_571;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _949 = _925;
    float _951 = _941;
    float _953 = _947;
    if (_903)
    {
        _949 = _921;
    }
    float _955 = _949;
    float _957 = _955;
    if (!_903)
    {
        float _959 = _583 * _583;
        float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _963 = -_473;
        float _965 = _963 + _927;
        float _967 = -_463;
        float _969 = _967 + _893;
        float _971 = fma(_591, _591, _959);
        float _973 = -_451;
        float _975 = _973 + _909;
        float _977 = fma(_601, _601, _971);
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _981 = sqrt(_977);
        float _983 = 1.0 / _639;
        float _985 = _979 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _987 = precise::min(_981, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _989 = _987 * _961;
        float _991 = _989 * _983;
        float _993 = _985 * _991;
        float _995 = _965 * _991;
        float _997 = fma(_969, _993, _575);
        float _999 = fma(_975, _993, _569);
        float _1001 = fma(_985, _995, _587);
        _951 = _999;
        _957 = _997;
        _953 = _1001;
    }
    float _1003 = _951;
    float _1005 = _957;
    float _1007 = _953;
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1015 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1017 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1009);
    float _1019 = _943 * _923;
    float _1021 = _1019 * 0.5;
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1011);
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1013);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1015);
    float _1029 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1017);
    float _1031 = _1017;
    if (_937)
    {
        _1031 = 1.0;
    }
    float _1033 = _1031;
    float _1035 = _1033;
    if (!_937)
    {
        float _1037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1041 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1039);
        float _1043 = _1037 * 0.15915493667125701904296875;
        float _1045 = _1043 * 6.283185482025146484375;
        float _1047 = cos(_1045);
        float _1049 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1051 = _1049 * 0.15915493667125701904296875;
        float _1053 = _1043 * 6.283185482025146484375;
        float _1055 = sin(_1053);
        float _1057 = 1.0 / _1047;
        float _1059 = _1051 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1055 * _1057;
        float _1065 = 1.0 / _1041;
        float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1069 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1067;
        float _1071 = _1061 * _1063;
        float _1073 = _1051 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        float _1077 = 1.0 / _1071;
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1081 = _1065 * _1079;
        float _1083 = 1.0 / _1069;
        float _1085 = _1075 * _1077;
        float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1089 = fma(_1085, _1081, _1087);
        float _1091 = _1089 * _1083;
        float _1093 = precise::clamp(_1091, 0.0, 1.0);
        _1035 = _1093;
    }
    float _1095 = _1035;
    float _1097 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1023);
    float _1099 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1103 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1027);
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1113 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1107);
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1109);
    float _1119 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1111);
    float _1123 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1125 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1115);
    float _1127 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1117);
    float _1129 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1119);
    float _1131 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1121);
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1125);
    float _1135 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1127);
    bool _1137 = _1095 > 0.0;
    bool _1139 = isnan(_1095);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.0);
    bool _1145 = _1141 || _1143;
    float _1147 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1129);
    float _1149 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1131);
    float _1153 = _1133 + _1135;
    float _1155 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1159 = _1153 * 0.5;
    out.m_35.x = _1157;
    out.gl_Position.x = _1151;
    out.gl_Position.y = _1155;
    out.gl_Position.z = _1133;
    out.gl_Position.w = _1135;
    out.m_52.z = _1159;
    out.m_52.w = _1135;
    if (_1145)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1161 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1161;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _847 = false;
    bool _313 = false;
    bool _165 = false;
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
        float _1218 = as_type<float>(_87);
        out.gl_Position.z = _1218;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1287 = as_type<float>(_123);
        out.gl_Position.z = _1287;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    bool _127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _129 = as_type<int>(_125) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_125) & 2;
    bool _135 = _133 != 0;
    bool _137 = !_131;
    float _139 = _137 ? (-0.5) : 0.5;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_127;
    float _163;
    if (!_145)
    {
        float _147 = in.m_42.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_71);
        float _169 = 1.0 / _167;
        float _171 = _105 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    bool _179 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _181 = isnan(_173);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    bool _191 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_173);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _207 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = -_189;
    float _213 = _211 + 1.0;
    float _215 = 1.0 / _205;
    bool _217 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _219 = isnan(_173);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = _201 * _213;
    float _231 = -_201;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = _227 * _233;
    float _239 = 1.0 / _209;
    float _241 = -_227;
    float _243 = _241 + 1.0;
    float _245 = _177 * _215;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _173 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_253, _245, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _245, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _249 * _239;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _269 = _259 * _237;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _275 = _261 * _237;
    float _277 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _279 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _281 = fma(_273, _263, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _283 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _285 = fma(_277, _229, _279);
    float _287 = fma(_281, _229, _283);
    float _289 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[145].x, _285);
    float _291 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[145].y, _287);
    bool _293 = !_235;
    float _311;
    if (!_293)
    {
        float _295 = in.m_42.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_71);
        float _317 = 1.0 / _315;
        float _319 = _105 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_42.x;
    float _325 = in.m_42.y;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _329 = in.m_32.x;
    float _331 = in.m_32.y;
    float _333 = in.m_32.z;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _349 = _347 != 0;
    float _351 = 1.0 / _337;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _355 = _353 != 0;
    float _357 = 1.0 / _341;
    bool _359 = _325 > 0.5;
    bool _361 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = isnan(_321);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    bool _373 = _323 > 0.5;
    float _375 = _345 * _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _379 = _321 + _377;
    bool _381 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _383 = isnan(_321);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -_371;
    float _395 = _393 + 1.0;
    float _397 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_375, _379, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _401 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_321);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _391 * _395;
    float _415 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _417 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = -_391;
    float _421 = _419 + 1.0;
    float _423 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _429 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
    float _431 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _433 = _411 * _421;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _321 + _435;
    float _439 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _441 = _427 * _357;
    float _443 = _399 * _433;
    float _445 = -_411;
    float _447 = _445 + 1.0;
    float _449 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _451 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _453 = -_139;
    int _455 = _373 ? as_type<int>(_453) : as_type<int>(_139);
    float _457 = fma(_441, _437, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _463 = _449 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _467 = _451 + _465;
    bool _469 = !_349;
    float _471 = _469 ? _139 : as_type<float>(_455);
    float _473 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _477 = _463 + _475;
    float _479 = _467 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _481 = -_143;
    int _483 = _359 ? as_type<int>(_481) : as_type<int>(_143);
    float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _487 = _471 + 0.5;
    float _489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _491 = _473 + _489;
    float _493 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[28].x, _479);
    bool _495 = !_355;
    float _497 = _495 ? _143 : as_type<float>(_483);
    float _499 = _487 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _501 = fma(_457, _413, _461);
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[28].z, _493);
    float _505 = -_497;
    float _507 = _505 + 0.5;
    float _509 = _499 * _327;
    float _511 = _467 * _467;
    bool _513 = _503 >= 0.0;
    float _515 = _507 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _517 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[117].x, _501);
    float _519 = fma(_477, _477, _511);
    float _521 = _515 * _485;
    float _523 = fma(_491, _491, _519);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = rsqrt(_523);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = _519;
    if (_513)
    {
        _531 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _533 = _531;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _543 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _557 = as_type<int>(_533);
    if (_513)
    {
        float _559 = _533 * 5.0;
        _557 = as_type<int>(_559);
    }
    int _561 = _557;
    out.m_44.x = _509;
    out.m_44.y = _521;
    float _563 = _467 * _527;
    float _565 = _477 * _527;
    out.m_46.x = _547;
    out.m_46.y = _549;
    out.m_46.z = _551;
    out.m_48.x = _543;
    out.m_48.y = _545;
    out.m_48.z = _553;
    out.m_48.w = _555;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2043 = as_type<float>(_561);
        out.gl_Position.z = _2043;
    }
    if (_513)
    {
        out.m_35.x = 0.0;
    }
    if (_513)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _567 = -_563;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _451);
    float _571 = _491 * _527;
    float _573 = -_565;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _463);
    float _577 = -_563;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _583 = _569 + _581;
    float _585 = -_571;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _473);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _575 + _589;
    float _593 = -_565;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _477);
    float _597 = _583 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _587 + _599;
    float _603 = _579 * _579;
    float _605 = -_571;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _491);
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _597);
    float _611 = in.m_50.x;
    float _613 = in.m_50.y;
    float _615 = fma(_595, _595, _603);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _609);
    float _619 = fma(_607, _607, _615);
    bool _621 = _617 >= 0.0;
    float _623 = sqrt(_619);
    float _625 = _617;
    if (_621)
    {
        _625 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _627 = _625;
    int _629 = as_type<int>(_627);
    if (_621)
    {
        out.m_35.x = 0.0;
    }
    float _631 = _289 * _611;
    float _633 = _291 * _613;
    if (_621)
    {
        float _635 = _627 * 5.0;
        _629 = as_type<int>(_635);
    }
    int _637 = _629;
    float _639 = _527 * _623;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_637);
        out.gl_Position.z = _2185;
    }
    if (_621)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _641 = _633 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _139);
    float _649 = _641 * _639;
    float _651 = _643 * _639;
    float _653 = _639 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _655 = _653 * 0.5;
    float _657 = _645 * _649;
    float _659 = _647 * _651;
    float _661 = _657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _663 = _657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _671 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].z, _667);
    float _675 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].z, _671);
    float _679 = _673 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _685 = _463 + _679;
    float _687 = _473 + _681;
    float _689 = _451 + _683;
    float _691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _697 = _687 + _695;
    float _699 = _693 * _693;
    float _701 = _697 * _697;
    float _703 = _699 + _701;
    float _705 = sqrt(_703);
    bool _707 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _709 = _683;
    float _711 = _677;
    float _713 = _655;
    float _715 = _701;
    float _717 = _685;
    if (!_707)
    {
        _709 = _699;
    }
    float _719 = _709;
    float _721 = _719;
    if (!_707)
    {
        _711 = _687;
    }
    float _723 = _711;
    float _725 = _723;
    if (!_707)
    {
        _713 = _689;
    }
    float _727 = _713;
    bool _729 = !_707;
    float _731 = _727;
    if (!_729)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _737 = _705 + _735;
        float _739 = rsqrt(_703);
        float _741 = _737 * _733;
        float _743 = _689 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _745 = _741 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = cos(_751);
        float _755 = fma(_749, _743, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = _739 * _755;
        float _759 = _753 + (-1.0);
        float _761 = fma(_693, _757, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _763 = fma(_697, _757, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _765 = _759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _769 = _761 + _767;
        float _771 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _773 = _763 + _771;
        float _775 = fma(_689, _753, _765);
        float _777 = _769 * _769;
        float _779 = _773 * _773;
        _731 = _775;
        _721 = _777;
        _715 = _779;
        _717 = _761;
        _725 = _763;
    }
    float _781 = _731;
    float _783 = _721;
    float _785 = _715;
    float _787 = _717;
    float _789 = _725;
    float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _793 = _781 + _791;
    float _795 = fma(_793, _793, _783);
    float _797 = _795 + _785;
    float _799 = sqrt(_797);
    bool _801 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _803 = isnan(_799);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _809 = _805 || _807;
    float _811 = _783;
    if (!_809)
    {
        _811 = 1.0;
    }
    float _813 = _811;
    bool _815 = !_809;
    float _817 = _813;
    if (!_815)
    {
        bool _819 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _821 = isnan(_799);
        bool _823 = _819 || _821;
        bool _825 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _827 = _823 || _825;
        if (!_827)
        {
            float _829 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _831 = _799 + _829;
            float _833 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _835 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _833;
            float _837 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _839 = _837 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _841 = 1.0 / _835;
            float _843 = _831 * _841;
            float _845 = fma(_843, _839, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _817 = _845;
            _847 = true;
        }
        else
        {
            bool _849 = _799 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _851 = isnan(_799);
            bool _853 = _849 || _851;
            bool _855 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _857 = _853 || _855;
            if (!_857)
            {
                float _859 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _861 = _799 + _859;
                float _863 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _865 = _863 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _867 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _869 = _867 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _871 = 1.0 / _865;
                float _873 = _861 * _871;
                float _875 = fma(_873, _869, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _817 = _875;
                _847 = true;
            }
            else
            {
                _817 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _847 = false;
    float _877 = _817;
    float _879 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _881 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _883 = _787 + _881;
    float _885 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _887 = _781 + _885;
    float _889 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _879);
    float _891 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = fma(_883, _877, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _895 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _897 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.5);
    bool _903 = _899 || _901;
    float _905 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[11].z, _889);
    float _907 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _909 = fma(_887, _877, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _911 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _913 = _789 + _911;
    float _915 = _905 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _919 = -_565;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _893);
    float _923 = 1.0 / _915;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = fma(_913, _877, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _929 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _931 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.5);
    bool _937 = _933 || _935;
    float _939 = -_563;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _943 = _925 + _915;
    float _945 = -_571;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _949 = _925;
    float _951 = _941;
    float _953 = _947;
    if (_903)
    {
        _949 = _921;
    }
    float _955 = _949;
    float _957 = _955;
    if (!_903)
    {
        float _959 = _583 * _583;
        float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _963 = -_473;
        float _965 = _963 + _927;
        float _967 = -_463;
        float _969 = _967 + _893;
        float _971 = fma(_591, _591, _959);
        float _973 = -_451;
        float _975 = _973 + _909;
        float _977 = fma(_601, _601, _971);
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _981 = sqrt(_977);
        float _983 = 1.0 / _639;
        float _985 = _979 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _987 = precise::min(_981, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _989 = _987 * _961;
        float _991 = _989 * _983;
        float _993 = _985 * _991;
        float _995 = _965 * _991;
        float _997 = fma(_969, _993, _575);
        float _999 = fma(_975, _993, _569);
        float _1001 = fma(_985, _995, _587);
        _951 = _999;
        _957 = _997;
        _953 = _1001;
    }
    float _1003 = _951;
    float _1005 = _957;
    float _1007 = _953;
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1015 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1017 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1009);
    float _1019 = _943 * _923;
    float _1021 = _1019 * 0.5;
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1011);
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1013);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1015);
    float _1029 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1017);
    float _1031 = _1017;
    if (_937)
    {
        _1031 = 1.0;
    }
    float _1033 = _1031;
    float _1035 = _1033;
    if (!_937)
    {
        float _1037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1041 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1039);
        float _1043 = _1037 * 0.15915493667125701904296875;
        float _1045 = _1043 * 6.283185482025146484375;
        float _1047 = cos(_1045);
        float _1049 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1051 = _1049 * 0.15915493667125701904296875;
        float _1053 = _1043 * 6.283185482025146484375;
        float _1055 = sin(_1053);
        float _1057 = 1.0 / _1047;
        float _1059 = _1051 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1055 * _1057;
        float _1065 = 1.0 / _1041;
        float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1069 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1067;
        float _1071 = _1061 * _1063;
        float _1073 = _1051 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        float _1077 = 1.0 / _1071;
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1081 = _1065 * _1079;
        float _1083 = 1.0 / _1069;
        float _1085 = _1075 * _1077;
        float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1089 = fma(_1085, _1081, _1087);
        float _1091 = _1089 * _1083;
        float _1093 = precise::clamp(_1091, 0.0, 1.0);
        _1035 = _1093;
    }
    float _1095 = _1035;
    float _1097 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1023);
    float _1099 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1103 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1027);
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1113 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1107);
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1109);
    float _1119 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1111);
    float _1123 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1125 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1115);
    float _1127 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1117);
    float _1129 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1119);
    float _1131 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1121);
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1125);
    float _1135 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1127);
    bool _1137 = _1095 > 0.0;
    bool _1139 = isnan(_1095);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.0);
    bool _1145 = _1141 || _1143;
    float _1147 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1129);
    float _1149 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1131);
    float _1153 = _1133 + _1135;
    float _1155 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1159 = _1153 * 0.5;
    out.m_35.x = _1157;
    out.gl_Position.x = _1151;
    out.gl_Position.y = _1155;
    out.gl_Position.z = _1133;
    out.gl_Position.w = _1135;
    out.m_52.z = _1159;
    out.m_52.w = _1135;
    if (_1145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1161 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1161;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

