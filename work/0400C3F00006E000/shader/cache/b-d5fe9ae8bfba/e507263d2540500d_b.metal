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
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _287 = false;
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
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
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
        float _1360 = as_type<float>(_87);
        out.gl_Position.z = _1360;
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
        _81 = _109;
    }
    float _111 = _81;
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
        float _1430 = as_type<float>(_125);
        out.gl_Position.z = _1430;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_40.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = 0.0;
    float _157 = _129;
    if (!_141)
    {
        float _159 = _129 * _129;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_141;
    float _189 = _169;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _129 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _129);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
    }
    float _221 = _189;
    bool _223 = !_141;
    if (!_223)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = 1.0 / _231;
        float _235 = _129 * _227;
        float _237 = exp2(_235);
        float _239 = -_237;
        float _241 = _239 + 1.0;
        float _243 = _241 * _233;
        _157 = _243;
    }
    float _245 = _157;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _255 = fma(_245, _145, _249);
    float _257 = fma(_245, _143, _251);
    float _259 = fma(_245, _147, _253);
    float _261 = fma(_255, _131, _151);
    float _263 = fma(_257, _131, _149);
    float _265 = fma(_259, _131, _153);
    bool _267 = !_247;
    float _285;
    if (!_267)
    {
        float _269 = in.m_42.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_71);
        float _291 = 1.0 / _289;
        float _293 = _105 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    float _303 = in.m_42.w;
    float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _307 = log2(_305);
    float _309 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _313 = _311 != 0;
    float _315 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _309);
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _323 = _321 != 0;
    float _325 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _329 = _327 != 0;
    float _331 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _333 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _335 = _307 * _105;
    float _337 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _331);
    float _339 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _333);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _343 = exp2(_335);
    bool _345 = _297 > 0.5;
    float _347 = _301 * 2.0;
    bool _349 = _303 > 0.5;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -_181;
    int _357 = _345 ? as_type<int>(_355) : as_type<int>(_181);
    float _359 = _297 * 2.0;
    bool _361 = _299 > 0.5;
    float _363 = floor(_347);
    float _365 = -_185;
    int _367 = _349 ? as_type<int>(_365) : as_type<int>(_185);
    float _369 = _299 + _301;
    bool _371 = !_313;
    float _373 = _371 ? _181 : as_type<float>(_357);
    float _375 = _301 + _297;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _379 = _377 != 0;
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _387 = _385 != 0;
    float _389 = _301 + (-0.5);
    float _391 = -_185;
    int _393 = _361 ? as_type<int>(_391) : as_type<int>(_185);
    float _395 = -_343;
    float _397 = _395 + 1.0;
    bool _399 = _301 > 0.5;
    float _401 = _299 + _297;
    float _403 = _297 + (-0.5);
    float _405 = -_181;
    int _407 = _399 ? as_type<int>(_405) : as_type<int>(_181);
    float _409 = _299 + (-0.5);
    bool _411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _419 = _415 || _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _429 = _419 ? _397 : 0.0;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _433 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(1.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _445 = 1.0 + _443;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _449 = 1.0 / _427;
    float _451 = _299 * 2.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _459 = _295 + _457;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _463 = 1.0 / _445;
    float _465 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _475 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = 1.0 / _353;
    out.m_44.x = _465;
    out.m_44.y = _467;
    out.m_44.z = _469;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _487 = _295 + _485;
    float _489 = _369 + (-1.0);
    float _491 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _337);
    float _493 = floor(_359);
    if (_441)
    {
        float _495 = _429 * _463;
        _107 = _495;
    }
    float _497 = _107;
    bool _499 = _363 >= 0.0;
    bool _501 = isnan(_363);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    out.m_46.x = _475;
    out.m_46.y = _481;
    out.m_46.z = _483;
    out.m_46.w = _479;
    float _509 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _339);
    bool _511 = !_319;
    float _513 = _511 ? _185 : as_type<float>(_393);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _295 + _515;
    bool _519 = _363 > 0.0;
    float _521 = floor(_451);
    int _523 = _507 ? 0 : 1;
    float _525 = _487 * _477;
    float _527 = _459 * _449;
    float _529 = _375 + (-1.0);
    int _531 = ~_523;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _539 = _295 + _537;
    float _541 = 1.0 / _455;
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _545 = _325 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _547 = _535;
    if (!_519)
    {
        int _549 = ~_523;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    float _555 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _557 = _493 >= 0.0;
    bool _559 = isnan(_493);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = 1.0 / _423;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _569;
    float _573 = _491 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _575 = _565 ? 0 : 1;
    float _577 = fma(_571, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _521 > 0.0;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _585 = _521 >= 0.0;
    bool _587 = isnan(_521);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = _517 * _541;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _601 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _603 = isnan(_295);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _615 = _573 + _613;
    float _617 = fma(_583, _595, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _619 = fma(_599, _595, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _621 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_295);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_611;
    float _635 = _633 + 1.0;
    bool _637 = !_329;
    float _639 = _637 ? _185 : as_type<float>(_367);
    float _641 = _539 * _567;
    float _643 = _631 * _635;
    bool _645 = _493 > 0.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _647;
    bool _651 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _653 = isnan(_295);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_631;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _667;
    bool _671 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _673 = isnan(_295);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = fma(_649, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _685 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _687 = isnan(_295);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -_661;
    float _699 = _697 + 1.0;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _701;
    float _705 = fma(_669, _641, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _711 = _661 * _665;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _545 + _713;
    float _717 = _681 * _699;
    float _719 = fma(_703, _641, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _721 = _509 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _723 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = -_681;
    float _727 = _725 + 1.0;
    float _729 = _577 * _717;
    float _731 = _401 + (-1.0);
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _721 + _733;
    float _737 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _743 = -_695;
    float _745 = _743 + 1.0;
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _753 = fma(_617, _711, _739);
    float _755 = _611 * _745;
    float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _759 = !_323;
    float _761 = _759 ? _181 : as_type<float>(_407);
    float _763 = _373 + 0.5;
    float _765 = fma(_709, _527, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _767 = fma(_751, _527, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _769 = _747 >= 0.0;
    float _771 = fma(_705, _643, _753);
    float _773 = in.m_40.x;
    float _775 = in.m_40.y;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _779 = -_513;
    float _781 = _779 + 0.5;
    float _783 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _785 = !_379;
    int _787 = _785 ? 0 : 1;
    float _789 = _761 + 0.5;
    int _791 = ~_575;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = fma(_765, _755, _771);
    int _799 = abs(_787);
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _803 = _715 * _715;
    int _805 = _795;
    if (!_645)
    {
        int _807 = ~_575;
        int _809 = _807 + 1;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = _789 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _817 = fma(_615, _615, _803);
    float _819 = float(_799);
    float _821 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[147].x, _797);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _825 = _815 * _757;
    float _827 = _783 * _777;
    float _829 = -_639;
    float _831 = _829 + 0.5;
    float _833 = fma(_735, _735, _817);
    float _835 = float(_553);
    float _837 = _817;
    if (_769)
    {
        out.m_33.x = 0.0;
    }
    float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _841 = _813 * _801;
    float _843 = rsqrt(_833);
    float _845 = in.m_48.x;
    float _847 = in.m_48.y;
    float _849 = in.m_48.z;
    float _851 = _821 * _773;
    if (_769)
    {
        _837 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _853 = _837;
    float _855 = _819 * _835;
    int _857 = _593 ? 0 : 1;
    float _859 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _839 * _823;
    int _863 = as_type<int>(_853);
    if (_769)
    {
        float _865 = _853 * 5.0;
        _863 = as_type<int>(_865);
    }
    int _867 = _863;
    int _869 = ~_857;
    int _871 = _869 + 1;
    int _873 = _871 + 1;
    out.m_50.x = _827;
    out.m_50.y = _841;
    out.m_50.z = _825;
    out.m_50.w = _861;
    int _875 = _873;
    if (!_579)
    {
        int _877 = ~_857;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = _855 * (-2.0);
    bool _885 = !_383;
    int _887 = _885 ? 0 : 1;
    if (_769)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2633 = as_type<float>(_867);
        out.gl_Position.z = _2633;
    }
    float _889 = fma(_741, _883, _741);
    float _891 = fma(_883, _845, _845);
    float _893 = _859 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _895 = abs(_887);
    bool _897 = !_387;
    int _899 = _897 ? 0 : 1;
    float _901 = _893 * _843;
    float _903 = _715 * _901;
    float _905 = _849;
    if (_769)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _907 = float(_895);
    float _909 = _615 * _901;
    float _911 = float(_811);
    float _913 = -_903;
    float _915 = _545 + _913;
    int _917 = abs(_899);
    float _919 = -_909;
    float _921 = _573 + _919;
    float _923 = -_903;
    float _925 = _715 + _923;
    float _927 = _907 * _911;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _931 = _915 + _929;
    float _933 = _735 * _901;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _937 = _921 + _935;
    float _939 = float(_917);
    float _941 = _931 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _943 = -_933;
    float _945 = _721 + _943;
    float _947 = float(_881);
    float _949 = -_909;
    float _951 = _615 + _949;
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[28].x, _941);
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _957 = _945 + _955;
    float _959 = _927 * (-2.0);
    float _961 = _925 * _925;
    float _963 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    float _965 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[28].z, _953);
    float _967 = fma(_959, _847, _847);
    float _969 = fma(_555, _959, _555);
    float _971 = _939 * _947;
    float _973 = fma(_951, _951, _961);
    bool _975 = _965 >= 0.0;
    float _977 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[196].y, _967);
    float _979 = -_933;
    float _981 = _735 + _979;
    float _983 = fma(_889, _497, _963);
    float _985 = _683 * _717;
    float _987 = fma(_969, _497, _977);
    float _989 = _971 * (-2.0);
    float _991 = fma(_981, _981, _973);
    float _993 = _983 * 0.15915493667125701904296875;
    float _995 = _987 * 0.15915493667125701904296875;
    float _997 = fma(_989, _849, _849);
    float _999 = fma(_543, _989, _543);
    float _1001 = _993 * 6.283185482025146484375;
    float _1003 = sin(_1001);
    if (_975)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1005 = _905;
    float _1007 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].y, _985);
    float _1009 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[196].z, _997);
    int _1011 = as_type<int>(_1005);
    if (_975)
    {
        out.m_33.x = 0.0;
    }
    float _1013 = fma(_619, _711, _1007);
    if (_975)
    {
        float _1015 = _1005 * 5.0;
        _1011 = as_type<int>(_1015);
    }
    int _1017 = _1011;
    float _1019 = _993 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = fma(_999, _497, _1009);
    float _1025 = fma(_719, _643, _1013);
    if (_975)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2865 = as_type<float>(_1017);
        out.gl_Position.z = _2865;
    }
    float _1027 = _1023 * 0.15915493667125701904296875;
    float _1029 = fma(_767, _755, _1025);
    float _1031 = _995 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _995 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = sqrt(_991);
    if (_975)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1041 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1029);
    float _1043 = _1027 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = _843 * _1039;
    float _1049 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1051 = _1041 * _775;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1055 = _1021 * _1037;
    float _1057 = _859 * _1047;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1061 = _1027 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1067 = _1065 * 0.5;
    float _1069 = _1053 * _1057;
    float _1071 = _1047 * _1059;
    float _1073 = _1049 * _1071;
    float _1075 = _1003 * _1033;
    float _1077 = _1021 * _1033;
    float _1079 = _1033 * _1045;
    float _1081 = _1045 * _1073;
    float _1083 = _1021 * _1081;
    float _1085 = fma(_1063, _1055, _1075);
    float _1087 = _1037 * _1045;
    float _1089 = _1003 * _1037;
    float _1091 = -_1073;
    float _1093 = _1063 * _1091;
    float _1095 = fma(_1085, _1069, _1083);
    float _1097 = _1003 * _1081;
    float _1099 = -_1089;
    float _1101 = fma(_1063, _1077, _1099);
    float _1103 = -_1077;
    float _1105 = fma(_1063, _1089, _1103);
    float _1107 = fma(_1087, _1069, _1093);
    float _1109 = fma(_1063, _1075, _1055);
    float _1111 = fma(_1101, _1067, _1095);
    float _1113 = fma(_1105, _1069, _1097);
    float _1115 = fma(_1079, _1067, _1107);
    float _1117 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1119 = fma(_1109, _1067, _1113);
    float _1121 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1117);
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1127 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1123);
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1125);
    float _1131 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1135 = _721 + _1131;
    float _1137 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1139 = _573 + _1133;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1143 = _1135 + _1141;
    float _1145 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1137);
    float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1149 = _1139 + _1147;
    float _1151 = _1143 * _1143;
    float _1153 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1155 = fma(_1149, _1149, _1151);
    float _1157 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1159 = sqrt(_1155);
    float _1161 = _545 + _1157;
    bool _1163 = _1159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1165 = _1151;
    float _1167 = _1137;
    float _1169 = _1139;
    if (!_1163)
    {
        _1165 = _1135;
    }
    float _1171 = _1165;
    float _1173 = _1171;
    if (!_1163)
    {
        _1167 = _1161;
    }
    float _1175 = _1167;
    bool _1177 = !_1163;
    float _1179 = _1175;
    if (!_1177)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1185 = _1159 + _1183;
        float _1187 = _1161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = rsqrt(_1155);
        float _1191 = _1185 * _1181;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1193 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = _1193 * 6.283185482025146484375;
        float _1201 = cos(_1199);
        float _1203 = fma(_1197, _1187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1205 = _1189 * _1203;
        float _1207 = _1201 + (-1.0);
        float _1209 = fma(_1149, _1205, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1211 = fma(_1143, _1205, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1213 = _1207 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = fma(_1161, _1201, _1213);
        _1179 = _1215;
        _1169 = _1209;
        _1173 = _1211;
    }
    float _1217 = _1179;
    float _1219 = _1169;
    float _1221 = _1173;
    float _1223 = -_903;
    float _1225 = _1223 + _1217;
    float _1227 = -_909;
    float _1229 = _1227 + _1219;
    float _1231 = -_933;
    float _1233 = _1231 + _1221;
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1239 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1241 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1235);
    float _1243 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1237);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1239);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1241);
    float _1251 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1243);
    float _1253 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1245);
    float _1255 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1247);
    float _1257 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1251);
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1267 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1269 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1273 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1265);
    float _1275 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1267);
    float _1277 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1269);
    float _1279 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1283 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1275);
    float _1285 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1271);
    float _1287 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1277);
    float _1289 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1281);
    float _1291 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1283);
    float _1293 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1285);
    float _1295 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1287);
    float _1297 = _1289 + _1291;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1293);
    float _1301 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1303 = _1297 * 0.5;
    out.m_33.x = _1301;
    out.gl_Position.x = _1295;
    out.gl_Position.y = _1299;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1291;
    out.m_52.z = _1303;
    out.m_52.w = _1291;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _287 = false;
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
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
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
        float _1360 = as_type<float>(_87);
        out.gl_Position.z = _1360;
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
        _81 = _109;
    }
    float _111 = _81;
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
        float _1430 = as_type<float>(_125);
        out.gl_Position.z = _1430;
    }
    if (_117)
    {
        return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_40.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = 0.0;
    float _157 = _129;
    if (!_141)
    {
        float _159 = _129 * _129;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_141;
    float _189 = _169;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _129 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _129);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
    }
    float _221 = _189;
    bool _223 = !_141;
    if (!_223)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = 1.0 / _231;
        float _235 = _129 * _227;
        float _237 = exp2(_235);
        float _239 = -_237;
        float _241 = _239 + 1.0;
        float _243 = _241 * _233;
        _157 = _243;
    }
    float _245 = _157;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _255 = fma(_245, _145, _249);
    float _257 = fma(_245, _143, _251);
    float _259 = fma(_245, _147, _253);
    float _261 = fma(_255, _131, _151);
    float _263 = fma(_257, _131, _149);
    float _265 = fma(_259, _131, _153);
    bool _267 = !_247;
    float _285;
    if (!_267)
    {
        float _269 = in.m_42.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_71);
        float _291 = 1.0 / _289;
        float _293 = _105 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    float _303 = in.m_42.w;
    float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _307 = log2(_305);
    float _309 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _313 = _311 != 0;
    float _315 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _309);
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _323 = _321 != 0;
    float _325 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _329 = _327 != 0;
    float _331 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _333 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _335 = _307 * _105;
    float _337 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _331);
    float _339 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _333);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _343 = exp2(_335);
    bool _345 = _297 > 0.5;
    float _347 = _301 * 2.0;
    bool _349 = _303 > 0.5;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -_181;
    int _357 = _345 ? as_type<int>(_355) : as_type<int>(_181);
    float _359 = _297 * 2.0;
    bool _361 = _299 > 0.5;
    float _363 = floor(_347);
    float _365 = -_185;
    int _367 = _349 ? as_type<int>(_365) : as_type<int>(_185);
    float _369 = _299 + _301;
    bool _371 = !_313;
    float _373 = _371 ? _181 : as_type<float>(_357);
    float _375 = _301 + _297;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _379 = _377 != 0;
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _387 = _385 != 0;
    float _389 = _301 + (-0.5);
    float _391 = -_185;
    int _393 = _361 ? as_type<int>(_391) : as_type<int>(_185);
    float _395 = -_343;
    float _397 = _395 + 1.0;
    bool _399 = _301 > 0.5;
    float _401 = _299 + _297;
    float _403 = _297 + (-0.5);
    float _405 = -_181;
    int _407 = _399 ? as_type<int>(_405) : as_type<int>(_181);
    float _409 = _299 + (-0.5);
    bool _411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _419 = _415 || _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _429 = _419 ? _397 : 0.0;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _433 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(1.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _445 = 1.0 + _443;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _449 = 1.0 / _427;
    float _451 = _299 * 2.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _459 = _295 + _457;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _463 = 1.0 / _445;
    float _465 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _475 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = 1.0 / _353;
    out.m_44.x = _465;
    out.m_44.y = _467;
    out.m_44.z = _469;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _487 = _295 + _485;
    float _489 = _369 + (-1.0);
    float _491 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _337);
    float _493 = floor(_359);
    if (_441)
    {
        float _495 = _429 * _463;
        _107 = _495;
    }
    float _497 = _107;
    bool _499 = _363 >= 0.0;
    bool _501 = isnan(_363);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    out.m_46.x = _475;
    out.m_46.y = _481;
    out.m_46.z = _483;
    out.m_46.w = _479;
    float _509 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _339);
    bool _511 = !_319;
    float _513 = _511 ? _185 : as_type<float>(_393);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _295 + _515;
    bool _519 = _363 > 0.0;
    float _521 = floor(_451);
    int _523 = _507 ? 0 : 1;
    float _525 = _487 * _477;
    float _527 = _459 * _449;
    float _529 = _375 + (-1.0);
    int _531 = ~_523;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _539 = _295 + _537;
    float _541 = 1.0 / _455;
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _545 = _325 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _547 = _535;
    if (!_519)
    {
        int _549 = ~_523;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    float _555 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _557 = _493 >= 0.0;
    bool _559 = isnan(_493);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = 1.0 / _423;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _569;
    float _573 = _491 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _575 = _565 ? 0 : 1;
    float _577 = fma(_571, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _521 > 0.0;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _585 = _521 >= 0.0;
    bool _587 = isnan(_521);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = _517 * _541;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _601 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _603 = isnan(_295);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _615 = _573 + _613;
    float _617 = fma(_583, _595, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _619 = fma(_599, _595, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _621 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_295);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_611;
    float _635 = _633 + 1.0;
    bool _637 = !_329;
    float _639 = _637 ? _185 : as_type<float>(_367);
    float _641 = _539 * _567;
    float _643 = _631 * _635;
    bool _645 = _493 > 0.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _647;
    bool _651 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _653 = isnan(_295);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_631;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _667;
    bool _671 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _673 = isnan(_295);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = fma(_649, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _685 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _687 = isnan(_295);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -_661;
    float _699 = _697 + 1.0;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _701;
    float _705 = fma(_669, _641, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _711 = _661 * _665;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _545 + _713;
    float _717 = _681 * _699;
    float _719 = fma(_703, _641, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _721 = _509 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _723 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = -_681;
    float _727 = _725 + 1.0;
    float _729 = _577 * _717;
    float _731 = _401 + (-1.0);
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _721 + _733;
    float _737 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _743 = -_695;
    float _745 = _743 + 1.0;
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _753 = fma(_617, _711, _739);
    float _755 = _611 * _745;
    float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _759 = !_323;
    float _761 = _759 ? _181 : as_type<float>(_407);
    float _763 = _373 + 0.5;
    float _765 = fma(_709, _527, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _767 = fma(_751, _527, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _769 = _747 >= 0.0;
    float _771 = fma(_705, _643, _753);
    float _773 = in.m_40.x;
    float _775 = in.m_40.y;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _779 = -_513;
    float _781 = _779 + 0.5;
    float _783 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _785 = !_379;
    int _787 = _785 ? 0 : 1;
    float _789 = _761 + 0.5;
    int _791 = ~_575;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = fma(_765, _755, _771);
    int _799 = abs(_787);
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _803 = _715 * _715;
    int _805 = _795;
    if (!_645)
    {
        int _807 = ~_575;
        int _809 = _807 + 1;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = _789 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _817 = fma(_615, _615, _803);
    float _819 = float(_799);
    float _821 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[147].x, _797);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _825 = _815 * _757;
    float _827 = _783 * _777;
    float _829 = -_639;
    float _831 = _829 + 0.5;
    float _833 = fma(_735, _735, _817);
    float _835 = float(_553);
    float _837 = _817;
    if (_769)
    {
        out.m_33.x = 0.0;
    }
    float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _841 = _813 * _801;
    float _843 = rsqrt(_833);
    float _845 = in.m_48.x;
    float _847 = in.m_48.y;
    float _849 = in.m_48.z;
    float _851 = _821 * _773;
    if (_769)
    {
        _837 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _853 = _837;
    float _855 = _819 * _835;
    int _857 = _593 ? 0 : 1;
    float _859 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _839 * _823;
    int _863 = as_type<int>(_853);
    if (_769)
    {
        float _865 = _853 * 5.0;
        _863 = as_type<int>(_865);
    }
    int _867 = _863;
    int _869 = ~_857;
    int _871 = _869 + 1;
    int _873 = _871 + 1;
    out.m_50.x = _827;
    out.m_50.y = _841;
    out.m_50.z = _825;
    out.m_50.w = _861;
    int _875 = _873;
    if (!_579)
    {
        int _877 = ~_857;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = _855 * (-2.0);
    bool _885 = !_383;
    int _887 = _885 ? 0 : 1;
    if (_769)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2633 = as_type<float>(_867);
        out.gl_Position.z = _2633;
    }
    float _889 = fma(_741, _883, _741);
    float _891 = fma(_883, _845, _845);
    float _893 = _859 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _895 = abs(_887);
    bool _897 = !_387;
    int _899 = _897 ? 0 : 1;
    float _901 = _893 * _843;
    float _903 = _715 * _901;
    float _905 = _849;
    if (_769)
    {
        return out;
    }
    float _907 = float(_895);
    float _909 = _615 * _901;
    float _911 = float(_811);
    float _913 = -_903;
    float _915 = _545 + _913;
    int _917 = abs(_899);
    float _919 = -_909;
    float _921 = _573 + _919;
    float _923 = -_903;
    float _925 = _715 + _923;
    float _927 = _907 * _911;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _931 = _915 + _929;
    float _933 = _735 * _901;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _937 = _921 + _935;
    float _939 = float(_917);
    float _941 = _931 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _943 = -_933;
    float _945 = _721 + _943;
    float _947 = float(_881);
    float _949 = -_909;
    float _951 = _615 + _949;
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[28].x, _941);
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _957 = _945 + _955;
    float _959 = _927 * (-2.0);
    float _961 = _925 * _925;
    float _963 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    float _965 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[28].z, _953);
    float _967 = fma(_959, _847, _847);
    float _969 = fma(_555, _959, _555);
    float _971 = _939 * _947;
    float _973 = fma(_951, _951, _961);
    bool _975 = _965 >= 0.0;
    float _977 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[196].y, _967);
    float _979 = -_933;
    float _981 = _735 + _979;
    float _983 = fma(_889, _497, _963);
    float _985 = _683 * _717;
    float _987 = fma(_969, _497, _977);
    float _989 = _971 * (-2.0);
    float _991 = fma(_981, _981, _973);
    float _993 = _983 * 0.15915493667125701904296875;
    float _995 = _987 * 0.15915493667125701904296875;
    float _997 = fma(_989, _849, _849);
    float _999 = fma(_543, _989, _543);
    float _1001 = _993 * 6.283185482025146484375;
    float _1003 = sin(_1001);
    if (_975)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1005 = _905;
    float _1007 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].y, _985);
    float _1009 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[196].z, _997);
    int _1011 = as_type<int>(_1005);
    if (_975)
    {
        out.m_33.x = 0.0;
    }
    float _1013 = fma(_619, _711, _1007);
    if (_975)
    {
        float _1015 = _1005 * 5.0;
        _1011 = as_type<int>(_1015);
    }
    int _1017 = _1011;
    float _1019 = _993 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = fma(_999, _497, _1009);
    float _1025 = fma(_719, _643, _1013);
    if (_975)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2865 = as_type<float>(_1017);
        out.gl_Position.z = _2865;
    }
    float _1027 = _1023 * 0.15915493667125701904296875;
    float _1029 = fma(_767, _755, _1025);
    float _1031 = _995 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _995 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = sqrt(_991);
    if (_975)
    {
        return out;
    }
    float _1041 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1029);
    float _1043 = _1027 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = _843 * _1039;
    float _1049 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1051 = _1041 * _775;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1055 = _1021 * _1037;
    float _1057 = _859 * _1047;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1061 = _1027 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1067 = _1065 * 0.5;
    float _1069 = _1053 * _1057;
    float _1071 = _1047 * _1059;
    float _1073 = _1049 * _1071;
    float _1075 = _1003 * _1033;
    float _1077 = _1021 * _1033;
    float _1079 = _1033 * _1045;
    float _1081 = _1045 * _1073;
    float _1083 = _1021 * _1081;
    float _1085 = fma(_1063, _1055, _1075);
    float _1087 = _1037 * _1045;
    float _1089 = _1003 * _1037;
    float _1091 = -_1073;
    float _1093 = _1063 * _1091;
    float _1095 = fma(_1085, _1069, _1083);
    float _1097 = _1003 * _1081;
    float _1099 = -_1089;
    float _1101 = fma(_1063, _1077, _1099);
    float _1103 = -_1077;
    float _1105 = fma(_1063, _1089, _1103);
    float _1107 = fma(_1087, _1069, _1093);
    float _1109 = fma(_1063, _1075, _1055);
    float _1111 = fma(_1101, _1067, _1095);
    float _1113 = fma(_1105, _1069, _1097);
    float _1115 = fma(_1079, _1067, _1107);
    float _1117 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1119 = fma(_1109, _1067, _1113);
    float _1121 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1117);
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1127 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1123);
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1125);
    float _1131 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1135 = _721 + _1131;
    float _1137 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1139 = _573 + _1133;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1143 = _1135 + _1141;
    float _1145 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1137);
    float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1149 = _1139 + _1147;
    float _1151 = _1143 * _1143;
    float _1153 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1155 = fma(_1149, _1149, _1151);
    float _1157 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1159 = sqrt(_1155);
    float _1161 = _545 + _1157;
    bool _1163 = _1159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1165 = _1151;
    float _1167 = _1137;
    float _1169 = _1139;
    if (!_1163)
    {
        _1165 = _1135;
    }
    float _1171 = _1165;
    float _1173 = _1171;
    if (!_1163)
    {
        _1167 = _1161;
    }
    float _1175 = _1167;
    bool _1177 = !_1163;
    float _1179 = _1175;
    if (!_1177)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1185 = _1159 + _1183;
        float _1187 = _1161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = rsqrt(_1155);
        float _1191 = _1185 * _1181;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1193 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = _1193 * 6.283185482025146484375;
        float _1201 = cos(_1199);
        float _1203 = fma(_1197, _1187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1205 = _1189 * _1203;
        float _1207 = _1201 + (-1.0);
        float _1209 = fma(_1149, _1205, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1211 = fma(_1143, _1205, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1213 = _1207 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = fma(_1161, _1201, _1213);
        _1179 = _1215;
        _1169 = _1209;
        _1173 = _1211;
    }
    float _1217 = _1179;
    float _1219 = _1169;
    float _1221 = _1173;
    float _1223 = -_903;
    float _1225 = _1223 + _1217;
    float _1227 = -_909;
    float _1229 = _1227 + _1219;
    float _1231 = -_933;
    float _1233 = _1231 + _1221;
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1239 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1241 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1235);
    float _1243 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1237);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1239);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1241);
    float _1251 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1243);
    float _1253 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1245);
    float _1255 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1247);
    float _1257 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1251);
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1267 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1269 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1273 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1265);
    float _1275 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1267);
    float _1277 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1269);
    float _1279 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1283 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1275);
    float _1285 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1271);
    float _1287 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1277);
    float _1289 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1281);
    float _1291 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1283);
    float _1293 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1285);
    float _1295 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1287);
    float _1297 = _1289 + _1291;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1293);
    float _1301 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1303 = _1297 * 0.5;
    out.m_33.x = _1301;
    out.gl_Position.x = _1295;
    out.gl_Position.y = _1299;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1291;
    out.m_52.z = _1303;
    out.m_52.w = _1291;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _287 = false;
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
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
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
        float _1360 = as_type<float>(_87);
        out.gl_Position.z = _1360;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _81 = _109;
    }
    float _111 = _81;
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
        float _1430 = as_type<float>(_125);
        out.gl_Position.z = _1430;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_40.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_35.x;
    float _145 = in.m_35.y;
    float _147 = in.m_35.z;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = 0.0;
    float _157 = _129;
    if (!_141)
    {
        float _159 = _129 * _129;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_141;
    float _189 = _169;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _129 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _129);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
    }
    float _221 = _189;
    bool _223 = !_141;
    if (!_223)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = 1.0 / _231;
        float _235 = _129 * _227;
        float _237 = exp2(_235);
        float _239 = -_237;
        float _241 = _239 + 1.0;
        float _243 = _241 * _233;
        _157 = _243;
    }
    float _245 = _157;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _255 = fma(_245, _145, _249);
    float _257 = fma(_245, _143, _251);
    float _259 = fma(_245, _147, _253);
    float _261 = fma(_255, _131, _151);
    float _263 = fma(_257, _131, _149);
    float _265 = fma(_259, _131, _153);
    bool _267 = !_247;
    float _285;
    if (!_267)
    {
        float _269 = in.m_42.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_71);
        float _291 = 1.0 / _289;
        float _293 = _105 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    float _303 = in.m_42.w;
    float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _307 = log2(_305);
    float _309 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _313 = _311 != 0;
    float _315 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _309);
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _323 = _321 != 0;
    float _325 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _329 = _327 != 0;
    float _331 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _333 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _335 = _307 * _105;
    float _337 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _331);
    float _339 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _333);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _343 = exp2(_335);
    bool _345 = _297 > 0.5;
    float _347 = _301 * 2.0;
    bool _349 = _303 > 0.5;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -_181;
    int _357 = _345 ? as_type<int>(_355) : as_type<int>(_181);
    float _359 = _297 * 2.0;
    bool _361 = _299 > 0.5;
    float _363 = floor(_347);
    float _365 = -_185;
    int _367 = _349 ? as_type<int>(_365) : as_type<int>(_185);
    float _369 = _299 + _301;
    bool _371 = !_313;
    float _373 = _371 ? _181 : as_type<float>(_357);
    float _375 = _301 + _297;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _379 = _377 != 0;
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _387 = _385 != 0;
    float _389 = _301 + (-0.5);
    float _391 = -_185;
    int _393 = _361 ? as_type<int>(_391) : as_type<int>(_185);
    float _395 = -_343;
    float _397 = _395 + 1.0;
    bool _399 = _301 > 0.5;
    float _401 = _299 + _297;
    float _403 = _297 + (-0.5);
    float _405 = -_181;
    int _407 = _399 ? as_type<int>(_405) : as_type<int>(_181);
    float _409 = _299 + (-0.5);
    bool _411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _419 = _415 || _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _429 = _419 ? _397 : 0.0;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _433 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(1.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _445 = 1.0 + _443;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _449 = 1.0 / _427;
    float _451 = _299 * 2.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _459 = _295 + _457;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _463 = 1.0 / _445;
    float _465 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _475 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = 1.0 / _353;
    out.m_44.x = _465;
    out.m_44.y = _467;
    out.m_44.z = _469;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _487 = _295 + _485;
    float _489 = _369 + (-1.0);
    float _491 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _337);
    float _493 = floor(_359);
    if (_441)
    {
        float _495 = _429 * _463;
        _107 = _495;
    }
    float _497 = _107;
    bool _499 = _363 >= 0.0;
    bool _501 = isnan(_363);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    out.m_46.x = _475;
    out.m_46.y = _481;
    out.m_46.z = _483;
    out.m_46.w = _479;
    float _509 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _339);
    bool _511 = !_319;
    float _513 = _511 ? _185 : as_type<float>(_393);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _295 + _515;
    bool _519 = _363 > 0.0;
    float _521 = floor(_451);
    int _523 = _507 ? 0 : 1;
    float _525 = _487 * _477;
    float _527 = _459 * _449;
    float _529 = _375 + (-1.0);
    int _531 = ~_523;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _539 = _295 + _537;
    float _541 = 1.0 / _455;
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _545 = _325 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _547 = _535;
    if (!_519)
    {
        int _549 = ~_523;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    float _555 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _557 = _493 >= 0.0;
    bool _559 = isnan(_493);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = 1.0 / _423;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _569;
    float _573 = _491 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _575 = _565 ? 0 : 1;
    float _577 = fma(_571, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _521 > 0.0;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _585 = _521 >= 0.0;
    bool _587 = isnan(_521);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = _517 * _541;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _601 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _603 = isnan(_295);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _615 = _573 + _613;
    float _617 = fma(_583, _595, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _619 = fma(_599, _595, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _621 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_295);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_611;
    float _635 = _633 + 1.0;
    bool _637 = !_329;
    float _639 = _637 ? _185 : as_type<float>(_367);
    float _641 = _539 * _567;
    float _643 = _631 * _635;
    bool _645 = _493 > 0.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _647;
    bool _651 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _653 = isnan(_295);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_631;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _667;
    bool _671 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _673 = isnan(_295);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = fma(_649, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _685 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _687 = isnan(_295);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -_661;
    float _699 = _697 + 1.0;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _701;
    float _705 = fma(_669, _641, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _711 = _661 * _665;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _545 + _713;
    float _717 = _681 * _699;
    float _719 = fma(_703, _641, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _721 = _509 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _723 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = -_681;
    float _727 = _725 + 1.0;
    float _729 = _577 * _717;
    float _731 = _401 + (-1.0);
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _721 + _733;
    float _737 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _743 = -_695;
    float _745 = _743 + 1.0;
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _753 = fma(_617, _711, _739);
    float _755 = _611 * _745;
    float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _759 = !_323;
    float _761 = _759 ? _181 : as_type<float>(_407);
    float _763 = _373 + 0.5;
    float _765 = fma(_709, _527, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _767 = fma(_751, _527, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _769 = _747 >= 0.0;
    float _771 = fma(_705, _643, _753);
    float _773 = in.m_40.x;
    float _775 = in.m_40.y;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _779 = -_513;
    float _781 = _779 + 0.5;
    float _783 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _785 = !_379;
    int _787 = _785 ? 0 : 1;
    float _789 = _761 + 0.5;
    int _791 = ~_575;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = fma(_765, _755, _771);
    int _799 = abs(_787);
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _803 = _715 * _715;
    int _805 = _795;
    if (!_645)
    {
        int _807 = ~_575;
        int _809 = _807 + 1;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = _789 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _817 = fma(_615, _615, _803);
    float _819 = float(_799);
    float _821 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[147].x, _797);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _825 = _815 * _757;
    float _827 = _783 * _777;
    float _829 = -_639;
    float _831 = _829 + 0.5;
    float _833 = fma(_735, _735, _817);
    float _835 = float(_553);
    float _837 = _817;
    if (_769)
    {
        out.m_33.x = 0.0;
    }
    float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _841 = _813 * _801;
    float _843 = rsqrt(_833);
    float _845 = in.m_48.x;
    float _847 = in.m_48.y;
    float _849 = in.m_48.z;
    float _851 = _821 * _773;
    if (_769)
    {
        _837 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _853 = _837;
    float _855 = _819 * _835;
    int _857 = _593 ? 0 : 1;
    float _859 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _839 * _823;
    int _863 = as_type<int>(_853);
    if (_769)
    {
        float _865 = _853 * 5.0;
        _863 = as_type<int>(_865);
    }
    int _867 = _863;
    int _869 = ~_857;
    int _871 = _869 + 1;
    int _873 = _871 + 1;
    out.m_50.x = _827;
    out.m_50.y = _841;
    out.m_50.z = _825;
    out.m_50.w = _861;
    int _875 = _873;
    if (!_579)
    {
        int _877 = ~_857;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = _855 * (-2.0);
    bool _885 = !_383;
    int _887 = _885 ? 0 : 1;
    if (_769)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2633 = as_type<float>(_867);
        out.gl_Position.z = _2633;
    }
    float _889 = fma(_741, _883, _741);
    float _891 = fma(_883, _845, _845);
    float _893 = _859 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _895 = abs(_887);
    bool _897 = !_387;
    int _899 = _897 ? 0 : 1;
    float _901 = _893 * _843;
    float _903 = _715 * _901;
    float _905 = _849;
    if (_769)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _907 = float(_895);
    float _909 = _615 * _901;
    float _911 = float(_811);
    float _913 = -_903;
    float _915 = _545 + _913;
    int _917 = abs(_899);
    float _919 = -_909;
    float _921 = _573 + _919;
    float _923 = -_903;
    float _925 = _715 + _923;
    float _927 = _907 * _911;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _931 = _915 + _929;
    float _933 = _735 * _901;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _937 = _921 + _935;
    float _939 = float(_917);
    float _941 = _931 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _943 = -_933;
    float _945 = _721 + _943;
    float _947 = float(_881);
    float _949 = -_909;
    float _951 = _615 + _949;
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[28].x, _941);
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _957 = _945 + _955;
    float _959 = _927 * (-2.0);
    float _961 = _925 * _925;
    float _963 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    float _965 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[28].z, _953);
    float _967 = fma(_959, _847, _847);
    float _969 = fma(_555, _959, _555);
    float _971 = _939 * _947;
    float _973 = fma(_951, _951, _961);
    bool _975 = _965 >= 0.0;
    float _977 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[196].y, _967);
    float _979 = -_933;
    float _981 = _735 + _979;
    float _983 = fma(_889, _497, _963);
    float _985 = _683 * _717;
    float _987 = fma(_969, _497, _977);
    float _989 = _971 * (-2.0);
    float _991 = fma(_981, _981, _973);
    float _993 = _983 * 0.15915493667125701904296875;
    float _995 = _987 * 0.15915493667125701904296875;
    float _997 = fma(_989, _849, _849);
    float _999 = fma(_543, _989, _543);
    float _1001 = _993 * 6.283185482025146484375;
    float _1003 = sin(_1001);
    if (_975)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1005 = _905;
    float _1007 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].y, _985);
    float _1009 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[196].z, _997);
    int _1011 = as_type<int>(_1005);
    if (_975)
    {
        out.m_33.x = 0.0;
    }
    float _1013 = fma(_619, _711, _1007);
    if (_975)
    {
        float _1015 = _1005 * 5.0;
        _1011 = as_type<int>(_1015);
    }
    int _1017 = _1011;
    float _1019 = _993 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = fma(_999, _497, _1009);
    float _1025 = fma(_719, _643, _1013);
    if (_975)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2865 = as_type<float>(_1017);
        out.gl_Position.z = _2865;
    }
    float _1027 = _1023 * 0.15915493667125701904296875;
    float _1029 = fma(_767, _755, _1025);
    float _1031 = _995 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _995 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = sqrt(_991);
    if (_975)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1041 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1029);
    float _1043 = _1027 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = _843 * _1039;
    float _1049 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1051 = _1041 * _775;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1055 = _1021 * _1037;
    float _1057 = _859 * _1047;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1061 = _1027 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1067 = _1065 * 0.5;
    float _1069 = _1053 * _1057;
    float _1071 = _1047 * _1059;
    float _1073 = _1049 * _1071;
    float _1075 = _1003 * _1033;
    float _1077 = _1021 * _1033;
    float _1079 = _1033 * _1045;
    float _1081 = _1045 * _1073;
    float _1083 = _1021 * _1081;
    float _1085 = fma(_1063, _1055, _1075);
    float _1087 = _1037 * _1045;
    float _1089 = _1003 * _1037;
    float _1091 = -_1073;
    float _1093 = _1063 * _1091;
    float _1095 = fma(_1085, _1069, _1083);
    float _1097 = _1003 * _1081;
    float _1099 = -_1089;
    float _1101 = fma(_1063, _1077, _1099);
    float _1103 = -_1077;
    float _1105 = fma(_1063, _1089, _1103);
    float _1107 = fma(_1087, _1069, _1093);
    float _1109 = fma(_1063, _1075, _1055);
    float _1111 = fma(_1101, _1067, _1095);
    float _1113 = fma(_1105, _1069, _1097);
    float _1115 = fma(_1079, _1067, _1107);
    float _1117 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1119 = fma(_1109, _1067, _1113);
    float _1121 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1117);
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1127 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1123);
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1125);
    float _1131 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1135 = _721 + _1131;
    float _1137 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1139 = _573 + _1133;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1143 = _1135 + _1141;
    float _1145 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1137);
    float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1149 = _1139 + _1147;
    float _1151 = _1143 * _1143;
    float _1153 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1155 = fma(_1149, _1149, _1151);
    float _1157 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1159 = sqrt(_1155);
    float _1161 = _545 + _1157;
    bool _1163 = _1159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1165 = _1151;
    float _1167 = _1137;
    float _1169 = _1139;
    if (!_1163)
    {
        _1165 = _1135;
    }
    float _1171 = _1165;
    float _1173 = _1171;
    if (!_1163)
    {
        _1167 = _1161;
    }
    float _1175 = _1167;
    bool _1177 = !_1163;
    float _1179 = _1175;
    if (!_1177)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1185 = _1159 + _1183;
        float _1187 = _1161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = rsqrt(_1155);
        float _1191 = _1185 * _1181;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1193 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = _1193 * 6.283185482025146484375;
        float _1201 = cos(_1199);
        float _1203 = fma(_1197, _1187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1205 = _1189 * _1203;
        float _1207 = _1201 + (-1.0);
        float _1209 = fma(_1149, _1205, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1211 = fma(_1143, _1205, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1213 = _1207 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = fma(_1161, _1201, _1213);
        _1179 = _1215;
        _1169 = _1209;
        _1173 = _1211;
    }
    float _1217 = _1179;
    float _1219 = _1169;
    float _1221 = _1173;
    float _1223 = -_903;
    float _1225 = _1223 + _1217;
    float _1227 = -_909;
    float _1229 = _1227 + _1219;
    float _1231 = -_933;
    float _1233 = _1231 + _1221;
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1239 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1241 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1235);
    float _1243 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1237);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1239);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1241);
    float _1251 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1243);
    float _1253 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1245);
    float _1255 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1247);
    float _1257 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1251);
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1267 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1269 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1273 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1265);
    float _1275 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1267);
    float _1277 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1269);
    float _1279 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1283 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1275);
    float _1285 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1271);
    float _1287 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1277);
    float _1289 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1281);
    float _1291 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1283);
    float _1293 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1285);
    float _1295 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1287);
    float _1297 = _1289 + _1291;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1293);
    float _1301 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1303 = _1297 * 0.5;
    out.m_33.x = _1301;
    out.gl_Position.x = _1295;
    out.gl_Position.y = _1299;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1291;
    out.m_52.z = _1303;
    out.m_52.w = _1291;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

