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
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _787 = false;
    bool _285 = false;
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
        float _1166 = as_type<float>(_87);
        out.gl_Position.z = _1166;
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
        float _1235 = as_type<float>(_123);
        out.gl_Position.z = _1235;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _155 = _241;
    }
    float _243 = _155;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _301 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _303 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _305 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _299);
    float _307 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _301);
    float _309 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _303);
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _313 = _311 != 0;
    float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _307);
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _321 = _319 != 0;
    float _323 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _309);
    float _325 = _323 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _333 = _325 + _331;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _339 = _295 > 0.5;
    float _341 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _305);
    bool _343 = _297 > 0.5;
    float _345 = _317 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _347 = -_179;
    int _349 = _339 ? as_type<int>(_347) : as_type<int>(_179);
    float _351 = _341 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _353 = -_183;
    int _355 = _343 ? as_type<int>(_353) : as_type<int>(_183);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _359 = !_313;
    float _361 = _359 ? _179 : as_type<float>(_349);
    float _363 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _365 = _351 + _363;
    bool _367 = !_321;
    float _369 = _367 ? _183 : as_type<float>(_355);
    float _371 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _373 = _345 + _371;
    float _375 = _365 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _377 = _361 + 0.5;
    float _379 = -_369;
    float _381 = _379 + 0.5;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[28].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _387 = _365 * _365;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _391 = fma(_333, (*spvDescriptorSet0.vp_c8)._m0[28].z, _383);
    float _393 = _385 * _315;
    float _395 = fma(_373, _373, _387);
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _401 = _391 >= 0.0;
    float _403 = fma(_333, _333, _395);
    float _405 = _389 * _327;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _409 = _329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = rsqrt(_403);
    float _417 = _337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _409;
    out.m_46.y = _411;
    out.m_46.z = _413;
    out.m_46.w = _407;
    float _423 = _387;
    if (_401)
    {
        _423 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _425 = _423;
    out.m_48.x = _417;
    out.m_48.y = _419;
    out.m_48.z = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _427;
    int _431 = as_type<int>(_425);
    if (_401)
    {
        float _433 = _425 * 5.0;
        _431 = as_type<int>(_433);
    }
    int _435 = _431;
    out.m_50.x = _393;
    out.m_50.y = _405;
    float _437 = _365 * _415;
    float _439 = _373 * _415;
    if (_401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1786 = as_type<float>(_435);
        out.gl_Position.z = _1786;
    }
    if (_401)
    {
        out.m_35.x = 0.0;
    }
    if (_401)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _441 = -_437;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _351);
    float _445 = 1.0 / _429;
    float _447 = _333 * _415;
    float _449 = -_439;
    float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _455 = _443 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _293 + _457;
    float _461 = -_447;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _465 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _467 = _451 + _465;
    float _469 = _455 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _471 = -_437;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _365);
    float _475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _477 = _463 + _475;
    float _479 = -_439;
    float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _483 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[28].x, _469);
    float _485 = _473 * _473;
    float _487 = -_447;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _333);
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[28].z, _483);
    float _493 = _459 * _445;
    bool _495 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _497 = isnan(_293);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = fma(_481, _481, _485);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _509;
    bool _513 = _491 >= 0.0;
    float _515 = -_505;
    float _517 = _515 + 1.0;
    bool _519 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_293);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _531;
    float _535 = in.m_42.x;
    float _537 = in.m_42.y;
    float _539 = fma(_489, _489, _507);
    float _541 = fma(_511, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _543 = _529 * _517;
    float _545 = fma(_533, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _547 = -_529;
    float _549 = _547 + 1.0;
    float _551 = _541 * _543;
    float _553 = _545 * _543;
    float _555 = sqrt(_539);
    float _557 = _553;
    if (_513)
    {
        out.m_35.x = 0.0;
    }
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].y, _551);
    int _563 = as_type<int>(_561);
    if (_513)
    {
        _557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _565 = _557;
    float _567 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[144].x, _559);
    float _569 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[144].y, _561);
    if (_513)
    {
        float _571 = _565 * 5.0;
        _563 = as_type<int>(_571);
    }
    int _573 = _563;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_573);
        out.gl_Position.z = _2025;
    }
    float _575 = _567 * _535;
    float _577 = _569 * _537;
    float _579 = _415 * _555;
    if (_513)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _581 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _589 = _579 * _581;
    float _591 = _579 * _583;
    float _593 = _579 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _595 = _593 * 0.5;
    float _597 = _585 * _589;
    float _599 = _587 * _591;
    float _601 = _597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _603 = _597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[24].x, _601);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _615 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    float _617 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _619 = _613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _625 = _345 + _619;
    float _627 = _325 + _621;
    float _629 = _351 + _623;
    float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _633 = _625 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _637 = _627 + _635;
    float _639 = _633 * _633;
    float _641 = _637 * _637;
    float _643 = _639 + _641;
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _599;
    float _651 = _623;
    float _653 = _595;
    float _655 = _641;
    float _657 = _625;
    if (!_647)
    {
        _649 = _639;
    }
    float _659 = _649;
    float _661 = _659;
    if (!_647)
    {
        _651 = _627;
    }
    float _663 = _651;
    float _665 = _663;
    if (!_647)
    {
        _653 = _629;
    }
    float _667 = _653;
    bool _669 = !_647;
    float _671 = _667;
    if (!_669)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _677 = _645 + _675;
        float _679 = _629 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _681 = rsqrt(_643);
        float _683 = _677 * _673;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _685 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = fma(_689, _679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _697 = _681 * _695;
        float _699 = _693 + (-1.0);
        float _701 = fma(_633, _697, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _703 = fma(_637, _697, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _705 = _699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _709 = _701 + _707;
        float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _713 = _703 + _711;
        float _715 = fma(_629, _693, _705);
        float _717 = _709 * _709;
        float _719 = _713 * _713;
        _671 = _715;
        _661 = _717;
        _655 = _719;
        _657 = _701;
        _665 = _703;
    }
    float _721 = _671;
    float _723 = _661;
    float _725 = _655;
    float _727 = _657;
    float _729 = _665;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _733 = _721 + _731;
    float _735 = fma(_733, _733, _723);
    float _737 = _735 + _725;
    float _739 = sqrt(_737);
    bool _741 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _743 = isnan(_739);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _749 = _745 || _747;
    float _751 = _723;
    if (!_749)
    {
        _751 = 1.0;
    }
    float _753 = _751;
    bool _755 = !_749;
    float _757 = _753;
    if (!_755)
    {
        bool _759 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _761 = isnan(_739);
        bool _763 = _759 || _761;
        bool _765 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _767 = _763 || _765;
        if (!_767)
        {
            float _769 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _771 = _739 + _769;
            float _773 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _775 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _773;
            float _777 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _779 = _777 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _781 = 1.0 / _775;
            float _783 = _771 * _781;
            float _785 = fma(_783, _779, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _757 = _785;
            _787 = true;
        }
        else
        {
            bool _789 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _791 = isnan(_739);
            bool _793 = _789 || _791;
            bool _795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _797 = _793 || _795;
            if (!_797)
            {
                float _799 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _801 = _739 + _799;
                float _803 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _805 = _803 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _807 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _809 = _807 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _811 = 1.0 / _805;
                float _813 = _801 * _811;
                float _815 = fma(_813, _809, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _757 = _815;
                _787 = true;
            }
            else
            {
                _757 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _787 = false;
    float _817 = _757;
    float _819 = _443 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _821 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _823 = _727 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _827 = _729 + _825;
    float _829 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _819);
    bool _831 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.5);
    bool _839 = _835 || _837;
    float _841 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _843 = _721 + _841;
    float _845 = _443 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _847 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].z, _829);
    float _849 = fma(_823, _817, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _851 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _845);
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _855 = -_439;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _859 = fma(_843, _817, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _861 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].z, _851);
    float _863 = 1.0 / _853;
    float _865 = fma(_827, _817, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _867 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _869 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.5);
    bool _875 = _871 || _873;
    float _877 = _861 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _879 = -_437;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _883 = -_447;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _887 = _877 + _853;
    float _889 = _877;
    float _891 = _881;
    float _893 = _885;
    if (_839)
    {
        _889 = _857;
    }
    float _895 = _889;
    float _897 = _895;
    if (!_839)
    {
        float _899 = _455 * _455;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _903 = -_325;
        float _905 = _903 + _865;
        float _907 = -_345;
        float _909 = _907 + _849;
        float _911 = fma(_467, _467, _899);
        float _913 = -_351;
        float _915 = _913 + _859;
        float _917 = fma(_477, _477, _911);
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _921 = sqrt(_917);
        float _923 = 1.0 / _579;
        float _925 = _919 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _927 = precise::min(_921, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _929 = _927 * _901;
        float _931 = _929 * _923;
        float _933 = _925 * _931;
        float _935 = _905 * _931;
        float _937 = fma(_915, _933, _443);
        float _939 = fma(_909, _933, _451);
        float _941 = fma(_925, _935, _463);
        _891 = _937;
        _897 = _939;
        _893 = _941;
    }
    float _943 = _891;
    float _945 = _897;
    float _947 = _893;
    float _949 = _887 * _863;
    float _951 = _949 * 0.5;
    float _953 = _943 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _955 = _943 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _957 = _943 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _959 = _943 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _961 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[1].x, _953);
    float _963 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[0].x, _955);
    float _965 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[2].x, _957);
    float _967 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[3].x, _959);
    float _969 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _971 = _961;
    if (_875)
    {
        _971 = 1.0;
    }
    float _973 = _971;
    float _975 = _973;
    if (!_875)
    {
        float _977 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _981 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[30].w, _979);
        float _983 = _977 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _983 * 6.283185482025146484375;
        float _995 = sin(_993);
        float _997 = 1.0 / _987;
        float _999 = _991 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _995 * _997;
        float _1005 = 1.0 / _981;
        float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1009 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1007;
        float _1011 = _1001 * _1003;
        float _1013 = _991 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        float _1017 = 1.0 / _1011;
        float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1021 = _1005 * _1019;
        float _1023 = 1.0 / _1009;
        float _1025 = _1015 * _1017;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1029 = fma(_1025, _1021, _1027);
        float _1031 = _1029 * _1023;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        _975 = _1033;
    }
    float _1035 = _975;
    float _1037 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _1039 = _969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1041 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _965);
    float _1043 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _1045 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1051 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1053 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1055 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1047);
    float _1059 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1049);
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1051);
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1053);
    float _1065 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1057);
    float _1069 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1059);
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1061);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1063);
    bool _1075 = _1035 > 0.0;
    bool _1077 = isnan(_1035);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1067);
    float _1089 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1069);
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1073);
    float _1093 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1071);
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1097 = _1087 + _1091;
    float _1099 = _1093 + _1091;
    float _1101 = _1091 * 0.5;
    float _1103 = _1097 * 0.5;
    float _1105 = _1099 * 0.5;
    float _1107 = fma(_1089, -0.5, _1101);
    out.m_35.x = _1095;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1089;
    out.gl_Position.z = _1093;
    out.gl_Position.w = _1091;
    out.m_52.x = _1103;
    out.m_52.y = _1107;
    out.m_52.z = _1105;
    out.m_52.w = _1091;
    if (_1083)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1109 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1109;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _787 = false;
    bool _285 = false;
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
        float _1166 = as_type<float>(_87);
        out.gl_Position.z = _1166;
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
        float _1235 = as_type<float>(_123);
        out.gl_Position.z = _1235;
    }
    if (_115)
    {
        return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _155 = _241;
    }
    float _243 = _155;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _301 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _303 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _305 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _299);
    float _307 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _301);
    float _309 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _303);
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _313 = _311 != 0;
    float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _307);
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _321 = _319 != 0;
    float _323 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _309);
    float _325 = _323 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _333 = _325 + _331;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _339 = _295 > 0.5;
    float _341 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _305);
    bool _343 = _297 > 0.5;
    float _345 = _317 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _347 = -_179;
    int _349 = _339 ? as_type<int>(_347) : as_type<int>(_179);
    float _351 = _341 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _353 = -_183;
    int _355 = _343 ? as_type<int>(_353) : as_type<int>(_183);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _359 = !_313;
    float _361 = _359 ? _179 : as_type<float>(_349);
    float _363 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _365 = _351 + _363;
    bool _367 = !_321;
    float _369 = _367 ? _183 : as_type<float>(_355);
    float _371 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _373 = _345 + _371;
    float _375 = _365 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _377 = _361 + 0.5;
    float _379 = -_369;
    float _381 = _379 + 0.5;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[28].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _387 = _365 * _365;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _391 = fma(_333, (*spvDescriptorSet0.vp_c8)._m0[28].z, _383);
    float _393 = _385 * _315;
    float _395 = fma(_373, _373, _387);
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _401 = _391 >= 0.0;
    float _403 = fma(_333, _333, _395);
    float _405 = _389 * _327;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _409 = _329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = rsqrt(_403);
    float _417 = _337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _409;
    out.m_46.y = _411;
    out.m_46.z = _413;
    out.m_46.w = _407;
    float _423 = _387;
    if (_401)
    {
        _423 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _425 = _423;
    out.m_48.x = _417;
    out.m_48.y = _419;
    out.m_48.z = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _427;
    int _431 = as_type<int>(_425);
    if (_401)
    {
        float _433 = _425 * 5.0;
        _431 = as_type<int>(_433);
    }
    int _435 = _431;
    out.m_50.x = _393;
    out.m_50.y = _405;
    float _437 = _365 * _415;
    float _439 = _373 * _415;
    if (_401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1786 = as_type<float>(_435);
        out.gl_Position.z = _1786;
    }
    if (_401)
    {
        out.m_35.x = 0.0;
    }
    if (_401)
    {
        return out;
    }
    float _441 = -_437;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _351);
    float _445 = 1.0 / _429;
    float _447 = _333 * _415;
    float _449 = -_439;
    float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _455 = _443 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _293 + _457;
    float _461 = -_447;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _465 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _467 = _451 + _465;
    float _469 = _455 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _471 = -_437;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _365);
    float _475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _477 = _463 + _475;
    float _479 = -_439;
    float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _483 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[28].x, _469);
    float _485 = _473 * _473;
    float _487 = -_447;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _333);
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[28].z, _483);
    float _493 = _459 * _445;
    bool _495 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _497 = isnan(_293);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = fma(_481, _481, _485);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _509;
    bool _513 = _491 >= 0.0;
    float _515 = -_505;
    float _517 = _515 + 1.0;
    bool _519 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_293);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _531;
    float _535 = in.m_42.x;
    float _537 = in.m_42.y;
    float _539 = fma(_489, _489, _507);
    float _541 = fma(_511, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _543 = _529 * _517;
    float _545 = fma(_533, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _547 = -_529;
    float _549 = _547 + 1.0;
    float _551 = _541 * _543;
    float _553 = _545 * _543;
    float _555 = sqrt(_539);
    float _557 = _553;
    if (_513)
    {
        out.m_35.x = 0.0;
    }
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].y, _551);
    int _563 = as_type<int>(_561);
    if (_513)
    {
        _557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _565 = _557;
    float _567 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[144].x, _559);
    float _569 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[144].y, _561);
    if (_513)
    {
        float _571 = _565 * 5.0;
        _563 = as_type<int>(_571);
    }
    int _573 = _563;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_573);
        out.gl_Position.z = _2025;
    }
    float _575 = _567 * _535;
    float _577 = _569 * _537;
    float _579 = _415 * _555;
    if (_513)
    {
        return out;
    }
    float _581 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _589 = _579 * _581;
    float _591 = _579 * _583;
    float _593 = _579 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _595 = _593 * 0.5;
    float _597 = _585 * _589;
    float _599 = _587 * _591;
    float _601 = _597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _603 = _597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[24].x, _601);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _615 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    float _617 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _619 = _613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _625 = _345 + _619;
    float _627 = _325 + _621;
    float _629 = _351 + _623;
    float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _633 = _625 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _637 = _627 + _635;
    float _639 = _633 * _633;
    float _641 = _637 * _637;
    float _643 = _639 + _641;
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _599;
    float _651 = _623;
    float _653 = _595;
    float _655 = _641;
    float _657 = _625;
    if (!_647)
    {
        _649 = _639;
    }
    float _659 = _649;
    float _661 = _659;
    if (!_647)
    {
        _651 = _627;
    }
    float _663 = _651;
    float _665 = _663;
    if (!_647)
    {
        _653 = _629;
    }
    float _667 = _653;
    bool _669 = !_647;
    float _671 = _667;
    if (!_669)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _677 = _645 + _675;
        float _679 = _629 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _681 = rsqrt(_643);
        float _683 = _677 * _673;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _685 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = fma(_689, _679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _697 = _681 * _695;
        float _699 = _693 + (-1.0);
        float _701 = fma(_633, _697, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _703 = fma(_637, _697, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _705 = _699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _709 = _701 + _707;
        float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _713 = _703 + _711;
        float _715 = fma(_629, _693, _705);
        float _717 = _709 * _709;
        float _719 = _713 * _713;
        _671 = _715;
        _661 = _717;
        _655 = _719;
        _657 = _701;
        _665 = _703;
    }
    float _721 = _671;
    float _723 = _661;
    float _725 = _655;
    float _727 = _657;
    float _729 = _665;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _733 = _721 + _731;
    float _735 = fma(_733, _733, _723);
    float _737 = _735 + _725;
    float _739 = sqrt(_737);
    bool _741 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _743 = isnan(_739);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _749 = _745 || _747;
    float _751 = _723;
    if (!_749)
    {
        _751 = 1.0;
    }
    float _753 = _751;
    bool _755 = !_749;
    float _757 = _753;
    if (!_755)
    {
        bool _759 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _761 = isnan(_739);
        bool _763 = _759 || _761;
        bool _765 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _767 = _763 || _765;
        if (!_767)
        {
            float _769 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _771 = _739 + _769;
            float _773 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _775 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _773;
            float _777 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _779 = _777 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _781 = 1.0 / _775;
            float _783 = _771 * _781;
            float _785 = fma(_783, _779, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _757 = _785;
            _787 = true;
        }
        else
        {
            bool _789 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _791 = isnan(_739);
            bool _793 = _789 || _791;
            bool _795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _797 = _793 || _795;
            if (!_797)
            {
                float _799 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _801 = _739 + _799;
                float _803 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _805 = _803 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _807 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _809 = _807 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _811 = 1.0 / _805;
                float _813 = _801 * _811;
                float _815 = fma(_813, _809, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _757 = _815;
                _787 = true;
            }
            else
            {
                _757 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _787 = false;
    float _817 = _757;
    float _819 = _443 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _821 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _823 = _727 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _827 = _729 + _825;
    float _829 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _819);
    bool _831 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.5);
    bool _839 = _835 || _837;
    float _841 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _843 = _721 + _841;
    float _845 = _443 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _847 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].z, _829);
    float _849 = fma(_823, _817, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _851 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _845);
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _855 = -_439;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _859 = fma(_843, _817, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _861 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].z, _851);
    float _863 = 1.0 / _853;
    float _865 = fma(_827, _817, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _867 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _869 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.5);
    bool _875 = _871 || _873;
    float _877 = _861 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _879 = -_437;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _883 = -_447;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _887 = _877 + _853;
    float _889 = _877;
    float _891 = _881;
    float _893 = _885;
    if (_839)
    {
        _889 = _857;
    }
    float _895 = _889;
    float _897 = _895;
    if (!_839)
    {
        float _899 = _455 * _455;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _903 = -_325;
        float _905 = _903 + _865;
        float _907 = -_345;
        float _909 = _907 + _849;
        float _911 = fma(_467, _467, _899);
        float _913 = -_351;
        float _915 = _913 + _859;
        float _917 = fma(_477, _477, _911);
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _921 = sqrt(_917);
        float _923 = 1.0 / _579;
        float _925 = _919 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _927 = precise::min(_921, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _929 = _927 * _901;
        float _931 = _929 * _923;
        float _933 = _925 * _931;
        float _935 = _905 * _931;
        float _937 = fma(_915, _933, _443);
        float _939 = fma(_909, _933, _451);
        float _941 = fma(_925, _935, _463);
        _891 = _937;
        _897 = _939;
        _893 = _941;
    }
    float _943 = _891;
    float _945 = _897;
    float _947 = _893;
    float _949 = _887 * _863;
    float _951 = _949 * 0.5;
    float _953 = _943 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _955 = _943 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _957 = _943 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _959 = _943 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _961 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[1].x, _953);
    float _963 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[0].x, _955);
    float _965 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[2].x, _957);
    float _967 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[3].x, _959);
    float _969 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _971 = _961;
    if (_875)
    {
        _971 = 1.0;
    }
    float _973 = _971;
    float _975 = _973;
    if (!_875)
    {
        float _977 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _981 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[30].w, _979);
        float _983 = _977 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _983 * 6.283185482025146484375;
        float _995 = sin(_993);
        float _997 = 1.0 / _987;
        float _999 = _991 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _995 * _997;
        float _1005 = 1.0 / _981;
        float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1009 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1007;
        float _1011 = _1001 * _1003;
        float _1013 = _991 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        float _1017 = 1.0 / _1011;
        float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1021 = _1005 * _1019;
        float _1023 = 1.0 / _1009;
        float _1025 = _1015 * _1017;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1029 = fma(_1025, _1021, _1027);
        float _1031 = _1029 * _1023;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        _975 = _1033;
    }
    float _1035 = _975;
    float _1037 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _1039 = _969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1041 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _965);
    float _1043 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _1045 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1051 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1053 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1055 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1047);
    float _1059 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1049);
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1051);
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1053);
    float _1065 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1057);
    float _1069 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1059);
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1061);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1063);
    bool _1075 = _1035 > 0.0;
    bool _1077 = isnan(_1035);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1067);
    float _1089 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1069);
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1073);
    float _1093 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1071);
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1097 = _1087 + _1091;
    float _1099 = _1093 + _1091;
    float _1101 = _1091 * 0.5;
    float _1103 = _1097 * 0.5;
    float _1105 = _1099 * 0.5;
    float _1107 = fma(_1089, -0.5, _1101);
    out.m_35.x = _1095;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1089;
    out.gl_Position.z = _1093;
    out.gl_Position.w = _1091;
    out.m_52.x = _1103;
    out.m_52.y = _1107;
    out.m_52.z = _1105;
    out.m_52.w = _1091;
    if (_1083)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1109 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1109;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _787 = false;
    bool _285 = false;
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
        float _1166 = as_type<float>(_87);
        out.gl_Position.z = _1166;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1235 = as_type<float>(_123);
        out.gl_Position.z = _1235;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _155 = _241;
    }
    float _243 = _155;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _301 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _303 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _305 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _299);
    float _307 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _301);
    float _309 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _303);
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _313 = _311 != 0;
    float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _307);
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _321 = _319 != 0;
    float _323 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _309);
    float _325 = _323 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _333 = _325 + _331;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _339 = _295 > 0.5;
    float _341 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _305);
    bool _343 = _297 > 0.5;
    float _345 = _317 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _347 = -_179;
    int _349 = _339 ? as_type<int>(_347) : as_type<int>(_179);
    float _351 = _341 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _353 = -_183;
    int _355 = _343 ? as_type<int>(_353) : as_type<int>(_183);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _359 = !_313;
    float _361 = _359 ? _179 : as_type<float>(_349);
    float _363 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _365 = _351 + _363;
    bool _367 = !_321;
    float _369 = _367 ? _183 : as_type<float>(_355);
    float _371 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _373 = _345 + _371;
    float _375 = _365 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _377 = _361 + 0.5;
    float _379 = -_369;
    float _381 = _379 + 0.5;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[28].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _387 = _365 * _365;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _391 = fma(_333, (*spvDescriptorSet0.vp_c8)._m0[28].z, _383);
    float _393 = _385 * _315;
    float _395 = fma(_373, _373, _387);
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _401 = _391 >= 0.0;
    float _403 = fma(_333, _333, _395);
    float _405 = _389 * _327;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _409 = _329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = rsqrt(_403);
    float _417 = _337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _409;
    out.m_46.y = _411;
    out.m_46.z = _413;
    out.m_46.w = _407;
    float _423 = _387;
    if (_401)
    {
        _423 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _425 = _423;
    out.m_48.x = _417;
    out.m_48.y = _419;
    out.m_48.z = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _427;
    int _431 = as_type<int>(_425);
    if (_401)
    {
        float _433 = _425 * 5.0;
        _431 = as_type<int>(_433);
    }
    int _435 = _431;
    out.m_50.x = _393;
    out.m_50.y = _405;
    float _437 = _365 * _415;
    float _439 = _373 * _415;
    if (_401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1786 = as_type<float>(_435);
        out.gl_Position.z = _1786;
    }
    if (_401)
    {
        out.m_35.x = 0.0;
    }
    if (_401)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _441 = -_437;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _351);
    float _445 = 1.0 / _429;
    float _447 = _333 * _415;
    float _449 = -_439;
    float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _455 = _443 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _293 + _457;
    float _461 = -_447;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _465 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _467 = _451 + _465;
    float _469 = _455 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _471 = -_437;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _365);
    float _475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _477 = _463 + _475;
    float _479 = -_439;
    float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _483 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[28].x, _469);
    float _485 = _473 * _473;
    float _487 = -_447;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _333);
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[28].z, _483);
    float _493 = _459 * _445;
    bool _495 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _497 = isnan(_293);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = fma(_481, _481, _485);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _509;
    bool _513 = _491 >= 0.0;
    float _515 = -_505;
    float _517 = _515 + 1.0;
    bool _519 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_293);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _531;
    float _535 = in.m_42.x;
    float _537 = in.m_42.y;
    float _539 = fma(_489, _489, _507);
    float _541 = fma(_511, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _543 = _529 * _517;
    float _545 = fma(_533, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _547 = -_529;
    float _549 = _547 + 1.0;
    float _551 = _541 * _543;
    float _553 = _545 * _543;
    float _555 = sqrt(_539);
    float _557 = _553;
    if (_513)
    {
        out.m_35.x = 0.0;
    }
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].y, _551);
    int _563 = as_type<int>(_561);
    if (_513)
    {
        _557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _565 = _557;
    float _567 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[144].x, _559);
    float _569 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[144].y, _561);
    if (_513)
    {
        float _571 = _565 * 5.0;
        _563 = as_type<int>(_571);
    }
    int _573 = _563;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_573);
        out.gl_Position.z = _2025;
    }
    float _575 = _567 * _535;
    float _577 = _569 * _537;
    float _579 = _415 * _555;
    if (_513)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _581 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _589 = _579 * _581;
    float _591 = _579 * _583;
    float _593 = _579 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _595 = _593 * 0.5;
    float _597 = _585 * _589;
    float _599 = _587 * _591;
    float _601 = _597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _603 = _597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[24].x, _601);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _615 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    float _617 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _619 = _613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _625 = _345 + _619;
    float _627 = _325 + _621;
    float _629 = _351 + _623;
    float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _633 = _625 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _637 = _627 + _635;
    float _639 = _633 * _633;
    float _641 = _637 * _637;
    float _643 = _639 + _641;
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _599;
    float _651 = _623;
    float _653 = _595;
    float _655 = _641;
    float _657 = _625;
    if (!_647)
    {
        _649 = _639;
    }
    float _659 = _649;
    float _661 = _659;
    if (!_647)
    {
        _651 = _627;
    }
    float _663 = _651;
    float _665 = _663;
    if (!_647)
    {
        _653 = _629;
    }
    float _667 = _653;
    bool _669 = !_647;
    float _671 = _667;
    if (!_669)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _677 = _645 + _675;
        float _679 = _629 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _681 = rsqrt(_643);
        float _683 = _677 * _673;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _685 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = fma(_689, _679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _697 = _681 * _695;
        float _699 = _693 + (-1.0);
        float _701 = fma(_633, _697, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _703 = fma(_637, _697, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _705 = _699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _709 = _701 + _707;
        float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _713 = _703 + _711;
        float _715 = fma(_629, _693, _705);
        float _717 = _709 * _709;
        float _719 = _713 * _713;
        _671 = _715;
        _661 = _717;
        _655 = _719;
        _657 = _701;
        _665 = _703;
    }
    float _721 = _671;
    float _723 = _661;
    float _725 = _655;
    float _727 = _657;
    float _729 = _665;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _733 = _721 + _731;
    float _735 = fma(_733, _733, _723);
    float _737 = _735 + _725;
    float _739 = sqrt(_737);
    bool _741 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _743 = isnan(_739);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _749 = _745 || _747;
    float _751 = _723;
    if (!_749)
    {
        _751 = 1.0;
    }
    float _753 = _751;
    bool _755 = !_749;
    float _757 = _753;
    if (!_755)
    {
        bool _759 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _761 = isnan(_739);
        bool _763 = _759 || _761;
        bool _765 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _767 = _763 || _765;
        if (!_767)
        {
            float _769 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _771 = _739 + _769;
            float _773 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _775 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _773;
            float _777 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _779 = _777 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _781 = 1.0 / _775;
            float _783 = _771 * _781;
            float _785 = fma(_783, _779, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _757 = _785;
            _787 = true;
        }
        else
        {
            bool _789 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _791 = isnan(_739);
            bool _793 = _789 || _791;
            bool _795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _797 = _793 || _795;
            if (!_797)
            {
                float _799 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _801 = _739 + _799;
                float _803 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _805 = _803 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _807 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _809 = _807 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _811 = 1.0 / _805;
                float _813 = _801 * _811;
                float _815 = fma(_813, _809, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _757 = _815;
                _787 = true;
            }
            else
            {
                _757 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _787 = false;
    float _817 = _757;
    float _819 = _443 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _821 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _823 = _727 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _827 = _729 + _825;
    float _829 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _819);
    bool _831 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.5);
    bool _839 = _835 || _837;
    float _841 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _843 = _721 + _841;
    float _845 = _443 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _847 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].z, _829);
    float _849 = fma(_823, _817, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _851 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _845);
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _855 = -_439;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _859 = fma(_843, _817, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _861 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].z, _851);
    float _863 = 1.0 / _853;
    float _865 = fma(_827, _817, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _867 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _869 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.5);
    bool _875 = _871 || _873;
    float _877 = _861 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _879 = -_437;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _883 = -_447;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _887 = _877 + _853;
    float _889 = _877;
    float _891 = _881;
    float _893 = _885;
    if (_839)
    {
        _889 = _857;
    }
    float _895 = _889;
    float _897 = _895;
    if (!_839)
    {
        float _899 = _455 * _455;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _903 = -_325;
        float _905 = _903 + _865;
        float _907 = -_345;
        float _909 = _907 + _849;
        float _911 = fma(_467, _467, _899);
        float _913 = -_351;
        float _915 = _913 + _859;
        float _917 = fma(_477, _477, _911);
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _921 = sqrt(_917);
        float _923 = 1.0 / _579;
        float _925 = _919 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _927 = precise::min(_921, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _929 = _927 * _901;
        float _931 = _929 * _923;
        float _933 = _925 * _931;
        float _935 = _905 * _931;
        float _937 = fma(_915, _933, _443);
        float _939 = fma(_909, _933, _451);
        float _941 = fma(_925, _935, _463);
        _891 = _937;
        _897 = _939;
        _893 = _941;
    }
    float _943 = _891;
    float _945 = _897;
    float _947 = _893;
    float _949 = _887 * _863;
    float _951 = _949 * 0.5;
    float _953 = _943 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _955 = _943 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _957 = _943 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _959 = _943 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _961 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[1].x, _953);
    float _963 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[0].x, _955);
    float _965 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[2].x, _957);
    float _967 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[3].x, _959);
    float _969 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _971 = _961;
    if (_875)
    {
        _971 = 1.0;
    }
    float _973 = _971;
    float _975 = _973;
    if (!_875)
    {
        float _977 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _981 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[30].w, _979);
        float _983 = _977 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _983 * 6.283185482025146484375;
        float _995 = sin(_993);
        float _997 = 1.0 / _987;
        float _999 = _991 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _995 * _997;
        float _1005 = 1.0 / _981;
        float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1009 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1007;
        float _1011 = _1001 * _1003;
        float _1013 = _991 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        float _1017 = 1.0 / _1011;
        float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1021 = _1005 * _1019;
        float _1023 = 1.0 / _1009;
        float _1025 = _1015 * _1017;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1029 = fma(_1025, _1021, _1027);
        float _1031 = _1029 * _1023;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        _975 = _1033;
    }
    float _1035 = _975;
    float _1037 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _1039 = _969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1041 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _965);
    float _1043 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _1045 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1051 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1053 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1055 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1047);
    float _1059 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1049);
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1051);
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1053);
    float _1065 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1057);
    float _1069 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1059);
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1061);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1063);
    bool _1075 = _1035 > 0.0;
    bool _1077 = isnan(_1035);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1067);
    float _1089 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1069);
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1073);
    float _1093 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1071);
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1097 = _1087 + _1091;
    float _1099 = _1093 + _1091;
    float _1101 = _1091 * 0.5;
    float _1103 = _1097 * 0.5;
    float _1105 = _1099 * 0.5;
    float _1107 = fma(_1089, -0.5, _1101);
    out.m_35.x = _1095;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1089;
    out.gl_Position.z = _1093;
    out.gl_Position.w = _1091;
    out.m_52.x = _1103;
    out.m_52.y = _1107;
    out.m_52.z = _1105;
    out.m_52.w = _1091;
    if (_1083)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1109 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1109;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

