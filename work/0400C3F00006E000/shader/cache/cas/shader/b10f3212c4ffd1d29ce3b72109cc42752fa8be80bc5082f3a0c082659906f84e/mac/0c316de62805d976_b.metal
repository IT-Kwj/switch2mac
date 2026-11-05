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
    float4 m_44 [[user(locn0)]];
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
    float4 m_46 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _969 = false;
    bool _299 = false;
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
        float _1346 = as_type<float>(_87);
        out.gl_Position.z = _1346;
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
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_71);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    if (_117)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _81;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1414 = as_type<float>(_123);
        out.gl_Position.z = _1414;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    float _131 = in.m_32.x;
    float _133 = in.m_32.y;
    float _135 = in.m_32.z;
    float _137 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _139 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _143 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _145 = _137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _147 = _139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _149 = _141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _151 = as_type<int>(_125) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_125) & 2;
    bool _157 = _155 != 0;
    float _159 = in.m_37.x;
    float _161 = in.m_37.y;
    float _163 = in.m_37.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    bool _175 = !_153;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_157;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = 0.0;
    float _185 = _127;
    if (!_173)
    {
        float _187 = _127 * _127;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_173)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    bool _199 = !_173;
    float _201 = _197;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _127 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _127);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_173;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _127 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _185 = _255;
    }
    float _257 = _185;
    out.m_44.x = _145;
    out.m_44.y = _147;
    out.m_44.z = _149;
    out.m_44.w = _143;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _159, _261);
    float _269 = fma(_257, _161, _263);
    float _271 = fma(_257, _163, _265);
    float _273 = fma(_267, _129, _131);
    float _275 = fma(_269, _129, _133);
    float _277 = fma(_271, _129, _135);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_46.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_71);
        float _303 = 1.0 / _301;
        float _305 = _105 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _329 = 1.0 / _315;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _337 = _335 != 0;
    float _339 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _341 = 1.0 / _319;
    float _343 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _345 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _339);
    float _347 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _345);
    float _349 = 1.0 / _327;
    float _351 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _353 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _343);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _357 = _307 + _355;
    bool _359 = _311 > 0.5;
    float _361 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _351);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _365 = _307 + _363;
    float _367 = _357 * _329;
    float _369 = 1.0 / _323;
    float _371 = _365 * _341;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _375 = _307 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _379 = _307 + _377;
    bool _381 = _309 > 0.5;
    float _383 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _385 = _375 * _349;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _395;
    float _399 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _361);
    float _401 = fma(_389, _367, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _403 = fma(_393, _367, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _405 = fma(_397, _367, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _407 = _379 * _369;
    bool _409 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _411 = isnan(_307);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _425 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _427 = isnan(_307);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _441 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _443 = isnan(_307);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_419;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = fma(_439, _371, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _467 = _435 * _455;
    bool _469 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _471 = isnan(_307);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = fma(_423, _371, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _483 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _485 = isnan(_307);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_459, _371, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _497 = _451 * _463;
    float _499 = -_451;
    float _501 = _499 + 1.0;
    float _503 = -_493;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _507;
    float _511 = _493 * _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _517;
    float _521 = _479 * _505;
    float _523 = fma(_509, _407, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _525 = fma(_515, _407, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _527 = fma(_519, _407, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _529 = _401 * _521;
    float _531 = _403 * _521;
    float _533 = _405 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _539 = -_479;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _547 = _347 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = fma(_537, _385, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _551 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].x, _529);
    float _553 = fma(_545, _385, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].y, _531);
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].z, _533);
    float _563 = fma(_481, _511, _551);
    float _565 = _383 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _569 = _547 + _567;
    float _571 = fma(_557, _385, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _573 = fma(_465, _511, _559);
    float _575 = fma(_495, _511, _561);
    float _577 = _399 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _565 + _579;
    float _583 = _569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _585 = fma(_527, _497, _563);
    float _587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _589 = _577 + _587;
    float _591 = fma(_523, _497, _573);
    float _593 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _595 = fma(_525, _497, _575);
    float _597 = _569 * _569;
    float _599 = -_177;
    int _601 = _381 ? as_type<int>(_599) : as_type<int>(_177);
    float _603 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _605 = -_181;
    int _607 = _359 ? as_type<int>(_605) : as_type<int>(_181);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _611 = fma(_549, _467, _585);
    float _613 = fma(_571, _467, _591);
    bool _615 = _603 >= 0.0;
    float _617 = fma(_553, _467, _595);
    float _619 = fma(_581, _581, _597);
    bool _621 = !_333;
    float _623 = _621 ? _177 : as_type<float>(_601);
    float _625 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].x, _611);
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _629 = !_337;
    float _631 = _629 ? _181 : as_type<float>(_607);
    float _633 = fma(_589, _589, _619);
    float _635 = _623 + 0.5;
    float _637 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].y, _613);
    float _639 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].z, _617);
    float _641 = -_631;
    float _643 = _641 + 0.5;
    float _645 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _647 = rsqrt(_633);
    float _649 = _597;
    float _651 = _547;
    if (_615)
    {
        _649 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _653 = _649;
    float _655 = _643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _657 = _625 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _659 = _637 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _639 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _663 = _645 * _609;
    float _665 = _655 * _627;
    int _667 = as_type<int>(_653);
    if (_615)
    {
        float _669 = _653 * 5.0;
        _667 = as_type<int>(_669);
    }
    int _671 = _667;
    float _673 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _663;
    out.m_48.y = _665;
    float _679 = _569 * _647;
    if (_615)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_671);
        out.gl_Position.z = _2357;
    }
    float _681 = _581 * _647;
    out.m_50.x = _673;
    out.m_50.y = _675;
    out.m_50.z = _677;
    if (_615)
    {
        out.m_35.x = 0.0;
    }
    if (_615)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _683 = -_679;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _687 = _589 * _647;
    float _689 = -_681;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _693 = -_679;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = _685 + _697;
    float _701 = -_687;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _707 = _691 + _705;
    float _709 = -_681;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _713 = _699 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _717 = _703 + _715;
    float _719 = _695 * _695;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[28].x, _713);
    float _723 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[28].z, _721);
    bool _725 = _723 >= 0.0;
    float _727 = _717;
    if (_725)
    {
        _727 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _729 = _727;
    int _731 = as_type<int>(_729);
    if (_725)
    {
        out.m_35.x = 0.0;
    }
    if (_725)
    {
        float _733 = _729 * 5.0;
        _731 = as_type<int>(_733);
    }
    int _735 = _731;
    if (_725)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2478 = as_type<float>(_735);
        out.gl_Position.z = _2478;
    }
    if (_725)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _737 = in.m_42.x;
    float _739 = in.m_42.y;
    float _741 = -_687;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _745 = fma(_711, _711, _719);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _751 = fma(_743, _743, _745);
    float _753 = sqrt(_751);
    float _755 = _739 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _757 = _647 * _753;
    float _759 = _737 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _763 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _765 = _757 * _761;
    float _767 = _757 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _757 * _763;
    float _773 = _747 * _765;
    float _775 = _749 * _771;
    float _777 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _781 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _783 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[26].x, _779);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _791 = _787 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _793 = _565 + _789;
    float _795 = _577 + _791;
    float _797 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _799 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _801 = _793 + _799;
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _805 = _795 + _803;
    float _807 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[25].x, _797);
    float _809 = _801 * _801;
    float _811 = _805 * _805;
    float _813 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    float _815 = _809 + _811;
    float _817 = _813 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _819 = sqrt(_815);
    float _821 = _547 + _817;
    bool _823 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _825 = _813;
    float _827 = _797;
    float _829 = _817;
    float _831 = _773;
    if (!_823)
    {
        _651 = _811;
    }
    float _833 = _651;
    float _835 = _833;
    if (!_823)
    {
        _825 = _809;
    }
    float _837 = _825;
    float _839 = _837;
    if (!_823)
    {
        _827 = _793;
    }
    float _841 = _827;
    float _843 = _841;
    if (!_823)
    {
        _829 = _795;
    }
    float _845 = _829;
    float _847 = _845;
    if (!_823)
    {
        _831 = _821;
    }
    float _849 = _831;
    bool _851 = !_823;
    float _853 = _849;
    if (!_851)
    {
        float _855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _859 = _819 + _857;
        float _861 = _821 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = rsqrt(_815);
        float _865 = _859 * _855;
        float _867 = _865 * 0.15915493667125701904296875;
        float _869 = _867 * 6.283185482025146484375;
        float _871 = sin(_869);
        float _873 = _867 * 6.283185482025146484375;
        float _875 = cos(_873);
        float _877 = fma(_871, _861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _879 = _863 * _877;
        float _881 = _875 + (-1.0);
        float _883 = fma(_801, _879, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _885 = fma(_805, _879, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _887 = _881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _891 = _883 + _889;
        float _893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _895 = _885 + _893;
        float _897 = fma(_821, _875, _887);
        float _899 = _891 * _891;
        float _901 = _895 * _895;
        _853 = _897;
        _839 = _899;
        _835 = _901;
        _843 = _883;
        _847 = _885;
    }
    float _903 = _853;
    float _905 = _839;
    float _907 = _835;
    float _909 = _843;
    float _911 = _847;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _915 = _903 + _913;
    float _917 = fma(_915, _915, _905);
    float _919 = _917 + _907;
    float _921 = sqrt(_919);
    bool _923 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _925 = isnan(_921);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _931 = _927 || _929;
    float _933 = _905;
    if (!_931)
    {
        _933 = 1.0;
    }
    float _935 = _933;
    bool _937 = !_931;
    float _939 = _935;
    if (!_937)
    {
        bool _941 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _943 = isnan(_921);
        bool _945 = _941 || _943;
        bool _947 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _949 = _945 || _947;
        if (!_949)
        {
            float _951 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _953 = _921 + _951;
            float _955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _957 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _955;
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _961 = _959 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _963 = 1.0 / _957;
            float _965 = _953 * _963;
            float _967 = fma(_965, _961, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _939 = _967;
            _969 = true;
        }
        else
        {
            bool _971 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _973 = isnan(_921);
            bool _975 = _971 || _973;
            bool _977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _979 = _975 || _977;
            if (!_979)
            {
                float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _983 = _921 + _981;
                float _985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _991 = _989 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _993 = 1.0 / _987;
                float _995 = _983 * _993;
                float _997 = fma(_995, _991, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _939 = _997;
                _969 = true;
            }
            else
            {
                _939 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _969 = false;
    float _999 = _939;
    float _1001 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1003 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1007 = _909 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1011 = _911 + _1009;
    float _1013 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1001);
    float _1015 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1003);
    float _1017 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1019 = _903 + _1017;
    float _1021 = fma(_1007, _999, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1023 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1013);
    float _1025 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1015);
    float _1027 = fma(_1019, _999, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1029 = fma(_1011, _999, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1035 = -_679;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1039 = 1.0 / _1031;
    float _1041 = _1033 + _1031;
    float _1043 = -_681;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1049 = -_687;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1029);
    bool _1053 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.5);
    bool _1061 = _1057 || _1059;
    float _1063 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1047);
    float _1067 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1069 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1071 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1073 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1067);
    float _1075 = _1041 * _1039;
    float _1077 = _1075 * 0.5;
    float _1079 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1085 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1083);
    float _1087 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1063);
    float _1089 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1069);
    float _1091 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1095 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = 1.0 / _1085;
    float _1099 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1089);
    float _1101 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1105 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1109 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1101);
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1093);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1117 = _1103;
    float _1119 = _1101;
    if (_1061)
    {
        _1117 = 1.0;
    }
    float _1121 = _1117;
    float _1123 = _1121;
    if (_1061)
    {
        _1119 = 1.0;
    }
    float _1125 = _1119;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1129 = _1097 * _1127;
    float _1131 = _1125;
    if (!_1061)
    {
        float _1133 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1135 = _1133 * 0.15915493667125701904296875;
        float _1137 = _1135 * 6.283185482025146484375;
        float _1139 = cos(_1137);
        float _1141 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1143 = _1141 * 0.15915493667125701904296875;
        float _1145 = _1135 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1139;
        float _1151 = _1143 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = _1147 * _1149;
        float _1157 = _1143 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1153 * _1155;
        float _1163 = 1.0 / _1161;
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1165;
        float _1169 = 1.0 / _1167;
        float _1171 = _1159 * _1163;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1175 = fma(_1129, _1171, _1173);
        float _1177 = _1175 * _1169;
        float _1179 = precise::clamp(_1177, 0.0, 1.0);
        _1123 = _1179;
    }
    float _1181 = _1123;
    if (!_1061)
    {
        float _1183 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1185 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = 1.0 / _1189;
        float _1201 = _1193 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1197 * _1199;
        float _1207 = _1193 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = 1.0 / _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1217 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1215;
        float _1219 = 1.0 / _1217;
        float _1221 = _1209 * _1213;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1225 = fma(_1129, _1221, _1223);
        float _1227 = _1225 * _1219;
        float _1229 = precise::clamp(_1227, 0.0, 1.0);
        float _1231 = -_1229;
        float _1233 = _1231 + 1.0;
        _1131 = _1233;
    }
    float _1235 = _1131;
    float _1237 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1109);
    float _1241 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1113);
    float _1243 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1115);
    bool _1245 = _1181 > 0.0;
    bool _1247 = isnan(_1181);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan(0.0);
    bool _1253 = _1249 || _1251;
    float _1255 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1111);
    float _1257 = _1181 * _1235;
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1239);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1243);
    float _1263 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1241);
    bool _1265 = _1235 <= 0.0;
    bool _1267 = !_1253;
    bool _1269 = _1265 || _1267;
    float _1271 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1255);
    float _1273 = _1259 + _1261;
    float _1275 = _1263 + _1261;
    float _1277 = _1261 * 0.5;
    float _1279 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1281 = _1273 * 0.5;
    float _1283 = _1275 * 0.5;
    float _1285 = fma(_1271, -0.5, _1277);
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1259;
    out.gl_Position.y = _1271;
    out.gl_Position.z = _1263;
    out.gl_Position.w = _1261;
    out.m_52.x = _1281;
    out.m_52.y = _1285;
    out.m_52.z = _1283;
    out.m_52.w = _1261;
    out.m_35.x = _1287;
    if (!_1269)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1289 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1289;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _969 = false;
    bool _299 = false;
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
        float _1346 = as_type<float>(_87);
        out.gl_Position.z = _1346;
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
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_71);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    if (_117)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _81;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1414 = as_type<float>(_123);
        out.gl_Position.z = _1414;
    }
    if (_117)
    {
        return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    float _131 = in.m_32.x;
    float _133 = in.m_32.y;
    float _135 = in.m_32.z;
    float _137 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _139 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _143 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _145 = _137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _147 = _139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _149 = _141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _151 = as_type<int>(_125) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_125) & 2;
    bool _157 = _155 != 0;
    float _159 = in.m_37.x;
    float _161 = in.m_37.y;
    float _163 = in.m_37.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    bool _175 = !_153;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_157;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = 0.0;
    float _185 = _127;
    if (!_173)
    {
        float _187 = _127 * _127;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_173)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    bool _199 = !_173;
    float _201 = _197;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _127 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _127);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_173;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _127 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _185 = _255;
    }
    float _257 = _185;
    out.m_44.x = _145;
    out.m_44.y = _147;
    out.m_44.z = _149;
    out.m_44.w = _143;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _159, _261);
    float _269 = fma(_257, _161, _263);
    float _271 = fma(_257, _163, _265);
    float _273 = fma(_267, _129, _131);
    float _275 = fma(_269, _129, _133);
    float _277 = fma(_271, _129, _135);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_46.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_71);
        float _303 = 1.0 / _301;
        float _305 = _105 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _329 = 1.0 / _315;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _337 = _335 != 0;
    float _339 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _341 = 1.0 / _319;
    float _343 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _345 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _339);
    float _347 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _345);
    float _349 = 1.0 / _327;
    float _351 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _353 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _343);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _357 = _307 + _355;
    bool _359 = _311 > 0.5;
    float _361 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _351);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _365 = _307 + _363;
    float _367 = _357 * _329;
    float _369 = 1.0 / _323;
    float _371 = _365 * _341;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _375 = _307 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _379 = _307 + _377;
    bool _381 = _309 > 0.5;
    float _383 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _385 = _375 * _349;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _395;
    float _399 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _361);
    float _401 = fma(_389, _367, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _403 = fma(_393, _367, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _405 = fma(_397, _367, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _407 = _379 * _369;
    bool _409 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _411 = isnan(_307);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _425 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _427 = isnan(_307);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _441 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _443 = isnan(_307);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_419;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = fma(_439, _371, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _467 = _435 * _455;
    bool _469 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _471 = isnan(_307);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = fma(_423, _371, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _483 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _485 = isnan(_307);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_459, _371, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _497 = _451 * _463;
    float _499 = -_451;
    float _501 = _499 + 1.0;
    float _503 = -_493;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _507;
    float _511 = _493 * _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _517;
    float _521 = _479 * _505;
    float _523 = fma(_509, _407, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _525 = fma(_515, _407, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _527 = fma(_519, _407, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _529 = _401 * _521;
    float _531 = _403 * _521;
    float _533 = _405 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _539 = -_479;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _547 = _347 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = fma(_537, _385, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _551 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].x, _529);
    float _553 = fma(_545, _385, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].y, _531);
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].z, _533);
    float _563 = fma(_481, _511, _551);
    float _565 = _383 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _569 = _547 + _567;
    float _571 = fma(_557, _385, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _573 = fma(_465, _511, _559);
    float _575 = fma(_495, _511, _561);
    float _577 = _399 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _565 + _579;
    float _583 = _569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _585 = fma(_527, _497, _563);
    float _587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _589 = _577 + _587;
    float _591 = fma(_523, _497, _573);
    float _593 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _595 = fma(_525, _497, _575);
    float _597 = _569 * _569;
    float _599 = -_177;
    int _601 = _381 ? as_type<int>(_599) : as_type<int>(_177);
    float _603 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _605 = -_181;
    int _607 = _359 ? as_type<int>(_605) : as_type<int>(_181);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _611 = fma(_549, _467, _585);
    float _613 = fma(_571, _467, _591);
    bool _615 = _603 >= 0.0;
    float _617 = fma(_553, _467, _595);
    float _619 = fma(_581, _581, _597);
    bool _621 = !_333;
    float _623 = _621 ? _177 : as_type<float>(_601);
    float _625 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].x, _611);
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _629 = !_337;
    float _631 = _629 ? _181 : as_type<float>(_607);
    float _633 = fma(_589, _589, _619);
    float _635 = _623 + 0.5;
    float _637 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].y, _613);
    float _639 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].z, _617);
    float _641 = -_631;
    float _643 = _641 + 0.5;
    float _645 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _647 = rsqrt(_633);
    float _649 = _597;
    float _651 = _547;
    if (_615)
    {
        _649 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _653 = _649;
    float _655 = _643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _657 = _625 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _659 = _637 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _639 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _663 = _645 * _609;
    float _665 = _655 * _627;
    int _667 = as_type<int>(_653);
    if (_615)
    {
        float _669 = _653 * 5.0;
        _667 = as_type<int>(_669);
    }
    int _671 = _667;
    float _673 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _663;
    out.m_48.y = _665;
    float _679 = _569 * _647;
    if (_615)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_671);
        out.gl_Position.z = _2357;
    }
    float _681 = _581 * _647;
    out.m_50.x = _673;
    out.m_50.y = _675;
    out.m_50.z = _677;
    if (_615)
    {
        out.m_35.x = 0.0;
    }
    if (_615)
    {
        return out;
    }
    float _683 = -_679;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _687 = _589 * _647;
    float _689 = -_681;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _693 = -_679;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = _685 + _697;
    float _701 = -_687;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _707 = _691 + _705;
    float _709 = -_681;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _713 = _699 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _717 = _703 + _715;
    float _719 = _695 * _695;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[28].x, _713);
    float _723 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[28].z, _721);
    bool _725 = _723 >= 0.0;
    float _727 = _717;
    if (_725)
    {
        _727 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _729 = _727;
    int _731 = as_type<int>(_729);
    if (_725)
    {
        out.m_35.x = 0.0;
    }
    if (_725)
    {
        float _733 = _729 * 5.0;
        _731 = as_type<int>(_733);
    }
    int _735 = _731;
    if (_725)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2478 = as_type<float>(_735);
        out.gl_Position.z = _2478;
    }
    if (_725)
    {
        return out;
    }
    float _737 = in.m_42.x;
    float _739 = in.m_42.y;
    float _741 = -_687;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _745 = fma(_711, _711, _719);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _751 = fma(_743, _743, _745);
    float _753 = sqrt(_751);
    float _755 = _739 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _757 = _647 * _753;
    float _759 = _737 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _763 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _765 = _757 * _761;
    float _767 = _757 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _757 * _763;
    float _773 = _747 * _765;
    float _775 = _749 * _771;
    float _777 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _781 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _783 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[26].x, _779);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _791 = _787 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _793 = _565 + _789;
    float _795 = _577 + _791;
    float _797 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _799 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _801 = _793 + _799;
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _805 = _795 + _803;
    float _807 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[25].x, _797);
    float _809 = _801 * _801;
    float _811 = _805 * _805;
    float _813 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    float _815 = _809 + _811;
    float _817 = _813 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _819 = sqrt(_815);
    float _821 = _547 + _817;
    bool _823 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _825 = _813;
    float _827 = _797;
    float _829 = _817;
    float _831 = _773;
    if (!_823)
    {
        _651 = _811;
    }
    float _833 = _651;
    float _835 = _833;
    if (!_823)
    {
        _825 = _809;
    }
    float _837 = _825;
    float _839 = _837;
    if (!_823)
    {
        _827 = _793;
    }
    float _841 = _827;
    float _843 = _841;
    if (!_823)
    {
        _829 = _795;
    }
    float _845 = _829;
    float _847 = _845;
    if (!_823)
    {
        _831 = _821;
    }
    float _849 = _831;
    bool _851 = !_823;
    float _853 = _849;
    if (!_851)
    {
        float _855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _859 = _819 + _857;
        float _861 = _821 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = rsqrt(_815);
        float _865 = _859 * _855;
        float _867 = _865 * 0.15915493667125701904296875;
        float _869 = _867 * 6.283185482025146484375;
        float _871 = sin(_869);
        float _873 = _867 * 6.283185482025146484375;
        float _875 = cos(_873);
        float _877 = fma(_871, _861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _879 = _863 * _877;
        float _881 = _875 + (-1.0);
        float _883 = fma(_801, _879, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _885 = fma(_805, _879, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _887 = _881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _891 = _883 + _889;
        float _893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _895 = _885 + _893;
        float _897 = fma(_821, _875, _887);
        float _899 = _891 * _891;
        float _901 = _895 * _895;
        _853 = _897;
        _839 = _899;
        _835 = _901;
        _843 = _883;
        _847 = _885;
    }
    float _903 = _853;
    float _905 = _839;
    float _907 = _835;
    float _909 = _843;
    float _911 = _847;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _915 = _903 + _913;
    float _917 = fma(_915, _915, _905);
    float _919 = _917 + _907;
    float _921 = sqrt(_919);
    bool _923 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _925 = isnan(_921);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _931 = _927 || _929;
    float _933 = _905;
    if (!_931)
    {
        _933 = 1.0;
    }
    float _935 = _933;
    bool _937 = !_931;
    float _939 = _935;
    if (!_937)
    {
        bool _941 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _943 = isnan(_921);
        bool _945 = _941 || _943;
        bool _947 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _949 = _945 || _947;
        if (!_949)
        {
            float _951 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _953 = _921 + _951;
            float _955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _957 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _955;
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _961 = _959 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _963 = 1.0 / _957;
            float _965 = _953 * _963;
            float _967 = fma(_965, _961, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _939 = _967;
            _969 = true;
        }
        else
        {
            bool _971 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _973 = isnan(_921);
            bool _975 = _971 || _973;
            bool _977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _979 = _975 || _977;
            if (!_979)
            {
                float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _983 = _921 + _981;
                float _985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _991 = _989 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _993 = 1.0 / _987;
                float _995 = _983 * _993;
                float _997 = fma(_995, _991, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _939 = _997;
                _969 = true;
            }
            else
            {
                _939 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _969 = false;
    float _999 = _939;
    float _1001 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1003 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1007 = _909 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1011 = _911 + _1009;
    float _1013 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1001);
    float _1015 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1003);
    float _1017 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1019 = _903 + _1017;
    float _1021 = fma(_1007, _999, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1023 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1013);
    float _1025 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1015);
    float _1027 = fma(_1019, _999, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1029 = fma(_1011, _999, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1035 = -_679;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1039 = 1.0 / _1031;
    float _1041 = _1033 + _1031;
    float _1043 = -_681;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1049 = -_687;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1029);
    bool _1053 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.5);
    bool _1061 = _1057 || _1059;
    float _1063 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1047);
    float _1067 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1069 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1071 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1073 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1067);
    float _1075 = _1041 * _1039;
    float _1077 = _1075 * 0.5;
    float _1079 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1085 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1083);
    float _1087 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1063);
    float _1089 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1069);
    float _1091 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1095 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = 1.0 / _1085;
    float _1099 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1089);
    float _1101 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1105 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1109 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1101);
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1093);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1117 = _1103;
    float _1119 = _1101;
    if (_1061)
    {
        _1117 = 1.0;
    }
    float _1121 = _1117;
    float _1123 = _1121;
    if (_1061)
    {
        _1119 = 1.0;
    }
    float _1125 = _1119;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1129 = _1097 * _1127;
    float _1131 = _1125;
    if (!_1061)
    {
        float _1133 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1135 = _1133 * 0.15915493667125701904296875;
        float _1137 = _1135 * 6.283185482025146484375;
        float _1139 = cos(_1137);
        float _1141 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1143 = _1141 * 0.15915493667125701904296875;
        float _1145 = _1135 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1139;
        float _1151 = _1143 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = _1147 * _1149;
        float _1157 = _1143 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1153 * _1155;
        float _1163 = 1.0 / _1161;
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1165;
        float _1169 = 1.0 / _1167;
        float _1171 = _1159 * _1163;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1175 = fma(_1129, _1171, _1173);
        float _1177 = _1175 * _1169;
        float _1179 = precise::clamp(_1177, 0.0, 1.0);
        _1123 = _1179;
    }
    float _1181 = _1123;
    if (!_1061)
    {
        float _1183 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1185 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = 1.0 / _1189;
        float _1201 = _1193 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1197 * _1199;
        float _1207 = _1193 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = 1.0 / _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1217 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1215;
        float _1219 = 1.0 / _1217;
        float _1221 = _1209 * _1213;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1225 = fma(_1129, _1221, _1223);
        float _1227 = _1225 * _1219;
        float _1229 = precise::clamp(_1227, 0.0, 1.0);
        float _1231 = -_1229;
        float _1233 = _1231 + 1.0;
        _1131 = _1233;
    }
    float _1235 = _1131;
    float _1237 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1109);
    float _1241 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1113);
    float _1243 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1115);
    bool _1245 = _1181 > 0.0;
    bool _1247 = isnan(_1181);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan(0.0);
    bool _1253 = _1249 || _1251;
    float _1255 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1111);
    float _1257 = _1181 * _1235;
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1239);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1243);
    float _1263 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1241);
    bool _1265 = _1235 <= 0.0;
    bool _1267 = !_1253;
    bool _1269 = _1265 || _1267;
    float _1271 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1255);
    float _1273 = _1259 + _1261;
    float _1275 = _1263 + _1261;
    float _1277 = _1261 * 0.5;
    float _1279 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1281 = _1273 * 0.5;
    float _1283 = _1275 * 0.5;
    float _1285 = fma(_1271, -0.5, _1277);
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1259;
    out.gl_Position.y = _1271;
    out.gl_Position.z = _1263;
    out.gl_Position.w = _1261;
    out.m_52.x = _1281;
    out.m_52.y = _1285;
    out.m_52.z = _1283;
    out.m_52.w = _1261;
    out.m_35.x = _1287;
    if (!_1269)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1289 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1289;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _969 = false;
    bool _299 = false;
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
        float _1346 = as_type<float>(_87);
        out.gl_Position.z = _1346;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_71);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    if (_117)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _81;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1414 = as_type<float>(_123);
        out.gl_Position.z = _1414;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    float _131 = in.m_32.x;
    float _133 = in.m_32.y;
    float _135 = in.m_32.z;
    float _137 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _139 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _143 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _145 = _137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _147 = _139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _149 = _141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _151 = as_type<int>(_125) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_125) & 2;
    bool _157 = _155 != 0;
    float _159 = in.m_37.x;
    float _161 = in.m_37.y;
    float _163 = in.m_37.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    bool _175 = !_153;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_157;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = 0.0;
    float _185 = _127;
    if (!_173)
    {
        float _187 = _127 * _127;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_173)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    bool _199 = !_173;
    float _201 = _197;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _127 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _127);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_173;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _127 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _185 = _255;
    }
    float _257 = _185;
    out.m_44.x = _145;
    out.m_44.y = _147;
    out.m_44.z = _149;
    out.m_44.w = _143;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _159, _261);
    float _269 = fma(_257, _161, _263);
    float _271 = fma(_257, _163, _265);
    float _273 = fma(_267, _129, _131);
    float _275 = fma(_269, _129, _133);
    float _277 = fma(_271, _129, _135);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_46.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_71);
        float _303 = 1.0 / _301;
        float _305 = _105 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _329 = 1.0 / _315;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _337 = _335 != 0;
    float _339 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _341 = 1.0 / _319;
    float _343 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _345 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _339);
    float _347 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _345);
    float _349 = 1.0 / _327;
    float _351 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _353 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _343);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _357 = _307 + _355;
    bool _359 = _311 > 0.5;
    float _361 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _351);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _365 = _307 + _363;
    float _367 = _357 * _329;
    float _369 = 1.0 / _323;
    float _371 = _365 * _341;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _375 = _307 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _379 = _307 + _377;
    bool _381 = _309 > 0.5;
    float _383 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _385 = _375 * _349;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _395;
    float _399 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _361);
    float _401 = fma(_389, _367, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _403 = fma(_393, _367, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _405 = fma(_397, _367, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _407 = _379 * _369;
    bool _409 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _411 = isnan(_307);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _425 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _427 = isnan(_307);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _441 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _443 = isnan(_307);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_419;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = fma(_439, _371, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _467 = _435 * _455;
    bool _469 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _471 = isnan(_307);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = fma(_423, _371, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _483 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _485 = isnan(_307);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_459, _371, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _497 = _451 * _463;
    float _499 = -_451;
    float _501 = _499 + 1.0;
    float _503 = -_493;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _507;
    float _511 = _493 * _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _517;
    float _521 = _479 * _505;
    float _523 = fma(_509, _407, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _525 = fma(_515, _407, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _527 = fma(_519, _407, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _529 = _401 * _521;
    float _531 = _403 * _521;
    float _533 = _405 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _539 = -_479;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _547 = _347 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = fma(_537, _385, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _551 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].x, _529);
    float _553 = fma(_545, _385, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].y, _531);
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[123].z, _533);
    float _563 = fma(_481, _511, _551);
    float _565 = _383 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _569 = _547 + _567;
    float _571 = fma(_557, _385, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _573 = fma(_465, _511, _559);
    float _575 = fma(_495, _511, _561);
    float _577 = _399 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _565 + _579;
    float _583 = _569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _585 = fma(_527, _497, _563);
    float _587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _589 = _577 + _587;
    float _591 = fma(_523, _497, _573);
    float _593 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _595 = fma(_525, _497, _575);
    float _597 = _569 * _569;
    float _599 = -_177;
    int _601 = _381 ? as_type<int>(_599) : as_type<int>(_177);
    float _603 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _605 = -_181;
    int _607 = _359 ? as_type<int>(_605) : as_type<int>(_181);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _611 = fma(_549, _467, _585);
    float _613 = fma(_571, _467, _591);
    bool _615 = _603 >= 0.0;
    float _617 = fma(_553, _467, _595);
    float _619 = fma(_581, _581, _597);
    bool _621 = !_333;
    float _623 = _621 ? _177 : as_type<float>(_601);
    float _625 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].x, _611);
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _629 = !_337;
    float _631 = _629 ? _181 : as_type<float>(_607);
    float _633 = fma(_589, _589, _619);
    float _635 = _623 + 0.5;
    float _637 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].y, _613);
    float _639 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[127].z, _617);
    float _641 = -_631;
    float _643 = _641 + 0.5;
    float _645 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _647 = rsqrt(_633);
    float _649 = _597;
    float _651 = _547;
    if (_615)
    {
        _649 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _653 = _649;
    float _655 = _643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _657 = _625 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _659 = _637 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _639 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _663 = _645 * _609;
    float _665 = _655 * _627;
    int _667 = as_type<int>(_653);
    if (_615)
    {
        float _669 = _653 * 5.0;
        _667 = as_type<int>(_669);
    }
    int _671 = _667;
    float _673 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _663;
    out.m_48.y = _665;
    float _679 = _569 * _647;
    if (_615)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_671);
        out.gl_Position.z = _2357;
    }
    float _681 = _581 * _647;
    out.m_50.x = _673;
    out.m_50.y = _675;
    out.m_50.z = _677;
    if (_615)
    {
        out.m_35.x = 0.0;
    }
    if (_615)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _683 = -_679;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _687 = _589 * _647;
    float _689 = -_681;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _693 = -_679;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = _685 + _697;
    float _701 = -_687;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _707 = _691 + _705;
    float _709 = -_681;
    float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _713 = _699 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _717 = _703 + _715;
    float _719 = _695 * _695;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[28].x, _713);
    float _723 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[28].z, _721);
    bool _725 = _723 >= 0.0;
    float _727 = _717;
    if (_725)
    {
        _727 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _729 = _727;
    int _731 = as_type<int>(_729);
    if (_725)
    {
        out.m_35.x = 0.0;
    }
    if (_725)
    {
        float _733 = _729 * 5.0;
        _731 = as_type<int>(_733);
    }
    int _735 = _731;
    if (_725)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2478 = as_type<float>(_735);
        out.gl_Position.z = _2478;
    }
    if (_725)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _737 = in.m_42.x;
    float _739 = in.m_42.y;
    float _741 = -_687;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _745 = fma(_711, _711, _719);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _751 = fma(_743, _743, _745);
    float _753 = sqrt(_751);
    float _755 = _739 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _757 = _647 * _753;
    float _759 = _737 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _763 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _765 = _757 * _761;
    float _767 = _757 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _757 * _763;
    float _773 = _747 * _765;
    float _775 = _749 * _771;
    float _777 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _781 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _783 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[26].x, _779);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _791 = _787 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _793 = _565 + _789;
    float _795 = _577 + _791;
    float _797 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _799 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _801 = _793 + _799;
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _805 = _795 + _803;
    float _807 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[25].x, _797);
    float _809 = _801 * _801;
    float _811 = _805 * _805;
    float _813 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    float _815 = _809 + _811;
    float _817 = _813 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _819 = sqrt(_815);
    float _821 = _547 + _817;
    bool _823 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _825 = _813;
    float _827 = _797;
    float _829 = _817;
    float _831 = _773;
    if (!_823)
    {
        _651 = _811;
    }
    float _833 = _651;
    float _835 = _833;
    if (!_823)
    {
        _825 = _809;
    }
    float _837 = _825;
    float _839 = _837;
    if (!_823)
    {
        _827 = _793;
    }
    float _841 = _827;
    float _843 = _841;
    if (!_823)
    {
        _829 = _795;
    }
    float _845 = _829;
    float _847 = _845;
    if (!_823)
    {
        _831 = _821;
    }
    float _849 = _831;
    bool _851 = !_823;
    float _853 = _849;
    if (!_851)
    {
        float _855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _859 = _819 + _857;
        float _861 = _821 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = rsqrt(_815);
        float _865 = _859 * _855;
        float _867 = _865 * 0.15915493667125701904296875;
        float _869 = _867 * 6.283185482025146484375;
        float _871 = sin(_869);
        float _873 = _867 * 6.283185482025146484375;
        float _875 = cos(_873);
        float _877 = fma(_871, _861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _879 = _863 * _877;
        float _881 = _875 + (-1.0);
        float _883 = fma(_801, _879, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _885 = fma(_805, _879, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _887 = _881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _891 = _883 + _889;
        float _893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _895 = _885 + _893;
        float _897 = fma(_821, _875, _887);
        float _899 = _891 * _891;
        float _901 = _895 * _895;
        _853 = _897;
        _839 = _899;
        _835 = _901;
        _843 = _883;
        _847 = _885;
    }
    float _903 = _853;
    float _905 = _839;
    float _907 = _835;
    float _909 = _843;
    float _911 = _847;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _915 = _903 + _913;
    float _917 = fma(_915, _915, _905);
    float _919 = _917 + _907;
    float _921 = sqrt(_919);
    bool _923 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _925 = isnan(_921);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _931 = _927 || _929;
    float _933 = _905;
    if (!_931)
    {
        _933 = 1.0;
    }
    float _935 = _933;
    bool _937 = !_931;
    float _939 = _935;
    if (!_937)
    {
        bool _941 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _943 = isnan(_921);
        bool _945 = _941 || _943;
        bool _947 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _949 = _945 || _947;
        if (!_949)
        {
            float _951 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _953 = _921 + _951;
            float _955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _957 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _955;
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _961 = _959 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _963 = 1.0 / _957;
            float _965 = _953 * _963;
            float _967 = fma(_965, _961, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _939 = _967;
            _969 = true;
        }
        else
        {
            bool _971 = _921 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _973 = isnan(_921);
            bool _975 = _971 || _973;
            bool _977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _979 = _975 || _977;
            if (!_979)
            {
                float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _983 = _921 + _981;
                float _985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _991 = _989 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _993 = 1.0 / _987;
                float _995 = _983 * _993;
                float _997 = fma(_995, _991, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _939 = _997;
                _969 = true;
            }
            else
            {
                _939 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _969 = false;
    float _999 = _939;
    float _1001 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1003 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1007 = _909 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1011 = _911 + _1009;
    float _1013 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1001);
    float _1015 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1003);
    float _1017 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1019 = _903 + _1017;
    float _1021 = fma(_1007, _999, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1023 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1013);
    float _1025 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1015);
    float _1027 = fma(_1019, _999, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1029 = fma(_1011, _999, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1035 = -_679;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1039 = 1.0 / _1031;
    float _1041 = _1033 + _1031;
    float _1043 = -_681;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1049 = -_687;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1029);
    bool _1053 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.5);
    bool _1061 = _1057 || _1059;
    float _1063 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1047);
    float _1067 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1069 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1071 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1073 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1067);
    float _1075 = _1041 * _1039;
    float _1077 = _1075 * 0.5;
    float _1079 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1085 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1083);
    float _1087 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1063);
    float _1089 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1069);
    float _1091 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1095 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = 1.0 / _1085;
    float _1099 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1089);
    float _1101 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1105 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1109 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1101);
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1093);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1117 = _1103;
    float _1119 = _1101;
    if (_1061)
    {
        _1117 = 1.0;
    }
    float _1121 = _1117;
    float _1123 = _1121;
    if (_1061)
    {
        _1119 = 1.0;
    }
    float _1125 = _1119;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1129 = _1097 * _1127;
    float _1131 = _1125;
    if (!_1061)
    {
        float _1133 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1135 = _1133 * 0.15915493667125701904296875;
        float _1137 = _1135 * 6.283185482025146484375;
        float _1139 = cos(_1137);
        float _1141 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1143 = _1141 * 0.15915493667125701904296875;
        float _1145 = _1135 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1139;
        float _1151 = _1143 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = _1147 * _1149;
        float _1157 = _1143 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1153 * _1155;
        float _1163 = 1.0 / _1161;
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1165;
        float _1169 = 1.0 / _1167;
        float _1171 = _1159 * _1163;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1175 = fma(_1129, _1171, _1173);
        float _1177 = _1175 * _1169;
        float _1179 = precise::clamp(_1177, 0.0, 1.0);
        _1123 = _1179;
    }
    float _1181 = _1123;
    if (!_1061)
    {
        float _1183 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1185 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = 1.0 / _1189;
        float _1201 = _1193 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1197 * _1199;
        float _1207 = _1193 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = 1.0 / _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1217 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1215;
        float _1219 = 1.0 / _1217;
        float _1221 = _1209 * _1213;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1225 = fma(_1129, _1221, _1223);
        float _1227 = _1225 * _1219;
        float _1229 = precise::clamp(_1227, 0.0, 1.0);
        float _1231 = -_1229;
        float _1233 = _1231 + 1.0;
        _1131 = _1233;
    }
    float _1235 = _1131;
    float _1237 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1109);
    float _1241 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1113);
    float _1243 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1115);
    bool _1245 = _1181 > 0.0;
    bool _1247 = isnan(_1181);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan(0.0);
    bool _1253 = _1249 || _1251;
    float _1255 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1111);
    float _1257 = _1181 * _1235;
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1239);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1243);
    float _1263 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1241);
    bool _1265 = _1235 <= 0.0;
    bool _1267 = !_1253;
    bool _1269 = _1265 || _1267;
    float _1271 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1255);
    float _1273 = _1259 + _1261;
    float _1275 = _1263 + _1261;
    float _1277 = _1261 * 0.5;
    float _1279 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1281 = _1273 * 0.5;
    float _1283 = _1275 * 0.5;
    float _1285 = fma(_1271, -0.5, _1277);
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1259;
    out.gl_Position.y = _1271;
    out.gl_Position.z = _1263;
    out.gl_Position.w = _1261;
    out.m_52.x = _1281;
    out.m_52.y = _1285;
    out.m_52.z = _1283;
    out.m_52.w = _1261;
    out.m_35.x = _1287;
    if (!_1269)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1289 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1289;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

