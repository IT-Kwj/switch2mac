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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_62 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_52 [[attribute(3)]];
    float4 m_46 [[attribute(5)]];
    float4 m_34 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_41 [[attribute(8)]];
    float4 m_56 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1865 = false;
    bool _1075 = false;
    bool _1063 = false;
    bool _719 = false;
    bool _553 = false;
    bool _405 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_34.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_37.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2026 = as_type<float>(_99);
        out.gl_Position.z = _2026;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_39.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_37.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_135);
        out.gl_Position.z = _2094;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_41.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_46.x;
    float _147 = in.m_46.y;
    float _149 = in.m_46.z;
    float _151 = in.m_48.x;
    float _153 = in.m_48.y;
    float _155 = in.m_48.z;
    float _157 = in.m_50.x;
    float _159 = in.m_50.y;
    float _161 = in.m_50.z;
    float _163 = _141 * _139;
    float _165 = in.m_52.x;
    float _167 = in.m_52.y;
    float _169 = in.m_52.z;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _173 = as_type<int>(_143) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_143) & 2;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = floor(_171);
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _181 * 0.15915493667125701904296875;
    bool _191 = !_179;
    int _193 = _191 ? (-1090519040) : 1056964608;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _147 * _153;
    bool _205 = !_175;
    int _207 = _205 ? (-1090519040) : 1056964608;
    float _209 = _189 * 6.283185482025146484375;
    float _211 = cos(_209);
    float _213 = _147 * _159;
    bool _215 = !_197;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_145, _151, _203);
    bool _221 = !_187;
    int _223 = _221 ? 0 : 1;
    float _225 = _147 * _167;
    float _227 = fma(_145, _157, _213);
    out.m_54.x = as_type<float>(_207);
    out.m_54.y = as_type<float>(_193);
    float _229 = -_183;
    float _231 = _171 + _229;
    float _233 = fma(_145, _165, _225);
    int _235 = abs(_217);
    float _237 = fma(_149, _161, _227);
    int _239 = abs(_223);
    float _241 = -_231;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = fma(_211, 0.5, 0.5);
    float _249 = float(_235);
    bool _251 = !_201;
    int _253 = _251 ? 0 : 1;
    bool _255 = _231 < 0.5;
    float _257 = float(_255);
    float _259 = abs(_243);
    float _261 = _249 * _259;
    int _263 = abs(_253);
    float _265 = -_247;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = float(_239);
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = float(_263);
    float _277 = fma(_149, _169, _233);
    float _279 = fma(_269, _267, _261);
    float _281 = fma(_149, _155, _219);
    float _283 = abs(_273);
    float _285 = fma(_275, _283, _279);
    bool _287 = !_245;
    float _303;
    if (!_287)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_83);
        float _309 = 1.0 / _307;
        float _311 = _117 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    bool _319 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_313);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -_329;
    float _337 = _335 + 1.0;
    bool _339 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_313);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _357 = 1.0 / _333;
    float _359 = _349 * _337;
    float _361 = -_349;
    float _363 = _361 + 1.0;
    float _365 = _317 * _357;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = fma(_353, _365, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_369, _365, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _371 * _359;
    float _377 = _373 * _359;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[144].x, _379);
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[144].y, _381);
    bool _387 = !_355;
    float _403;
    if (!_387)
    {
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_83);
        float _409 = 1.0 / _407;
        float _411 = _117 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    bool _455 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _457 = isnan(_413);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = 1.0 / _421;
    float _469 = -_433;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _475 = _413 + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _479 = _449 * _471;
    float _481 = -_449;
    float _483 = _481 + 1.0;
    float _485 = 1.0 / _437;
    float _487 = _453 * _467;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _493 = fma(_487, _417, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _495 = _491 * _485;
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = _493 * _479;
    float _503 = fma(_495, _475, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _505 = _433 * _499;
    float _507 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _501);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _511 = fma(_503, _505, _507);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[117].x, _511);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_56.x;
    float _527 = in.m_56.y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _521;
    out.m_58.y = _517;
    out.m_58.z = _523;
    out.m_58.w = _529;
    float _531 = _385 * _527;
    float _533 = _383 * _525;
    bool _535 = !_477;
    float _551;
    if (!_535)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _539 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_83);
        float _557 = 1.0 / _555;
        float _559 = _117 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _565 = _561 + _563;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _581 = _561 + _579;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _603 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _605 = isnan(_561);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_577;
    float _617 = _615 + 1.0;
    float _619 = 1.0 / _597;
    float _621 = _613 * _617;
    float _623 = -_613;
    float _625 = _623 + 1.0;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _627;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _633 = 1.0 / _601;
    float _635 = _593 * _625;
    float _637 = -_593;
    float _639 = _637 + 1.0;
    float _641 = _565 * _619;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _647;
    float _651 = fma(_629, _641, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _653 = fma(_645, _641, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _655 = fma(_649, _641, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _657 = _581 * _633;
    float _659 = _651 * _635;
    float _661 = _653 * _635;
    float _663 = _655 * _635;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _677 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].x, _659);
    float _679 = fma(_667, _657, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _681 = fma(_671, _657, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _683 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].y, _661);
    float _685 = fma(_675, _657, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _687 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].z, _663);
    float _689 = fma(_679, _621, _677);
    float _691 = fma(_681, _621, _683);
    float _693 = fma(_685, _621, _687);
    float _695 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].x, _689);
    float _697 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].y, _691);
    float _699 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].z, _693);
    bool _701 = !_631;
    float _717;
    if (!_701)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _705 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _709 = _707 * _703;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _717 = _715;
        _719 = true;
    }
    else
    {
        float _721 = float(_83);
        float _723 = 1.0 / _721;
        float _725 = _117 * _723;
        _717 = _725;
    }
    _719 = false;
    float _727 = _717;
    float _729 = in.m_34.x;
    float _731 = in.m_34.y;
    float _733 = in.m_34.z;
    float _735 = _285 * _531;
    float _737 = in.m_50.w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_193));
    float _745 = in.m_48.w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = 1.0 / _741;
    float _753 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = in.m_52.w;
    float _757 = _699 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _759 = _753 * _743;
    float _761 = 1.0 / _749;
    float _763 = _159 * _731;
    float _765 = _153 * _731;
    float _767 = _167 * _731;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _769;
    float _773 = fma(_157, _729, _763);
    float _775 = fma(_151, _729, _765);
    float _777 = fma(_165, _729, _767);
    float _779 = _771 * _751;
    float _781 = fma(_161, _733, _773);
    float _783 = fma(_155, _733, _775);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _787 = _727 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _793 = _781 + _737;
    float _795 = fma(_169, _733, _777);
    float _797 = _783 + _745;
    float _799 = fma(_779, _787, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _801 = _793 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _803 = _791 * _761;
    bool _805 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _807 = isnan(_727);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _795 + _755;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _821 = _797 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _823 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    bool _825 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _827 = isnan(_727);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_815;
    float _839 = _837 + 1.0;
    float _841 = _817 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].x, _823);
    float _845 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _847 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _849 = _835 * _839;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].x, _843);
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].y, _845);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _861 = _727 + _859;
    float _863 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    bool _865 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _867 = isnan(_727);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].y, _857);
    float _879 = fma(_803, _861, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _881 = _863 * _819;
    float _883 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _887 = _877 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _889 = _875 * _855;
    float _891 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].z, _883);
    float _893 = -_875;
    float _895 = _893 + 1.0;
    float _897 = _887 * _847;
    float _899 = _799 * _889;
    float _901 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].z, _891);
    float _903 = fma(_881, 0.5, 0.5);
    float _905 = fma(_897, 0.5, 0.5);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[131].x, _899);
    float _909 = _901 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _911 = floor(_903);
    float _913 = _285 * _533;
    float _915 = fma(_879, _849, _907);
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_207));
    float _919 = _909 * _885;
    float _921 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _923 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _925 = floor(_905);
    float _927 = fma(_919, 0.5, 0.5);
    float _929 = _921 * _917;
    float _931 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _933 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[133].x, _915);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _923);
    float _939 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _931);
    float _941 = floor(_927);
    float _943 = -_911;
    float _945 = _903 + _943;
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _949 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _951 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _953 = fma(_945, 2.0, -1.0);
    float _955 = _695 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _959 = -_925;
    float _961 = _905 + _959;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _939);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _947);
    float _967 = _953 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _969 = fma(_961, 2.0, -1.0);
    float _971 = _697 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _973 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _977 = _969 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _979 = -_941;
    float _981 = _927 + _979;
    float _983 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _985 = _963 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _989 = fma(_981, 2.0, -1.0);
    float _991 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _993 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _995 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].y, _987);
    float _997 = _989 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _999 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].x, _991);
    float _1001 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].z, _993);
    bool _1003 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(1.0);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].y, _995);
    float _1015 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].x, _999);
    float _1017 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1001);
    float _1019 = _957 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1021 = _965 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1025 = _1013 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_60.x = _973;
    out.m_60.y = _983;
    out.m_60.z = _975;
    out.m_60.w = _951;
    float _1029 = _1021 + _1027;
    float _1031 = _1019 + _1023;
    float _1033 = _985 + _1025;
    float _1035 = _975;
    float _1037 = _1019;
    float _1039 = _993;
    float _1041 = _965;
    float _1043 = _1019;
    float _1045 = _965;
    float _1047 = _953;
    float _1049 = _969;
    float _1051 = _989;
    float _1053 = _985;
    float _1055 = _1025;
    float _1057 = _1023;
    float _1067;
    float _1069;
    float _1071;
    float _1073;
    if (!_1011)
    {
        bool _1059 = _1025 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1061 = !_1059;
        _1063 = _1061;
        if (!_1063)
        {
            float _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1067 = _1065;
            _1069 = 0.0;
            _1071 = 0.0;
            _1073 = 0.0;
            _1075 = true;
        }
    }
    if ((!_1075) || _1063)
    {
        bool _1111;
        if (!_1063)
        {
            bool _1077 = _1025 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1079 = isnan(_1025);
            bool _1081 = _1077 || _1079;
            bool _1083 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1085 = _1081 || _1083;
            bool _1087 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1089 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1091 = !_1085;
            bool _1093 = _1089 && _1091;
            if (_1093)
            {
                _1035 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1095 = _1035;
            float _1097 = _1095;
            if (_1093)
            {
                _1037 = 0.0;
            }
            float _1099 = _1037;
            _1043 = _1099;
            _1069 = _1099;
            if (_1093)
            {
                _1039 = 0.0;
            }
            float _1101 = _1039;
            _1071 = _1101;
            if (_1093)
            {
                float _1103 = _1095 * 5.0;
                _1097 = _1103;
            }
            float _1105 = _1097;
            _1067 = _1105;
            if (_1093)
            {
                _1041 = 0.0;
            }
            float _1107 = _1041;
            bool _1109 = !_1085;
            _1111 = _1109 && _1087;
            _1045 = _1107;
            _1073 = _1107;
        }
        if ((!_1111) || _1063)
        {
            _1063 = false;
            float _1113 = _1043;
            float _1115 = _1045;
            bool _1117 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1119 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1121 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1123 = _1021;
            float _1125 = _1113;
            float _1127 = _1115;
            _1067 = _1029;
            _1071 = _1033;
            if (_1117)
            {
                float _1129 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1123 = _1129;
            }
            float _1131 = _1123;
            if (_1117)
            {
                float _1133 = abs(_953);
                float _1135 = -_1133;
                float _1137 = _1135 + 1.0;
                _1047 = _1137;
            }
            float _1139 = _1047;
            if (_1119)
            {
                float _1141 = abs(_969);
                float _1143 = -_1141;
                float _1145 = _1143 + 1.0;
                _1049 = _1145;
            }
            float _1147 = _1049;
            if (!_1117)
            {
                _1125 = 1.0;
            }
            float _1149 = _1125;
            float _1151 = _1149;
            if (_1121)
            {
                float _1153 = abs(_989);
                float _1155 = -_1153;
                float _1157 = _1155 + 1.0;
                _1051 = _1157;
            }
            float _1159 = _1051;
            if (!_1119)
            {
                _1053 = 1.0;
            }
            float _1161 = _1053;
            float _1163 = _1161;
            if (!_1121)
            {
                _1127 = 1.0;
            }
            float _1165 = _1127;
            float _1167 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1169 = _1165;
            if (_1119)
            {
                float _1171 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1167 = _1171;
            }
            float _1173 = _1167;
            float _1175 = _983;
            if (_1121)
            {
                float _1177 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1175 = _1177;
            }
            float _1179 = _1175;
            if (_1117)
            {
                float _1181 = _1139 * _1131;
                float _1183 = precise::clamp(_1181, 0.0, 1.0);
                _1151 = _1183;
            }
            float _1185 = _1151;
            if (_1119)
            {
                float _1187 = _1147 * _1173;
                float _1189 = precise::clamp(_1187, 0.0, 1.0);
                _1163 = _1189;
            }
            float _1191 = _1163;
            float _1193 = _1185 * _1191;
            _1069 = _1031;
            if (_1121)
            {
                float _1195 = _1159 * _1179;
                float _1197 = precise::clamp(_1195, 0.0, 1.0);
                _1169 = _1197;
            }
            float _1199 = _1169;
            float _1201 = _1193 * _1199;
            _1073 = _1201;
        }
    }
    _1075 = false;
    float _1203 = _1067;
    float _1205 = _1069;
    float _1207 = _1071;
    float _1209 = _1073;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1213 = _1203 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1217 = _1205 + _1215;
    float _1219 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1221 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1223 = _1213 * _1213;
    float _1225 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1227 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1229 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1221);
    float _1231 = fma(_1217, _1217, _1223);
    float _1233 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1219);
    float _1235 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1237 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1225);
    float _1239 = sqrt(_1231);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1233);
    float _1243 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1227);
    float _1245 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1247 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1235);
    float _1249 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1251 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1237);
    float _1253 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = 1.0 / _1249;
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1265 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1247);
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _1269 = _1239 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = _1267 + _1271;
    bool _1277 = !_1269;
    float _1279 = _1207;
    float _1281 = _1205;
    float _1283 = _1203;
    float _1285 = _1255;
    if (!_1277)
    {
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1291 = _1239 + _1289;
        float _1293 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = rsqrt(_1231);
        float _1297 = _1291 * _1287;
        float _1299 = _1297 * 0.15915493667125701904296875;
        float _1301 = _1299 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = _1299 * 6.283185482025146484375;
        float _1307 = cos(_1305);
        float _1309 = fma(_1303, _1293, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1311 = _1295 * _1309;
        float _1313 = _1307 + (-1.0);
        float _1315 = fma(_1217, _1311, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1317 = fma(_1213, _1311, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = fma(_1307, _1207, _1319);
        _1279 = _1321;
        _1281 = _1315;
        _1283 = _1317;
    }
    float _1323 = _1279;
    float _1325 = _1281;
    float _1327 = _1283;
    float _1329 = -_1025;
    float _1331 = _1329 + _1323;
    float _1333 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1275);
    float _1335 = -_1023;
    float _1337 = _1335 + _1325;
    float _1339 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1341 = _1331 * _1331;
    float _1343 = -_1027;
    float _1345 = _1343 + _1327;
    float _1347 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1339);
    float _1349 = fma(_1337, _1337, _1341);
    float _1351 = 1.0 / _1333;
    float _1353 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1355 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = fma(_1345, _1345, _1349);
    out.m_62.y = 1.0;
    float _1359 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1353);
    float _1361 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1363 = sqrt(_1357);
    float _1365 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1359);
    float _1367 = _1361 + _1249;
    float _1369 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1365);
    float _1371 = _1367 * _1257;
    float _1373 = _1371 * 0.5;
    float _1375 = _1369 * _1351;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1379 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1377);
    bool _1381 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(0.5);
    bool _1389 = _1385 || _1387;
    float _1391 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1393 = _1375 > 0.0;
    bool _1395 = _1363 > 0.0;
    float _1397 = 1.0 / _1379;
    bool _1399 = _1375 < 1.0;
    bool _1401 = _1399 && _1393;
    bool _1403 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    float _1413 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1417 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1419 = _1391;
    float _1421 = _1323;
    float _1423 = _1327;
    float _1425 = _1325;
    if (!_1395)
    {
        _1419 = _1325;
    }
    float _1427 = _1419;
    float _1429 = _1427;
    if (!_1395)
    {
        _1285 = _1327;
    }
    float _1431 = _1285;
    bool _1433 = !_1395;
    float _1435 = _1431;
    if (!_1433)
    {
        float _1437 = _237 * _237;
        float _1439 = rsqrt(_1357);
        float _1441 = fma(_281, _281, _1437);
        float _1443 = fma(_277, _277, _1441);
        float _1445 = sqrt(_1443);
        float _1447 = _1331 * _1439;
        float _1449 = _1337 * _1439;
        float _1451 = _1345 * _1439;
        bool _1453 = _1445 > 0.0;
        float _1455 = _1445;
        float _1457 = _1439;
        if (!_1453)
        {
            _1455 = _1325;
        }
        float _1459 = _1455;
        _1429 = _1459;
        if (!_1453)
        {
            _1457 = _1327;
        }
        float _1461 = _1457;
        bool _1463 = !_1453;
        _1435 = _1461;
        if (!_1463)
        {
            float _1465 = rsqrt(_1443);
            float _1467 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1469 = _237 * _1465;
            float _1471 = _281 * _1465;
            float _1473 = _277 * _1465;
            float _1475 = _1447 * _1469;
            float _1477 = fma(_1449, _1471, _1475);
            float _1479 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1481 = fma(_1451, _1473, _1477);
            float _1483 = _1481 * _1479;
            float _1485 = fma(_281, _1483, _1325);
            float _1487 = fma(_237, _1483, _1323);
            float _1489 = fma(_277, _1483, _1327);
            _1429 = _1485;
            _1435 = _1489;
            _1421 = _1487;
        }
    }
    float _1491 = _1429;
    float _1493 = _1435;
    float _1495 = _1421;
    float _1497 = _1495;
    if (_1411)
    {
        _1423 = _1491;
    }
    float _1499 = _1423;
    float _1501 = _1499;
    if (_1411)
    {
        _1425 = _1493;
    }
    float _1503 = _1425;
    float _1505 = _1503;
    if (!_1411)
    {
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1509 = _1025 + _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1513 = _1023 + _1511;
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1517 = -_1027;
        float _1519 = _1517 + _1493;
        float _1521 = _1509 * _1509;
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1525 = _1027 + _1523;
        float _1527 = fma(_1513, _1513, _1521);
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1531 = fma(_1525, _1525, _1527);
        float _1533 = sqrt(_1531);
        float _1535 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1529;
        float _1541 = -_1023;
        float _1543 = _1541 + _1491;
        float _1545 = _1535 * _1539;
        float _1547 = -_1025;
        float _1549 = _1547 + _1495;
        float _1551 = fma(_1543, _1545, _1023);
        float _1553 = fma(_1549, _1545, _1025);
        float _1555 = fma(_1519, _1545, _1027);
        _1497 = _1553;
        _1501 = _1551;
        _1505 = _1555;
    }
    float _1557 = _1497;
    float _1559 = _1501;
    float _1561 = _1505;
    if (_1389)
    {
        _1055 = 1.0;
    }
    float _1563 = _1055;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1567 = _1397 * _1565;
    float _1569 = _1563;
    if (_1389)
    {
        _1057 = 1.0;
    }
    float _1571 = _1057;
    float _1573 = _1571;
    if (!_1389)
    {
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = _1577 * 6.283185482025146484375;
        float _1581 = cos(_1579);
        float _1583 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1585 = _1583 * 0.15915493667125701904296875;
        float _1587 = _1577 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = 1.0 / _1581;
        float _1593 = _1585 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = _1585 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = 1.0 / _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1609 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1607;
        float _1611 = 1.0 / _1609;
        float _1613 = _1601 * _1605;
        float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1617 = fma(_1567, _1613, _1615);
        float _1619 = _1617 * _1611;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        _1569 = _1621;
    }
    float _1623 = _1569;
    if (!_1389)
    {
        float _1625 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1627 = _1625 * 0.15915493667125701904296875;
        float _1629 = _1627 * 6.283185482025146484375;
        float _1631 = cos(_1629);
        float _1633 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1635 = _1633 * 0.15915493667125701904296875;
        float _1637 = _1627 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = 1.0 / _1631;
        float _1643 = _1635 * 6.283185482025146484375;
        float _1645 = cos(_1643);
        float _1647 = _1639 * _1641;
        float _1649 = _1635 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = _1645 * _1647;
        float _1655 = 1.0 / _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1659 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1657;
        float _1661 = 1.0 / _1659;
        float _1663 = _1651 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1667 = fma(_1567, _1663, _1665);
        float _1669 = _1667 * _1661;
        float _1671 = precise::clamp(_1669, 0.0, 1.0);
        float _1673 = -_1671;
        float _1675 = _1673 + 1.0;
        _1573 = _1675;
    }
    float _1677 = _1573;
    float _1679 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1681 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1683 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1685 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1687 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1679);
    float _1689 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1691 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1683);
    float _1693 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1685);
    float _1695 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1687);
    float _1697 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1689);
    float _1699 = -_237;
    float _1701 = _1699 + _1557;
    float _1703 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1691);
    float _1705 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1707 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = -_281;
    float _1711 = _1709 + _1559;
    float _1713 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1693);
    float _1715 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1717 = -_277;
    float _1719 = _1717 + _1561;
    float _1721 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1723 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1729 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1715);
    float _1731 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1721);
    float _1733 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1723);
    float _1735 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1737 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1739 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1729);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1731);
    float _1743 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1733);
    float _1745 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1735);
    float _1747 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1739);
    float _1749 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1741);
    float _1751 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1743);
    float _1753 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1745);
    float _1755 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _1757 = 1.0 / _1747;
    float _1759 = _1749 + _1747;
    float _1761 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1755);
    float _1763 = _1623 * _1677;
    float _1765 = _1759 * 0.5;
    float _1767 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _1769 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1761);
    float _1771 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1753;
    out.gl_Position.z = _1749;
    out.gl_Position.w = _1747;
    float _1773 = _1767 + _1415;
    float _1775 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1777 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_64.z = _1765;
    out.m_64.w = _1747;
    float _1779 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1781 = _1763 * _1209;
    float _1783 = _1751 * _1757;
    float _1785 = _1753 * _1757;
    float _1787 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1777);
    float _1789 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1779);
    float _1791 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1773);
    bool _1793 = _1783 > (-1.0);
    bool _1795 = _1793 && _1401;
    float _1797 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1787);
    float _1799 = 1.0 / _1775;
    float _1801 = _1771 + _1417;
    bool _1803 = _1785 > (-1.0);
    bool _1805 = _1803 && _1795;
    float _1807 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1789);
    float _1809 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _1811 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    bool _1813 = _1783 < 1.0;
    bool _1815 = _1813 && _1805;
    float _1817 = _1781 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1819 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    bool _1821 = _1785 < 1.0;
    bool _1823 = _1821 && _1815;
    float _1825 = _1791 * _1351;
    float _1827 = _1811 * _1351;
    float _1829 = _285 * _1817;
    float _1831 = _1809 * _1799;
    float _1833 = _1819 * _1799;
    bool _1835 = !_1823;
    float _1837 = _1829;
    if (!_1835)
    {
        float _1839 = -_1827;
        float _1841 = _1785 + _1839;
        float _1843 = -_1825;
        float _1845 = _1783 + _1843;
        float _1847 = -_1831;
        float _1849 = _1783 + _1847;
        float _1851 = -_1833;
        float _1853 = _1785 + _1851;
        float _1855 = _1841 * _1841;
        float _1857 = fma(_1845, _1845, _1855);
        float _1859 = sqrt(_1857);
        bool _1861 = _1859 > 0.0;
        bool _1863 = !_1861;
        _1865 = _1863;
        if (!_1865)
        {
            float _1867 = _1853 * _1853;
            float _1869 = fma(_1849, _1849, _1867);
            float _1871 = rsqrt(_1857);
            float _1873 = sqrt(_1869);
            float _1875 = _1845 * _1871;
            float _1877 = _1841 * _1871;
            bool _1879 = _1873 > 0.0;
            bool _1881 = !_1879;
            _1865 = _1881;
            if (!_1865)
            {
                float _1883 = _921 * _1273;
                float _1885 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1887 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1267);
                float _1889 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1771);
                float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1767);
                float _1893 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1887);
                float _1895 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1889);
                float _1897 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1891);
                float _1899 = rsqrt(_1869);
                float _1901 = _1885 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1903 = 1.0 / _1893;
                float _1905 = _1853 * _1901;
                float _1907 = _1849 * _1901;
                float _1909 = _1905 * _1905;
                float _1911 = fma(_1907, _1907, _1909);
                float _1913 = _1853 * _1899;
                float _1915 = _1849 * _1899;
                float _1917 = _1895 * _1903;
                float _1919 = _1897 * _1903;
                float _1921 = sqrt(_1911);
                float _1923 = _1917 * _1917;
                float _1925 = fma(_1919, _1919, _1923);
                float _1927 = _1877 * _1913;
                float _1929 = sqrt(_1925);
                float _1931 = fma(_1875, _1915, _1927);
                float _1933 = precise::min(0.0, _1931);
                float _1935 = _1747 * _1933;
                float _1937 = fma(_1907, _1935, _1751);
                float _1939 = fma(_1921, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1929);
                float _1941 = fma(_1905, _1935, _1753);
                float _1943 = 1.0 / _1939;
                out.gl_Position.x = _1937;
                out.gl_Position.y = _1941;
                float _1945 = _1929 * _1943;
                out.m_62.y = _1945;
                _1865 = true;
            }
        }
    }
    else
    {
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1947;
        _1837 = 0.0;
    }
    _1865 = false;
    float _1949 = _1837;
    bool _1951 = _1623 > 0.0;
    bool _1953 = isnan(_1623);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = _1949 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1963 = _1677 <= 0.0;
    bool _1965 = !_1959;
    bool _1967 = _1963 || _1965;
    out.m_37.x = _1961;
    if (!_1967)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1969 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_37.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1969;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1865 = false;
    bool _1075 = false;
    bool _1063 = false;
    bool _719 = false;
    bool _553 = false;
    bool _405 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_34.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_37.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2026 = as_type<float>(_99);
        out.gl_Position.z = _2026;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_39.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_37.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_135);
        out.gl_Position.z = _2094;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_41.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_46.x;
    float _147 = in.m_46.y;
    float _149 = in.m_46.z;
    float _151 = in.m_48.x;
    float _153 = in.m_48.y;
    float _155 = in.m_48.z;
    float _157 = in.m_50.x;
    float _159 = in.m_50.y;
    float _161 = in.m_50.z;
    float _163 = _141 * _139;
    float _165 = in.m_52.x;
    float _167 = in.m_52.y;
    float _169 = in.m_52.z;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _173 = as_type<int>(_143) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_143) & 2;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = floor(_171);
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _181 * 0.15915493667125701904296875;
    bool _191 = !_179;
    int _193 = _191 ? (-1090519040) : 1056964608;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _147 * _153;
    bool _205 = !_175;
    int _207 = _205 ? (-1090519040) : 1056964608;
    float _209 = _189 * 6.283185482025146484375;
    float _211 = cos(_209);
    float _213 = _147 * _159;
    bool _215 = !_197;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_145, _151, _203);
    bool _221 = !_187;
    int _223 = _221 ? 0 : 1;
    float _225 = _147 * _167;
    float _227 = fma(_145, _157, _213);
    out.m_54.x = as_type<float>(_207);
    out.m_54.y = as_type<float>(_193);
    float _229 = -_183;
    float _231 = _171 + _229;
    float _233 = fma(_145, _165, _225);
    int _235 = abs(_217);
    float _237 = fma(_149, _161, _227);
    int _239 = abs(_223);
    float _241 = -_231;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = fma(_211, 0.5, 0.5);
    float _249 = float(_235);
    bool _251 = !_201;
    int _253 = _251 ? 0 : 1;
    bool _255 = _231 < 0.5;
    float _257 = float(_255);
    float _259 = abs(_243);
    float _261 = _249 * _259;
    int _263 = abs(_253);
    float _265 = -_247;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = float(_239);
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = float(_263);
    float _277 = fma(_149, _169, _233);
    float _279 = fma(_269, _267, _261);
    float _281 = fma(_149, _155, _219);
    float _283 = abs(_273);
    float _285 = fma(_275, _283, _279);
    bool _287 = !_245;
    float _303;
    if (!_287)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_83);
        float _309 = 1.0 / _307;
        float _311 = _117 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    bool _319 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_313);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -_329;
    float _337 = _335 + 1.0;
    bool _339 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_313);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _357 = 1.0 / _333;
    float _359 = _349 * _337;
    float _361 = -_349;
    float _363 = _361 + 1.0;
    float _365 = _317 * _357;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = fma(_353, _365, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_369, _365, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _371 * _359;
    float _377 = _373 * _359;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[144].x, _379);
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[144].y, _381);
    bool _387 = !_355;
    float _403;
    if (!_387)
    {
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_83);
        float _409 = 1.0 / _407;
        float _411 = _117 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    bool _455 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _457 = isnan(_413);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = 1.0 / _421;
    float _469 = -_433;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _475 = _413 + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _479 = _449 * _471;
    float _481 = -_449;
    float _483 = _481 + 1.0;
    float _485 = 1.0 / _437;
    float _487 = _453 * _467;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _493 = fma(_487, _417, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _495 = _491 * _485;
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = _493 * _479;
    float _503 = fma(_495, _475, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _505 = _433 * _499;
    float _507 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _501);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _511 = fma(_503, _505, _507);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[117].x, _511);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_56.x;
    float _527 = in.m_56.y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _521;
    out.m_58.y = _517;
    out.m_58.z = _523;
    out.m_58.w = _529;
    float _531 = _385 * _527;
    float _533 = _383 * _525;
    bool _535 = !_477;
    float _551;
    if (!_535)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _539 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_83);
        float _557 = 1.0 / _555;
        float _559 = _117 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _565 = _561 + _563;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _581 = _561 + _579;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _603 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _605 = isnan(_561);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_577;
    float _617 = _615 + 1.0;
    float _619 = 1.0 / _597;
    float _621 = _613 * _617;
    float _623 = -_613;
    float _625 = _623 + 1.0;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _627;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _633 = 1.0 / _601;
    float _635 = _593 * _625;
    float _637 = -_593;
    float _639 = _637 + 1.0;
    float _641 = _565 * _619;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _647;
    float _651 = fma(_629, _641, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _653 = fma(_645, _641, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _655 = fma(_649, _641, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _657 = _581 * _633;
    float _659 = _651 * _635;
    float _661 = _653 * _635;
    float _663 = _655 * _635;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _677 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].x, _659);
    float _679 = fma(_667, _657, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _681 = fma(_671, _657, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _683 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].y, _661);
    float _685 = fma(_675, _657, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _687 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].z, _663);
    float _689 = fma(_679, _621, _677);
    float _691 = fma(_681, _621, _683);
    float _693 = fma(_685, _621, _687);
    float _695 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].x, _689);
    float _697 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].y, _691);
    float _699 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].z, _693);
    bool _701 = !_631;
    float _717;
    if (!_701)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _705 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _709 = _707 * _703;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _717 = _715;
        _719 = true;
    }
    else
    {
        float _721 = float(_83);
        float _723 = 1.0 / _721;
        float _725 = _117 * _723;
        _717 = _725;
    }
    _719 = false;
    float _727 = _717;
    float _729 = in.m_34.x;
    float _731 = in.m_34.y;
    float _733 = in.m_34.z;
    float _735 = _285 * _531;
    float _737 = in.m_50.w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_193));
    float _745 = in.m_48.w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = 1.0 / _741;
    float _753 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = in.m_52.w;
    float _757 = _699 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _759 = _753 * _743;
    float _761 = 1.0 / _749;
    float _763 = _159 * _731;
    float _765 = _153 * _731;
    float _767 = _167 * _731;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _769;
    float _773 = fma(_157, _729, _763);
    float _775 = fma(_151, _729, _765);
    float _777 = fma(_165, _729, _767);
    float _779 = _771 * _751;
    float _781 = fma(_161, _733, _773);
    float _783 = fma(_155, _733, _775);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _787 = _727 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _793 = _781 + _737;
    float _795 = fma(_169, _733, _777);
    float _797 = _783 + _745;
    float _799 = fma(_779, _787, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _801 = _793 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _803 = _791 * _761;
    bool _805 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _807 = isnan(_727);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _795 + _755;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _821 = _797 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _823 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    bool _825 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _827 = isnan(_727);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_815;
    float _839 = _837 + 1.0;
    float _841 = _817 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].x, _823);
    float _845 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _847 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _849 = _835 * _839;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].x, _843);
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].y, _845);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _861 = _727 + _859;
    float _863 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    bool _865 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _867 = isnan(_727);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].y, _857);
    float _879 = fma(_803, _861, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _881 = _863 * _819;
    float _883 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _887 = _877 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _889 = _875 * _855;
    float _891 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].z, _883);
    float _893 = -_875;
    float _895 = _893 + 1.0;
    float _897 = _887 * _847;
    float _899 = _799 * _889;
    float _901 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].z, _891);
    float _903 = fma(_881, 0.5, 0.5);
    float _905 = fma(_897, 0.5, 0.5);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[131].x, _899);
    float _909 = _901 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _911 = floor(_903);
    float _913 = _285 * _533;
    float _915 = fma(_879, _849, _907);
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_207));
    float _919 = _909 * _885;
    float _921 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _923 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _925 = floor(_905);
    float _927 = fma(_919, 0.5, 0.5);
    float _929 = _921 * _917;
    float _931 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _933 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[133].x, _915);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _923);
    float _939 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _931);
    float _941 = floor(_927);
    float _943 = -_911;
    float _945 = _903 + _943;
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _949 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _951 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _953 = fma(_945, 2.0, -1.0);
    float _955 = _695 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _959 = -_925;
    float _961 = _905 + _959;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _939);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _947);
    float _967 = _953 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _969 = fma(_961, 2.0, -1.0);
    float _971 = _697 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _973 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _977 = _969 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _979 = -_941;
    float _981 = _927 + _979;
    float _983 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _985 = _963 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _989 = fma(_981, 2.0, -1.0);
    float _991 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _993 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _995 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].y, _987);
    float _997 = _989 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _999 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].x, _991);
    float _1001 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].z, _993);
    bool _1003 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(1.0);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].y, _995);
    float _1015 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].x, _999);
    float _1017 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1001);
    float _1019 = _957 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1021 = _965 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1025 = _1013 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_60.x = _973;
    out.m_60.y = _983;
    out.m_60.z = _975;
    out.m_60.w = _951;
    float _1029 = _1021 + _1027;
    float _1031 = _1019 + _1023;
    float _1033 = _985 + _1025;
    float _1035 = _975;
    float _1037 = _1019;
    float _1039 = _993;
    float _1041 = _965;
    float _1043 = _1019;
    float _1045 = _965;
    float _1047 = _953;
    float _1049 = _969;
    float _1051 = _989;
    float _1053 = _985;
    float _1055 = _1025;
    float _1057 = _1023;
    float _1067;
    float _1069;
    float _1071;
    float _1073;
    if (!_1011)
    {
        bool _1059 = _1025 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1061 = !_1059;
        _1063 = _1061;
        if (!_1063)
        {
            float _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1067 = _1065;
            _1069 = 0.0;
            _1071 = 0.0;
            _1073 = 0.0;
            _1075 = true;
        }
    }
    if ((!_1075) || _1063)
    {
        bool _1111;
        if (!_1063)
        {
            bool _1077 = _1025 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1079 = isnan(_1025);
            bool _1081 = _1077 || _1079;
            bool _1083 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1085 = _1081 || _1083;
            bool _1087 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1089 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1091 = !_1085;
            bool _1093 = _1089 && _1091;
            if (_1093)
            {
                _1035 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1095 = _1035;
            float _1097 = _1095;
            if (_1093)
            {
                _1037 = 0.0;
            }
            float _1099 = _1037;
            _1043 = _1099;
            _1069 = _1099;
            if (_1093)
            {
                _1039 = 0.0;
            }
            float _1101 = _1039;
            _1071 = _1101;
            if (_1093)
            {
                float _1103 = _1095 * 5.0;
                _1097 = _1103;
            }
            float _1105 = _1097;
            _1067 = _1105;
            if (_1093)
            {
                _1041 = 0.0;
            }
            float _1107 = _1041;
            bool _1109 = !_1085;
            _1111 = _1109 && _1087;
            _1045 = _1107;
            _1073 = _1107;
        }
        if ((!_1111) || _1063)
        {
            _1063 = false;
            float _1113 = _1043;
            float _1115 = _1045;
            bool _1117 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1119 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1121 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1123 = _1021;
            float _1125 = _1113;
            float _1127 = _1115;
            _1067 = _1029;
            _1071 = _1033;
            if (_1117)
            {
                float _1129 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1123 = _1129;
            }
            float _1131 = _1123;
            if (_1117)
            {
                float _1133 = abs(_953);
                float _1135 = -_1133;
                float _1137 = _1135 + 1.0;
                _1047 = _1137;
            }
            float _1139 = _1047;
            if (_1119)
            {
                float _1141 = abs(_969);
                float _1143 = -_1141;
                float _1145 = _1143 + 1.0;
                _1049 = _1145;
            }
            float _1147 = _1049;
            if (!_1117)
            {
                _1125 = 1.0;
            }
            float _1149 = _1125;
            float _1151 = _1149;
            if (_1121)
            {
                float _1153 = abs(_989);
                float _1155 = -_1153;
                float _1157 = _1155 + 1.0;
                _1051 = _1157;
            }
            float _1159 = _1051;
            if (!_1119)
            {
                _1053 = 1.0;
            }
            float _1161 = _1053;
            float _1163 = _1161;
            if (!_1121)
            {
                _1127 = 1.0;
            }
            float _1165 = _1127;
            float _1167 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1169 = _1165;
            if (_1119)
            {
                float _1171 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1167 = _1171;
            }
            float _1173 = _1167;
            float _1175 = _983;
            if (_1121)
            {
                float _1177 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1175 = _1177;
            }
            float _1179 = _1175;
            if (_1117)
            {
                float _1181 = _1139 * _1131;
                float _1183 = precise::clamp(_1181, 0.0, 1.0);
                _1151 = _1183;
            }
            float _1185 = _1151;
            if (_1119)
            {
                float _1187 = _1147 * _1173;
                float _1189 = precise::clamp(_1187, 0.0, 1.0);
                _1163 = _1189;
            }
            float _1191 = _1163;
            float _1193 = _1185 * _1191;
            _1069 = _1031;
            if (_1121)
            {
                float _1195 = _1159 * _1179;
                float _1197 = precise::clamp(_1195, 0.0, 1.0);
                _1169 = _1197;
            }
            float _1199 = _1169;
            float _1201 = _1193 * _1199;
            _1073 = _1201;
        }
    }
    _1075 = false;
    float _1203 = _1067;
    float _1205 = _1069;
    float _1207 = _1071;
    float _1209 = _1073;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1213 = _1203 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1217 = _1205 + _1215;
    float _1219 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1221 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1223 = _1213 * _1213;
    float _1225 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1227 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1229 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1221);
    float _1231 = fma(_1217, _1217, _1223);
    float _1233 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1219);
    float _1235 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1237 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1225);
    float _1239 = sqrt(_1231);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1233);
    float _1243 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1227);
    float _1245 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1247 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1235);
    float _1249 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1251 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1237);
    float _1253 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = 1.0 / _1249;
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1265 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1247);
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _1269 = _1239 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = _1267 + _1271;
    bool _1277 = !_1269;
    float _1279 = _1207;
    float _1281 = _1205;
    float _1283 = _1203;
    float _1285 = _1255;
    if (!_1277)
    {
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1291 = _1239 + _1289;
        float _1293 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = rsqrt(_1231);
        float _1297 = _1291 * _1287;
        float _1299 = _1297 * 0.15915493667125701904296875;
        float _1301 = _1299 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = _1299 * 6.283185482025146484375;
        float _1307 = cos(_1305);
        float _1309 = fma(_1303, _1293, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1311 = _1295 * _1309;
        float _1313 = _1307 + (-1.0);
        float _1315 = fma(_1217, _1311, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1317 = fma(_1213, _1311, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = fma(_1307, _1207, _1319);
        _1279 = _1321;
        _1281 = _1315;
        _1283 = _1317;
    }
    float _1323 = _1279;
    float _1325 = _1281;
    float _1327 = _1283;
    float _1329 = -_1025;
    float _1331 = _1329 + _1323;
    float _1333 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1275);
    float _1335 = -_1023;
    float _1337 = _1335 + _1325;
    float _1339 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1341 = _1331 * _1331;
    float _1343 = -_1027;
    float _1345 = _1343 + _1327;
    float _1347 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1339);
    float _1349 = fma(_1337, _1337, _1341);
    float _1351 = 1.0 / _1333;
    float _1353 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1355 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = fma(_1345, _1345, _1349);
    out.m_62.y = 1.0;
    float _1359 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1353);
    float _1361 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1363 = sqrt(_1357);
    float _1365 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1359);
    float _1367 = _1361 + _1249;
    float _1369 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1365);
    float _1371 = _1367 * _1257;
    float _1373 = _1371 * 0.5;
    float _1375 = _1369 * _1351;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1379 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1377);
    bool _1381 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(0.5);
    bool _1389 = _1385 || _1387;
    float _1391 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1393 = _1375 > 0.0;
    bool _1395 = _1363 > 0.0;
    float _1397 = 1.0 / _1379;
    bool _1399 = _1375 < 1.0;
    bool _1401 = _1399 && _1393;
    bool _1403 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    float _1413 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1417 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1419 = _1391;
    float _1421 = _1323;
    float _1423 = _1327;
    float _1425 = _1325;
    if (!_1395)
    {
        _1419 = _1325;
    }
    float _1427 = _1419;
    float _1429 = _1427;
    if (!_1395)
    {
        _1285 = _1327;
    }
    float _1431 = _1285;
    bool _1433 = !_1395;
    float _1435 = _1431;
    if (!_1433)
    {
        float _1437 = _237 * _237;
        float _1439 = rsqrt(_1357);
        float _1441 = fma(_281, _281, _1437);
        float _1443 = fma(_277, _277, _1441);
        float _1445 = sqrt(_1443);
        float _1447 = _1331 * _1439;
        float _1449 = _1337 * _1439;
        float _1451 = _1345 * _1439;
        bool _1453 = _1445 > 0.0;
        float _1455 = _1445;
        float _1457 = _1439;
        if (!_1453)
        {
            _1455 = _1325;
        }
        float _1459 = _1455;
        _1429 = _1459;
        if (!_1453)
        {
            _1457 = _1327;
        }
        float _1461 = _1457;
        bool _1463 = !_1453;
        _1435 = _1461;
        if (!_1463)
        {
            float _1465 = rsqrt(_1443);
            float _1467 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1469 = _237 * _1465;
            float _1471 = _281 * _1465;
            float _1473 = _277 * _1465;
            float _1475 = _1447 * _1469;
            float _1477 = fma(_1449, _1471, _1475);
            float _1479 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1481 = fma(_1451, _1473, _1477);
            float _1483 = _1481 * _1479;
            float _1485 = fma(_281, _1483, _1325);
            float _1487 = fma(_237, _1483, _1323);
            float _1489 = fma(_277, _1483, _1327);
            _1429 = _1485;
            _1435 = _1489;
            _1421 = _1487;
        }
    }
    float _1491 = _1429;
    float _1493 = _1435;
    float _1495 = _1421;
    float _1497 = _1495;
    if (_1411)
    {
        _1423 = _1491;
    }
    float _1499 = _1423;
    float _1501 = _1499;
    if (_1411)
    {
        _1425 = _1493;
    }
    float _1503 = _1425;
    float _1505 = _1503;
    if (!_1411)
    {
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1509 = _1025 + _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1513 = _1023 + _1511;
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1517 = -_1027;
        float _1519 = _1517 + _1493;
        float _1521 = _1509 * _1509;
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1525 = _1027 + _1523;
        float _1527 = fma(_1513, _1513, _1521);
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1531 = fma(_1525, _1525, _1527);
        float _1533 = sqrt(_1531);
        float _1535 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1529;
        float _1541 = -_1023;
        float _1543 = _1541 + _1491;
        float _1545 = _1535 * _1539;
        float _1547 = -_1025;
        float _1549 = _1547 + _1495;
        float _1551 = fma(_1543, _1545, _1023);
        float _1553 = fma(_1549, _1545, _1025);
        float _1555 = fma(_1519, _1545, _1027);
        _1497 = _1553;
        _1501 = _1551;
        _1505 = _1555;
    }
    float _1557 = _1497;
    float _1559 = _1501;
    float _1561 = _1505;
    if (_1389)
    {
        _1055 = 1.0;
    }
    float _1563 = _1055;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1567 = _1397 * _1565;
    float _1569 = _1563;
    if (_1389)
    {
        _1057 = 1.0;
    }
    float _1571 = _1057;
    float _1573 = _1571;
    if (!_1389)
    {
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = _1577 * 6.283185482025146484375;
        float _1581 = cos(_1579);
        float _1583 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1585 = _1583 * 0.15915493667125701904296875;
        float _1587 = _1577 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = 1.0 / _1581;
        float _1593 = _1585 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = _1585 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = 1.0 / _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1609 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1607;
        float _1611 = 1.0 / _1609;
        float _1613 = _1601 * _1605;
        float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1617 = fma(_1567, _1613, _1615);
        float _1619 = _1617 * _1611;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        _1569 = _1621;
    }
    float _1623 = _1569;
    if (!_1389)
    {
        float _1625 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1627 = _1625 * 0.15915493667125701904296875;
        float _1629 = _1627 * 6.283185482025146484375;
        float _1631 = cos(_1629);
        float _1633 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1635 = _1633 * 0.15915493667125701904296875;
        float _1637 = _1627 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = 1.0 / _1631;
        float _1643 = _1635 * 6.283185482025146484375;
        float _1645 = cos(_1643);
        float _1647 = _1639 * _1641;
        float _1649 = _1635 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = _1645 * _1647;
        float _1655 = 1.0 / _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1659 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1657;
        float _1661 = 1.0 / _1659;
        float _1663 = _1651 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1667 = fma(_1567, _1663, _1665);
        float _1669 = _1667 * _1661;
        float _1671 = precise::clamp(_1669, 0.0, 1.0);
        float _1673 = -_1671;
        float _1675 = _1673 + 1.0;
        _1573 = _1675;
    }
    float _1677 = _1573;
    float _1679 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1681 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1683 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1685 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1687 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1679);
    float _1689 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1691 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1683);
    float _1693 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1685);
    float _1695 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1687);
    float _1697 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1689);
    float _1699 = -_237;
    float _1701 = _1699 + _1557;
    float _1703 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1691);
    float _1705 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1707 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = -_281;
    float _1711 = _1709 + _1559;
    float _1713 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1693);
    float _1715 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1717 = -_277;
    float _1719 = _1717 + _1561;
    float _1721 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1723 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1729 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1715);
    float _1731 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1721);
    float _1733 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1723);
    float _1735 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1737 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1739 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1729);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1731);
    float _1743 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1733);
    float _1745 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1735);
    float _1747 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1739);
    float _1749 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1741);
    float _1751 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1743);
    float _1753 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1745);
    float _1755 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _1757 = 1.0 / _1747;
    float _1759 = _1749 + _1747;
    float _1761 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1755);
    float _1763 = _1623 * _1677;
    float _1765 = _1759 * 0.5;
    float _1767 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _1769 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1761);
    float _1771 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1753;
    out.gl_Position.z = _1749;
    out.gl_Position.w = _1747;
    float _1773 = _1767 + _1415;
    float _1775 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1777 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_64.z = _1765;
    out.m_64.w = _1747;
    float _1779 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1781 = _1763 * _1209;
    float _1783 = _1751 * _1757;
    float _1785 = _1753 * _1757;
    float _1787 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1777);
    float _1789 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1779);
    float _1791 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1773);
    bool _1793 = _1783 > (-1.0);
    bool _1795 = _1793 && _1401;
    float _1797 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1787);
    float _1799 = 1.0 / _1775;
    float _1801 = _1771 + _1417;
    bool _1803 = _1785 > (-1.0);
    bool _1805 = _1803 && _1795;
    float _1807 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1789);
    float _1809 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _1811 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    bool _1813 = _1783 < 1.0;
    bool _1815 = _1813 && _1805;
    float _1817 = _1781 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1819 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    bool _1821 = _1785 < 1.0;
    bool _1823 = _1821 && _1815;
    float _1825 = _1791 * _1351;
    float _1827 = _1811 * _1351;
    float _1829 = _285 * _1817;
    float _1831 = _1809 * _1799;
    float _1833 = _1819 * _1799;
    bool _1835 = !_1823;
    float _1837 = _1829;
    if (!_1835)
    {
        float _1839 = -_1827;
        float _1841 = _1785 + _1839;
        float _1843 = -_1825;
        float _1845 = _1783 + _1843;
        float _1847 = -_1831;
        float _1849 = _1783 + _1847;
        float _1851 = -_1833;
        float _1853 = _1785 + _1851;
        float _1855 = _1841 * _1841;
        float _1857 = fma(_1845, _1845, _1855);
        float _1859 = sqrt(_1857);
        bool _1861 = _1859 > 0.0;
        bool _1863 = !_1861;
        _1865 = _1863;
        if (!_1865)
        {
            float _1867 = _1853 * _1853;
            float _1869 = fma(_1849, _1849, _1867);
            float _1871 = rsqrt(_1857);
            float _1873 = sqrt(_1869);
            float _1875 = _1845 * _1871;
            float _1877 = _1841 * _1871;
            bool _1879 = _1873 > 0.0;
            bool _1881 = !_1879;
            _1865 = _1881;
            if (!_1865)
            {
                float _1883 = _921 * _1273;
                float _1885 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1887 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1267);
                float _1889 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1771);
                float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1767);
                float _1893 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1887);
                float _1895 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1889);
                float _1897 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1891);
                float _1899 = rsqrt(_1869);
                float _1901 = _1885 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1903 = 1.0 / _1893;
                float _1905 = _1853 * _1901;
                float _1907 = _1849 * _1901;
                float _1909 = _1905 * _1905;
                float _1911 = fma(_1907, _1907, _1909);
                float _1913 = _1853 * _1899;
                float _1915 = _1849 * _1899;
                float _1917 = _1895 * _1903;
                float _1919 = _1897 * _1903;
                float _1921 = sqrt(_1911);
                float _1923 = _1917 * _1917;
                float _1925 = fma(_1919, _1919, _1923);
                float _1927 = _1877 * _1913;
                float _1929 = sqrt(_1925);
                float _1931 = fma(_1875, _1915, _1927);
                float _1933 = precise::min(0.0, _1931);
                float _1935 = _1747 * _1933;
                float _1937 = fma(_1907, _1935, _1751);
                float _1939 = fma(_1921, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1929);
                float _1941 = fma(_1905, _1935, _1753);
                float _1943 = 1.0 / _1939;
                out.gl_Position.x = _1937;
                out.gl_Position.y = _1941;
                float _1945 = _1929 * _1943;
                out.m_62.y = _1945;
                _1865 = true;
            }
        }
    }
    else
    {
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1947;
        _1837 = 0.0;
    }
    _1865 = false;
    float _1949 = _1837;
    bool _1951 = _1623 > 0.0;
    bool _1953 = isnan(_1623);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = _1949 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1963 = _1677 <= 0.0;
    bool _1965 = !_1959;
    bool _1967 = _1963 || _1965;
    out.m_37.x = _1961;
    if (!_1967)
    {
        return out;
    }
    float _1969 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_37.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1969;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1865 = false;
    bool _1075 = false;
    bool _1063 = false;
    bool _719 = false;
    bool _553 = false;
    bool _405 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_34.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_37.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2026 = as_type<float>(_99);
        out.gl_Position.z = _2026;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_39.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_37.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_135);
        out.gl_Position.z = _2094;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_41.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_46.x;
    float _147 = in.m_46.y;
    float _149 = in.m_46.z;
    float _151 = in.m_48.x;
    float _153 = in.m_48.y;
    float _155 = in.m_48.z;
    float _157 = in.m_50.x;
    float _159 = in.m_50.y;
    float _161 = in.m_50.z;
    float _163 = _141 * _139;
    float _165 = in.m_52.x;
    float _167 = in.m_52.y;
    float _169 = in.m_52.z;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _173 = as_type<int>(_143) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_143) & 2;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = floor(_171);
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _181 * 0.15915493667125701904296875;
    bool _191 = !_179;
    int _193 = _191 ? (-1090519040) : 1056964608;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _147 * _153;
    bool _205 = !_175;
    int _207 = _205 ? (-1090519040) : 1056964608;
    float _209 = _189 * 6.283185482025146484375;
    float _211 = cos(_209);
    float _213 = _147 * _159;
    bool _215 = !_197;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_145, _151, _203);
    bool _221 = !_187;
    int _223 = _221 ? 0 : 1;
    float _225 = _147 * _167;
    float _227 = fma(_145, _157, _213);
    out.m_54.x = as_type<float>(_207);
    out.m_54.y = as_type<float>(_193);
    float _229 = -_183;
    float _231 = _171 + _229;
    float _233 = fma(_145, _165, _225);
    int _235 = abs(_217);
    float _237 = fma(_149, _161, _227);
    int _239 = abs(_223);
    float _241 = -_231;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = fma(_211, 0.5, 0.5);
    float _249 = float(_235);
    bool _251 = !_201;
    int _253 = _251 ? 0 : 1;
    bool _255 = _231 < 0.5;
    float _257 = float(_255);
    float _259 = abs(_243);
    float _261 = _249 * _259;
    int _263 = abs(_253);
    float _265 = -_247;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = float(_239);
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = float(_263);
    float _277 = fma(_149, _169, _233);
    float _279 = fma(_269, _267, _261);
    float _281 = fma(_149, _155, _219);
    float _283 = abs(_273);
    float _285 = fma(_275, _283, _279);
    bool _287 = !_245;
    float _303;
    if (!_287)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_83);
        float _309 = 1.0 / _307;
        float _311 = _117 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    bool _319 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_313);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -_329;
    float _337 = _335 + 1.0;
    bool _339 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_313);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _357 = 1.0 / _333;
    float _359 = _349 * _337;
    float _361 = -_349;
    float _363 = _361 + 1.0;
    float _365 = _317 * _357;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = fma(_353, _365, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_369, _365, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _371 * _359;
    float _377 = _373 * _359;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[144].x, _379);
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[144].y, _381);
    bool _387 = !_355;
    float _403;
    if (!_387)
    {
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_83);
        float _409 = 1.0 / _407;
        float _411 = _117 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    bool _455 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _457 = isnan(_413);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = 1.0 / _421;
    float _469 = -_433;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _475 = _413 + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _479 = _449 * _471;
    float _481 = -_449;
    float _483 = _481 + 1.0;
    float _485 = 1.0 / _437;
    float _487 = _453 * _467;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _493 = fma(_487, _417, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _495 = _491 * _485;
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = _493 * _479;
    float _503 = fma(_495, _475, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _505 = _433 * _499;
    float _507 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _501);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _511 = fma(_503, _505, _507);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[117].x, _511);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_56.x;
    float _527 = in.m_56.y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _521;
    out.m_58.y = _517;
    out.m_58.z = _523;
    out.m_58.w = _529;
    float _531 = _385 * _527;
    float _533 = _383 * _525;
    bool _535 = !_477;
    float _551;
    if (!_535)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _539 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_83);
        float _557 = 1.0 / _555;
        float _559 = _117 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _565 = _561 + _563;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _581 = _561 + _579;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _603 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _605 = isnan(_561);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_577;
    float _617 = _615 + 1.0;
    float _619 = 1.0 / _597;
    float _621 = _613 * _617;
    float _623 = -_613;
    float _625 = _623 + 1.0;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _627;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _633 = 1.0 / _601;
    float _635 = _593 * _625;
    float _637 = -_593;
    float _639 = _637 + 1.0;
    float _641 = _565 * _619;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _647;
    float _651 = fma(_629, _641, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _653 = fma(_645, _641, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _655 = fma(_649, _641, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _657 = _581 * _633;
    float _659 = _651 * _635;
    float _661 = _653 * _635;
    float _663 = _655 * _635;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _677 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].x, _659);
    float _679 = fma(_667, _657, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _681 = fma(_671, _657, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _683 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].y, _661);
    float _685 = fma(_675, _657, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _687 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[123].z, _663);
    float _689 = fma(_679, _621, _677);
    float _691 = fma(_681, _621, _683);
    float _693 = fma(_685, _621, _687);
    float _695 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].x, _689);
    float _697 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].y, _691);
    float _699 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[125].z, _693);
    bool _701 = !_631;
    float _717;
    if (!_701)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _705 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _709 = _707 * _703;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _717 = _715;
        _719 = true;
    }
    else
    {
        float _721 = float(_83);
        float _723 = 1.0 / _721;
        float _725 = _117 * _723;
        _717 = _725;
    }
    _719 = false;
    float _727 = _717;
    float _729 = in.m_34.x;
    float _731 = in.m_34.y;
    float _733 = in.m_34.z;
    float _735 = _285 * _531;
    float _737 = in.m_50.w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_193));
    float _745 = in.m_48.w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = 1.0 / _741;
    float _753 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = in.m_52.w;
    float _757 = _699 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _759 = _753 * _743;
    float _761 = 1.0 / _749;
    float _763 = _159 * _731;
    float _765 = _153 * _731;
    float _767 = _167 * _731;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _769;
    float _773 = fma(_157, _729, _763);
    float _775 = fma(_151, _729, _765);
    float _777 = fma(_165, _729, _767);
    float _779 = _771 * _751;
    float _781 = fma(_161, _733, _773);
    float _783 = fma(_155, _733, _775);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _787 = _727 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _793 = _781 + _737;
    float _795 = fma(_169, _733, _777);
    float _797 = _783 + _745;
    float _799 = fma(_779, _787, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _801 = _793 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _803 = _791 * _761;
    bool _805 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _807 = isnan(_727);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _795 + _755;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _821 = _797 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _823 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    bool _825 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _827 = isnan(_727);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_815;
    float _839 = _837 + 1.0;
    float _841 = _817 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].x, _823);
    float _845 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _847 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _849 = _835 * _839;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].x, _843);
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].y, _845);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _861 = _727 + _859;
    float _863 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    bool _865 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _867 = isnan(_727);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].y, _857);
    float _879 = fma(_803, _861, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _881 = _863 * _819;
    float _883 = _801 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _887 = _877 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _889 = _875 * _855;
    float _891 = fma(_821, (*spvDescriptorSet0.vp_c12)._m0[6].z, _883);
    float _893 = -_875;
    float _895 = _893 + 1.0;
    float _897 = _887 * _847;
    float _899 = _799 * _889;
    float _901 = fma(_841, (*spvDescriptorSet0.vp_c12)._m0[8].z, _891);
    float _903 = fma(_881, 0.5, 0.5);
    float _905 = fma(_897, 0.5, 0.5);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[131].x, _899);
    float _909 = _901 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _911 = floor(_903);
    float _913 = _285 * _533;
    float _915 = fma(_879, _849, _907);
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_207));
    float _919 = _909 * _885;
    float _921 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _923 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _925 = floor(_905);
    float _927 = fma(_919, 0.5, 0.5);
    float _929 = _921 * _917;
    float _931 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _933 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[133].x, _915);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _923);
    float _939 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _931);
    float _941 = floor(_927);
    float _943 = -_911;
    float _945 = _903 + _943;
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _949 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _951 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _953 = fma(_945, 2.0, -1.0);
    float _955 = _695 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _959 = -_925;
    float _961 = _905 + _959;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _939);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _947);
    float _967 = _953 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _969 = fma(_961, 2.0, -1.0);
    float _971 = _697 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _973 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _977 = _969 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _979 = -_941;
    float _981 = _927 + _979;
    float _983 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _985 = _963 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _989 = fma(_981, 2.0, -1.0);
    float _991 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _993 = _977 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _995 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].y, _987);
    float _997 = _989 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _999 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].x, _991);
    float _1001 = fma(_967, (*spvDescriptorSet0.vp_c12)._m0[2].z, _993);
    bool _1003 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(1.0);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].y, _995);
    float _1015 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].x, _999);
    float _1017 = fma(_997, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1001);
    float _1019 = _957 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1021 = _965 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1025 = _1013 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_60.x = _973;
    out.m_60.y = _983;
    out.m_60.z = _975;
    out.m_60.w = _951;
    float _1029 = _1021 + _1027;
    float _1031 = _1019 + _1023;
    float _1033 = _985 + _1025;
    float _1035 = _975;
    float _1037 = _1019;
    float _1039 = _993;
    float _1041 = _965;
    float _1043 = _1019;
    float _1045 = _965;
    float _1047 = _953;
    float _1049 = _969;
    float _1051 = _989;
    float _1053 = _985;
    float _1055 = _1025;
    float _1057 = _1023;
    float _1067;
    float _1069;
    float _1071;
    float _1073;
    if (!_1011)
    {
        bool _1059 = _1025 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1061 = !_1059;
        _1063 = _1061;
        if (!_1063)
        {
            float _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1067 = _1065;
            _1069 = 0.0;
            _1071 = 0.0;
            _1073 = 0.0;
            _1075 = true;
        }
    }
    if ((!_1075) || _1063)
    {
        bool _1111;
        if (!_1063)
        {
            bool _1077 = _1025 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1079 = isnan(_1025);
            bool _1081 = _1077 || _1079;
            bool _1083 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1085 = _1081 || _1083;
            bool _1087 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1089 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1091 = !_1085;
            bool _1093 = _1089 && _1091;
            if (_1093)
            {
                _1035 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1095 = _1035;
            float _1097 = _1095;
            if (_1093)
            {
                _1037 = 0.0;
            }
            float _1099 = _1037;
            _1043 = _1099;
            _1069 = _1099;
            if (_1093)
            {
                _1039 = 0.0;
            }
            float _1101 = _1039;
            _1071 = _1101;
            if (_1093)
            {
                float _1103 = _1095 * 5.0;
                _1097 = _1103;
            }
            float _1105 = _1097;
            _1067 = _1105;
            if (_1093)
            {
                _1041 = 0.0;
            }
            float _1107 = _1041;
            bool _1109 = !_1085;
            _1111 = _1109 && _1087;
            _1045 = _1107;
            _1073 = _1107;
        }
        if ((!_1111) || _1063)
        {
            _1063 = false;
            float _1113 = _1043;
            float _1115 = _1045;
            bool _1117 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1119 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1121 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1123 = _1021;
            float _1125 = _1113;
            float _1127 = _1115;
            _1067 = _1029;
            _1071 = _1033;
            if (_1117)
            {
                float _1129 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1123 = _1129;
            }
            float _1131 = _1123;
            if (_1117)
            {
                float _1133 = abs(_953);
                float _1135 = -_1133;
                float _1137 = _1135 + 1.0;
                _1047 = _1137;
            }
            float _1139 = _1047;
            if (_1119)
            {
                float _1141 = abs(_969);
                float _1143 = -_1141;
                float _1145 = _1143 + 1.0;
                _1049 = _1145;
            }
            float _1147 = _1049;
            if (!_1117)
            {
                _1125 = 1.0;
            }
            float _1149 = _1125;
            float _1151 = _1149;
            if (_1121)
            {
                float _1153 = abs(_989);
                float _1155 = -_1153;
                float _1157 = _1155 + 1.0;
                _1051 = _1157;
            }
            float _1159 = _1051;
            if (!_1119)
            {
                _1053 = 1.0;
            }
            float _1161 = _1053;
            float _1163 = _1161;
            if (!_1121)
            {
                _1127 = 1.0;
            }
            float _1165 = _1127;
            float _1167 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1169 = _1165;
            if (_1119)
            {
                float _1171 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1167 = _1171;
            }
            float _1173 = _1167;
            float _1175 = _983;
            if (_1121)
            {
                float _1177 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1175 = _1177;
            }
            float _1179 = _1175;
            if (_1117)
            {
                float _1181 = _1139 * _1131;
                float _1183 = precise::clamp(_1181, 0.0, 1.0);
                _1151 = _1183;
            }
            float _1185 = _1151;
            if (_1119)
            {
                float _1187 = _1147 * _1173;
                float _1189 = precise::clamp(_1187, 0.0, 1.0);
                _1163 = _1189;
            }
            float _1191 = _1163;
            float _1193 = _1185 * _1191;
            _1069 = _1031;
            if (_1121)
            {
                float _1195 = _1159 * _1179;
                float _1197 = precise::clamp(_1195, 0.0, 1.0);
                _1169 = _1197;
            }
            float _1199 = _1169;
            float _1201 = _1193 * _1199;
            _1073 = _1201;
        }
    }
    _1075 = false;
    float _1203 = _1067;
    float _1205 = _1069;
    float _1207 = _1071;
    float _1209 = _1073;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1213 = _1203 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1217 = _1205 + _1215;
    float _1219 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1221 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1223 = _1213 * _1213;
    float _1225 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1227 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1229 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1221);
    float _1231 = fma(_1217, _1217, _1223);
    float _1233 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1219);
    float _1235 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1237 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1225);
    float _1239 = sqrt(_1231);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1233);
    float _1243 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1227);
    float _1245 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1247 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1235);
    float _1249 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1251 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1237);
    float _1253 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = 1.0 / _1249;
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1265 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1247);
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _1269 = _1239 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = _1267 + _1271;
    bool _1277 = !_1269;
    float _1279 = _1207;
    float _1281 = _1205;
    float _1283 = _1203;
    float _1285 = _1255;
    if (!_1277)
    {
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1291 = _1239 + _1289;
        float _1293 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = rsqrt(_1231);
        float _1297 = _1291 * _1287;
        float _1299 = _1297 * 0.15915493667125701904296875;
        float _1301 = _1299 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = _1299 * 6.283185482025146484375;
        float _1307 = cos(_1305);
        float _1309 = fma(_1303, _1293, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1311 = _1295 * _1309;
        float _1313 = _1307 + (-1.0);
        float _1315 = fma(_1217, _1311, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1317 = fma(_1213, _1311, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = fma(_1307, _1207, _1319);
        _1279 = _1321;
        _1281 = _1315;
        _1283 = _1317;
    }
    float _1323 = _1279;
    float _1325 = _1281;
    float _1327 = _1283;
    float _1329 = -_1025;
    float _1331 = _1329 + _1323;
    float _1333 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1275);
    float _1335 = -_1023;
    float _1337 = _1335 + _1325;
    float _1339 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1341 = _1331 * _1331;
    float _1343 = -_1027;
    float _1345 = _1343 + _1327;
    float _1347 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1339);
    float _1349 = fma(_1337, _1337, _1341);
    float _1351 = 1.0 / _1333;
    float _1353 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1355 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = fma(_1345, _1345, _1349);
    out.m_62.y = 1.0;
    float _1359 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1353);
    float _1361 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1363 = sqrt(_1357);
    float _1365 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1359);
    float _1367 = _1361 + _1249;
    float _1369 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1365);
    float _1371 = _1367 * _1257;
    float _1373 = _1371 * 0.5;
    float _1375 = _1369 * _1351;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1379 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1377);
    bool _1381 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(0.5);
    bool _1389 = _1385 || _1387;
    float _1391 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1393 = _1375 > 0.0;
    bool _1395 = _1363 > 0.0;
    float _1397 = 1.0 / _1379;
    bool _1399 = _1375 < 1.0;
    bool _1401 = _1399 && _1393;
    bool _1403 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    float _1413 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1417 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1419 = _1391;
    float _1421 = _1323;
    float _1423 = _1327;
    float _1425 = _1325;
    if (!_1395)
    {
        _1419 = _1325;
    }
    float _1427 = _1419;
    float _1429 = _1427;
    if (!_1395)
    {
        _1285 = _1327;
    }
    float _1431 = _1285;
    bool _1433 = !_1395;
    float _1435 = _1431;
    if (!_1433)
    {
        float _1437 = _237 * _237;
        float _1439 = rsqrt(_1357);
        float _1441 = fma(_281, _281, _1437);
        float _1443 = fma(_277, _277, _1441);
        float _1445 = sqrt(_1443);
        float _1447 = _1331 * _1439;
        float _1449 = _1337 * _1439;
        float _1451 = _1345 * _1439;
        bool _1453 = _1445 > 0.0;
        float _1455 = _1445;
        float _1457 = _1439;
        if (!_1453)
        {
            _1455 = _1325;
        }
        float _1459 = _1455;
        _1429 = _1459;
        if (!_1453)
        {
            _1457 = _1327;
        }
        float _1461 = _1457;
        bool _1463 = !_1453;
        _1435 = _1461;
        if (!_1463)
        {
            float _1465 = rsqrt(_1443);
            float _1467 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1469 = _237 * _1465;
            float _1471 = _281 * _1465;
            float _1473 = _277 * _1465;
            float _1475 = _1447 * _1469;
            float _1477 = fma(_1449, _1471, _1475);
            float _1479 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1481 = fma(_1451, _1473, _1477);
            float _1483 = _1481 * _1479;
            float _1485 = fma(_281, _1483, _1325);
            float _1487 = fma(_237, _1483, _1323);
            float _1489 = fma(_277, _1483, _1327);
            _1429 = _1485;
            _1435 = _1489;
            _1421 = _1487;
        }
    }
    float _1491 = _1429;
    float _1493 = _1435;
    float _1495 = _1421;
    float _1497 = _1495;
    if (_1411)
    {
        _1423 = _1491;
    }
    float _1499 = _1423;
    float _1501 = _1499;
    if (_1411)
    {
        _1425 = _1493;
    }
    float _1503 = _1425;
    float _1505 = _1503;
    if (!_1411)
    {
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1509 = _1025 + _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1513 = _1023 + _1511;
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1517 = -_1027;
        float _1519 = _1517 + _1493;
        float _1521 = _1509 * _1509;
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1525 = _1027 + _1523;
        float _1527 = fma(_1513, _1513, _1521);
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1531 = fma(_1525, _1525, _1527);
        float _1533 = sqrt(_1531);
        float _1535 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1529;
        float _1541 = -_1023;
        float _1543 = _1541 + _1491;
        float _1545 = _1535 * _1539;
        float _1547 = -_1025;
        float _1549 = _1547 + _1495;
        float _1551 = fma(_1543, _1545, _1023);
        float _1553 = fma(_1549, _1545, _1025);
        float _1555 = fma(_1519, _1545, _1027);
        _1497 = _1553;
        _1501 = _1551;
        _1505 = _1555;
    }
    float _1557 = _1497;
    float _1559 = _1501;
    float _1561 = _1505;
    if (_1389)
    {
        _1055 = 1.0;
    }
    float _1563 = _1055;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1567 = _1397 * _1565;
    float _1569 = _1563;
    if (_1389)
    {
        _1057 = 1.0;
    }
    float _1571 = _1057;
    float _1573 = _1571;
    if (!_1389)
    {
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = _1577 * 6.283185482025146484375;
        float _1581 = cos(_1579);
        float _1583 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1585 = _1583 * 0.15915493667125701904296875;
        float _1587 = _1577 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = 1.0 / _1581;
        float _1593 = _1585 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = _1585 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = 1.0 / _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1609 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1607;
        float _1611 = 1.0 / _1609;
        float _1613 = _1601 * _1605;
        float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1617 = fma(_1567, _1613, _1615);
        float _1619 = _1617 * _1611;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        _1569 = _1621;
    }
    float _1623 = _1569;
    if (!_1389)
    {
        float _1625 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1627 = _1625 * 0.15915493667125701904296875;
        float _1629 = _1627 * 6.283185482025146484375;
        float _1631 = cos(_1629);
        float _1633 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1635 = _1633 * 0.15915493667125701904296875;
        float _1637 = _1627 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = 1.0 / _1631;
        float _1643 = _1635 * 6.283185482025146484375;
        float _1645 = cos(_1643);
        float _1647 = _1639 * _1641;
        float _1649 = _1635 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = _1645 * _1647;
        float _1655 = 1.0 / _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1659 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1657;
        float _1661 = 1.0 / _1659;
        float _1663 = _1651 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1667 = fma(_1567, _1663, _1665);
        float _1669 = _1667 * _1661;
        float _1671 = precise::clamp(_1669, 0.0, 1.0);
        float _1673 = -_1671;
        float _1675 = _1673 + 1.0;
        _1573 = _1675;
    }
    float _1677 = _1573;
    float _1679 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1681 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1683 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1685 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1687 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1679);
    float _1689 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1691 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1683);
    float _1693 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1685);
    float _1695 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1687);
    float _1697 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1689);
    float _1699 = -_237;
    float _1701 = _1699 + _1557;
    float _1703 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1691);
    float _1705 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1707 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = -_281;
    float _1711 = _1709 + _1559;
    float _1713 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1693);
    float _1715 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1717 = -_277;
    float _1719 = _1717 + _1561;
    float _1721 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1723 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1729 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1715);
    float _1731 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1721);
    float _1733 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1723);
    float _1735 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1737 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1739 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1729);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1731);
    float _1743 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1733);
    float _1745 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1735);
    float _1747 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1739);
    float _1749 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1741);
    float _1751 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1743);
    float _1753 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1745);
    float _1755 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _1757 = 1.0 / _1747;
    float _1759 = _1749 + _1747;
    float _1761 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1755);
    float _1763 = _1623 * _1677;
    float _1765 = _1759 * 0.5;
    float _1767 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _1769 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1761);
    float _1771 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1753;
    out.gl_Position.z = _1749;
    out.gl_Position.w = _1747;
    float _1773 = _1767 + _1415;
    float _1775 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1777 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_64.z = _1765;
    out.m_64.w = _1747;
    float _1779 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1781 = _1763 * _1209;
    float _1783 = _1751 * _1757;
    float _1785 = _1753 * _1757;
    float _1787 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1777);
    float _1789 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1779);
    float _1791 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1773);
    bool _1793 = _1783 > (-1.0);
    bool _1795 = _1793 && _1401;
    float _1797 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1787);
    float _1799 = 1.0 / _1775;
    float _1801 = _1771 + _1417;
    bool _1803 = _1785 > (-1.0);
    bool _1805 = _1803 && _1795;
    float _1807 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1789);
    float _1809 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _1811 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    bool _1813 = _1783 < 1.0;
    bool _1815 = _1813 && _1805;
    float _1817 = _1781 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1819 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    bool _1821 = _1785 < 1.0;
    bool _1823 = _1821 && _1815;
    float _1825 = _1791 * _1351;
    float _1827 = _1811 * _1351;
    float _1829 = _285 * _1817;
    float _1831 = _1809 * _1799;
    float _1833 = _1819 * _1799;
    bool _1835 = !_1823;
    float _1837 = _1829;
    if (!_1835)
    {
        float _1839 = -_1827;
        float _1841 = _1785 + _1839;
        float _1843 = -_1825;
        float _1845 = _1783 + _1843;
        float _1847 = -_1831;
        float _1849 = _1783 + _1847;
        float _1851 = -_1833;
        float _1853 = _1785 + _1851;
        float _1855 = _1841 * _1841;
        float _1857 = fma(_1845, _1845, _1855);
        float _1859 = sqrt(_1857);
        bool _1861 = _1859 > 0.0;
        bool _1863 = !_1861;
        _1865 = _1863;
        if (!_1865)
        {
            float _1867 = _1853 * _1853;
            float _1869 = fma(_1849, _1849, _1867);
            float _1871 = rsqrt(_1857);
            float _1873 = sqrt(_1869);
            float _1875 = _1845 * _1871;
            float _1877 = _1841 * _1871;
            bool _1879 = _1873 > 0.0;
            bool _1881 = !_1879;
            _1865 = _1881;
            if (!_1865)
            {
                float _1883 = _921 * _1273;
                float _1885 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1887 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1267);
                float _1889 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1771);
                float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1767);
                float _1893 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1887);
                float _1895 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1889);
                float _1897 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1891);
                float _1899 = rsqrt(_1869);
                float _1901 = _1885 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1903 = 1.0 / _1893;
                float _1905 = _1853 * _1901;
                float _1907 = _1849 * _1901;
                float _1909 = _1905 * _1905;
                float _1911 = fma(_1907, _1907, _1909);
                float _1913 = _1853 * _1899;
                float _1915 = _1849 * _1899;
                float _1917 = _1895 * _1903;
                float _1919 = _1897 * _1903;
                float _1921 = sqrt(_1911);
                float _1923 = _1917 * _1917;
                float _1925 = fma(_1919, _1919, _1923);
                float _1927 = _1877 * _1913;
                float _1929 = sqrt(_1925);
                float _1931 = fma(_1875, _1915, _1927);
                float _1933 = precise::min(0.0, _1931);
                float _1935 = _1747 * _1933;
                float _1937 = fma(_1907, _1935, _1751);
                float _1939 = fma(_1921, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1929);
                float _1941 = fma(_1905, _1935, _1753);
                float _1943 = 1.0 / _1939;
                out.gl_Position.x = _1937;
                out.gl_Position.y = _1941;
                float _1945 = _1929 * _1943;
                out.m_62.y = _1945;
                _1865 = true;
            }
        }
    }
    else
    {
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1947;
        _1837 = 0.0;
    }
    _1865 = false;
    float _1949 = _1837;
    bool _1951 = _1623 > 0.0;
    bool _1953 = isnan(_1623);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = _1949 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1963 = _1677 <= 0.0;
    bool _1965 = !_1959;
    bool _1967 = _1963 || _1965;
    out.m_37.x = _1961;
    if (!_1967)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1969 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_37.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1969;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

