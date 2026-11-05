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
    float4 m_50 [[user(locn1)]];
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
    float4 m_39 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1033 = false;
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
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1413 = as_type<float>(_87);
        out.gl_Position.z = _1413;
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
        _79 = _107;
    }
    float _109 = _79;
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
        float _1482 = as_type<float>(_123);
        out.gl_Position.z = _1482;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_39.z;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _131 = _129 != 0;
    float _133 = as_type<float>(int(gl_VertexIndex));
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_39.w;
    float _147 = in.m_39.x;
    float _149 = 0.0;
    float _151 = _127;
    float _153 = _125;
    if (!_131)
    {
        float _155 = in.m_39.y;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = 0.0;
    if (!_143)
    {
        float _161 = _127 * _127;
        float _163 = _161 * 0.5;
        _159 = _163;
    }
    float _165 = _159;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    bool _173 = _145 > 0.5;
    float _175 = 0.0;
    float _177 = _171;
    if (!_131)
    {
        _175 = _157;
    }
    float _179 = _175;
    float _181 = _179;
    float _183 = _157;
    if (_131)
    {
        float _185 = in.m_39.x;
        float _187 = in.m_39.y;
        _181 = _185;
        _183 = _187;
    }
    float _189 = _181;
    float _191 = _183;
    bool _193 = !_143;
    if (!_193)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _127 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _127);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _223;
    }
    float _225 = _177;
    bool _227 = !_143;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _127 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _151 = _247;
    }
    float _249 = _151;
    float _251 = in.m_44.w;
    int _253 = as_type<int>(_133) & 1;
    bool _255 = _253 != 0;
    int _257 = as_type<int>(_133) & 2;
    bool _259 = _257 != 0;
    float _261 = _189 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _263 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _265 = in.m_37.x;
    float _267 = in.m_37.y;
    float _269 = in.m_37.z;
    bool _271 = !_259;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _263);
    float _277 = in.m_44.x;
    float _279 = -_273;
    int _281 = _173 ? as_type<int>(_279) : as_type<int>(_273);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _285 = _283 != 0;
    float _287 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    bool _289 = _125 > 0.5;
    float _291 = 0.0;
    if (!_131)
    {
        _291 = _125;
    }
    float _293 = _291;
    float _295 = _293;
    if (_131)
    {
        _295 = _191;
    }
    float _297 = _295;
    if (_131)
    {
        _153 = _191;
    }
    float _299 = _153;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _303 = _301 != 0;
    float _305 = _297 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _313 = _311 != 0;
    bool _315 = !_285;
    float _317 = _315 ? _273 : as_type<float>(_281);
    float _319 = in.m_32.x;
    float _321 = in.m_32.y;
    float _323 = in.m_32.z;
    bool _325 = _191 > 0.5;
    float _327 = _277 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _329 = _147 > 0.5;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _333 = _327 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _335 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[83].w, _331);
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _339 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _345 = -_337;
    float _347 = fma(_261, 2.0, _345);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _351 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[83].z, _341);
    float _353 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_249, _267, _339);
    float _357 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_305, -2.0, _349);
    float _361 = fma(_249, _265, _353);
    float _363 = fma(_355, _251, _321);
    float _365 = fma(_249, _269, _357);
    float _367 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _351);
    float _369 = fma(_361, _251, _319);
    float _371 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = fma(_365, _251, _323);
    float _375 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = -_105;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[81].x, _347);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _387 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _377);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _391 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _335);
    float _393 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _395 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    float _397 = _389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _399 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _359);
    float _401 = _343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _403 = _317 + (-0.5);
    float _405 = _393 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _407 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _409 = _397 + _407;
    float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _413 = -_401;
    float _415 = -_399;
    float _417 = fma(_413, _403, _415);
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _405 + _419;
    float _423 = _409 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _425 = !_255;
    float _427 = _425 ? (-0.5) : 0.5;
    float _429 = _395 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _431 = -_391;
    float _433 = _431 + 1.0;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _423);
    float _437 = -_273;
    int _439 = _325 ? as_type<int>(_437) : as_type<int>(_273);
    float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _443 = -_427;
    int _445 = _289 ? as_type<int>(_443) : as_type<int>(_427);
    float _447 = -_367;
    float _449 = _447 + 1.0;
    bool _451 = !_313;
    float _453 = _451 ? _273 : as_type<float>(_439);
    float _455 = fma(_317, _433, _417);
    bool _457 = !_303;
    float _459 = _457 ? _427 : as_type<float>(_445);
    float _461 = _333 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _463 = _411 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _465 = -_453;
    float _467 = _465 + 0.5;
    float _469 = -_427;
    int _471 = _329 ? as_type<int>(_469) : as_type<int>(_427);
    float _473 = _459 + 0.5;
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _477 = _467 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _481 = _429 + _479;
    float _483 = fma(_463, _473, _383);
    bool _485 = !_309;
    float _487 = _485 ? _427 : as_type<float>(_471);
    float _489 = _477 * _441;
    float _491 = _409 * _409;
    float _493 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[28].z, _435);
    float _495 = -_449;
    float _497 = fma(_459, _495, _483);
    float _499 = _487 + 0.5;
    float _501 = fma(_421, _421, _491);
    bool _503 = _493 >= 0.0;
    float _505 = fma(_481, _481, _501);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = _507 * _475;
    float _513 = rsqrt(_505);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_503)
    {
        _525 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _527 = _525;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _531 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _539 = as_type<int>(_527);
    if (_503)
    {
        float _541 = _527 * 5.0;
        _539 = as_type<int>(_541);
    }
    int _543 = _539;
    float _545 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _461 * _513;
    out.m_46.x = _511;
    out.m_46.y = _489;
    out.m_46.z = _497;
    out.m_46.w = _455;
    float _551 = _421 * _549;
    if (_503)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_543);
        out.gl_Position.z = _2223;
    }
    float _553 = _409 * _549;
    out.m_48.x = _531;
    out.m_48.y = _533;
    out.m_48.z = _535;
    out.m_48.w = _521;
    out.m_50.x = _537;
    out.m_50.y = _545;
    out.m_50.z = _547;
    if (_503)
    {
        out.m_35.x = 0.0;
    }
    if (_503)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _555 = -_553;
    float _557 = _397 + _555;
    float _559 = _481 * _549;
    float _561 = -_551;
    float _563 = _405 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _567 = _557 + _565;
    float _569 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _571 = -_559;
    float _573 = _429 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _577 = _563 + _575;
    float _579 = _567 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _581 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _569);
    float _583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _585 = _573 + _583;
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[28].x, _579);
    float _589 = sqrt(_287);
    float _591 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _581);
    float _593 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[28].z, _587);
    float _595 = -_553;
    float _597 = _409 + _595;
    float _599 = -_551;
    float _601 = _421 + _599;
    bool _603 = _593 >= 0.0;
    float _605 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _607 = rsqrt(_287);
    float _609 = _597 * _597;
    float _611 = -_559;
    float _613 = _481 + _611;
    float _615 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _617 = fma(_601, _601, _609);
    float _619 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _621 = sqrt(_591);
    float _623 = _579;
    if (_603)
    {
        _623 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _623;
    int _627 = as_type<int>(_625);
    if (_603)
    {
        out.m_35.x = 0.0;
    }
    float _629 = rsqrt(_591);
    if (_603)
    {
        float _631 = _625 * 5.0;
        _627 = as_type<int>(_631);
    }
    int _633 = _627;
    if (_603)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2392 = as_type<float>(_633);
        out.gl_Position.z = _2392;
    }
    float _635 = sqrt(_619);
    if (_603)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _637 = -_397;
    float _639 = _637 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = fma(_613, _613, _617);
    float _643 = -_405;
    float _645 = _643 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _647 = -_429;
    float _649 = _647 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _651 = _639 * _639;
    float _653 = precise::max(_589, _621);
    float _655 = _427 * _607;
    float _657 = sqrt(_641);
    float _659 = fma(_645, _645, _651);
    float _661 = precise::max(_635, _653);
    float _663 = _273 * _629;
    float _665 = in.m_44.y;
    float _667 = fma(_649, _649, _659);
    float _669 = _655 * _661;
    float _671 = _663 * _661;
    float _673 = rsqrt(_667);
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    float _677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _671);
    float _679 = _513 * _657;
    float _681 = _645 * _673;
    float _683 = _649 * _673;
    float _685 = _639 * _673;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _689 = _681 * _687;
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _693 = _683 * _691;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _697 = _685 * _695;
    float _699 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _701 = -_689;
    float _703 = fma(_683, _699, _701);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _707 = -_693;
    float _709 = fma(_685, _705, _707);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _713 = -_697;
    float _715 = fma(_681, _711, _713);
    float _717 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _719 = _703 * _703;
    float _721 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _717);
    float _723 = fma(_709, _709, _719);
    float _725 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _727 = fma(_715, _715, _723);
    float _729 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _725);
    float _731 = _333 * _679;
    float _733 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _735 = rsqrt(_727);
    float _737 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _721);
    float _739 = _665 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _741 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _729);
    float _743 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _733);
    float _745 = _675 * _731;
    float _747 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _749 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _743);
    float _751 = rsqrt(_741);
    float _753 = _679 * _747;
    float _755 = _677 * _753;
    float _757 = _715 * _735;
    float _759 = rsqrt(_737);
    float _761 = _703 * _735;
    float _763 = _709 * _735;
    float _765 = _681 * _757;
    float _767 = _683 * _761;
    float _769 = _685 * _763;
    float _771 = -_765;
    float _773 = fma(_683, _763, _771);
    float _775 = rsqrt(_749);
    float _777 = -_767;
    float _779 = fma(_685, _757, _777);
    float _781 = -_769;
    float _783 = fma(_681, _761, _781);
    float _785 = _755 * _773;
    float _787 = _751 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _789 = _755 * _779;
    float _791 = _755 * _783;
    float _793 = _679 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _795 = _793 * 0.5;
    float _797 = fma(_745, _761, _785);
    float _799 = _759 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _801 = fma(_745, _763, _789);
    float _803 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _805 = fma(_795, _685, _797);
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _809 = fma(_745, _757, _791);
    float _811 = fma(_795, _681, _801);
    float _813 = _775 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _815 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _817 = _805 * _803;
    float _819 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _821 = _805 * _807;
    float _823 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _825 = fma(_795, _683, _809);
    float _827 = fma(_811, _815, _817);
    float _829 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _831 = fma(_811, _819, _821);
    float _833 = _805 * _823;
    float _835 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _837 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _839 = fma(_825, _829, _827);
    float _841 = fma(_825, _835, _831);
    float _843 = fma(_811, _837, _833);
    float _845 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _847 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _849 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _851 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _853 = fma(_825, _845, _843);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].x, _847);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].z, _849);
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].y, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].x, _855);
    float _863 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].z, _857);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].y, _859);
    float _867 = _405 + _861;
    float _869 = _429 + _863;
    float _871 = _397 + _865;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _867 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _879 = _869 + _877;
    float _881 = _875 * _875;
    float _883 = _879 * _879;
    float _885 = _881 + _883;
    float _887 = sqrt(_885);
    bool _889 = _887 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _851;
    float _893 = _859;
    float _895 = _865;
    float _897 = _867;
    float _899 = _883;
    if (!_889)
    {
        _891 = _867;
    }
    float _901 = _891;
    float _903 = _901;
    if (!_889)
    {
        _893 = _881;
    }
    float _905 = _893;
    float _907 = _905;
    if (!_889)
    {
        _895 = _869;
    }
    float _909 = _895;
    float _911 = _909;
    if (!_889)
    {
        _897 = _871;
    }
    float _913 = _897;
    bool _915 = !_889;
    float _917 = _913;
    if (!_915)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _923 = _887 + _921;
        float _925 = _871 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = rsqrt(_885);
        float _929 = _923 * _919;
        float _931 = _929 * 0.15915493667125701904296875;
        float _933 = _931 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _931 * 6.283185482025146484375;
        float _939 = cos(_937);
        float _941 = fma(_935, _925, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _943 = _927 * _941;
        float _945 = _939 + (-1.0);
        float _947 = fma(_875, _943, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _949 = fma(_879, _943, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _951 = _945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _955 = _947 + _953;
        float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _959 = _949 + _957;
        float _961 = fma(_871, _939, _951);
        float _963 = _955 * _955;
        float _965 = _959 * _959;
        _917 = _961;
        _907 = _963;
        _899 = _965;
        _911 = _949;
        _903 = _947;
    }
    float _967 = _917;
    float _969 = _907;
    float _971 = _899;
    float _973 = _911;
    float _975 = _903;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _979 = _967 + _977;
    out.m_48.x = _531;
    out.m_48.y = _533;
    out.m_48.z = _535;
    out.m_48.w = _521;
    float _981 = fma(_979, _979, _969);
    out.m_50.x = _537;
    out.m_50.y = _545;
    out.m_50.z = _547;
    float _983 = _981 + _971;
    float _985 = sqrt(_983);
    bool _987 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _989 = isnan(_985);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _995 = _991 || _993;
    float _997 = _969;
    if (!_995)
    {
        _997 = 1.0;
    }
    float _999 = _997;
    bool _1001 = !_995;
    float _1003 = _999;
    if (!_1001)
    {
        bool _1005 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1007 = isnan(_985);
        bool _1009 = _1005 || _1007;
        bool _1011 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1013 = _1009 || _1011;
        if (!_1013)
        {
            float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1017 = _985 + _1015;
            float _1019 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1021 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1019;
            float _1023 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1025 = _1023 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1027 = 1.0 / _1021;
            float _1029 = _1017 * _1027;
            float _1031 = fma(_1029, _1025, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1003 = _1031;
            _1033 = true;
        }
        else
        {
            bool _1035 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1037 = isnan(_985);
            bool _1039 = _1035 || _1037;
            bool _1041 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1043 = _1039 || _1041;
            if (!_1043)
            {
                float _1045 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1047 = _985 + _1045;
                float _1049 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1051 = _1049 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1053 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1055 = _1053 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1057 = 1.0 / _1051;
                float _1059 = _1047 * _1057;
                float _1061 = fma(_1059, _1055, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1003 = _1061;
                _1033 = true;
            }
            else
            {
                _1003 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1033 = false;
    float _1063 = _1003;
    float _1065 = _557 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1069 = _973 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1073 = _975 + _1071;
    float _1075 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1065);
    float _1077 = _557 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1079 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.5);
    bool _1087 = _1083 || _1085;
    float _1089 = fma(_1069, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1091 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1075);
    float _1093 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1077);
    float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1097 = _967 + _1095;
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1101 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1093);
    float _1103 = fma(_1073, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1105 = -_559;
    float _1107 = _1105 + _1089;
    float _1109 = 1.0 / _1099;
    float _1111 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1113 = fma(_1097, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1115 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan(0.5);
    bool _1123 = _1119 || _1121;
    float _1125 = -_551;
    float _1127 = _1125 + _1103;
    float _1129 = _1111 + _1099;
    float _1131 = -_553;
    float _1133 = _1131 + _1113;
    float _1135 = _1111;
    float _1137 = _1133;
    float _1139 = _1127;
    if (_1087)
    {
        _1135 = _1107;
    }
    float _1141 = _1135;
    float _1143 = _1141;
    if (!_1087)
    {
        float _1145 = _567 * _567;
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1149 = -_429;
        float _1151 = _1149 + _1089;
        float _1153 = fma(_577, _577, _1145);
        float _1155 = fma(_585, _585, _1153);
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = sqrt(_1155);
        float _1161 = 1.0 / _679;
        float _1163 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1165 = precise::min(_1159, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1167 = _1165 * _1147;
        float _1169 = -_405;
        float _1171 = _1169 + _1103;
        float _1173 = _1167 * _1161;
        float _1175 = -_397;
        float _1177 = _1175 + _1113;
        float _1179 = _1163 * _1173;
        float _1181 = _1151 * _1173;
        float _1183 = fma(_1171, _1179, _563);
        float _1185 = fma(_1177, _1179, _557);
        float _1187 = fma(_1163, _1181, _573);
        _1137 = _1185;
        _1139 = _1183;
        _1143 = _1187;
    }
    float _1189 = _1137;
    float _1191 = _1139;
    float _1193 = _1143;
    float _1195 = _1129 * _1109;
    float _1197 = _1195 * 0.5;
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1201 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1207 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1199);
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1201);
    float _1211 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1213 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1205);
    float _1215 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1207);
    float _1217 = _1207;
    if (_1123)
    {
        _1217 = 1.0;
    }
    float _1219 = _1217;
    float _1221 = _1219;
    if (!_1123)
    {
        float _1223 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1227 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1225);
        float _1229 = _1223 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1229 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = 1.0 / _1233;
        float _1245 = _1237 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = _1241 * _1243;
        float _1251 = 1.0 / _1227;
        float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1255 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1253;
        float _1257 = _1247 * _1249;
        float _1259 = _1237 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = 1.0 / _1257;
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1267 = _1251 * _1265;
        float _1269 = 1.0 / _1255;
        float _1271 = _1261 * _1263;
        float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1275 = fma(_1271, _1267, _1273);
        float _1277 = _1275 * _1269;
        float _1279 = precise::clamp(_1277, 0.0, 1.0);
        _1221 = _1279;
    }
    float _1281 = _1221;
    float _1283 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1209);
    float _1285 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1211);
    float _1289 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1213);
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1293);
    float _1305 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1295);
    float _1307 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1309 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1311 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1303);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1305);
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1307);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1309);
    bool _1321 = _1281 > 0.0;
    bool _1323 = isnan(_1281);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    float _1331 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1333 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1313);
    float _1335 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1315);
    float _1337 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1339 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1317);
    float _1341 = _1331 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1343 = _1333 + _1337;
    float _1345 = _1339 + _1337;
    float _1347 = _1337 * 0.5;
    float _1349 = _1343 * 0.5;
    float _1351 = _1345 * 0.5;
    float _1353 = fma(_1335, -0.5, _1347);
    out.m_35.x = _1341;
    out.gl_Position.x = _1333;
    out.gl_Position.y = _1335;
    out.gl_Position.z = _1339;
    out.gl_Position.w = _1337;
    out.m_52.x = _1349;
    out.m_52.y = _1353;
    out.m_52.z = _1351;
    out.m_52.w = _1337;
    if (_1329)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1355;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1033 = false;
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
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1413 = as_type<float>(_87);
        out.gl_Position.z = _1413;
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
        _79 = _107;
    }
    float _109 = _79;
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
        float _1482 = as_type<float>(_123);
        out.gl_Position.z = _1482;
    }
    if (_115)
    {
        return out;
    }
    float _125 = in.m_39.z;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _131 = _129 != 0;
    float _133 = as_type<float>(int(gl_VertexIndex));
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_39.w;
    float _147 = in.m_39.x;
    float _149 = 0.0;
    float _151 = _127;
    float _153 = _125;
    if (!_131)
    {
        float _155 = in.m_39.y;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = 0.0;
    if (!_143)
    {
        float _161 = _127 * _127;
        float _163 = _161 * 0.5;
        _159 = _163;
    }
    float _165 = _159;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    bool _173 = _145 > 0.5;
    float _175 = 0.0;
    float _177 = _171;
    if (!_131)
    {
        _175 = _157;
    }
    float _179 = _175;
    float _181 = _179;
    float _183 = _157;
    if (_131)
    {
        float _185 = in.m_39.x;
        float _187 = in.m_39.y;
        _181 = _185;
        _183 = _187;
    }
    float _189 = _181;
    float _191 = _183;
    bool _193 = !_143;
    if (!_193)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _127 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _127);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _223;
    }
    float _225 = _177;
    bool _227 = !_143;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _127 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _151 = _247;
    }
    float _249 = _151;
    float _251 = in.m_44.w;
    int _253 = as_type<int>(_133) & 1;
    bool _255 = _253 != 0;
    int _257 = as_type<int>(_133) & 2;
    bool _259 = _257 != 0;
    float _261 = _189 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _263 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _265 = in.m_37.x;
    float _267 = in.m_37.y;
    float _269 = in.m_37.z;
    bool _271 = !_259;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _263);
    float _277 = in.m_44.x;
    float _279 = -_273;
    int _281 = _173 ? as_type<int>(_279) : as_type<int>(_273);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _285 = _283 != 0;
    float _287 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    bool _289 = _125 > 0.5;
    float _291 = 0.0;
    if (!_131)
    {
        _291 = _125;
    }
    float _293 = _291;
    float _295 = _293;
    if (_131)
    {
        _295 = _191;
    }
    float _297 = _295;
    if (_131)
    {
        _153 = _191;
    }
    float _299 = _153;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _303 = _301 != 0;
    float _305 = _297 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _313 = _311 != 0;
    bool _315 = !_285;
    float _317 = _315 ? _273 : as_type<float>(_281);
    float _319 = in.m_32.x;
    float _321 = in.m_32.y;
    float _323 = in.m_32.z;
    bool _325 = _191 > 0.5;
    float _327 = _277 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _329 = _147 > 0.5;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _333 = _327 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _335 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[83].w, _331);
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _339 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _345 = -_337;
    float _347 = fma(_261, 2.0, _345);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _351 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[83].z, _341);
    float _353 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_249, _267, _339);
    float _357 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_305, -2.0, _349);
    float _361 = fma(_249, _265, _353);
    float _363 = fma(_355, _251, _321);
    float _365 = fma(_249, _269, _357);
    float _367 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _351);
    float _369 = fma(_361, _251, _319);
    float _371 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = fma(_365, _251, _323);
    float _375 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = -_105;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[81].x, _347);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _387 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _377);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _391 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _335);
    float _393 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _395 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    float _397 = _389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _399 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _359);
    float _401 = _343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _403 = _317 + (-0.5);
    float _405 = _393 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _407 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _409 = _397 + _407;
    float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _413 = -_401;
    float _415 = -_399;
    float _417 = fma(_413, _403, _415);
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _405 + _419;
    float _423 = _409 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _425 = !_255;
    float _427 = _425 ? (-0.5) : 0.5;
    float _429 = _395 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _431 = -_391;
    float _433 = _431 + 1.0;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _423);
    float _437 = -_273;
    int _439 = _325 ? as_type<int>(_437) : as_type<int>(_273);
    float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _443 = -_427;
    int _445 = _289 ? as_type<int>(_443) : as_type<int>(_427);
    float _447 = -_367;
    float _449 = _447 + 1.0;
    bool _451 = !_313;
    float _453 = _451 ? _273 : as_type<float>(_439);
    float _455 = fma(_317, _433, _417);
    bool _457 = !_303;
    float _459 = _457 ? _427 : as_type<float>(_445);
    float _461 = _333 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _463 = _411 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _465 = -_453;
    float _467 = _465 + 0.5;
    float _469 = -_427;
    int _471 = _329 ? as_type<int>(_469) : as_type<int>(_427);
    float _473 = _459 + 0.5;
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _477 = _467 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _481 = _429 + _479;
    float _483 = fma(_463, _473, _383);
    bool _485 = !_309;
    float _487 = _485 ? _427 : as_type<float>(_471);
    float _489 = _477 * _441;
    float _491 = _409 * _409;
    float _493 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[28].z, _435);
    float _495 = -_449;
    float _497 = fma(_459, _495, _483);
    float _499 = _487 + 0.5;
    float _501 = fma(_421, _421, _491);
    bool _503 = _493 >= 0.0;
    float _505 = fma(_481, _481, _501);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = _507 * _475;
    float _513 = rsqrt(_505);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_503)
    {
        _525 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _527 = _525;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _531 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _539 = as_type<int>(_527);
    if (_503)
    {
        float _541 = _527 * 5.0;
        _539 = as_type<int>(_541);
    }
    int _543 = _539;
    float _545 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _461 * _513;
    out.m_46.x = _511;
    out.m_46.y = _489;
    out.m_46.z = _497;
    out.m_46.w = _455;
    float _551 = _421 * _549;
    if (_503)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_543);
        out.gl_Position.z = _2223;
    }
    float _553 = _409 * _549;
    out.m_48.x = _531;
    out.m_48.y = _533;
    out.m_48.z = _535;
    out.m_48.w = _521;
    out.m_50.x = _537;
    out.m_50.y = _545;
    out.m_50.z = _547;
    if (_503)
    {
        out.m_35.x = 0.0;
    }
    if (_503)
    {
        return out;
    }
    float _555 = -_553;
    float _557 = _397 + _555;
    float _559 = _481 * _549;
    float _561 = -_551;
    float _563 = _405 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _567 = _557 + _565;
    float _569 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _571 = -_559;
    float _573 = _429 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _577 = _563 + _575;
    float _579 = _567 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _581 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _569);
    float _583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _585 = _573 + _583;
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[28].x, _579);
    float _589 = sqrt(_287);
    float _591 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _581);
    float _593 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[28].z, _587);
    float _595 = -_553;
    float _597 = _409 + _595;
    float _599 = -_551;
    float _601 = _421 + _599;
    bool _603 = _593 >= 0.0;
    float _605 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _607 = rsqrt(_287);
    float _609 = _597 * _597;
    float _611 = -_559;
    float _613 = _481 + _611;
    float _615 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _617 = fma(_601, _601, _609);
    float _619 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _621 = sqrt(_591);
    float _623 = _579;
    if (_603)
    {
        _623 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _623;
    int _627 = as_type<int>(_625);
    if (_603)
    {
        out.m_35.x = 0.0;
    }
    float _629 = rsqrt(_591);
    if (_603)
    {
        float _631 = _625 * 5.0;
        _627 = as_type<int>(_631);
    }
    int _633 = _627;
    if (_603)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2392 = as_type<float>(_633);
        out.gl_Position.z = _2392;
    }
    float _635 = sqrt(_619);
    if (_603)
    {
        return out;
    }
    float _637 = -_397;
    float _639 = _637 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = fma(_613, _613, _617);
    float _643 = -_405;
    float _645 = _643 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _647 = -_429;
    float _649 = _647 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _651 = _639 * _639;
    float _653 = precise::max(_589, _621);
    float _655 = _427 * _607;
    float _657 = sqrt(_641);
    float _659 = fma(_645, _645, _651);
    float _661 = precise::max(_635, _653);
    float _663 = _273 * _629;
    float _665 = in.m_44.y;
    float _667 = fma(_649, _649, _659);
    float _669 = _655 * _661;
    float _671 = _663 * _661;
    float _673 = rsqrt(_667);
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    float _677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _671);
    float _679 = _513 * _657;
    float _681 = _645 * _673;
    float _683 = _649 * _673;
    float _685 = _639 * _673;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _689 = _681 * _687;
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _693 = _683 * _691;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _697 = _685 * _695;
    float _699 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _701 = -_689;
    float _703 = fma(_683, _699, _701);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _707 = -_693;
    float _709 = fma(_685, _705, _707);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _713 = -_697;
    float _715 = fma(_681, _711, _713);
    float _717 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _719 = _703 * _703;
    float _721 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _717);
    float _723 = fma(_709, _709, _719);
    float _725 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _727 = fma(_715, _715, _723);
    float _729 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _725);
    float _731 = _333 * _679;
    float _733 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _735 = rsqrt(_727);
    float _737 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _721);
    float _739 = _665 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _741 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _729);
    float _743 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _733);
    float _745 = _675 * _731;
    float _747 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _749 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _743);
    float _751 = rsqrt(_741);
    float _753 = _679 * _747;
    float _755 = _677 * _753;
    float _757 = _715 * _735;
    float _759 = rsqrt(_737);
    float _761 = _703 * _735;
    float _763 = _709 * _735;
    float _765 = _681 * _757;
    float _767 = _683 * _761;
    float _769 = _685 * _763;
    float _771 = -_765;
    float _773 = fma(_683, _763, _771);
    float _775 = rsqrt(_749);
    float _777 = -_767;
    float _779 = fma(_685, _757, _777);
    float _781 = -_769;
    float _783 = fma(_681, _761, _781);
    float _785 = _755 * _773;
    float _787 = _751 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _789 = _755 * _779;
    float _791 = _755 * _783;
    float _793 = _679 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _795 = _793 * 0.5;
    float _797 = fma(_745, _761, _785);
    float _799 = _759 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _801 = fma(_745, _763, _789);
    float _803 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _805 = fma(_795, _685, _797);
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _809 = fma(_745, _757, _791);
    float _811 = fma(_795, _681, _801);
    float _813 = _775 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _815 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _817 = _805 * _803;
    float _819 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _821 = _805 * _807;
    float _823 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _825 = fma(_795, _683, _809);
    float _827 = fma(_811, _815, _817);
    float _829 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _831 = fma(_811, _819, _821);
    float _833 = _805 * _823;
    float _835 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _837 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _839 = fma(_825, _829, _827);
    float _841 = fma(_825, _835, _831);
    float _843 = fma(_811, _837, _833);
    float _845 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _847 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _849 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _851 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _853 = fma(_825, _845, _843);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].x, _847);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].z, _849);
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].y, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].x, _855);
    float _863 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].z, _857);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].y, _859);
    float _867 = _405 + _861;
    float _869 = _429 + _863;
    float _871 = _397 + _865;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _867 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _879 = _869 + _877;
    float _881 = _875 * _875;
    float _883 = _879 * _879;
    float _885 = _881 + _883;
    float _887 = sqrt(_885);
    bool _889 = _887 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _851;
    float _893 = _859;
    float _895 = _865;
    float _897 = _867;
    float _899 = _883;
    if (!_889)
    {
        _891 = _867;
    }
    float _901 = _891;
    float _903 = _901;
    if (!_889)
    {
        _893 = _881;
    }
    float _905 = _893;
    float _907 = _905;
    if (!_889)
    {
        _895 = _869;
    }
    float _909 = _895;
    float _911 = _909;
    if (!_889)
    {
        _897 = _871;
    }
    float _913 = _897;
    bool _915 = !_889;
    float _917 = _913;
    if (!_915)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _923 = _887 + _921;
        float _925 = _871 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = rsqrt(_885);
        float _929 = _923 * _919;
        float _931 = _929 * 0.15915493667125701904296875;
        float _933 = _931 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _931 * 6.283185482025146484375;
        float _939 = cos(_937);
        float _941 = fma(_935, _925, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _943 = _927 * _941;
        float _945 = _939 + (-1.0);
        float _947 = fma(_875, _943, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _949 = fma(_879, _943, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _951 = _945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _955 = _947 + _953;
        float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _959 = _949 + _957;
        float _961 = fma(_871, _939, _951);
        float _963 = _955 * _955;
        float _965 = _959 * _959;
        _917 = _961;
        _907 = _963;
        _899 = _965;
        _911 = _949;
        _903 = _947;
    }
    float _967 = _917;
    float _969 = _907;
    float _971 = _899;
    float _973 = _911;
    float _975 = _903;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _979 = _967 + _977;
    out.m_48.x = _531;
    out.m_48.y = _533;
    out.m_48.z = _535;
    out.m_48.w = _521;
    float _981 = fma(_979, _979, _969);
    out.m_50.x = _537;
    out.m_50.y = _545;
    out.m_50.z = _547;
    float _983 = _981 + _971;
    float _985 = sqrt(_983);
    bool _987 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _989 = isnan(_985);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _995 = _991 || _993;
    float _997 = _969;
    if (!_995)
    {
        _997 = 1.0;
    }
    float _999 = _997;
    bool _1001 = !_995;
    float _1003 = _999;
    if (!_1001)
    {
        bool _1005 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1007 = isnan(_985);
        bool _1009 = _1005 || _1007;
        bool _1011 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1013 = _1009 || _1011;
        if (!_1013)
        {
            float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1017 = _985 + _1015;
            float _1019 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1021 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1019;
            float _1023 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1025 = _1023 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1027 = 1.0 / _1021;
            float _1029 = _1017 * _1027;
            float _1031 = fma(_1029, _1025, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1003 = _1031;
            _1033 = true;
        }
        else
        {
            bool _1035 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1037 = isnan(_985);
            bool _1039 = _1035 || _1037;
            bool _1041 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1043 = _1039 || _1041;
            if (!_1043)
            {
                float _1045 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1047 = _985 + _1045;
                float _1049 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1051 = _1049 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1053 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1055 = _1053 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1057 = 1.0 / _1051;
                float _1059 = _1047 * _1057;
                float _1061 = fma(_1059, _1055, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1003 = _1061;
                _1033 = true;
            }
            else
            {
                _1003 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1033 = false;
    float _1063 = _1003;
    float _1065 = _557 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1069 = _973 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1073 = _975 + _1071;
    float _1075 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1065);
    float _1077 = _557 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1079 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.5);
    bool _1087 = _1083 || _1085;
    float _1089 = fma(_1069, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1091 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1075);
    float _1093 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1077);
    float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1097 = _967 + _1095;
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1101 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1093);
    float _1103 = fma(_1073, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1105 = -_559;
    float _1107 = _1105 + _1089;
    float _1109 = 1.0 / _1099;
    float _1111 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1113 = fma(_1097, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1115 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan(0.5);
    bool _1123 = _1119 || _1121;
    float _1125 = -_551;
    float _1127 = _1125 + _1103;
    float _1129 = _1111 + _1099;
    float _1131 = -_553;
    float _1133 = _1131 + _1113;
    float _1135 = _1111;
    float _1137 = _1133;
    float _1139 = _1127;
    if (_1087)
    {
        _1135 = _1107;
    }
    float _1141 = _1135;
    float _1143 = _1141;
    if (!_1087)
    {
        float _1145 = _567 * _567;
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1149 = -_429;
        float _1151 = _1149 + _1089;
        float _1153 = fma(_577, _577, _1145);
        float _1155 = fma(_585, _585, _1153);
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = sqrt(_1155);
        float _1161 = 1.0 / _679;
        float _1163 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1165 = precise::min(_1159, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1167 = _1165 * _1147;
        float _1169 = -_405;
        float _1171 = _1169 + _1103;
        float _1173 = _1167 * _1161;
        float _1175 = -_397;
        float _1177 = _1175 + _1113;
        float _1179 = _1163 * _1173;
        float _1181 = _1151 * _1173;
        float _1183 = fma(_1171, _1179, _563);
        float _1185 = fma(_1177, _1179, _557);
        float _1187 = fma(_1163, _1181, _573);
        _1137 = _1185;
        _1139 = _1183;
        _1143 = _1187;
    }
    float _1189 = _1137;
    float _1191 = _1139;
    float _1193 = _1143;
    float _1195 = _1129 * _1109;
    float _1197 = _1195 * 0.5;
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1201 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1207 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1199);
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1201);
    float _1211 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1213 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1205);
    float _1215 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1207);
    float _1217 = _1207;
    if (_1123)
    {
        _1217 = 1.0;
    }
    float _1219 = _1217;
    float _1221 = _1219;
    if (!_1123)
    {
        float _1223 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1227 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1225);
        float _1229 = _1223 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1229 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = 1.0 / _1233;
        float _1245 = _1237 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = _1241 * _1243;
        float _1251 = 1.0 / _1227;
        float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1255 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1253;
        float _1257 = _1247 * _1249;
        float _1259 = _1237 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = 1.0 / _1257;
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1267 = _1251 * _1265;
        float _1269 = 1.0 / _1255;
        float _1271 = _1261 * _1263;
        float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1275 = fma(_1271, _1267, _1273);
        float _1277 = _1275 * _1269;
        float _1279 = precise::clamp(_1277, 0.0, 1.0);
        _1221 = _1279;
    }
    float _1281 = _1221;
    float _1283 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1209);
    float _1285 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1211);
    float _1289 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1213);
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1293);
    float _1305 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1295);
    float _1307 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1309 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1311 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1303);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1305);
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1307);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1309);
    bool _1321 = _1281 > 0.0;
    bool _1323 = isnan(_1281);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    float _1331 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1333 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1313);
    float _1335 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1315);
    float _1337 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1339 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1317);
    float _1341 = _1331 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1343 = _1333 + _1337;
    float _1345 = _1339 + _1337;
    float _1347 = _1337 * 0.5;
    float _1349 = _1343 * 0.5;
    float _1351 = _1345 * 0.5;
    float _1353 = fma(_1335, -0.5, _1347);
    out.m_35.x = _1341;
    out.gl_Position.x = _1333;
    out.gl_Position.y = _1335;
    out.gl_Position.z = _1339;
    out.gl_Position.w = _1337;
    out.m_52.x = _1349;
    out.m_52.y = _1353;
    out.m_52.z = _1351;
    out.m_52.w = _1337;
    if (_1329)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1355;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1033 = false;
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
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1413 = as_type<float>(_87);
        out.gl_Position.z = _1413;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _79 = _107;
    }
    float _109 = _79;
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
        float _1482 = as_type<float>(_123);
        out.gl_Position.z = _1482;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_39.z;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _131 = _129 != 0;
    float _133 = as_type<float>(int(gl_VertexIndex));
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_39.w;
    float _147 = in.m_39.x;
    float _149 = 0.0;
    float _151 = _127;
    float _153 = _125;
    if (!_131)
    {
        float _155 = in.m_39.y;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = 0.0;
    if (!_143)
    {
        float _161 = _127 * _127;
        float _163 = _161 * 0.5;
        _159 = _163;
    }
    float _165 = _159;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    bool _173 = _145 > 0.5;
    float _175 = 0.0;
    float _177 = _171;
    if (!_131)
    {
        _175 = _157;
    }
    float _179 = _175;
    float _181 = _179;
    float _183 = _157;
    if (_131)
    {
        float _185 = in.m_39.x;
        float _187 = in.m_39.y;
        _181 = _185;
        _183 = _187;
    }
    float _189 = _181;
    float _191 = _183;
    bool _193 = !_143;
    if (!_193)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _127 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _127);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _223;
    }
    float _225 = _177;
    bool _227 = !_143;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _127 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _151 = _247;
    }
    float _249 = _151;
    float _251 = in.m_44.w;
    int _253 = as_type<int>(_133) & 1;
    bool _255 = _253 != 0;
    int _257 = as_type<int>(_133) & 2;
    bool _259 = _257 != 0;
    float _261 = _189 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _263 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _265 = in.m_37.x;
    float _267 = in.m_37.y;
    float _269 = in.m_37.z;
    bool _271 = !_259;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _263);
    float _277 = in.m_44.x;
    float _279 = -_273;
    int _281 = _173 ? as_type<int>(_279) : as_type<int>(_273);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _285 = _283 != 0;
    float _287 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    bool _289 = _125 > 0.5;
    float _291 = 0.0;
    if (!_131)
    {
        _291 = _125;
    }
    float _293 = _291;
    float _295 = _293;
    if (_131)
    {
        _295 = _191;
    }
    float _297 = _295;
    if (_131)
    {
        _153 = _191;
    }
    float _299 = _153;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _303 = _301 != 0;
    float _305 = _297 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _313 = _311 != 0;
    bool _315 = !_285;
    float _317 = _315 ? _273 : as_type<float>(_281);
    float _319 = in.m_32.x;
    float _321 = in.m_32.y;
    float _323 = in.m_32.z;
    bool _325 = _191 > 0.5;
    float _327 = _277 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _329 = _147 > 0.5;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _333 = _327 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _335 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[83].w, _331);
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _339 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _345 = -_337;
    float _347 = fma(_261, 2.0, _345);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _351 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[83].z, _341);
    float _353 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_249, _267, _339);
    float _357 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_305, -2.0, _349);
    float _361 = fma(_249, _265, _353);
    float _363 = fma(_355, _251, _321);
    float _365 = fma(_249, _269, _357);
    float _367 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _351);
    float _369 = fma(_361, _251, _319);
    float _371 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = fma(_365, _251, _323);
    float _375 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = -_105;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[81].x, _347);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _387 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _377);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _391 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _335);
    float _393 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _395 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    float _397 = _389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _399 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _359);
    float _401 = _343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _403 = _317 + (-0.5);
    float _405 = _393 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _407 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _409 = _397 + _407;
    float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _413 = -_401;
    float _415 = -_399;
    float _417 = fma(_413, _403, _415);
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _405 + _419;
    float _423 = _409 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _425 = !_255;
    float _427 = _425 ? (-0.5) : 0.5;
    float _429 = _395 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _431 = -_391;
    float _433 = _431 + 1.0;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _423);
    float _437 = -_273;
    int _439 = _325 ? as_type<int>(_437) : as_type<int>(_273);
    float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _443 = -_427;
    int _445 = _289 ? as_type<int>(_443) : as_type<int>(_427);
    float _447 = -_367;
    float _449 = _447 + 1.0;
    bool _451 = !_313;
    float _453 = _451 ? _273 : as_type<float>(_439);
    float _455 = fma(_317, _433, _417);
    bool _457 = !_303;
    float _459 = _457 ? _427 : as_type<float>(_445);
    float _461 = _333 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _463 = _411 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _465 = -_453;
    float _467 = _465 + 0.5;
    float _469 = -_427;
    int _471 = _329 ? as_type<int>(_469) : as_type<int>(_427);
    float _473 = _459 + 0.5;
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _477 = _467 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _481 = _429 + _479;
    float _483 = fma(_463, _473, _383);
    bool _485 = !_309;
    float _487 = _485 ? _427 : as_type<float>(_471);
    float _489 = _477 * _441;
    float _491 = _409 * _409;
    float _493 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[28].z, _435);
    float _495 = -_449;
    float _497 = fma(_459, _495, _483);
    float _499 = _487 + 0.5;
    float _501 = fma(_421, _421, _491);
    bool _503 = _493 >= 0.0;
    float _505 = fma(_481, _481, _501);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = _507 * _475;
    float _513 = rsqrt(_505);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_503)
    {
        _525 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _527 = _525;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _531 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _539 = as_type<int>(_527);
    if (_503)
    {
        float _541 = _527 * 5.0;
        _539 = as_type<int>(_541);
    }
    int _543 = _539;
    float _545 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _461 * _513;
    out.m_46.x = _511;
    out.m_46.y = _489;
    out.m_46.z = _497;
    out.m_46.w = _455;
    float _551 = _421 * _549;
    if (_503)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_543);
        out.gl_Position.z = _2223;
    }
    float _553 = _409 * _549;
    out.m_48.x = _531;
    out.m_48.y = _533;
    out.m_48.z = _535;
    out.m_48.w = _521;
    out.m_50.x = _537;
    out.m_50.y = _545;
    out.m_50.z = _547;
    if (_503)
    {
        out.m_35.x = 0.0;
    }
    if (_503)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _555 = -_553;
    float _557 = _397 + _555;
    float _559 = _481 * _549;
    float _561 = -_551;
    float _563 = _405 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _567 = _557 + _565;
    float _569 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _571 = -_559;
    float _573 = _429 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _577 = _563 + _575;
    float _579 = _567 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _581 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _569);
    float _583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _585 = _573 + _583;
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[28].x, _579);
    float _589 = sqrt(_287);
    float _591 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _581);
    float _593 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[28].z, _587);
    float _595 = -_553;
    float _597 = _409 + _595;
    float _599 = -_551;
    float _601 = _421 + _599;
    bool _603 = _593 >= 0.0;
    float _605 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _607 = rsqrt(_287);
    float _609 = _597 * _597;
    float _611 = -_559;
    float _613 = _481 + _611;
    float _615 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _617 = fma(_601, _601, _609);
    float _619 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _621 = sqrt(_591);
    float _623 = _579;
    if (_603)
    {
        _623 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _623;
    int _627 = as_type<int>(_625);
    if (_603)
    {
        out.m_35.x = 0.0;
    }
    float _629 = rsqrt(_591);
    if (_603)
    {
        float _631 = _625 * 5.0;
        _627 = as_type<int>(_631);
    }
    int _633 = _627;
    if (_603)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2392 = as_type<float>(_633);
        out.gl_Position.z = _2392;
    }
    float _635 = sqrt(_619);
    if (_603)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _637 = -_397;
    float _639 = _637 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = fma(_613, _613, _617);
    float _643 = -_405;
    float _645 = _643 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _647 = -_429;
    float _649 = _647 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _651 = _639 * _639;
    float _653 = precise::max(_589, _621);
    float _655 = _427 * _607;
    float _657 = sqrt(_641);
    float _659 = fma(_645, _645, _651);
    float _661 = precise::max(_635, _653);
    float _663 = _273 * _629;
    float _665 = in.m_44.y;
    float _667 = fma(_649, _649, _659);
    float _669 = _655 * _661;
    float _671 = _663 * _661;
    float _673 = rsqrt(_667);
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    float _677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _671);
    float _679 = _513 * _657;
    float _681 = _645 * _673;
    float _683 = _649 * _673;
    float _685 = _639 * _673;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _689 = _681 * _687;
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _693 = _683 * _691;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _697 = _685 * _695;
    float _699 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _701 = -_689;
    float _703 = fma(_683, _699, _701);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _707 = -_693;
    float _709 = fma(_685, _705, _707);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _713 = -_697;
    float _715 = fma(_681, _711, _713);
    float _717 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _719 = _703 * _703;
    float _721 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _717);
    float _723 = fma(_709, _709, _719);
    float _725 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _727 = fma(_715, _715, _723);
    float _729 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _725);
    float _731 = _333 * _679;
    float _733 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _735 = rsqrt(_727);
    float _737 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _721);
    float _739 = _665 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _741 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _729);
    float _743 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _733);
    float _745 = _675 * _731;
    float _747 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _749 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _743);
    float _751 = rsqrt(_741);
    float _753 = _679 * _747;
    float _755 = _677 * _753;
    float _757 = _715 * _735;
    float _759 = rsqrt(_737);
    float _761 = _703 * _735;
    float _763 = _709 * _735;
    float _765 = _681 * _757;
    float _767 = _683 * _761;
    float _769 = _685 * _763;
    float _771 = -_765;
    float _773 = fma(_683, _763, _771);
    float _775 = rsqrt(_749);
    float _777 = -_767;
    float _779 = fma(_685, _757, _777);
    float _781 = -_769;
    float _783 = fma(_681, _761, _781);
    float _785 = _755 * _773;
    float _787 = _751 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _789 = _755 * _779;
    float _791 = _755 * _783;
    float _793 = _679 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _795 = _793 * 0.5;
    float _797 = fma(_745, _761, _785);
    float _799 = _759 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _801 = fma(_745, _763, _789);
    float _803 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _805 = fma(_795, _685, _797);
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _809 = fma(_745, _757, _791);
    float _811 = fma(_795, _681, _801);
    float _813 = _775 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _815 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _817 = _805 * _803;
    float _819 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _821 = _805 * _807;
    float _823 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _825 = fma(_795, _683, _809);
    float _827 = fma(_811, _815, _817);
    float _829 = _787 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _831 = fma(_811, _819, _821);
    float _833 = _805 * _823;
    float _835 = _799 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _837 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _839 = fma(_825, _829, _827);
    float _841 = fma(_825, _835, _831);
    float _843 = fma(_811, _837, _833);
    float _845 = _813 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _847 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _849 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _851 = _839 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _853 = fma(_825, _845, _843);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].x, _847);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].z, _849);
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c10)._m0[18].y, _851);
    float _861 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].x, _855);
    float _863 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].z, _857);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[20].y, _859);
    float _867 = _405 + _861;
    float _869 = _429 + _863;
    float _871 = _397 + _865;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _867 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _879 = _869 + _877;
    float _881 = _875 * _875;
    float _883 = _879 * _879;
    float _885 = _881 + _883;
    float _887 = sqrt(_885);
    bool _889 = _887 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _851;
    float _893 = _859;
    float _895 = _865;
    float _897 = _867;
    float _899 = _883;
    if (!_889)
    {
        _891 = _867;
    }
    float _901 = _891;
    float _903 = _901;
    if (!_889)
    {
        _893 = _881;
    }
    float _905 = _893;
    float _907 = _905;
    if (!_889)
    {
        _895 = _869;
    }
    float _909 = _895;
    float _911 = _909;
    if (!_889)
    {
        _897 = _871;
    }
    float _913 = _897;
    bool _915 = !_889;
    float _917 = _913;
    if (!_915)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _923 = _887 + _921;
        float _925 = _871 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = rsqrt(_885);
        float _929 = _923 * _919;
        float _931 = _929 * 0.15915493667125701904296875;
        float _933 = _931 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _931 * 6.283185482025146484375;
        float _939 = cos(_937);
        float _941 = fma(_935, _925, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _943 = _927 * _941;
        float _945 = _939 + (-1.0);
        float _947 = fma(_875, _943, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _949 = fma(_879, _943, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _951 = _945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _955 = _947 + _953;
        float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _959 = _949 + _957;
        float _961 = fma(_871, _939, _951);
        float _963 = _955 * _955;
        float _965 = _959 * _959;
        _917 = _961;
        _907 = _963;
        _899 = _965;
        _911 = _949;
        _903 = _947;
    }
    float _967 = _917;
    float _969 = _907;
    float _971 = _899;
    float _973 = _911;
    float _975 = _903;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _979 = _967 + _977;
    out.m_48.x = _531;
    out.m_48.y = _533;
    out.m_48.z = _535;
    out.m_48.w = _521;
    float _981 = fma(_979, _979, _969);
    out.m_50.x = _537;
    out.m_50.y = _545;
    out.m_50.z = _547;
    float _983 = _981 + _971;
    float _985 = sqrt(_983);
    bool _987 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _989 = isnan(_985);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _995 = _991 || _993;
    float _997 = _969;
    if (!_995)
    {
        _997 = 1.0;
    }
    float _999 = _997;
    bool _1001 = !_995;
    float _1003 = _999;
    if (!_1001)
    {
        bool _1005 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1007 = isnan(_985);
        bool _1009 = _1005 || _1007;
        bool _1011 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1013 = _1009 || _1011;
        if (!_1013)
        {
            float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1017 = _985 + _1015;
            float _1019 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1021 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1019;
            float _1023 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1025 = _1023 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1027 = 1.0 / _1021;
            float _1029 = _1017 * _1027;
            float _1031 = fma(_1029, _1025, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1003 = _1031;
            _1033 = true;
        }
        else
        {
            bool _1035 = _985 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1037 = isnan(_985);
            bool _1039 = _1035 || _1037;
            bool _1041 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1043 = _1039 || _1041;
            if (!_1043)
            {
                float _1045 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1047 = _985 + _1045;
                float _1049 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1051 = _1049 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1053 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1055 = _1053 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1057 = 1.0 / _1051;
                float _1059 = _1047 * _1057;
                float _1061 = fma(_1059, _1055, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1003 = _1061;
                _1033 = true;
            }
            else
            {
                _1003 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1033 = false;
    float _1063 = _1003;
    float _1065 = _557 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1069 = _973 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1073 = _975 + _1071;
    float _1075 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1065);
    float _1077 = _557 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1079 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.5);
    bool _1087 = _1083 || _1085;
    float _1089 = fma(_1069, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1091 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1075);
    float _1093 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1077);
    float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1097 = _967 + _1095;
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1101 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1093);
    float _1103 = fma(_1073, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1105 = -_559;
    float _1107 = _1105 + _1089;
    float _1109 = 1.0 / _1099;
    float _1111 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1113 = fma(_1097, _1063, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1115 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan(0.5);
    bool _1123 = _1119 || _1121;
    float _1125 = -_551;
    float _1127 = _1125 + _1103;
    float _1129 = _1111 + _1099;
    float _1131 = -_553;
    float _1133 = _1131 + _1113;
    float _1135 = _1111;
    float _1137 = _1133;
    float _1139 = _1127;
    if (_1087)
    {
        _1135 = _1107;
    }
    float _1141 = _1135;
    float _1143 = _1141;
    if (!_1087)
    {
        float _1145 = _567 * _567;
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1149 = -_429;
        float _1151 = _1149 + _1089;
        float _1153 = fma(_577, _577, _1145);
        float _1155 = fma(_585, _585, _1153);
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = sqrt(_1155);
        float _1161 = 1.0 / _679;
        float _1163 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1165 = precise::min(_1159, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1167 = _1165 * _1147;
        float _1169 = -_405;
        float _1171 = _1169 + _1103;
        float _1173 = _1167 * _1161;
        float _1175 = -_397;
        float _1177 = _1175 + _1113;
        float _1179 = _1163 * _1173;
        float _1181 = _1151 * _1173;
        float _1183 = fma(_1171, _1179, _563);
        float _1185 = fma(_1177, _1179, _557);
        float _1187 = fma(_1163, _1181, _573);
        _1137 = _1185;
        _1139 = _1183;
        _1143 = _1187;
    }
    float _1189 = _1137;
    float _1191 = _1139;
    float _1193 = _1143;
    float _1195 = _1129 * _1109;
    float _1197 = _1195 * 0.5;
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1201 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1207 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1199);
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1201);
    float _1211 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1213 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1205);
    float _1215 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1207);
    float _1217 = _1207;
    if (_1123)
    {
        _1217 = 1.0;
    }
    float _1219 = _1217;
    float _1221 = _1219;
    if (!_1123)
    {
        float _1223 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1227 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1225);
        float _1229 = _1223 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1229 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = 1.0 / _1233;
        float _1245 = _1237 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = _1241 * _1243;
        float _1251 = 1.0 / _1227;
        float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1255 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1253;
        float _1257 = _1247 * _1249;
        float _1259 = _1237 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = 1.0 / _1257;
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1267 = _1251 * _1265;
        float _1269 = 1.0 / _1255;
        float _1271 = _1261 * _1263;
        float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1275 = fma(_1271, _1267, _1273);
        float _1277 = _1275 * _1269;
        float _1279 = precise::clamp(_1277, 0.0, 1.0);
        _1221 = _1279;
    }
    float _1281 = _1221;
    float _1283 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1209);
    float _1285 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1211);
    float _1289 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1213);
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1293);
    float _1305 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1295);
    float _1307 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1309 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1311 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1303);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1305);
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1307);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1309);
    bool _1321 = _1281 > 0.0;
    bool _1323 = isnan(_1281);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    float _1331 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1333 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1313);
    float _1335 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1315);
    float _1337 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1339 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1317);
    float _1341 = _1331 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1343 = _1333 + _1337;
    float _1345 = _1339 + _1337;
    float _1347 = _1337 * 0.5;
    float _1349 = _1343 * 0.5;
    float _1351 = _1345 * 0.5;
    float _1353 = fma(_1335, -0.5, _1347);
    out.m_35.x = _1341;
    out.gl_Position.x = _1333;
    out.gl_Position.y = _1335;
    out.gl_Position.z = _1339;
    out.gl_Position.w = _1337;
    out.m_52.x = _1349;
    out.m_52.y = _1353;
    out.m_52.z = _1351;
    out.m_52.w = _1337;
    if (_1329)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1355;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

