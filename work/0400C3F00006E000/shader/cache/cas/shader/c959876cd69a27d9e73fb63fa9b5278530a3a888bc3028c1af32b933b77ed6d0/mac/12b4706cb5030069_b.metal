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
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_30.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    float _75 = as_type<float>(_67);
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _73;
    if (!_71)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _880 = as_type<float>(_83);
        out.gl_Position.z = _880;
    }
    if (!_71)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_97)
    {
        float _103 = float(_67);
        _75 = _103;
    }
    float _105 = _75;
    bool _107 = _101 >= _105;
    bool _109 = !_97;
    bool _111 = _107 || _109;
    float _113 = _105;
    if (_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _117 = _115 * 5.0;
        _85 = as_type<int>(_117);
    }
    int _119 = _85;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _949 = as_type<float>(_119);
        out.gl_Position.z = _949;
    }
    if (_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = as_type<float>(int(gl_VertexIndex));
    float _123 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_40.w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = 0.0;
    float _151 = _123;
    if (!_135)
    {
        float _153 = _123 * _123;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    int _165 = as_type<int>(_121) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_121) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    int _175 = _173 ? (-1090519040) : 1056964608;
    bool _177 = !_171;
    int _179 = _177 ? (-1090519040) : 1056964608;
    bool _181 = !_135;
    float _183 = _163;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _123 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _123);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_135;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _123 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _151 = _237;
    }
    float _239 = _151;
    float _241 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_239, _139, _241);
    float _249 = fma(_239, _137, _243);
    float _251 = fma(_239, _141, _245);
    float _253 = fma(_247, _125, _145);
    float _255 = fma(_249, _125, _143);
    float _257 = fma(_251, _125, _147);
    float _259 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _261 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _263 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _265 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _259);
    float _267 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _261);
    float _269 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _263);
    float _271 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _265);
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _267);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _269);
    float _277 = _271 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _279 = _273 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _281 = _275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _289 = _279 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _293 = _281 + _291;
    float _295 = _285 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _297 = _285 * _285;
    out.m_42.x = as_type<float>(_175);
    out.m_42.y = as_type<float>(_179);
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c8)._m0[28].x, _295);
    float _301 = fma(_293, (*spvDescriptorSet0.vp_c8)._m0[28].z, _299);
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _305 = _301 >= 0.0;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _309 = fma(_289, _289, _297);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _317 = fma(_293, _293, _309);
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _325 = rsqrt(_317);
    float _327 = _303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _329 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_305)
    {
        _331 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _333 = _331;
    float _335 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = _313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _339 = _315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _341 = _319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _343 = as_type<int>(_333);
    float _345 = _335;
    if (_305)
    {
        float _347 = _333 * 5.0;
        _343 = as_type<int>(_347);
    }
    int _349 = _343;
    out.m_44.x = _327;
    out.m_44.y = _329;
    out.m_44.z = _335;
    out.m_44.w = _321;
    out.m_46.x = _337;
    out.m_46.y = _339;
    out.m_46.z = _341;
    out.m_46.w = _323;
    float _351 = _285 * _325;
    if (_305)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1376 = as_type<float>(_349);
        out.gl_Position.z = _1376;
    }
    float _353 = _289 * _325;
    if (_305)
    {
        out.m_33.x = 0.0;
    }
    if (_305)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _355 = -_351;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _277);
    float _359 = _293 * _325;
    float _361 = -_353;
    float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _279);
    float _365 = -_351;
    float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _285);
    float _369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _371 = _357 + _369;
    float _373 = -_359;
    float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _281);
    float _377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _379 = _363 + _377;
    float _381 = -_353;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _289);
    float _385 = _371 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _389 = _375 + _387;
    float _391 = _367 * _367;
    float _393 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _385);
    float _395 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[28].z, _393);
    bool _397 = _395 >= 0.0;
    if (_397)
    {
        _345 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _399 = _345;
    int _401 = as_type<int>(_399);
    if (_397)
    {
        out.m_33.x = 0.0;
    }
    if (_397)
    {
        float _403 = _399 * 5.0;
        _401 = as_type<int>(_403);
    }
    int _405 = _401;
    if (_397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1490 = as_type<float>(_405);
        out.gl_Position.z = _1490;
    }
    if (_397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _407 = in.m_40.x;
    float _409 = in.m_40.y;
    float _411 = -_359;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _293);
    float _415 = fma(_383, _383, _391);
    float _417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_179));
    float _419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _421 = fma(_413, _413, _415);
    bool _423 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _425 = isnan(0.5);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _431 = _427 || _429;
    float _433 = sqrt(_421);
    float _435 = _409 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = _325 * _433;
    float _441 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _443 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _445 = _439 * _441;
    float _447 = _439 * _443;
    float _449 = _417 * _445;
    float _451 = _419 * _447;
    float _453 = _439 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _455 = _453 * 0.5;
    float _457 = _449 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = _449 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _461 = _449 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].x, _459);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _461);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _463);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _465);
    float _473 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    float _475 = _469 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _477 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _479 = _473 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _481 = _281 + _475;
    float _483 = _279 + _477;
    float _485 = _277 + _479;
    float _487 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _489 = _481 + _487;
    float _491 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _493 = _483 + _491;
    float _495 = _489 * _489;
    float _497 = fma(_493, _493, _495);
    float _499 = _357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _501 = sqrt(_497);
    float _503 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[11].x, _499);
    float _505 = _357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _507 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _503);
    float _509 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[10].x, _505);
    float _511 = _507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _513 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _509);
    float _515 = 1.0 / _511;
    float _517 = _513 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _519 = _501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _521 = _517 + _511;
    float _523 = _507;
    float _525 = _483;
    float _527 = _517;
    float _529 = _439;
    if (!_519)
    {
        _523 = _483;
    }
    float _531 = _523;
    float _533 = _531;
    if (!_519)
    {
        _525 = _481;
    }
    float _535 = _525;
    float _537 = _535;
    if (!_519)
    {
        _527 = _485;
    }
    float _539 = _527;
    bool _541 = !_519;
    float _543 = _539;
    if (!_541)
    {
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _547 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _549 = _501 + _547;
        float _551 = rsqrt(_497);
        float _553 = _549 * _545;
        float _555 = _485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _553 * 0.15915493667125701904296875;
        float _559 = _557 * 6.283185482025146484375;
        float _561 = sin(_559);
        float _563 = _557 * 6.283185482025146484375;
        float _565 = cos(_563);
        float _567 = fma(_561, _555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _569 = _551 * _567;
        float _571 = _565 + (-1.0);
        float _573 = fma(_493, _569, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _575 = fma(_489, _569, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _577 = _571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = fma(_485, _565, _577);
        _533 = _573;
        _543 = _579;
        _537 = _575;
    }
    float _581 = _533;
    float _583 = _543;
    float _585 = _537;
    bool _587 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _589 = isnan(0.5);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _595 = _591 || _593;
    float _597 = -_353;
    float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _601 = -_351;
    float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _605 = -_359;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _609 = _521 * _515;
    float _611 = _609 * 0.5;
    float _613 = _603;
    float _615 = _599;
    float _617 = _607;
    if (!_431)
    {
        float _619 = _371 * _371;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _623 = -_281;
        float _625 = _623 + _585;
        float _627 = -_279;
        float _629 = _627 + _581;
        float _631 = fma(_379, _379, _619);
        float _633 = fma(_389, _389, _631);
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _637 = sqrt(_633);
        float _639 = 1.0 / _439;
        float _641 = precise::min(_637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _643 = _641 * _621;
        float _645 = _635 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _647 = _643 * _639;
        float _649 = -_277;
        float _651 = _649 + _583;
        float _653 = _645 * _647;
        float _655 = _625 * _647;
        float _657 = fma(_629, _653, _363);
        float _659 = fma(_651, _653, _357);
        float _661 = fma(_645, _655, _375);
        _613 = _659;
        _615 = _657;
        _617 = _661;
    }
    float _663 = _613;
    float _665 = _615;
    float _667 = _617;
    float _669 = _663 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _671 = _663 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_595)
    {
        _529 = 1.0;
    }
    float _673 = _529;
    float _675 = _673;
    if (!_595)
    {
        float _677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _681 = _677 * 0.15915493667125701904296875;
        float _683 = _679 * 0.15915493667125701904296875;
        float _685 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[30].w, _685);
        float _689 = _681 * 6.283185482025146484375;
        float _691 = cos(_689);
        float _693 = _681 * 6.283185482025146484375;
        float _695 = sin(_693);
        float _697 = 1.0 / _691;
        float _699 = _683 * 6.283185482025146484375;
        float _701 = cos(_699);
        float _703 = _695 * _697;
        float _705 = _683 * 6.283185482025146484375;
        float _707 = sin(_705);
        float _709 = _701 * _703;
        float _711 = 1.0 / _687;
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _715 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _713;
        float _717 = 1.0 / _709;
        float _719 = 1.0 / _715;
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _723 = _711 * _721;
        float _725 = _707 * _717;
        float _727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _729 = fma(_725, _723, _727);
        float _731 = _729 * _719;
        float _733 = precise::clamp(_731, 0.0, 1.0);
        _675 = _733;
    }
    float _735 = _675;
    float _737 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[1].x, _671);
    float _739 = _663 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _741 = _663 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _743 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[0].x, _669);
    float _745 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[1].z, _737);
    float _747 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[2].x, _739);
    float _749 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[3].x, _741);
    float _751 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[0].z, _743);
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _755 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[2].z, _747);
    float _757 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[3].z, _749);
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _767 = _753 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _769 = _755 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _761);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _763);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _765);
    float _777 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _767);
    float _779 = _757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[4].z, _771);
    float _783 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[5].z, _773);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[6].z, _775);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[7].z, _777);
    bool _789 = _735 > 0.0;
    bool _791 = isnan(_735);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _781);
    float _803 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _783);
    float _805 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _787);
    float _807 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _785);
    float _809 = _799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _811 = _801 + _805;
    float _813 = _807 + _805;
    float _815 = _805 * 0.5;
    float _817 = _811 * 0.5;
    float _819 = _813 * 0.5;
    float _821 = fma(_803, -0.5, _815);
    out.m_33.x = _809;
    out.gl_Position.x = _801;
    out.gl_Position.y = _803;
    out.gl_Position.z = _807;
    out.gl_Position.w = _805;
    out.m_48.x = _817;
    out.m_48.y = _821;
    out.m_48.z = _819;
    out.m_48.w = _805;
    if (_797)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _823 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _823;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_30.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    float _75 = as_type<float>(_67);
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _73;
    if (!_71)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _880 = as_type<float>(_83);
        out.gl_Position.z = _880;
    }
    if (!_71)
    {
        return out;
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_97)
    {
        float _103 = float(_67);
        _75 = _103;
    }
    float _105 = _75;
    bool _107 = _101 >= _105;
    bool _109 = !_97;
    bool _111 = _107 || _109;
    float _113 = _105;
    if (_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _117 = _115 * 5.0;
        _85 = as_type<int>(_117);
    }
    int _119 = _85;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _949 = as_type<float>(_119);
        out.gl_Position.z = _949;
    }
    if (_111)
    {
        return out;
    }
    float _121 = as_type<float>(int(gl_VertexIndex));
    float _123 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_40.w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = 0.0;
    float _151 = _123;
    if (!_135)
    {
        float _153 = _123 * _123;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    int _165 = as_type<int>(_121) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_121) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    int _175 = _173 ? (-1090519040) : 1056964608;
    bool _177 = !_171;
    int _179 = _177 ? (-1090519040) : 1056964608;
    bool _181 = !_135;
    float _183 = _163;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _123 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _123);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_135;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _123 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _151 = _237;
    }
    float _239 = _151;
    float _241 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_239, _139, _241);
    float _249 = fma(_239, _137, _243);
    float _251 = fma(_239, _141, _245);
    float _253 = fma(_247, _125, _145);
    float _255 = fma(_249, _125, _143);
    float _257 = fma(_251, _125, _147);
    float _259 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _261 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _263 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _265 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _259);
    float _267 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _261);
    float _269 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _263);
    float _271 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _265);
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _267);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _269);
    float _277 = _271 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _279 = _273 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _281 = _275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _289 = _279 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _293 = _281 + _291;
    float _295 = _285 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _297 = _285 * _285;
    out.m_42.x = as_type<float>(_175);
    out.m_42.y = as_type<float>(_179);
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c8)._m0[28].x, _295);
    float _301 = fma(_293, (*spvDescriptorSet0.vp_c8)._m0[28].z, _299);
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _305 = _301 >= 0.0;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _309 = fma(_289, _289, _297);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _317 = fma(_293, _293, _309);
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _325 = rsqrt(_317);
    float _327 = _303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _329 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_305)
    {
        _331 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _333 = _331;
    float _335 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = _313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _339 = _315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _341 = _319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _343 = as_type<int>(_333);
    float _345 = _335;
    if (_305)
    {
        float _347 = _333 * 5.0;
        _343 = as_type<int>(_347);
    }
    int _349 = _343;
    out.m_44.x = _327;
    out.m_44.y = _329;
    out.m_44.z = _335;
    out.m_44.w = _321;
    out.m_46.x = _337;
    out.m_46.y = _339;
    out.m_46.z = _341;
    out.m_46.w = _323;
    float _351 = _285 * _325;
    if (_305)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1376 = as_type<float>(_349);
        out.gl_Position.z = _1376;
    }
    float _353 = _289 * _325;
    if (_305)
    {
        out.m_33.x = 0.0;
    }
    if (_305)
    {
        return out;
    }
    float _355 = -_351;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _277);
    float _359 = _293 * _325;
    float _361 = -_353;
    float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _279);
    float _365 = -_351;
    float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _285);
    float _369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _371 = _357 + _369;
    float _373 = -_359;
    float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _281);
    float _377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _379 = _363 + _377;
    float _381 = -_353;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _289);
    float _385 = _371 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _389 = _375 + _387;
    float _391 = _367 * _367;
    float _393 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _385);
    float _395 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[28].z, _393);
    bool _397 = _395 >= 0.0;
    if (_397)
    {
        _345 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _399 = _345;
    int _401 = as_type<int>(_399);
    if (_397)
    {
        out.m_33.x = 0.0;
    }
    if (_397)
    {
        float _403 = _399 * 5.0;
        _401 = as_type<int>(_403);
    }
    int _405 = _401;
    if (_397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1490 = as_type<float>(_405);
        out.gl_Position.z = _1490;
    }
    if (_397)
    {
        return out;
    }
    float _407 = in.m_40.x;
    float _409 = in.m_40.y;
    float _411 = -_359;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _293);
    float _415 = fma(_383, _383, _391);
    float _417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_179));
    float _419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _421 = fma(_413, _413, _415);
    bool _423 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _425 = isnan(0.5);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _431 = _427 || _429;
    float _433 = sqrt(_421);
    float _435 = _409 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = _325 * _433;
    float _441 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _443 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _445 = _439 * _441;
    float _447 = _439 * _443;
    float _449 = _417 * _445;
    float _451 = _419 * _447;
    float _453 = _439 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _455 = _453 * 0.5;
    float _457 = _449 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = _449 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _461 = _449 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].x, _459);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _461);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _463);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _465);
    float _473 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    float _475 = _469 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _477 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _479 = _473 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _481 = _281 + _475;
    float _483 = _279 + _477;
    float _485 = _277 + _479;
    float _487 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _489 = _481 + _487;
    float _491 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _493 = _483 + _491;
    float _495 = _489 * _489;
    float _497 = fma(_493, _493, _495);
    float _499 = _357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _501 = sqrt(_497);
    float _503 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[11].x, _499);
    float _505 = _357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _507 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _503);
    float _509 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[10].x, _505);
    float _511 = _507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _513 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _509);
    float _515 = 1.0 / _511;
    float _517 = _513 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _519 = _501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _521 = _517 + _511;
    float _523 = _507;
    float _525 = _483;
    float _527 = _517;
    float _529 = _439;
    if (!_519)
    {
        _523 = _483;
    }
    float _531 = _523;
    float _533 = _531;
    if (!_519)
    {
        _525 = _481;
    }
    float _535 = _525;
    float _537 = _535;
    if (!_519)
    {
        _527 = _485;
    }
    float _539 = _527;
    bool _541 = !_519;
    float _543 = _539;
    if (!_541)
    {
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _547 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _549 = _501 + _547;
        float _551 = rsqrt(_497);
        float _553 = _549 * _545;
        float _555 = _485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _553 * 0.15915493667125701904296875;
        float _559 = _557 * 6.283185482025146484375;
        float _561 = sin(_559);
        float _563 = _557 * 6.283185482025146484375;
        float _565 = cos(_563);
        float _567 = fma(_561, _555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _569 = _551 * _567;
        float _571 = _565 + (-1.0);
        float _573 = fma(_493, _569, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _575 = fma(_489, _569, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _577 = _571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = fma(_485, _565, _577);
        _533 = _573;
        _543 = _579;
        _537 = _575;
    }
    float _581 = _533;
    float _583 = _543;
    float _585 = _537;
    bool _587 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _589 = isnan(0.5);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _595 = _591 || _593;
    float _597 = -_353;
    float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _601 = -_351;
    float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _605 = -_359;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _609 = _521 * _515;
    float _611 = _609 * 0.5;
    float _613 = _603;
    float _615 = _599;
    float _617 = _607;
    if (!_431)
    {
        float _619 = _371 * _371;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _623 = -_281;
        float _625 = _623 + _585;
        float _627 = -_279;
        float _629 = _627 + _581;
        float _631 = fma(_379, _379, _619);
        float _633 = fma(_389, _389, _631);
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _637 = sqrt(_633);
        float _639 = 1.0 / _439;
        float _641 = precise::min(_637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _643 = _641 * _621;
        float _645 = _635 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _647 = _643 * _639;
        float _649 = -_277;
        float _651 = _649 + _583;
        float _653 = _645 * _647;
        float _655 = _625 * _647;
        float _657 = fma(_629, _653, _363);
        float _659 = fma(_651, _653, _357);
        float _661 = fma(_645, _655, _375);
        _613 = _659;
        _615 = _657;
        _617 = _661;
    }
    float _663 = _613;
    float _665 = _615;
    float _667 = _617;
    float _669 = _663 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _671 = _663 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_595)
    {
        _529 = 1.0;
    }
    float _673 = _529;
    float _675 = _673;
    if (!_595)
    {
        float _677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _681 = _677 * 0.15915493667125701904296875;
        float _683 = _679 * 0.15915493667125701904296875;
        float _685 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[30].w, _685);
        float _689 = _681 * 6.283185482025146484375;
        float _691 = cos(_689);
        float _693 = _681 * 6.283185482025146484375;
        float _695 = sin(_693);
        float _697 = 1.0 / _691;
        float _699 = _683 * 6.283185482025146484375;
        float _701 = cos(_699);
        float _703 = _695 * _697;
        float _705 = _683 * 6.283185482025146484375;
        float _707 = sin(_705);
        float _709 = _701 * _703;
        float _711 = 1.0 / _687;
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _715 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _713;
        float _717 = 1.0 / _709;
        float _719 = 1.0 / _715;
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _723 = _711 * _721;
        float _725 = _707 * _717;
        float _727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _729 = fma(_725, _723, _727);
        float _731 = _729 * _719;
        float _733 = precise::clamp(_731, 0.0, 1.0);
        _675 = _733;
    }
    float _735 = _675;
    float _737 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[1].x, _671);
    float _739 = _663 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _741 = _663 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _743 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[0].x, _669);
    float _745 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[1].z, _737);
    float _747 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[2].x, _739);
    float _749 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[3].x, _741);
    float _751 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[0].z, _743);
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _755 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[2].z, _747);
    float _757 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[3].z, _749);
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _767 = _753 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _769 = _755 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _761);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _763);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _765);
    float _777 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _767);
    float _779 = _757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[4].z, _771);
    float _783 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[5].z, _773);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[6].z, _775);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[7].z, _777);
    bool _789 = _735 > 0.0;
    bool _791 = isnan(_735);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _781);
    float _803 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _783);
    float _805 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _787);
    float _807 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _785);
    float _809 = _799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _811 = _801 + _805;
    float _813 = _807 + _805;
    float _815 = _805 * 0.5;
    float _817 = _811 * 0.5;
    float _819 = _813 * 0.5;
    float _821 = fma(_803, -0.5, _815);
    out.m_33.x = _809;
    out.gl_Position.x = _801;
    out.gl_Position.y = _803;
    out.gl_Position.z = _807;
    out.gl_Position.w = _805;
    out.m_48.x = _817;
    out.m_48.y = _821;
    out.m_48.z = _819;
    out.m_48.w = _805;
    if (_797)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _823 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _823;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_30.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    float _75 = as_type<float>(_67);
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _73;
    if (!_71)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _880 = as_type<float>(_83);
        out.gl_Position.z = _880;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_97)
    {
        float _103 = float(_67);
        _75 = _103;
    }
    float _105 = _75;
    bool _107 = _101 >= _105;
    bool _109 = !_97;
    bool _111 = _107 || _109;
    float _113 = _105;
    if (_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _117 = _115 * 5.0;
        _85 = as_type<int>(_117);
    }
    int _119 = _85;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _949 = as_type<float>(_119);
        out.gl_Position.z = _949;
    }
    if (_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = as_type<float>(int(gl_VertexIndex));
    float _123 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_40.w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = 0.0;
    float _151 = _123;
    if (!_135)
    {
        float _153 = _123 * _123;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    int _165 = as_type<int>(_121) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_121) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    int _175 = _173 ? (-1090519040) : 1056964608;
    bool _177 = !_171;
    int _179 = _177 ? (-1090519040) : 1056964608;
    bool _181 = !_135;
    float _183 = _163;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _123 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _123);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_135;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _123 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _151 = _237;
    }
    float _239 = _151;
    float _241 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_239, _139, _241);
    float _249 = fma(_239, _137, _243);
    float _251 = fma(_239, _141, _245);
    float _253 = fma(_247, _125, _145);
    float _255 = fma(_249, _125, _143);
    float _257 = fma(_251, _125, _147);
    float _259 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _261 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _263 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _265 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _259);
    float _267 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _261);
    float _269 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _263);
    float _271 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _265);
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _267);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _269);
    float _277 = _271 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _279 = _273 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _281 = _275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _289 = _279 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _293 = _281 + _291;
    float _295 = _285 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _297 = _285 * _285;
    out.m_42.x = as_type<float>(_175);
    out.m_42.y = as_type<float>(_179);
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c8)._m0[28].x, _295);
    float _301 = fma(_293, (*spvDescriptorSet0.vp_c8)._m0[28].z, _299);
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _305 = _301 >= 0.0;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _309 = fma(_289, _289, _297);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _317 = fma(_293, _293, _309);
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _325 = rsqrt(_317);
    float _327 = _303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _329 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_305)
    {
        _331 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _333 = _331;
    float _335 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = _313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _339 = _315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _341 = _319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _343 = as_type<int>(_333);
    float _345 = _335;
    if (_305)
    {
        float _347 = _333 * 5.0;
        _343 = as_type<int>(_347);
    }
    int _349 = _343;
    out.m_44.x = _327;
    out.m_44.y = _329;
    out.m_44.z = _335;
    out.m_44.w = _321;
    out.m_46.x = _337;
    out.m_46.y = _339;
    out.m_46.z = _341;
    out.m_46.w = _323;
    float _351 = _285 * _325;
    if (_305)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1376 = as_type<float>(_349);
        out.gl_Position.z = _1376;
    }
    float _353 = _289 * _325;
    if (_305)
    {
        out.m_33.x = 0.0;
    }
    if (_305)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _355 = -_351;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _277);
    float _359 = _293 * _325;
    float _361 = -_353;
    float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _279);
    float _365 = -_351;
    float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _285);
    float _369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _371 = _357 + _369;
    float _373 = -_359;
    float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _281);
    float _377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _379 = _363 + _377;
    float _381 = -_353;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _289);
    float _385 = _371 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _389 = _375 + _387;
    float _391 = _367 * _367;
    float _393 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _385);
    float _395 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[28].z, _393);
    bool _397 = _395 >= 0.0;
    if (_397)
    {
        _345 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _399 = _345;
    int _401 = as_type<int>(_399);
    if (_397)
    {
        out.m_33.x = 0.0;
    }
    if (_397)
    {
        float _403 = _399 * 5.0;
        _401 = as_type<int>(_403);
    }
    int _405 = _401;
    if (_397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1490 = as_type<float>(_405);
        out.gl_Position.z = _1490;
    }
    if (_397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _407 = in.m_40.x;
    float _409 = in.m_40.y;
    float _411 = -_359;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _293);
    float _415 = fma(_383, _383, _391);
    float _417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_179));
    float _419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _421 = fma(_413, _413, _415);
    bool _423 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _425 = isnan(0.5);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _431 = _427 || _429;
    float _433 = sqrt(_421);
    float _435 = _409 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = _325 * _433;
    float _441 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _443 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _445 = _439 * _441;
    float _447 = _439 * _443;
    float _449 = _417 * _445;
    float _451 = _419 * _447;
    float _453 = _439 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _455 = _453 * 0.5;
    float _457 = _449 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = _449 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _461 = _449 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].x, _459);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _461);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _463);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _465);
    float _473 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    float _475 = _469 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _477 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _479 = _473 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _481 = _281 + _475;
    float _483 = _279 + _477;
    float _485 = _277 + _479;
    float _487 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _489 = _481 + _487;
    float _491 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _493 = _483 + _491;
    float _495 = _489 * _489;
    float _497 = fma(_493, _493, _495);
    float _499 = _357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _501 = sqrt(_497);
    float _503 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[11].x, _499);
    float _505 = _357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _507 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _503);
    float _509 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[10].x, _505);
    float _511 = _507 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _513 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _509);
    float _515 = 1.0 / _511;
    float _517 = _513 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _519 = _501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _521 = _517 + _511;
    float _523 = _507;
    float _525 = _483;
    float _527 = _517;
    float _529 = _439;
    if (!_519)
    {
        _523 = _483;
    }
    float _531 = _523;
    float _533 = _531;
    if (!_519)
    {
        _525 = _481;
    }
    float _535 = _525;
    float _537 = _535;
    if (!_519)
    {
        _527 = _485;
    }
    float _539 = _527;
    bool _541 = !_519;
    float _543 = _539;
    if (!_541)
    {
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _547 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _549 = _501 + _547;
        float _551 = rsqrt(_497);
        float _553 = _549 * _545;
        float _555 = _485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _553 * 0.15915493667125701904296875;
        float _559 = _557 * 6.283185482025146484375;
        float _561 = sin(_559);
        float _563 = _557 * 6.283185482025146484375;
        float _565 = cos(_563);
        float _567 = fma(_561, _555, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _569 = _551 * _567;
        float _571 = _565 + (-1.0);
        float _573 = fma(_493, _569, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _575 = fma(_489, _569, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _577 = _571 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = fma(_485, _565, _577);
        _533 = _573;
        _543 = _579;
        _537 = _575;
    }
    float _581 = _533;
    float _583 = _543;
    float _585 = _537;
    bool _587 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _589 = isnan(0.5);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _595 = _591 || _593;
    float _597 = -_353;
    float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _601 = -_351;
    float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _605 = -_359;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _609 = _521 * _515;
    float _611 = _609 * 0.5;
    float _613 = _603;
    float _615 = _599;
    float _617 = _607;
    if (!_431)
    {
        float _619 = _371 * _371;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _623 = -_281;
        float _625 = _623 + _585;
        float _627 = -_279;
        float _629 = _627 + _581;
        float _631 = fma(_379, _379, _619);
        float _633 = fma(_389, _389, _631);
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _637 = sqrt(_633);
        float _639 = 1.0 / _439;
        float _641 = precise::min(_637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _643 = _641 * _621;
        float _645 = _635 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _647 = _643 * _639;
        float _649 = -_277;
        float _651 = _649 + _583;
        float _653 = _645 * _647;
        float _655 = _625 * _647;
        float _657 = fma(_629, _653, _363);
        float _659 = fma(_651, _653, _357);
        float _661 = fma(_645, _655, _375);
        _613 = _659;
        _615 = _657;
        _617 = _661;
    }
    float _663 = _613;
    float _665 = _615;
    float _667 = _617;
    float _669 = _663 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _671 = _663 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_595)
    {
        _529 = 1.0;
    }
    float _673 = _529;
    float _675 = _673;
    if (!_595)
    {
        float _677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _681 = _677 * 0.15915493667125701904296875;
        float _683 = _679 * 0.15915493667125701904296875;
        float _685 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[30].w, _685);
        float _689 = _681 * 6.283185482025146484375;
        float _691 = cos(_689);
        float _693 = _681 * 6.283185482025146484375;
        float _695 = sin(_693);
        float _697 = 1.0 / _691;
        float _699 = _683 * 6.283185482025146484375;
        float _701 = cos(_699);
        float _703 = _695 * _697;
        float _705 = _683 * 6.283185482025146484375;
        float _707 = sin(_705);
        float _709 = _701 * _703;
        float _711 = 1.0 / _687;
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _715 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _713;
        float _717 = 1.0 / _709;
        float _719 = 1.0 / _715;
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _723 = _711 * _721;
        float _725 = _707 * _717;
        float _727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _729 = fma(_725, _723, _727);
        float _731 = _729 * _719;
        float _733 = precise::clamp(_731, 0.0, 1.0);
        _675 = _733;
    }
    float _735 = _675;
    float _737 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[1].x, _671);
    float _739 = _663 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _741 = _663 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _743 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[0].x, _669);
    float _745 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[1].z, _737);
    float _747 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[2].x, _739);
    float _749 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[3].x, _741);
    float _751 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[0].z, _743);
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _755 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[2].z, _747);
    float _757 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[3].z, _749);
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _767 = _753 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _769 = _755 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _761);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _763);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _765);
    float _777 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _767);
    float _779 = _757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[4].z, _771);
    float _783 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[5].z, _773);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[6].z, _775);
    float _787 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[7].z, _777);
    bool _789 = _735 > 0.0;
    bool _791 = isnan(_735);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _781);
    float _803 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _783);
    float _805 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _787);
    float _807 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _785);
    float _809 = _799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _811 = _801 + _805;
    float _813 = _807 + _805;
    float _815 = _805 * 0.5;
    float _817 = _811 * 0.5;
    float _819 = _813 * 0.5;
    float _821 = fma(_803, -0.5, _815);
    out.m_33.x = _809;
    out.gl_Position.x = _801;
    out.gl_Position.y = _803;
    out.gl_Position.z = _807;
    out.gl_Position.w = _805;
    out.m_48.x = _817;
    out.m_48.y = _821;
    out.m_48.z = _819;
    out.m_48.w = _805;
    if (_797)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _823 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _823;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

