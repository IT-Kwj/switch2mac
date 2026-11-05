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
    float4 m_48 [[user(locn1)]];
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
    float4 m_40 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _77 = as_type<float>(_69);
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _79 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1116 = as_type<float>(_85);
        out.gl_Position.z = _1116;
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
        _77 = _105;
    }
    float _107 = _77;
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
        float _1185 = as_type<float>(_121);
        out.gl_Position.z = _1185;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = in.m_40.y;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_42.w;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    int _151 = as_type<int>(_123) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_123) & 2;
    bool _157 = _155 != 0;
    float _159 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = _125 > 0.5;
    float _163 = _125;
    float _165 = _159;
    if (!_135)
    {
        float _167 = _159 * _159;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    bool _173 = !_153;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_157;
    float _179 = _177 ? (-0.5) : 0.5;
    float _181 = _171;
    if (!_135)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    bool _187 = !_135;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _159 * _193;
        float _203 = exp2(_201);
        float _205 = _199 * 0.693147182464599609375;
        float _207 = 1.0 / _205;
        float _209 = 1.0 / _197;
        float _211 = _203 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _207, _159);
        float _217 = _215 * _209;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
    }
    float _221 = _189;
    bool _223 = !_135;
    if (!_223)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = 1.0 / _231;
        float _235 = _159 * _227;
        float _237 = exp2(_235);
        float _239 = -_237;
        float _241 = _239 + 1.0;
        float _243 = _241 * _233;
        _165 = _243;
    }
    float _245 = _165;
    float _247 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _251 = in.m_40.x;
    float _253 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _255 = fma(_245, _141, _247);
    float _257 = fma(_245, _139, _249);
    float _259 = in.m_40.w;
    float _261 = fma(_255, _137, _147);
    float _263 = fma(_245, _143, _253);
    float _265 = fma(_257, _137, _145);
    float _267 = in.m_40.z;
    float _269 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _273 = _271 != 0;
    float _275 = fma(_263, _137, _149);
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _279 = _277 != 0;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].x, _269);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _285 = _283 != 0;
    float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _291 = _289 != 0;
    float _293 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _295 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    float _297 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _299 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].x, _293);
    float _301 = _295 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _303 = _251 > 0.5;
    float _305 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].x, _297);
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _299);
    float _309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _311 = _301 + _309;
    float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _315 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _305);
    float _317 = _307 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _319 = _311 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _321 = -_175;
    int _323 = _303 ? as_type<int>(_321) : as_type<int>(_175);
    float _325 = _315 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _329 = _317 + _327;
    bool _331 = _259 > 0.5;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _335 = _267 > 0.5;
    float _337 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[28].x, _319);
    float _339 = -_179;
    int _341 = _161 ? as_type<int>(_339) : as_type<int>(_179);
    float _343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _345 = _325 + _343;
    float _347 = -_179;
    int _349 = _331 ? as_type<int>(_347) : as_type<int>(_179);
    bool _351 = !_273;
    float _353 = _351 ? _175 : as_type<float>(_323);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c8)._m0[28].z, _337);
    bool _357 = !_279;
    float _359 = _357 ? _179 : as_type<float>(_341);
    float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _363 = -_175;
    int _365 = _335 ? as_type<int>(_363) : as_type<int>(_175);
    float _367 = _353 + 0.5;
    bool _369 = !_291;
    float _371 = _369 ? _179 : as_type<float>(_349);
    float _373 = -_359;
    float _375 = _373 + 0.5;
    bool _377 = !_285;
    float _379 = _377 ? _175 : as_type<float>(_365);
    float _381 = _367 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _383 = _355 >= 0.0;
    float _385 = -_371;
    float _387 = _385 + 0.5;
    float _389 = _375 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _391 = _379 + 0.5;
    float _393 = _387 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _395 = _311 * _311;
    float _397 = _391 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _399 = _389 * _313;
    float _401 = _393 * _333;
    float _403 = fma(_329, _329, _395);
    float _405 = _397 * _287;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = fma(_345, _345, _403);
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = rsqrt(_409);
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _421 = _405;
    if (_383)
    {
        _419 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _423 = _419;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _431 = _381 * _361;
    float _433 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _435 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _445 = as_type<int>(_423);
    if (_383)
    {
        float _447 = _423 * 5.0;
        _445 = as_type<int>(_447);
    }
    int _449 = _445;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _457 = _455 != 0;
    out.m_44.x = _433;
    out.m_44.y = _435;
    out.m_44.z = _437;
    out.m_44.w = _411;
    float _459 = _311 * _415;
    float _461 = _329 * _415;
    out.m_46.x = _431;
    out.m_46.y = _399;
    out.m_46.z = _405;
    out.m_46.w = _401;
    bool _463 = !_453;
    int _465 = _463 ? 0 : 1;
    bool _467 = !_457;
    int _469 = _467 ? 0 : 1;
    out.m_48.x = _439;
    out.m_48.y = _441;
    out.m_48.z = _443;
    if (_383)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1785 = as_type<float>(_449);
        out.gl_Position.z = _1785;
    }
    if (_383)
    {
        out.m_33.x = 0.0;
    }
    if (_383)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _471 = -_459;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _301);
    float _475 = _345 * _415;
    float _477 = -_461;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _317);
    float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _485 = _473 + _483;
    float _487 = -_475;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _493 = _479 + _491;
    float _495 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _497 = _485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _501 = _489 + _499;
    float _503 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _497);
    float _505 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _503);
    float _507 = _495 * _481;
    bool _509 = _505 >= 0.0;
    if (_509)
    {
        _421 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _511 = _421;
    int _513 = as_type<int>(_511);
    if (_509)
    {
        out.m_33.x = 0.0;
    }
    if (_509)
    {
        float _515 = _511 * 5.0;
        _513 = as_type<int>(_515);
    }
    int _517 = _513;
    if (_509)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1891 = as_type<float>(_517);
        out.gl_Position.z = _1891;
    }
    if (_509)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _519 = -_301;
    float _521 = _519 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _523 = -_317;
    float _525 = _523 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _527 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[20].x, _507);
    float _529 = -_325;
    float _531 = _529 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _533 = _521 * _521;
    float _535 = floor(_527);
    float _537 = -_459;
    float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    float _541 = fma(_525, _525, _533);
    int _543 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _545 = _543 != 0;
    float _547 = _527 * 6.283185482025146484375;
    int _549 = abs(_465);
    float _551 = fma(_531, _531, _541);
    float _553 = -_461;
    float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _329);
    float _557 = _547 * 0.15915493667125701904296875;
    float _559 = _539 * _539;
    float _561 = -_475;
    float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _565 = rsqrt(_551);
    float _567 = fma(_555, _555, _559);
    float _569 = float(_549);
    float _571 = -_535;
    float _573 = _527 + _571;
    bool _575 = !_545;
    int _577 = _575 ? 0 : 1;
    float _579 = fma(_563, _563, _567);
    float _581 = in.m_42.y;
    float _583 = _557 * 6.283185482025146484375;
    float _585 = cos(_583);
    float _587 = -_573;
    float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _591 = abs(_577);
    float _593 = in.m_42.x;
    bool _595 = _573 < 0.5;
    float _597 = float(_595);
    float _599 = abs(_589);
    float _601 = _569 * _599;
    float _603 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _607 = _525 * _565;
    float _609 = _521 * _565;
    float _611 = _531 * _565;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _615 = _607 * _613;
    int _617 = abs(_469);
    float _619 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _621 = _609 * _619;
    float _623 = -_597;
    float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _627 = fma(_585, 0.5, 0.5);
    float _629 = float(_591);
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _633 = _611 * _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _637 = -_615;
    float _639 = fma(_611, _635, _637);
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _643 = -_621;
    float _645 = fma(_607, _641, _643);
    float _647 = -_627;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _653 = -_633;
    float _655 = fma(_609, _651, _653);
    float _657 = _639 * _639;
    float _659 = sqrt(_579);
    float _661 = float(_617);
    float _663 = fma(_629, _649, _601);
    float _665 = fma(_655, _655, _657);
    bool _667 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _669 = isnan(0.5);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _675 = _671 || _673;
    float _677 = abs(_625);
    float _679 = fma(_661, _677, _663);
    float _681 = fma(_645, _645, _665);
    float _683 = _581 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _685 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _687 = isnan(0.5);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _693 = _689 || _691;
    float _695 = _679 * _683;
    float _697 = rsqrt(_681);
    float _699 = _593 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _701 = _415 * _659;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _705 = _679 * _699;
    float _707 = _701 * _703;
    float _709 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _711 = _603 * _707;
    float _713 = _701 * _709;
    float _715 = _655 * _697;
    float _717 = _639 * _697;
    float _719 = _645 * _697;
    float _721 = _605 * _713;
    float _723 = _609 * _715;
    float _725 = _611 * _717;
    float _727 = -_723;
    float _729 = fma(_607, _717, _727);
    float _731 = -_725;
    float _733 = fma(_609, _719, _731);
    float _735 = _701 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _737 = _735 * 0.5;
    float _739 = _711 * _729;
    float _741 = _711 * _733;
    float _743 = fma(_721, _719, _739);
    float _745 = fma(_721, _715, _741);
    float _747 = fma(_737, _611, _743);
    float _749 = fma(_737, _607, _745);
    float _751 = _607 * _719;
    float _753 = _325 + _747;
    float _755 = _317 + _749;
    float _757 = _473 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _759 = -_751;
    float _761 = fma(_611, _715, _759);
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _765 = _753 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _769 = _755 + _767;
    float _771 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[11].x, _757);
    float _773 = _711 * _761;
    float _775 = _765 * _765;
    float _777 = _473 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _771);
    float _781 = fma(_721, _717, _773);
    float _783 = fma(_769, _769, _775);
    float _785 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _787 = _779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _789 = fma(_737, _609, _781);
    float _791 = sqrt(_783);
    float _793 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _785);
    float _795 = _301 + _789;
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _799 = 1.0 / _787;
    float _801 = _797 + _787;
    bool _803 = _791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _715;
    float _807 = _775;
    float _809 = _755;
    if (!_803)
    {
        _805 = _755;
    }
    float _811 = _805;
    float _813 = _811;
    if (!_803)
    {
        _807 = _753;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_803)
    {
        _809 = _795;
    }
    float _819 = _809;
    bool _821 = !_803;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _791 + _827;
        float _831 = rsqrt(_783);
        float _833 = _829 * _825;
        float _835 = _795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = sin(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = fma(_841, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _849 = _831 * _847;
        float _851 = _845 + (-1.0);
        float _853 = fma(_769, _849, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _855 = fma(_765, _849, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _857 = _851 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = fma(_795, _845, _857);
        _813 = _853;
        _823 = _859;
        _817 = _855;
    }
    float _861 = _813;
    float _863 = _823;
    float _865 = _817;
    float _867 = -_461;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _871 = -_459;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _875 = -_475;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _879 = _801 * _799;
    float _881 = _879 * 0.5;
    float _883 = _873;
    float _885 = _869;
    float _887 = _877;
    if (!_675)
    {
        float _889 = _485 * _485;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _893 = -_325;
        float _895 = _893 + _865;
        float _897 = -_317;
        float _899 = _897 + _861;
        float _901 = fma(_493, _493, _889);
        float _903 = fma(_501, _501, _901);
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _907 = sqrt(_903);
        float _909 = _891 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _911 = 1.0 / _701;
        float _913 = precise::min(_907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _915 = _913 * _905;
        float _917 = _915 * _911;
        float _919 = -_301;
        float _921 = _919 + _863;
        float _923 = _909 * _917;
        float _925 = _895 * _917;
        float _927 = fma(_899, _923, _479);
        float _929 = fma(_921, _923, _473);
        float _931 = fma(_909, _925, _489);
        _883 = _929;
        _885 = _927;
        _887 = _931;
    }
    float _933 = _883;
    float _935 = _885;
    float _937 = _887;
    float _939 = _933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _941 = _933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _943 = _933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = _933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].x, _939);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].x, _941);
    float _951 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _953 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[1].z, _947);
    float _957 = _947;
    if (_693)
    {
        _957 = 1.0;
    }
    float _959 = _957;
    float _961 = _959;
    if (!_693)
    {
        float _963 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _965 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _963);
        float _967 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _971 = 1.0 / _965;
        float _973 = 1.0 / _969;
        float _975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_971, _975, _977);
        float _981 = _979 * _973;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _961 = _983;
    }
    float _985 = _961;
    float _987 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[0].z, _949);
    float _989 = _955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _991 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[2].z, _951);
    float _993 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[3].z, _953);
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _997 = _989 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _999 = _989 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1001 = _989 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1003 = _989 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1005 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _997);
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _999);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1001);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1003);
    float _1015 = _993 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1017 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1007);
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1009);
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1011);
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1013);
    bool _1025 = _985 > 0.0;
    bool _1027 = isnan(_985);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan(0.0);
    bool _1033 = _1029 || _1031;
    float _1035 = _985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1037 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1017);
    float _1039 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1019);
    float _1041 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1023);
    float _1043 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1021);
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1047 = _1037 + _1041;
    float _1049 = _1043 + _1041;
    float _1051 = _1041 * 0.5;
    float _1053 = _1047 * 0.5;
    float _1055 = _1049 * 0.5;
    float _1057 = fma(_1039, -0.5, _1051);
    out.m_33.x = _1045;
    out.gl_Position.x = _1037;
    out.gl_Position.y = _1039;
    out.gl_Position.z = _1043;
    out.gl_Position.w = _1041;
    out.m_50.x = _1053;
    out.m_50.y = _1057;
    out.m_50.z = _1055;
    out.m_50.w = _1041;
    if (_1033)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1059 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1059;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _77 = as_type<float>(_69);
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _79 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1116 = as_type<float>(_85);
        out.gl_Position.z = _1116;
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
        _77 = _105;
    }
    float _107 = _77;
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
        float _1185 = as_type<float>(_121);
        out.gl_Position.z = _1185;
    }
    if (_113)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = in.m_40.y;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_42.w;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    int _151 = as_type<int>(_123) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_123) & 2;
    bool _157 = _155 != 0;
    float _159 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = _125 > 0.5;
    float _163 = _125;
    float _165 = _159;
    if (!_135)
    {
        float _167 = _159 * _159;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    bool _173 = !_153;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_157;
    float _179 = _177 ? (-0.5) : 0.5;
    float _181 = _171;
    if (!_135)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    bool _187 = !_135;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _159 * _193;
        float _203 = exp2(_201);
        float _205 = _199 * 0.693147182464599609375;
        float _207 = 1.0 / _205;
        float _209 = 1.0 / _197;
        float _211 = _203 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _207, _159);
        float _217 = _215 * _209;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
    }
    float _221 = _189;
    bool _223 = !_135;
    if (!_223)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = 1.0 / _231;
        float _235 = _159 * _227;
        float _237 = exp2(_235);
        float _239 = -_237;
        float _241 = _239 + 1.0;
        float _243 = _241 * _233;
        _165 = _243;
    }
    float _245 = _165;
    float _247 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _251 = in.m_40.x;
    float _253 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _255 = fma(_245, _141, _247);
    float _257 = fma(_245, _139, _249);
    float _259 = in.m_40.w;
    float _261 = fma(_255, _137, _147);
    float _263 = fma(_245, _143, _253);
    float _265 = fma(_257, _137, _145);
    float _267 = in.m_40.z;
    float _269 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _273 = _271 != 0;
    float _275 = fma(_263, _137, _149);
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _279 = _277 != 0;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].x, _269);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _285 = _283 != 0;
    float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _291 = _289 != 0;
    float _293 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _295 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    float _297 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _299 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].x, _293);
    float _301 = _295 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _303 = _251 > 0.5;
    float _305 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].x, _297);
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _299);
    float _309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _311 = _301 + _309;
    float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _315 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _305);
    float _317 = _307 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _319 = _311 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _321 = -_175;
    int _323 = _303 ? as_type<int>(_321) : as_type<int>(_175);
    float _325 = _315 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _329 = _317 + _327;
    bool _331 = _259 > 0.5;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _335 = _267 > 0.5;
    float _337 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[28].x, _319);
    float _339 = -_179;
    int _341 = _161 ? as_type<int>(_339) : as_type<int>(_179);
    float _343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _345 = _325 + _343;
    float _347 = -_179;
    int _349 = _331 ? as_type<int>(_347) : as_type<int>(_179);
    bool _351 = !_273;
    float _353 = _351 ? _175 : as_type<float>(_323);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c8)._m0[28].z, _337);
    bool _357 = !_279;
    float _359 = _357 ? _179 : as_type<float>(_341);
    float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _363 = -_175;
    int _365 = _335 ? as_type<int>(_363) : as_type<int>(_175);
    float _367 = _353 + 0.5;
    bool _369 = !_291;
    float _371 = _369 ? _179 : as_type<float>(_349);
    float _373 = -_359;
    float _375 = _373 + 0.5;
    bool _377 = !_285;
    float _379 = _377 ? _175 : as_type<float>(_365);
    float _381 = _367 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _383 = _355 >= 0.0;
    float _385 = -_371;
    float _387 = _385 + 0.5;
    float _389 = _375 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _391 = _379 + 0.5;
    float _393 = _387 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _395 = _311 * _311;
    float _397 = _391 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _399 = _389 * _313;
    float _401 = _393 * _333;
    float _403 = fma(_329, _329, _395);
    float _405 = _397 * _287;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = fma(_345, _345, _403);
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = rsqrt(_409);
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _421 = _405;
    if (_383)
    {
        _419 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _423 = _419;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _431 = _381 * _361;
    float _433 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _435 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _445 = as_type<int>(_423);
    if (_383)
    {
        float _447 = _423 * 5.0;
        _445 = as_type<int>(_447);
    }
    int _449 = _445;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _457 = _455 != 0;
    out.m_44.x = _433;
    out.m_44.y = _435;
    out.m_44.z = _437;
    out.m_44.w = _411;
    float _459 = _311 * _415;
    float _461 = _329 * _415;
    out.m_46.x = _431;
    out.m_46.y = _399;
    out.m_46.z = _405;
    out.m_46.w = _401;
    bool _463 = !_453;
    int _465 = _463 ? 0 : 1;
    bool _467 = !_457;
    int _469 = _467 ? 0 : 1;
    out.m_48.x = _439;
    out.m_48.y = _441;
    out.m_48.z = _443;
    if (_383)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1785 = as_type<float>(_449);
        out.gl_Position.z = _1785;
    }
    if (_383)
    {
        out.m_33.x = 0.0;
    }
    if (_383)
    {
        return out;
    }
    float _471 = -_459;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _301);
    float _475 = _345 * _415;
    float _477 = -_461;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _317);
    float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _485 = _473 + _483;
    float _487 = -_475;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _493 = _479 + _491;
    float _495 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _497 = _485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _501 = _489 + _499;
    float _503 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _497);
    float _505 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _503);
    float _507 = _495 * _481;
    bool _509 = _505 >= 0.0;
    if (_509)
    {
        _421 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _511 = _421;
    int _513 = as_type<int>(_511);
    if (_509)
    {
        out.m_33.x = 0.0;
    }
    if (_509)
    {
        float _515 = _511 * 5.0;
        _513 = as_type<int>(_515);
    }
    int _517 = _513;
    if (_509)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1891 = as_type<float>(_517);
        out.gl_Position.z = _1891;
    }
    if (_509)
    {
        return out;
    }
    float _519 = -_301;
    float _521 = _519 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _523 = -_317;
    float _525 = _523 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _527 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[20].x, _507);
    float _529 = -_325;
    float _531 = _529 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _533 = _521 * _521;
    float _535 = floor(_527);
    float _537 = -_459;
    float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    float _541 = fma(_525, _525, _533);
    int _543 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _545 = _543 != 0;
    float _547 = _527 * 6.283185482025146484375;
    int _549 = abs(_465);
    float _551 = fma(_531, _531, _541);
    float _553 = -_461;
    float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _329);
    float _557 = _547 * 0.15915493667125701904296875;
    float _559 = _539 * _539;
    float _561 = -_475;
    float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _565 = rsqrt(_551);
    float _567 = fma(_555, _555, _559);
    float _569 = float(_549);
    float _571 = -_535;
    float _573 = _527 + _571;
    bool _575 = !_545;
    int _577 = _575 ? 0 : 1;
    float _579 = fma(_563, _563, _567);
    float _581 = in.m_42.y;
    float _583 = _557 * 6.283185482025146484375;
    float _585 = cos(_583);
    float _587 = -_573;
    float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _591 = abs(_577);
    float _593 = in.m_42.x;
    bool _595 = _573 < 0.5;
    float _597 = float(_595);
    float _599 = abs(_589);
    float _601 = _569 * _599;
    float _603 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _607 = _525 * _565;
    float _609 = _521 * _565;
    float _611 = _531 * _565;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _615 = _607 * _613;
    int _617 = abs(_469);
    float _619 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _621 = _609 * _619;
    float _623 = -_597;
    float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _627 = fma(_585, 0.5, 0.5);
    float _629 = float(_591);
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _633 = _611 * _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _637 = -_615;
    float _639 = fma(_611, _635, _637);
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _643 = -_621;
    float _645 = fma(_607, _641, _643);
    float _647 = -_627;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _653 = -_633;
    float _655 = fma(_609, _651, _653);
    float _657 = _639 * _639;
    float _659 = sqrt(_579);
    float _661 = float(_617);
    float _663 = fma(_629, _649, _601);
    float _665 = fma(_655, _655, _657);
    bool _667 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _669 = isnan(0.5);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _675 = _671 || _673;
    float _677 = abs(_625);
    float _679 = fma(_661, _677, _663);
    float _681 = fma(_645, _645, _665);
    float _683 = _581 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _685 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _687 = isnan(0.5);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _693 = _689 || _691;
    float _695 = _679 * _683;
    float _697 = rsqrt(_681);
    float _699 = _593 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _701 = _415 * _659;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _705 = _679 * _699;
    float _707 = _701 * _703;
    float _709 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _711 = _603 * _707;
    float _713 = _701 * _709;
    float _715 = _655 * _697;
    float _717 = _639 * _697;
    float _719 = _645 * _697;
    float _721 = _605 * _713;
    float _723 = _609 * _715;
    float _725 = _611 * _717;
    float _727 = -_723;
    float _729 = fma(_607, _717, _727);
    float _731 = -_725;
    float _733 = fma(_609, _719, _731);
    float _735 = _701 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _737 = _735 * 0.5;
    float _739 = _711 * _729;
    float _741 = _711 * _733;
    float _743 = fma(_721, _719, _739);
    float _745 = fma(_721, _715, _741);
    float _747 = fma(_737, _611, _743);
    float _749 = fma(_737, _607, _745);
    float _751 = _607 * _719;
    float _753 = _325 + _747;
    float _755 = _317 + _749;
    float _757 = _473 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _759 = -_751;
    float _761 = fma(_611, _715, _759);
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _765 = _753 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _769 = _755 + _767;
    float _771 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[11].x, _757);
    float _773 = _711 * _761;
    float _775 = _765 * _765;
    float _777 = _473 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _771);
    float _781 = fma(_721, _717, _773);
    float _783 = fma(_769, _769, _775);
    float _785 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _787 = _779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _789 = fma(_737, _609, _781);
    float _791 = sqrt(_783);
    float _793 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _785);
    float _795 = _301 + _789;
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _799 = 1.0 / _787;
    float _801 = _797 + _787;
    bool _803 = _791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _715;
    float _807 = _775;
    float _809 = _755;
    if (!_803)
    {
        _805 = _755;
    }
    float _811 = _805;
    float _813 = _811;
    if (!_803)
    {
        _807 = _753;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_803)
    {
        _809 = _795;
    }
    float _819 = _809;
    bool _821 = !_803;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _791 + _827;
        float _831 = rsqrt(_783);
        float _833 = _829 * _825;
        float _835 = _795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = sin(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = fma(_841, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _849 = _831 * _847;
        float _851 = _845 + (-1.0);
        float _853 = fma(_769, _849, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _855 = fma(_765, _849, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _857 = _851 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = fma(_795, _845, _857);
        _813 = _853;
        _823 = _859;
        _817 = _855;
    }
    float _861 = _813;
    float _863 = _823;
    float _865 = _817;
    float _867 = -_461;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _871 = -_459;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _875 = -_475;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _879 = _801 * _799;
    float _881 = _879 * 0.5;
    float _883 = _873;
    float _885 = _869;
    float _887 = _877;
    if (!_675)
    {
        float _889 = _485 * _485;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _893 = -_325;
        float _895 = _893 + _865;
        float _897 = -_317;
        float _899 = _897 + _861;
        float _901 = fma(_493, _493, _889);
        float _903 = fma(_501, _501, _901);
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _907 = sqrt(_903);
        float _909 = _891 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _911 = 1.0 / _701;
        float _913 = precise::min(_907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _915 = _913 * _905;
        float _917 = _915 * _911;
        float _919 = -_301;
        float _921 = _919 + _863;
        float _923 = _909 * _917;
        float _925 = _895 * _917;
        float _927 = fma(_899, _923, _479);
        float _929 = fma(_921, _923, _473);
        float _931 = fma(_909, _925, _489);
        _883 = _929;
        _885 = _927;
        _887 = _931;
    }
    float _933 = _883;
    float _935 = _885;
    float _937 = _887;
    float _939 = _933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _941 = _933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _943 = _933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = _933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].x, _939);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].x, _941);
    float _951 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _953 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[1].z, _947);
    float _957 = _947;
    if (_693)
    {
        _957 = 1.0;
    }
    float _959 = _957;
    float _961 = _959;
    if (!_693)
    {
        float _963 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _965 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _963);
        float _967 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _971 = 1.0 / _965;
        float _973 = 1.0 / _969;
        float _975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_971, _975, _977);
        float _981 = _979 * _973;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _961 = _983;
    }
    float _985 = _961;
    float _987 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[0].z, _949);
    float _989 = _955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _991 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[2].z, _951);
    float _993 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[3].z, _953);
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _997 = _989 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _999 = _989 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1001 = _989 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1003 = _989 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1005 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _997);
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _999);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1001);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1003);
    float _1015 = _993 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1017 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1007);
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1009);
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1011);
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1013);
    bool _1025 = _985 > 0.0;
    bool _1027 = isnan(_985);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan(0.0);
    bool _1033 = _1029 || _1031;
    float _1035 = _985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1037 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1017);
    float _1039 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1019);
    float _1041 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1023);
    float _1043 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1021);
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1047 = _1037 + _1041;
    float _1049 = _1043 + _1041;
    float _1051 = _1041 * 0.5;
    float _1053 = _1047 * 0.5;
    float _1055 = _1049 * 0.5;
    float _1057 = fma(_1039, -0.5, _1051);
    out.m_33.x = _1045;
    out.gl_Position.x = _1037;
    out.gl_Position.y = _1039;
    out.gl_Position.z = _1043;
    out.gl_Position.w = _1041;
    out.m_50.x = _1053;
    out.m_50.y = _1057;
    out.m_50.z = _1055;
    out.m_50.w = _1041;
    if (_1033)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1059 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1059;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _77 = as_type<float>(_69);
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _79 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1116 = as_type<float>(_85);
        out.gl_Position.z = _1116;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _77 = _105;
    }
    float _107 = _77;
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
        float _1185 = as_type<float>(_121);
        out.gl_Position.z = _1185;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = in.m_40.y;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_42.w;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    int _151 = as_type<int>(_123) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_123) & 2;
    bool _157 = _155 != 0;
    float _159 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = _125 > 0.5;
    float _163 = _125;
    float _165 = _159;
    if (!_135)
    {
        float _167 = _159 * _159;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    bool _173 = !_153;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_157;
    float _179 = _177 ? (-0.5) : 0.5;
    float _181 = _171;
    if (!_135)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    bool _187 = !_135;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _159 * _193;
        float _203 = exp2(_201);
        float _205 = _199 * 0.693147182464599609375;
        float _207 = 1.0 / _205;
        float _209 = 1.0 / _197;
        float _211 = _203 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _207, _159);
        float _217 = _215 * _209;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
    }
    float _221 = _189;
    bool _223 = !_135;
    if (!_223)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = 1.0 / _231;
        float _235 = _159 * _227;
        float _237 = exp2(_235);
        float _239 = -_237;
        float _241 = _239 + 1.0;
        float _243 = _241 * _233;
        _165 = _243;
    }
    float _245 = _165;
    float _247 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _251 = in.m_40.x;
    float _253 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _255 = fma(_245, _141, _247);
    float _257 = fma(_245, _139, _249);
    float _259 = in.m_40.w;
    float _261 = fma(_255, _137, _147);
    float _263 = fma(_245, _143, _253);
    float _265 = fma(_257, _137, _145);
    float _267 = in.m_40.z;
    float _269 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _273 = _271 != 0;
    float _275 = fma(_263, _137, _149);
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _279 = _277 != 0;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].x, _269);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _285 = _283 != 0;
    float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _291 = _289 != 0;
    float _293 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _295 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    float _297 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _299 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].x, _293);
    float _301 = _295 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _303 = _251 > 0.5;
    float _305 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].x, _297);
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _299);
    float _309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _311 = _301 + _309;
    float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _315 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _305);
    float _317 = _307 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _319 = _311 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _321 = -_175;
    int _323 = _303 ? as_type<int>(_321) : as_type<int>(_175);
    float _325 = _315 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _329 = _317 + _327;
    bool _331 = _259 > 0.5;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _335 = _267 > 0.5;
    float _337 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[28].x, _319);
    float _339 = -_179;
    int _341 = _161 ? as_type<int>(_339) : as_type<int>(_179);
    float _343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _345 = _325 + _343;
    float _347 = -_179;
    int _349 = _331 ? as_type<int>(_347) : as_type<int>(_179);
    bool _351 = !_273;
    float _353 = _351 ? _175 : as_type<float>(_323);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c8)._m0[28].z, _337);
    bool _357 = !_279;
    float _359 = _357 ? _179 : as_type<float>(_341);
    float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _363 = -_175;
    int _365 = _335 ? as_type<int>(_363) : as_type<int>(_175);
    float _367 = _353 + 0.5;
    bool _369 = !_291;
    float _371 = _369 ? _179 : as_type<float>(_349);
    float _373 = -_359;
    float _375 = _373 + 0.5;
    bool _377 = !_285;
    float _379 = _377 ? _175 : as_type<float>(_365);
    float _381 = _367 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _383 = _355 >= 0.0;
    float _385 = -_371;
    float _387 = _385 + 0.5;
    float _389 = _375 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _391 = _379 + 0.5;
    float _393 = _387 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _395 = _311 * _311;
    float _397 = _391 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _399 = _389 * _313;
    float _401 = _393 * _333;
    float _403 = fma(_329, _329, _395);
    float _405 = _397 * _287;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = fma(_345, _345, _403);
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = rsqrt(_409);
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _421 = _405;
    if (_383)
    {
        _419 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _423 = _419;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _431 = _381 * _361;
    float _433 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _435 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _445 = as_type<int>(_423);
    if (_383)
    {
        float _447 = _423 * 5.0;
        _445 = as_type<int>(_447);
    }
    int _449 = _445;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _457 = _455 != 0;
    out.m_44.x = _433;
    out.m_44.y = _435;
    out.m_44.z = _437;
    out.m_44.w = _411;
    float _459 = _311 * _415;
    float _461 = _329 * _415;
    out.m_46.x = _431;
    out.m_46.y = _399;
    out.m_46.z = _405;
    out.m_46.w = _401;
    bool _463 = !_453;
    int _465 = _463 ? 0 : 1;
    bool _467 = !_457;
    int _469 = _467 ? 0 : 1;
    out.m_48.x = _439;
    out.m_48.y = _441;
    out.m_48.z = _443;
    if (_383)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1785 = as_type<float>(_449);
        out.gl_Position.z = _1785;
    }
    if (_383)
    {
        out.m_33.x = 0.0;
    }
    if (_383)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _471 = -_459;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _301);
    float _475 = _345 * _415;
    float _477 = -_461;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _317);
    float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _485 = _473 + _483;
    float _487 = -_475;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _493 = _479 + _491;
    float _495 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _497 = _485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _501 = _489 + _499;
    float _503 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _497);
    float _505 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _503);
    float _507 = _495 * _481;
    bool _509 = _505 >= 0.0;
    if (_509)
    {
        _421 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _511 = _421;
    int _513 = as_type<int>(_511);
    if (_509)
    {
        out.m_33.x = 0.0;
    }
    if (_509)
    {
        float _515 = _511 * 5.0;
        _513 = as_type<int>(_515);
    }
    int _517 = _513;
    if (_509)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1891 = as_type<float>(_517);
        out.gl_Position.z = _1891;
    }
    if (_509)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _519 = -_301;
    float _521 = _519 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _523 = -_317;
    float _525 = _523 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _527 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[20].x, _507);
    float _529 = -_325;
    float _531 = _529 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _533 = _521 * _521;
    float _535 = floor(_527);
    float _537 = -_459;
    float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    float _541 = fma(_525, _525, _533);
    int _543 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _545 = _543 != 0;
    float _547 = _527 * 6.283185482025146484375;
    int _549 = abs(_465);
    float _551 = fma(_531, _531, _541);
    float _553 = -_461;
    float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _329);
    float _557 = _547 * 0.15915493667125701904296875;
    float _559 = _539 * _539;
    float _561 = -_475;
    float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _565 = rsqrt(_551);
    float _567 = fma(_555, _555, _559);
    float _569 = float(_549);
    float _571 = -_535;
    float _573 = _527 + _571;
    bool _575 = !_545;
    int _577 = _575 ? 0 : 1;
    float _579 = fma(_563, _563, _567);
    float _581 = in.m_42.y;
    float _583 = _557 * 6.283185482025146484375;
    float _585 = cos(_583);
    float _587 = -_573;
    float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _591 = abs(_577);
    float _593 = in.m_42.x;
    bool _595 = _573 < 0.5;
    float _597 = float(_595);
    float _599 = abs(_589);
    float _601 = _569 * _599;
    float _603 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _607 = _525 * _565;
    float _609 = _521 * _565;
    float _611 = _531 * _565;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _615 = _607 * _613;
    int _617 = abs(_469);
    float _619 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _621 = _609 * _619;
    float _623 = -_597;
    float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _627 = fma(_585, 0.5, 0.5);
    float _629 = float(_591);
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _633 = _611 * _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _637 = -_615;
    float _639 = fma(_611, _635, _637);
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _643 = -_621;
    float _645 = fma(_607, _641, _643);
    float _647 = -_627;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _653 = -_633;
    float _655 = fma(_609, _651, _653);
    float _657 = _639 * _639;
    float _659 = sqrt(_579);
    float _661 = float(_617);
    float _663 = fma(_629, _649, _601);
    float _665 = fma(_655, _655, _657);
    bool _667 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _669 = isnan(0.5);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _675 = _671 || _673;
    float _677 = abs(_625);
    float _679 = fma(_661, _677, _663);
    float _681 = fma(_645, _645, _665);
    float _683 = _581 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _685 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _687 = isnan(0.5);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _693 = _689 || _691;
    float _695 = _679 * _683;
    float _697 = rsqrt(_681);
    float _699 = _593 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _701 = _415 * _659;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _705 = _679 * _699;
    float _707 = _701 * _703;
    float _709 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _711 = _603 * _707;
    float _713 = _701 * _709;
    float _715 = _655 * _697;
    float _717 = _639 * _697;
    float _719 = _645 * _697;
    float _721 = _605 * _713;
    float _723 = _609 * _715;
    float _725 = _611 * _717;
    float _727 = -_723;
    float _729 = fma(_607, _717, _727);
    float _731 = -_725;
    float _733 = fma(_609, _719, _731);
    float _735 = _701 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _737 = _735 * 0.5;
    float _739 = _711 * _729;
    float _741 = _711 * _733;
    float _743 = fma(_721, _719, _739);
    float _745 = fma(_721, _715, _741);
    float _747 = fma(_737, _611, _743);
    float _749 = fma(_737, _607, _745);
    float _751 = _607 * _719;
    float _753 = _325 + _747;
    float _755 = _317 + _749;
    float _757 = _473 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _759 = -_751;
    float _761 = fma(_611, _715, _759);
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _765 = _753 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _769 = _755 + _767;
    float _771 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[11].x, _757);
    float _773 = _711 * _761;
    float _775 = _765 * _765;
    float _777 = _473 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _771);
    float _781 = fma(_721, _717, _773);
    float _783 = fma(_769, _769, _775);
    float _785 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _787 = _779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _789 = fma(_737, _609, _781);
    float _791 = sqrt(_783);
    float _793 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _785);
    float _795 = _301 + _789;
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _799 = 1.0 / _787;
    float _801 = _797 + _787;
    bool _803 = _791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _715;
    float _807 = _775;
    float _809 = _755;
    if (!_803)
    {
        _805 = _755;
    }
    float _811 = _805;
    float _813 = _811;
    if (!_803)
    {
        _807 = _753;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_803)
    {
        _809 = _795;
    }
    float _819 = _809;
    bool _821 = !_803;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _791 + _827;
        float _831 = rsqrt(_783);
        float _833 = _829 * _825;
        float _835 = _795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = sin(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = fma(_841, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _849 = _831 * _847;
        float _851 = _845 + (-1.0);
        float _853 = fma(_769, _849, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _855 = fma(_765, _849, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _857 = _851 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = fma(_795, _845, _857);
        _813 = _853;
        _823 = _859;
        _817 = _855;
    }
    float _861 = _813;
    float _863 = _823;
    float _865 = _817;
    float _867 = -_461;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _871 = -_459;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _875 = -_475;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _879 = _801 * _799;
    float _881 = _879 * 0.5;
    float _883 = _873;
    float _885 = _869;
    float _887 = _877;
    if (!_675)
    {
        float _889 = _485 * _485;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _893 = -_325;
        float _895 = _893 + _865;
        float _897 = -_317;
        float _899 = _897 + _861;
        float _901 = fma(_493, _493, _889);
        float _903 = fma(_501, _501, _901);
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _907 = sqrt(_903);
        float _909 = _891 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _911 = 1.0 / _701;
        float _913 = precise::min(_907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _915 = _913 * _905;
        float _917 = _915 * _911;
        float _919 = -_301;
        float _921 = _919 + _863;
        float _923 = _909 * _917;
        float _925 = _895 * _917;
        float _927 = fma(_899, _923, _479);
        float _929 = fma(_921, _923, _473);
        float _931 = fma(_909, _925, _489);
        _883 = _929;
        _885 = _927;
        _887 = _931;
    }
    float _933 = _883;
    float _935 = _885;
    float _937 = _887;
    float _939 = _933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _941 = _933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _943 = _933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = _933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].x, _939);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].x, _941);
    float _951 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _953 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].x, _945);
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[1].z, _947);
    float _957 = _947;
    if (_693)
    {
        _957 = 1.0;
    }
    float _959 = _957;
    float _961 = _959;
    if (!_693)
    {
        float _963 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _965 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _963);
        float _967 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _971 = 1.0 / _965;
        float _973 = 1.0 / _969;
        float _975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_971, _975, _977);
        float _981 = _979 * _973;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _961 = _983;
    }
    float _985 = _961;
    float _987 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[0].z, _949);
    float _989 = _955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _991 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[2].z, _951);
    float _993 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[3].z, _953);
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _997 = _989 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _999 = _989 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1001 = _989 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1003 = _989 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1005 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _997);
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _999);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1001);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1003);
    float _1015 = _993 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1017 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1007);
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1009);
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1011);
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1013);
    bool _1025 = _985 > 0.0;
    bool _1027 = isnan(_985);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan(0.0);
    bool _1033 = _1029 || _1031;
    float _1035 = _985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1037 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1017);
    float _1039 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1019);
    float _1041 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1023);
    float _1043 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1021);
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1047 = _1037 + _1041;
    float _1049 = _1043 + _1041;
    float _1051 = _1041 * 0.5;
    float _1053 = _1047 * 0.5;
    float _1055 = _1049 * 0.5;
    float _1057 = fma(_1039, -0.5, _1051);
    out.m_33.x = _1045;
    out.gl_Position.x = _1037;
    out.gl_Position.y = _1039;
    out.gl_Position.z = _1043;
    out.gl_Position.w = _1041;
    out.m_50.x = _1053;
    out.m_50.y = _1057;
    out.m_50.z = _1055;
    out.m_50.w = _1041;
    if (_1033)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1059 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1059;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

