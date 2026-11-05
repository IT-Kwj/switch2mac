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
    float4 m_48 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_50 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1238 = as_type<float>(_87);
        out.gl_Position.z = _1238;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1308 = as_type<float>(_125);
        out.gl_Position.z = _1308;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_37.x;
    float _129 = in.m_37.y;
    float _131 = in.m_37.z;
    float _133 = in.m_37.w;
    float _135 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _137 = log2(_135);
    float _139 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = _131 * 2.0;
    int _151 = as_type<int>(_141) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_141) & 2;
    bool _157 = _155 != 0;
    float _159 = floor(_149);
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _137 * _105;
    bool _173 = _133 > 0.5;
    float _175 = exp2(_171);
    float _177 = _129 + _131;
    int _179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _181 = _179 != 0;
    float _183 = _177 + (-1.0);
    float _185 = 0.0;
    float _187 = _139;
    if (!_169)
    {
        float _189 = _139 * _139;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    bool _195 = !_153;
    float _197 = _195 ? (-0.5) : 0.5;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _201 = _199 != 0;
    float _203 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _207 = _205 != 0;
    float _209 = _193;
    if (!_169)
    {
        float _211 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    bool _215 = !_157;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = _159 > 0.0;
    bool _221 = !_169;
    float _223 = _213;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _139 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _139);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = _159 >= 0.0;
    bool _259 = isnan(_159);
    bool _261 = _257 || _259;
    bool _263 = isnan(0.0);
    bool _265 = _261 || _263;
    bool _267 = !_169;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _139 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _187 = _287;
    }
    float _289 = _187;
    float _291 = _127 + _129;
    float _293 = in.m_42.w;
    bool _295 = _127 > 0.5;
    float _297 = _127 * 2.0;
    float _299 = _291 + (-1.0);
    float _301 = in.m_30.x;
    float _303 = in.m_30.y;
    float _305 = in.m_30.z;
    float _307 = -_197;
    int _309 = _295 ? as_type<int>(_307) : as_type<int>(_197);
    float _311 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = _129 > 0.5;
    float _315 = floor(_297);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _319 = fma(_289, _145, _311);
    bool _321 = !_181;
    float _323 = _321 ? _197 : as_type<float>(_309);
    float _325 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = -_217;
    int _329 = _173 ? as_type<int>(_327) : as_type<int>(_217);
    float _331 = in.m_42.x;
    float _333 = fma(_289, _147, _325);
    float _335 = -_217;
    int _337 = _313 ? as_type<int>(_335) : as_type<int>(_217);
    float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _341 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _343 = isnan(0.0);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _349 = _345 || _347;
    float _351 = _323 + 0.5;
    bool _353 = !_201;
    float _355 = _353 ? _217 : as_type<float>(_337);
    float _357 = -_175;
    float _359 = _357 + 1.0;
    float _361 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(1.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _375 = 1.0 + _373;
    bool _377 = _131 > 0.5;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _381 = _349 ? _359 : 0.0;
    float _383 = fma(_289, _143, _361);
    float _385 = fma(_319, _293, _303);
    float _387 = fma(_333, _293, _305);
    float _389 = -_197;
    int _391 = _377 ? as_type<int>(_389) : as_type<int>(_197);
    float _393 = fma(_383, _293, _301);
    float _395 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = 1.0 / _375;
    float _399 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _407 = _405 != 0;
    float _409 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    bool _415 = _315 > 0.0;
    float _417 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    bool _419 = _315 >= 0.0;
    bool _421 = isnan(_315);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    float _429 = _413 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    float _435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _437 = _429 + _435;
    if (_371)
    {
        float _439 = _381 * _397;
        _107 = _439;
    }
    float _441 = _107;
    float _443 = _417 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _445 = !_207;
    float _447 = _445 ? _217 : as_type<float>(_329);
    float _449 = _129 * 2.0;
    bool _451 = !_407;
    float _453 = _451 ? _197 : as_type<float>(_391);
    float _455 = _433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _471 = _443 + _469;
    float _473 = _437 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _475 = _351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = -_355;
    float _479 = _477 + 0.5;
    float _481 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _483 = _455 + _481;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[28].x, _473);
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _489 = _453 + 0.5;
    float _491 = _475 * _339;
    float _493 = _437 * _437;
    float _495 = _479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[28].z, _485);
    float _499 = _489 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _501 = fma(_471, _471, _493);
    float _503 = floor(_449);
    float _505 = _495 * _431;
    bool _507 = !_463;
    int _509 = _507 ? 0 : 1;
    float _511 = -_447;
    float _513 = _511 + 0.5;
    float _515 = _499 * _379;
    bool _517 = _497 >= 0.0;
    float _519 = fma(_483, _483, _501);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _523 = _331 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = _521 * _487;
    float _527 = rsqrt(_519);
    int _529 = _265 ? 0 : 1;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _533 = !_459;
    int _535 = _533 ? 0 : 1;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _541 = _503 > 0.0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _545 = _503 >= 0.0;
    bool _547 = isnan(_503);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _557 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_517)
    {
        _563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _565 = _563;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _569 = _555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _573 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _575 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _539 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _581 = as_type<int>(_565);
    if (_517)
    {
        float _583 = _565 * 5.0;
        _581 = as_type<int>(_583);
    }
    int _585 = _581;
    out.m_44.x = _491;
    out.m_44.y = _505;
    out.m_44.z = _515;
    out.m_44.w = _525;
    float _587 = _577 * _527;
    bool _589 = !_467;
    int _591 = _589 ? 0 : 1;
    out.m_46.x = _575;
    out.m_46.y = _557;
    out.m_46.z = _559;
    out.m_46.w = _543;
    float _593 = _471 * _587;
    float _595 = _437 * _587;
    out.m_48.x = _569;
    out.m_48.y = _573;
    out.m_48.z = _579;
    if (_517)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_585);
        out.gl_Position.z = _2074;
    }
    if (_517)
    {
        out.m_33.x = 0.0;
    }
    if (_517)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _597 = -_595;
    float _599 = _429 + _597;
    int _601 = _427 ? 0 : 1;
    float _603 = -_593;
    float _605 = _443 + _603;
    int _607 = ~_529;
    int _609 = _607 + 1;
    int _611 = _609 + 1;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _615 = _599 + _613;
    int _617 = ~_601;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _625 = _605 + _623;
    int _627 = _621;
    int _629 = _611;
    if (!_415)
    {
        int _631 = ~_601;
        int _633 = _631 + 1;
        _627 = _633;
    }
    int _635 = _627;
    float _637 = _615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_219)
    {
        int _639 = ~_529;
        int _641 = _639 + 1;
        _629 = _641;
    }
    int _643 = _629;
    float _645 = in.m_50.x;
    float _647 = in.m_50.y;
    float _649 = in.m_50.z;
    int _651 = abs(_509);
    float _653 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[28].x, _637);
    int _655 = abs(_535);
    float _657 = _483 * _587;
    float _659 = float(_643);
    float _661 = _129 + (-0.5);
    float _663 = float(_655);
    float _665 = -_657;
    float _667 = _455 + _665;
    float _669 = float(_635);
    float _671 = -_595;
    float _673 = _437 + _671;
    float _675 = float(_651);
    float _677 = _663 * _659;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _681 = _667 + _679;
    int _683 = abs(_591);
    float _685 = -_593;
    float _687 = _471 + _685;
    float _689 = _677 * (-2.0);
    int _691 = _553 ? 0 : 1;
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[28].z, _653);
    float _695 = _675 * _669;
    float _697 = _127 + (-0.5);
    int _699 = ~_691;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = _673 * _673;
    float _707 = fma(_689, _645, _645);
    int _709 = _703;
    if (!_541)
    {
        int _711 = ~_691;
        int _713 = _711 + 1;
        _709 = _713;
    }
    int _715 = _709;
    float _717 = _127 + _131;
    bool _719 = _693 >= 0.0;
    float _721 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].x, _707);
    float _723 = float(_683);
    float _725 = fma(_317, _689, _317);
    float _727 = float(_715);
    float _729 = _695 * (-2.0);
    float _731 = fma(_687, _687, _705);
    float _733 = fma(_725, _441, _721);
    float _735 = _717 + (-1.0);
    float _737 = fma(_729, _647, _647);
    float _739 = fma(_203, _729, _203);
    float _741 = _733 * 0.15915493667125701904296875;
    float _743 = _723 * _727;
    float _745 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].y, _737);
    float _747 = _733;
    if (_719)
    {
        _747 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _749 = _747;
    float _751 = _741 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_739, _441, _745);
    int _757 = as_type<int>(_749);
    if (_719)
    {
        out.m_33.x = 0.0;
    }
    if (_719)
    {
        float _759 = _749 * 5.0;
        _757 = as_type<int>(_759);
    }
    int _761 = _757;
    float _763 = _755 * 0.15915493667125701904296875;
    float _765 = _741 * 6.283185482025146484375;
    float _767 = cos(_765);
    if (_719)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2330 = as_type<float>(_761);
        out.gl_Position.z = _2330;
    }
    if (_719)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _769 = in.m_42.y;
    float _771 = -_657;
    float _773 = _483 + _771;
    float _775 = _743 * (-2.0);
    float _777 = _131 + (-0.5);
    float _779 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _781 = fma(_773, _773, _731);
    float _783 = fma(_775, _649, _649);
    float _785 = _763 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_779, _775, _779);
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _793 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _783);
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    bool _797 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _799 = isnan(0.5);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _805 = _801 || _803;
    float _807 = fma(_789, _441, _793);
    float _809 = sqrt(_781);
    float _811 = _807 * 0.15915493667125701904296875;
    float _813 = _763 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _769 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _819 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _821 = _811 * 6.283185482025146484375;
    float _823 = cos(_821);
    float _825 = _527 * _809;
    float _827 = _767 * _787;
    float _829 = _825 * _819;
    float _831 = _753 * _787;
    float _833 = _539 * _825;
    float _835 = _811 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _791 * _829;
    float _841 = _767 * _815;
    float _843 = _795 * _833;
    float _845 = _753 * _815;
    float _847 = _823 * _839;
    float _849 = _787 * _823;
    float _851 = _815 * _823;
    float _853 = _825 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _855 = _853 * 0.5;
    float _857 = _767 * _847;
    float _859 = _753 * _847;
    float _861 = fma(_837, _841, _831);
    float _863 = -_839;
    float _865 = _837 * _863;
    float _867 = fma(_861, _843, _857);
    float _869 = -_845;
    float _871 = fma(_837, _827, _869);
    float _873 = -_827;
    float _875 = fma(_837, _845, _873);
    float _877 = fma(_851, _843, _865);
    float _879 = fma(_837, _831, _841);
    float _881 = fma(_871, _855, _867);
    float _883 = fma(_875, _843, _859);
    float _885 = fma(_849, _855, _877);
    float _887 = _881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = fma(_879, _855, _883);
    float _891 = _881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _893 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _895 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].x, _891);
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _893);
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _895);
    float _901 = _897 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _903 = _899 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _905 = _455 + _901;
    float _907 = _443 + _903;
    float _909 = _599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _905 + _911;
    float _915 = _599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _919 = _907 + _917;
    float _921 = _913 * _913;
    float _923 = fma(_919, _919, _921);
    float _925 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _909);
    float _927 = _881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _929 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _915);
    float _931 = sqrt(_923);
    float _933 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[11].z, _925);
    float _935 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].x, _927);
    float _937 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[10].z, _929);
    float _939 = _933 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _941 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _935);
    float _943 = _937 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _945 = 1.0 / _939;
    float _947 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _949 = _943 + _939;
    float _951 = _429 + _947;
    bool _953 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _955 = _947;
    float _957 = _941;
    float _959 = _907;
    if (!_953)
    {
        _955 = _905;
    }
    float _961 = _955;
    float _963 = _961;
    if (!_953)
    {
        _957 = _951;
    }
    float _965 = _957;
    bool _967 = !_953;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _931 + _973;
        float _977 = rsqrt(_923);
        float _979 = _975 * _971;
        float _981 = _951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _983 = _979 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = sin(_989);
        float _993 = _987 + (-1.0);
        float _995 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = fma(_991, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _999 = fma(_951, _987, _995);
        float _1001 = _977 * _997;
        float _1003 = fma(_919, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1005 = fma(_913, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _969 = _999;
        _963 = _1005;
        _959 = _1003;
    }
    float _1007 = _969;
    float _1009 = _963;
    float _1011 = _959;
    float _1013 = -_595;
    float _1015 = _1013 + _1007;
    float _1017 = -_657;
    float _1019 = _1017 + _1009;
    float _1021 = _949 * _945;
    float _1023 = _1021 * 0.5;
    float _1025 = -_593;
    float _1027 = _1025 + _1011;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1031 = _1009;
    if (_805)
    {
        _1031 = 1.0;
    }
    float _1033 = _1031;
    float _1035 = _1033;
    if (!_805)
    {
        float _1037 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1039 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1041 = _1037 * 0.15915493667125701904296875;
        float _1043 = _1039 * 0.15915493667125701904296875;
        float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1047 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1045);
        float _1049 = _1041 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        float _1053 = _1041 * 6.283185482025146484375;
        float _1055 = sin(_1053);
        float _1057 = 1.0 / _1051;
        float _1059 = _1043 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1055 * _1057;
        float _1065 = _1043 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1061 * _1063;
        float _1071 = 1.0 / _1047;
        float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1075 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1073;
        float _1077 = 1.0 / _1069;
        float _1079 = 1.0 / _1075;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1083 = _1071 * _1081;
        float _1085 = _1067 * _1077;
        float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1089 = fma(_1085, _1083, _1087);
        float _1091 = _1089 * _1079;
        float _1093 = precise::clamp(_1091, 0.0, 1.0);
        float _1095 = -_1093;
        float _1097 = _1095 + 1.0;
        _1035 = _1097;
    }
    float _1099 = _1035;
    float _1101 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1029);
    float _1105 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1109 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1111 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1103);
    float _1113 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1115 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1107);
    float _1117 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1109);
    float _1119 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1121 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1113);
    float _1123 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1115);
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1127 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1129 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1131 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1133 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1127);
    float _1137 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1129);
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1131);
    float _1143 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1135);
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1137);
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1139);
    float _1151 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1141);
    float _1153 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1145);
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1147);
    bool _1157 = _1099 > 0.0;
    bool _1159 = isnan(_1099);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.0);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1149);
    float _1169 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1171 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1151);
    float _1173 = _1153 + _1155;
    float _1175 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1167);
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1179 = _1173 * 0.5;
    out.m_33.x = _1177;
    out.gl_Position.x = _1171;
    out.gl_Position.y = _1175;
    out.gl_Position.z = _1153;
    out.gl_Position.w = _1155;
    out.m_52.z = _1179;
    out.m_52.w = _1155;
    if (_1165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1181;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1238 = as_type<float>(_87);
        out.gl_Position.z = _1238;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1308 = as_type<float>(_125);
        out.gl_Position.z = _1308;
    }
    if (_117)
    {
        return out;
    }
    float _127 = in.m_37.x;
    float _129 = in.m_37.y;
    float _131 = in.m_37.z;
    float _133 = in.m_37.w;
    float _135 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _137 = log2(_135);
    float _139 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = _131 * 2.0;
    int _151 = as_type<int>(_141) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_141) & 2;
    bool _157 = _155 != 0;
    float _159 = floor(_149);
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _137 * _105;
    bool _173 = _133 > 0.5;
    float _175 = exp2(_171);
    float _177 = _129 + _131;
    int _179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _181 = _179 != 0;
    float _183 = _177 + (-1.0);
    float _185 = 0.0;
    float _187 = _139;
    if (!_169)
    {
        float _189 = _139 * _139;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    bool _195 = !_153;
    float _197 = _195 ? (-0.5) : 0.5;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _201 = _199 != 0;
    float _203 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _207 = _205 != 0;
    float _209 = _193;
    if (!_169)
    {
        float _211 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    bool _215 = !_157;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = _159 > 0.0;
    bool _221 = !_169;
    float _223 = _213;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _139 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _139);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = _159 >= 0.0;
    bool _259 = isnan(_159);
    bool _261 = _257 || _259;
    bool _263 = isnan(0.0);
    bool _265 = _261 || _263;
    bool _267 = !_169;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _139 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _187 = _287;
    }
    float _289 = _187;
    float _291 = _127 + _129;
    float _293 = in.m_42.w;
    bool _295 = _127 > 0.5;
    float _297 = _127 * 2.0;
    float _299 = _291 + (-1.0);
    float _301 = in.m_30.x;
    float _303 = in.m_30.y;
    float _305 = in.m_30.z;
    float _307 = -_197;
    int _309 = _295 ? as_type<int>(_307) : as_type<int>(_197);
    float _311 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = _129 > 0.5;
    float _315 = floor(_297);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _319 = fma(_289, _145, _311);
    bool _321 = !_181;
    float _323 = _321 ? _197 : as_type<float>(_309);
    float _325 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = -_217;
    int _329 = _173 ? as_type<int>(_327) : as_type<int>(_217);
    float _331 = in.m_42.x;
    float _333 = fma(_289, _147, _325);
    float _335 = -_217;
    int _337 = _313 ? as_type<int>(_335) : as_type<int>(_217);
    float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _341 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _343 = isnan(0.0);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _349 = _345 || _347;
    float _351 = _323 + 0.5;
    bool _353 = !_201;
    float _355 = _353 ? _217 : as_type<float>(_337);
    float _357 = -_175;
    float _359 = _357 + 1.0;
    float _361 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(1.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _375 = 1.0 + _373;
    bool _377 = _131 > 0.5;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _381 = _349 ? _359 : 0.0;
    float _383 = fma(_289, _143, _361);
    float _385 = fma(_319, _293, _303);
    float _387 = fma(_333, _293, _305);
    float _389 = -_197;
    int _391 = _377 ? as_type<int>(_389) : as_type<int>(_197);
    float _393 = fma(_383, _293, _301);
    float _395 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = 1.0 / _375;
    float _399 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _407 = _405 != 0;
    float _409 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    bool _415 = _315 > 0.0;
    float _417 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    bool _419 = _315 >= 0.0;
    bool _421 = isnan(_315);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    float _429 = _413 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    float _435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _437 = _429 + _435;
    if (_371)
    {
        float _439 = _381 * _397;
        _107 = _439;
    }
    float _441 = _107;
    float _443 = _417 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _445 = !_207;
    float _447 = _445 ? _217 : as_type<float>(_329);
    float _449 = _129 * 2.0;
    bool _451 = !_407;
    float _453 = _451 ? _197 : as_type<float>(_391);
    float _455 = _433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _471 = _443 + _469;
    float _473 = _437 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _475 = _351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = -_355;
    float _479 = _477 + 0.5;
    float _481 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _483 = _455 + _481;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[28].x, _473);
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _489 = _453 + 0.5;
    float _491 = _475 * _339;
    float _493 = _437 * _437;
    float _495 = _479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[28].z, _485);
    float _499 = _489 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _501 = fma(_471, _471, _493);
    float _503 = floor(_449);
    float _505 = _495 * _431;
    bool _507 = !_463;
    int _509 = _507 ? 0 : 1;
    float _511 = -_447;
    float _513 = _511 + 0.5;
    float _515 = _499 * _379;
    bool _517 = _497 >= 0.0;
    float _519 = fma(_483, _483, _501);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _523 = _331 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = _521 * _487;
    float _527 = rsqrt(_519);
    int _529 = _265 ? 0 : 1;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _533 = !_459;
    int _535 = _533 ? 0 : 1;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _541 = _503 > 0.0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _545 = _503 >= 0.0;
    bool _547 = isnan(_503);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _557 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_517)
    {
        _563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _565 = _563;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _569 = _555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _573 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _575 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _539 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _581 = as_type<int>(_565);
    if (_517)
    {
        float _583 = _565 * 5.0;
        _581 = as_type<int>(_583);
    }
    int _585 = _581;
    out.m_44.x = _491;
    out.m_44.y = _505;
    out.m_44.z = _515;
    out.m_44.w = _525;
    float _587 = _577 * _527;
    bool _589 = !_467;
    int _591 = _589 ? 0 : 1;
    out.m_46.x = _575;
    out.m_46.y = _557;
    out.m_46.z = _559;
    out.m_46.w = _543;
    float _593 = _471 * _587;
    float _595 = _437 * _587;
    out.m_48.x = _569;
    out.m_48.y = _573;
    out.m_48.z = _579;
    if (_517)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_585);
        out.gl_Position.z = _2074;
    }
    if (_517)
    {
        out.m_33.x = 0.0;
    }
    if (_517)
    {
        return out;
    }
    float _597 = -_595;
    float _599 = _429 + _597;
    int _601 = _427 ? 0 : 1;
    float _603 = -_593;
    float _605 = _443 + _603;
    int _607 = ~_529;
    int _609 = _607 + 1;
    int _611 = _609 + 1;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _615 = _599 + _613;
    int _617 = ~_601;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _625 = _605 + _623;
    int _627 = _621;
    int _629 = _611;
    if (!_415)
    {
        int _631 = ~_601;
        int _633 = _631 + 1;
        _627 = _633;
    }
    int _635 = _627;
    float _637 = _615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_219)
    {
        int _639 = ~_529;
        int _641 = _639 + 1;
        _629 = _641;
    }
    int _643 = _629;
    float _645 = in.m_50.x;
    float _647 = in.m_50.y;
    float _649 = in.m_50.z;
    int _651 = abs(_509);
    float _653 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[28].x, _637);
    int _655 = abs(_535);
    float _657 = _483 * _587;
    float _659 = float(_643);
    float _661 = _129 + (-0.5);
    float _663 = float(_655);
    float _665 = -_657;
    float _667 = _455 + _665;
    float _669 = float(_635);
    float _671 = -_595;
    float _673 = _437 + _671;
    float _675 = float(_651);
    float _677 = _663 * _659;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _681 = _667 + _679;
    int _683 = abs(_591);
    float _685 = -_593;
    float _687 = _471 + _685;
    float _689 = _677 * (-2.0);
    int _691 = _553 ? 0 : 1;
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[28].z, _653);
    float _695 = _675 * _669;
    float _697 = _127 + (-0.5);
    int _699 = ~_691;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = _673 * _673;
    float _707 = fma(_689, _645, _645);
    int _709 = _703;
    if (!_541)
    {
        int _711 = ~_691;
        int _713 = _711 + 1;
        _709 = _713;
    }
    int _715 = _709;
    float _717 = _127 + _131;
    bool _719 = _693 >= 0.0;
    float _721 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].x, _707);
    float _723 = float(_683);
    float _725 = fma(_317, _689, _317);
    float _727 = float(_715);
    float _729 = _695 * (-2.0);
    float _731 = fma(_687, _687, _705);
    float _733 = fma(_725, _441, _721);
    float _735 = _717 + (-1.0);
    float _737 = fma(_729, _647, _647);
    float _739 = fma(_203, _729, _203);
    float _741 = _733 * 0.15915493667125701904296875;
    float _743 = _723 * _727;
    float _745 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].y, _737);
    float _747 = _733;
    if (_719)
    {
        _747 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _749 = _747;
    float _751 = _741 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_739, _441, _745);
    int _757 = as_type<int>(_749);
    if (_719)
    {
        out.m_33.x = 0.0;
    }
    if (_719)
    {
        float _759 = _749 * 5.0;
        _757 = as_type<int>(_759);
    }
    int _761 = _757;
    float _763 = _755 * 0.15915493667125701904296875;
    float _765 = _741 * 6.283185482025146484375;
    float _767 = cos(_765);
    if (_719)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2330 = as_type<float>(_761);
        out.gl_Position.z = _2330;
    }
    if (_719)
    {
        return out;
    }
    float _769 = in.m_42.y;
    float _771 = -_657;
    float _773 = _483 + _771;
    float _775 = _743 * (-2.0);
    float _777 = _131 + (-0.5);
    float _779 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _781 = fma(_773, _773, _731);
    float _783 = fma(_775, _649, _649);
    float _785 = _763 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_779, _775, _779);
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _793 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _783);
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    bool _797 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _799 = isnan(0.5);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _805 = _801 || _803;
    float _807 = fma(_789, _441, _793);
    float _809 = sqrt(_781);
    float _811 = _807 * 0.15915493667125701904296875;
    float _813 = _763 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _769 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _819 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _821 = _811 * 6.283185482025146484375;
    float _823 = cos(_821);
    float _825 = _527 * _809;
    float _827 = _767 * _787;
    float _829 = _825 * _819;
    float _831 = _753 * _787;
    float _833 = _539 * _825;
    float _835 = _811 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _791 * _829;
    float _841 = _767 * _815;
    float _843 = _795 * _833;
    float _845 = _753 * _815;
    float _847 = _823 * _839;
    float _849 = _787 * _823;
    float _851 = _815 * _823;
    float _853 = _825 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _855 = _853 * 0.5;
    float _857 = _767 * _847;
    float _859 = _753 * _847;
    float _861 = fma(_837, _841, _831);
    float _863 = -_839;
    float _865 = _837 * _863;
    float _867 = fma(_861, _843, _857);
    float _869 = -_845;
    float _871 = fma(_837, _827, _869);
    float _873 = -_827;
    float _875 = fma(_837, _845, _873);
    float _877 = fma(_851, _843, _865);
    float _879 = fma(_837, _831, _841);
    float _881 = fma(_871, _855, _867);
    float _883 = fma(_875, _843, _859);
    float _885 = fma(_849, _855, _877);
    float _887 = _881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = fma(_879, _855, _883);
    float _891 = _881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _893 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _895 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].x, _891);
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _893);
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _895);
    float _901 = _897 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _903 = _899 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _905 = _455 + _901;
    float _907 = _443 + _903;
    float _909 = _599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _905 + _911;
    float _915 = _599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _919 = _907 + _917;
    float _921 = _913 * _913;
    float _923 = fma(_919, _919, _921);
    float _925 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _909);
    float _927 = _881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _929 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _915);
    float _931 = sqrt(_923);
    float _933 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[11].z, _925);
    float _935 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].x, _927);
    float _937 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[10].z, _929);
    float _939 = _933 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _941 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _935);
    float _943 = _937 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _945 = 1.0 / _939;
    float _947 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _949 = _943 + _939;
    float _951 = _429 + _947;
    bool _953 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _955 = _947;
    float _957 = _941;
    float _959 = _907;
    if (!_953)
    {
        _955 = _905;
    }
    float _961 = _955;
    float _963 = _961;
    if (!_953)
    {
        _957 = _951;
    }
    float _965 = _957;
    bool _967 = !_953;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _931 + _973;
        float _977 = rsqrt(_923);
        float _979 = _975 * _971;
        float _981 = _951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _983 = _979 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = sin(_989);
        float _993 = _987 + (-1.0);
        float _995 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = fma(_991, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _999 = fma(_951, _987, _995);
        float _1001 = _977 * _997;
        float _1003 = fma(_919, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1005 = fma(_913, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _969 = _999;
        _963 = _1005;
        _959 = _1003;
    }
    float _1007 = _969;
    float _1009 = _963;
    float _1011 = _959;
    float _1013 = -_595;
    float _1015 = _1013 + _1007;
    float _1017 = -_657;
    float _1019 = _1017 + _1009;
    float _1021 = _949 * _945;
    float _1023 = _1021 * 0.5;
    float _1025 = -_593;
    float _1027 = _1025 + _1011;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1031 = _1009;
    if (_805)
    {
        _1031 = 1.0;
    }
    float _1033 = _1031;
    float _1035 = _1033;
    if (!_805)
    {
        float _1037 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1039 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1041 = _1037 * 0.15915493667125701904296875;
        float _1043 = _1039 * 0.15915493667125701904296875;
        float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1047 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1045);
        float _1049 = _1041 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        float _1053 = _1041 * 6.283185482025146484375;
        float _1055 = sin(_1053);
        float _1057 = 1.0 / _1051;
        float _1059 = _1043 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1055 * _1057;
        float _1065 = _1043 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1061 * _1063;
        float _1071 = 1.0 / _1047;
        float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1075 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1073;
        float _1077 = 1.0 / _1069;
        float _1079 = 1.0 / _1075;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1083 = _1071 * _1081;
        float _1085 = _1067 * _1077;
        float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1089 = fma(_1085, _1083, _1087);
        float _1091 = _1089 * _1079;
        float _1093 = precise::clamp(_1091, 0.0, 1.0);
        float _1095 = -_1093;
        float _1097 = _1095 + 1.0;
        _1035 = _1097;
    }
    float _1099 = _1035;
    float _1101 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1029);
    float _1105 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1109 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1111 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1103);
    float _1113 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1115 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1107);
    float _1117 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1109);
    float _1119 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1121 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1113);
    float _1123 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1115);
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1127 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1129 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1131 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1133 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1127);
    float _1137 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1129);
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1131);
    float _1143 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1135);
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1137);
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1139);
    float _1151 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1141);
    float _1153 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1145);
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1147);
    bool _1157 = _1099 > 0.0;
    bool _1159 = isnan(_1099);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.0);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1149);
    float _1169 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1171 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1151);
    float _1173 = _1153 + _1155;
    float _1175 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1167);
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1179 = _1173 * 0.5;
    out.m_33.x = _1177;
    out.gl_Position.x = _1171;
    out.gl_Position.y = _1175;
    out.gl_Position.z = _1153;
    out.gl_Position.w = _1155;
    out.m_52.z = _1179;
    out.m_52.w = _1155;
    if (_1165)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1181;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1238 = as_type<float>(_87);
        out.gl_Position.z = _1238;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1308 = as_type<float>(_125);
        out.gl_Position.z = _1308;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_37.x;
    float _129 = in.m_37.y;
    float _131 = in.m_37.z;
    float _133 = in.m_37.w;
    float _135 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _137 = log2(_135);
    float _139 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = _131 * 2.0;
    int _151 = as_type<int>(_141) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_141) & 2;
    bool _157 = _155 != 0;
    float _159 = floor(_149);
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _137 * _105;
    bool _173 = _133 > 0.5;
    float _175 = exp2(_171);
    float _177 = _129 + _131;
    int _179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _181 = _179 != 0;
    float _183 = _177 + (-1.0);
    float _185 = 0.0;
    float _187 = _139;
    if (!_169)
    {
        float _189 = _139 * _139;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    bool _195 = !_153;
    float _197 = _195 ? (-0.5) : 0.5;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _201 = _199 != 0;
    float _203 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _207 = _205 != 0;
    float _209 = _193;
    if (!_169)
    {
        float _211 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    bool _215 = !_157;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = _159 > 0.0;
    bool _221 = !_169;
    float _223 = _213;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _139 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _139);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = _159 >= 0.0;
    bool _259 = isnan(_159);
    bool _261 = _257 || _259;
    bool _263 = isnan(0.0);
    bool _265 = _261 || _263;
    bool _267 = !_169;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _139 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _187 = _287;
    }
    float _289 = _187;
    float _291 = _127 + _129;
    float _293 = in.m_42.w;
    bool _295 = _127 > 0.5;
    float _297 = _127 * 2.0;
    float _299 = _291 + (-1.0);
    float _301 = in.m_30.x;
    float _303 = in.m_30.y;
    float _305 = in.m_30.z;
    float _307 = -_197;
    int _309 = _295 ? as_type<int>(_307) : as_type<int>(_197);
    float _311 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = _129 > 0.5;
    float _315 = floor(_297);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _319 = fma(_289, _145, _311);
    bool _321 = !_181;
    float _323 = _321 ? _197 : as_type<float>(_309);
    float _325 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = -_217;
    int _329 = _173 ? as_type<int>(_327) : as_type<int>(_217);
    float _331 = in.m_42.x;
    float _333 = fma(_289, _147, _325);
    float _335 = -_217;
    int _337 = _313 ? as_type<int>(_335) : as_type<int>(_217);
    float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _341 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _343 = isnan(0.0);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _349 = _345 || _347;
    float _351 = _323 + 0.5;
    bool _353 = !_201;
    float _355 = _353 ? _217 : as_type<float>(_337);
    float _357 = -_175;
    float _359 = _357 + 1.0;
    float _361 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(1.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _375 = 1.0 + _373;
    bool _377 = _131 > 0.5;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _381 = _349 ? _359 : 0.0;
    float _383 = fma(_289, _143, _361);
    float _385 = fma(_319, _293, _303);
    float _387 = fma(_333, _293, _305);
    float _389 = -_197;
    int _391 = _377 ? as_type<int>(_389) : as_type<int>(_197);
    float _393 = fma(_383, _293, _301);
    float _395 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = 1.0 / _375;
    float _399 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _407 = _405 != 0;
    float _409 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    bool _415 = _315 > 0.0;
    float _417 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    bool _419 = _315 >= 0.0;
    bool _421 = isnan(_315);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    float _429 = _413 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    float _435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _437 = _429 + _435;
    if (_371)
    {
        float _439 = _381 * _397;
        _107 = _439;
    }
    float _441 = _107;
    float _443 = _417 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _445 = !_207;
    float _447 = _445 ? _217 : as_type<float>(_329);
    float _449 = _129 * 2.0;
    bool _451 = !_407;
    float _453 = _451 ? _197 : as_type<float>(_391);
    float _455 = _433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _471 = _443 + _469;
    float _473 = _437 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _475 = _351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = -_355;
    float _479 = _477 + 0.5;
    float _481 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _483 = _455 + _481;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[28].x, _473);
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _489 = _453 + 0.5;
    float _491 = _475 * _339;
    float _493 = _437 * _437;
    float _495 = _479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[28].z, _485);
    float _499 = _489 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _501 = fma(_471, _471, _493);
    float _503 = floor(_449);
    float _505 = _495 * _431;
    bool _507 = !_463;
    int _509 = _507 ? 0 : 1;
    float _511 = -_447;
    float _513 = _511 + 0.5;
    float _515 = _499 * _379;
    bool _517 = _497 >= 0.0;
    float _519 = fma(_483, _483, _501);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _523 = _331 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = _521 * _487;
    float _527 = rsqrt(_519);
    int _529 = _265 ? 0 : 1;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _533 = !_459;
    int _535 = _533 ? 0 : 1;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _541 = _503 > 0.0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _545 = _503 >= 0.0;
    bool _547 = isnan(_503);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _557 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_517)
    {
        _563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _565 = _563;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _569 = _555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _573 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _575 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _539 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _581 = as_type<int>(_565);
    if (_517)
    {
        float _583 = _565 * 5.0;
        _581 = as_type<int>(_583);
    }
    int _585 = _581;
    out.m_44.x = _491;
    out.m_44.y = _505;
    out.m_44.z = _515;
    out.m_44.w = _525;
    float _587 = _577 * _527;
    bool _589 = !_467;
    int _591 = _589 ? 0 : 1;
    out.m_46.x = _575;
    out.m_46.y = _557;
    out.m_46.z = _559;
    out.m_46.w = _543;
    float _593 = _471 * _587;
    float _595 = _437 * _587;
    out.m_48.x = _569;
    out.m_48.y = _573;
    out.m_48.z = _579;
    if (_517)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_585);
        out.gl_Position.z = _2074;
    }
    if (_517)
    {
        out.m_33.x = 0.0;
    }
    if (_517)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _597 = -_595;
    float _599 = _429 + _597;
    int _601 = _427 ? 0 : 1;
    float _603 = -_593;
    float _605 = _443 + _603;
    int _607 = ~_529;
    int _609 = _607 + 1;
    int _611 = _609 + 1;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _615 = _599 + _613;
    int _617 = ~_601;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _625 = _605 + _623;
    int _627 = _621;
    int _629 = _611;
    if (!_415)
    {
        int _631 = ~_601;
        int _633 = _631 + 1;
        _627 = _633;
    }
    int _635 = _627;
    float _637 = _615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_219)
    {
        int _639 = ~_529;
        int _641 = _639 + 1;
        _629 = _641;
    }
    int _643 = _629;
    float _645 = in.m_50.x;
    float _647 = in.m_50.y;
    float _649 = in.m_50.z;
    int _651 = abs(_509);
    float _653 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[28].x, _637);
    int _655 = abs(_535);
    float _657 = _483 * _587;
    float _659 = float(_643);
    float _661 = _129 + (-0.5);
    float _663 = float(_655);
    float _665 = -_657;
    float _667 = _455 + _665;
    float _669 = float(_635);
    float _671 = -_595;
    float _673 = _437 + _671;
    float _675 = float(_651);
    float _677 = _663 * _659;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _681 = _667 + _679;
    int _683 = abs(_591);
    float _685 = -_593;
    float _687 = _471 + _685;
    float _689 = _677 * (-2.0);
    int _691 = _553 ? 0 : 1;
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[28].z, _653);
    float _695 = _675 * _669;
    float _697 = _127 + (-0.5);
    int _699 = ~_691;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = _673 * _673;
    float _707 = fma(_689, _645, _645);
    int _709 = _703;
    if (!_541)
    {
        int _711 = ~_691;
        int _713 = _711 + 1;
        _709 = _713;
    }
    int _715 = _709;
    float _717 = _127 + _131;
    bool _719 = _693 >= 0.0;
    float _721 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].x, _707);
    float _723 = float(_683);
    float _725 = fma(_317, _689, _317);
    float _727 = float(_715);
    float _729 = _695 * (-2.0);
    float _731 = fma(_687, _687, _705);
    float _733 = fma(_725, _441, _721);
    float _735 = _717 + (-1.0);
    float _737 = fma(_729, _647, _647);
    float _739 = fma(_203, _729, _203);
    float _741 = _733 * 0.15915493667125701904296875;
    float _743 = _723 * _727;
    float _745 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].y, _737);
    float _747 = _733;
    if (_719)
    {
        _747 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _749 = _747;
    float _751 = _741 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_739, _441, _745);
    int _757 = as_type<int>(_749);
    if (_719)
    {
        out.m_33.x = 0.0;
    }
    if (_719)
    {
        float _759 = _749 * 5.0;
        _757 = as_type<int>(_759);
    }
    int _761 = _757;
    float _763 = _755 * 0.15915493667125701904296875;
    float _765 = _741 * 6.283185482025146484375;
    float _767 = cos(_765);
    if (_719)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2330 = as_type<float>(_761);
        out.gl_Position.z = _2330;
    }
    if (_719)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _769 = in.m_42.y;
    float _771 = -_657;
    float _773 = _483 + _771;
    float _775 = _743 * (-2.0);
    float _777 = _131 + (-0.5);
    float _779 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _781 = fma(_773, _773, _731);
    float _783 = fma(_775, _649, _649);
    float _785 = _763 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_779, _775, _779);
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _793 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _783);
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    bool _797 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _799 = isnan(0.5);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _805 = _801 || _803;
    float _807 = fma(_789, _441, _793);
    float _809 = sqrt(_781);
    float _811 = _807 * 0.15915493667125701904296875;
    float _813 = _763 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _769 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _819 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _821 = _811 * 6.283185482025146484375;
    float _823 = cos(_821);
    float _825 = _527 * _809;
    float _827 = _767 * _787;
    float _829 = _825 * _819;
    float _831 = _753 * _787;
    float _833 = _539 * _825;
    float _835 = _811 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _791 * _829;
    float _841 = _767 * _815;
    float _843 = _795 * _833;
    float _845 = _753 * _815;
    float _847 = _823 * _839;
    float _849 = _787 * _823;
    float _851 = _815 * _823;
    float _853 = _825 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _855 = _853 * 0.5;
    float _857 = _767 * _847;
    float _859 = _753 * _847;
    float _861 = fma(_837, _841, _831);
    float _863 = -_839;
    float _865 = _837 * _863;
    float _867 = fma(_861, _843, _857);
    float _869 = -_845;
    float _871 = fma(_837, _827, _869);
    float _873 = -_827;
    float _875 = fma(_837, _845, _873);
    float _877 = fma(_851, _843, _865);
    float _879 = fma(_837, _831, _841);
    float _881 = fma(_871, _855, _867);
    float _883 = fma(_875, _843, _859);
    float _885 = fma(_849, _855, _877);
    float _887 = _881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = fma(_879, _855, _883);
    float _891 = _881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _893 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _895 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].x, _891);
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _893);
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _895);
    float _901 = _897 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _903 = _899 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _905 = _455 + _901;
    float _907 = _443 + _903;
    float _909 = _599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _905 + _911;
    float _915 = _599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _919 = _907 + _917;
    float _921 = _913 * _913;
    float _923 = fma(_919, _919, _921);
    float _925 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _909);
    float _927 = _881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _929 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _915);
    float _931 = sqrt(_923);
    float _933 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[11].z, _925);
    float _935 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].x, _927);
    float _937 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[10].z, _929);
    float _939 = _933 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _941 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _935);
    float _943 = _937 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _945 = 1.0 / _939;
    float _947 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _949 = _943 + _939;
    float _951 = _429 + _947;
    bool _953 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _955 = _947;
    float _957 = _941;
    float _959 = _907;
    if (!_953)
    {
        _955 = _905;
    }
    float _961 = _955;
    float _963 = _961;
    if (!_953)
    {
        _957 = _951;
    }
    float _965 = _957;
    bool _967 = !_953;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _931 + _973;
        float _977 = rsqrt(_923);
        float _979 = _975 * _971;
        float _981 = _951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _983 = _979 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = cos(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = sin(_989);
        float _993 = _987 + (-1.0);
        float _995 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = fma(_991, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _999 = fma(_951, _987, _995);
        float _1001 = _977 * _997;
        float _1003 = fma(_919, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1005 = fma(_913, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _969 = _999;
        _963 = _1005;
        _959 = _1003;
    }
    float _1007 = _969;
    float _1009 = _963;
    float _1011 = _959;
    float _1013 = -_595;
    float _1015 = _1013 + _1007;
    float _1017 = -_657;
    float _1019 = _1017 + _1009;
    float _1021 = _949 * _945;
    float _1023 = _1021 * 0.5;
    float _1025 = -_593;
    float _1027 = _1025 + _1011;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1031 = _1009;
    if (_805)
    {
        _1031 = 1.0;
    }
    float _1033 = _1031;
    float _1035 = _1033;
    if (!_805)
    {
        float _1037 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1039 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1041 = _1037 * 0.15915493667125701904296875;
        float _1043 = _1039 * 0.15915493667125701904296875;
        float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1047 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1045);
        float _1049 = _1041 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        float _1053 = _1041 * 6.283185482025146484375;
        float _1055 = sin(_1053);
        float _1057 = 1.0 / _1051;
        float _1059 = _1043 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1055 * _1057;
        float _1065 = _1043 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1061 * _1063;
        float _1071 = 1.0 / _1047;
        float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1075 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1073;
        float _1077 = 1.0 / _1069;
        float _1079 = 1.0 / _1075;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1083 = _1071 * _1081;
        float _1085 = _1067 * _1077;
        float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1089 = fma(_1085, _1083, _1087);
        float _1091 = _1089 * _1079;
        float _1093 = precise::clamp(_1091, 0.0, 1.0);
        float _1095 = -_1093;
        float _1097 = _1095 + 1.0;
        _1035 = _1097;
    }
    float _1099 = _1035;
    float _1101 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1029);
    float _1105 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1109 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1111 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1103);
    float _1113 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1115 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1107);
    float _1117 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1109);
    float _1119 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1121 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1113);
    float _1123 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1115);
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1127 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1129 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1131 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1133 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1127);
    float _1137 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1129);
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1131);
    float _1143 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1135);
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1137);
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1139);
    float _1151 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1141);
    float _1153 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1145);
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1147);
    bool _1157 = _1099 > 0.0;
    bool _1159 = isnan(_1099);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.0);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1149);
    float _1169 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1171 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1151);
    float _1173 = _1153 + _1155;
    float _1175 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1167);
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1179 = _1173 * 0.5;
    out.m_33.x = _1177;
    out.gl_Position.x = _1171;
    out.gl_Position.y = _1175;
    out.gl_Position.z = _1153;
    out.gl_Position.w = _1155;
    out.m_52.z = _1179;
    out.m_52.w = _1155;
    if (_1165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1181;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

