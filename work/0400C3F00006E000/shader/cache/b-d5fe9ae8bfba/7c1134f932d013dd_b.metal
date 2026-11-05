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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_56 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_32 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_39 [[attribute(8)]];
    float4 m_54 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _495 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_35.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1398 = as_type<float>(_97);
        out.gl_Position.z = _1398;
    }
    if (!_85)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_81);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _99 = as_type<int>(_131);
    }
    int _133 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1467 = as_type<float>(_133);
        out.gl_Position.z = _1467;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_44.x;
    float _145 = in.m_44.y;
    float _147 = in.m_44.z;
    float _149 = in.m_46.x;
    float _151 = in.m_46.y;
    float _153 = in.m_46.z;
    float _155 = in.m_48.x;
    float _157 = in.m_48.y;
    float _159 = in.m_48.z;
    float _161 = _139 * _137;
    float _163 = in.m_50.x;
    float _165 = in.m_50.y;
    float _167 = in.m_50.z;
    float _169 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    int _171 = as_type<int>(_141) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_141) & 2;
    bool _177 = _175 != 0;
    float _179 = floor(_169);
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _169 * 6.283185482025146484375;
    float _187 = _185 * 0.15915493667125701904296875;
    bool _189 = !_177;
    int _191 = _189 ? (-1090519040) : 1056964608;
    float _193 = _145 * _151;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _145 * _157;
    float _205 = _187 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_173;
    int _211 = _209 ? (-1090519040) : 1056964608;
    float _213 = _145 * _165;
    float _215 = fma(_143, _149, _193);
    bool _217 = !_197;
    int _219 = _217 ? 0 : 1;
    float _221 = fma(_143, _155, _203);
    float _223 = fma(_143, _163, _213);
    bool _225 = !_183;
    int _227 = _225 ? 0 : 1;
    out.m_52.x = as_type<float>(_211);
    out.m_52.y = as_type<float>(_191);
    int _229 = abs(_219);
    float _231 = -_179;
    float _233 = _169 + _231;
    int _235 = abs(_227);
    float _237 = fma(_147, _153, _215);
    float _239 = -_233;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = fma(_207, 0.5, 0.5);
    float _247 = float(_229);
    bool _249 = !_201;
    int _251 = _249 ? 0 : 1;
    bool _253 = _233 < 0.5;
    float _255 = float(_253);
    float _257 = abs(_241);
    float _259 = _247 * _257;
    int _261 = abs(_251);
    float _263 = -_245;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_235);
    float _269 = -_255;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_261);
    float _275 = fma(_267, _265, _259);
    float _277 = fma(_147, _159, _221);
    float _279 = fma(_147, _167, _223);
    float _281 = abs(_271);
    float _283 = fma(_273, _281, _275);
    bool _285 = !_243;
    float _301;
    if (!_285)
    {
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_81);
        float _307 = 1.0 / _305;
        float _309 = _115 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _311 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = 1.0 / _327;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _341 = 1.0 / _335;
    bool _343 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_311);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _331;
    float _357 = _315 * _337;
    bool _359 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _361 = isnan(_311);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_353;
    float _373 = _371 + 1.0;
    float _375 = _319 * _341;
    bool _377 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _379 = isnan(_311);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _387 * _373;
    float _403 = -_387;
    float _405 = _403 + 1.0;
    float _407 = _323 * _355;
    float _409 = -_369;
    float _411 = _409 + 1.0;
    float _413 = _399 * _405;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = _353 * _411;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = fma(_423, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = fma(_427, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = fma(_431, _407, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_435, _407, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _437 * _413;
    float _447 = _439 * _413;
    float _449 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _461 = fma(_441, _401, _449);
    float _463 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_443, _401, _459);
    float _469 = fma(_463, _419, _461);
    float _471 = fma(_465, _419, _467);
    float _473 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[146].x, _469);
    float _475 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[146].y, _471);
    bool _477 = !_339;
    float _493;
    if (!_477)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _481 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_81);
        float _499 = 1.0 / _497;
        float _501 = _115 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = in.m_54.x;
    float _507 = in.m_54.y;
    float _509 = in.m_32.x;
    float _511 = in.m_32.y;
    float _513 = in.m_32.z;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _515;
    float _519 = in.m_50.w;
    float _521 = 1.0 / _517;
    float _523 = in.m_48.w;
    float _525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_211));
    float _527 = _473 * _505;
    float _529 = _475 * _507;
    float _531 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _533 = _157 * _511;
    float _535 = _151 * _511;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _541 = _165 * _511;
    float _543 = fma(_155, _509, _533);
    float _545 = fma(_149, _509, _535);
    float _547 = 1.0 / _539;
    float _549 = fma(_163, _509, _541);
    float _551 = _283 * _529;
    float _553 = _283 * _527;
    float _555 = fma(_153, _513, _545);
    float _557 = fma(_167, _513, _549);
    float _559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_191));
    float _561 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _563 = fma(_159, _513, _543);
    float _565 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _569 = _503 + _567;
    float _571 = _561 * _559;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _575 = _503 + _573;
    float _577 = _565 * _525;
    float _579 = _557 + _519;
    float _581 = _571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _583 = _569 * _547;
    float _585 = _571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _587 = _575 * _521;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _581);
    float _591 = _563 + _523;
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _585);
    float _595 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].z, _589);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].z, _593);
    float _599 = in.m_46.w;
    float _601 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _603;
    float _607 = _597 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _609;
    float _613 = _579 + _601;
    float _615 = fma(_605, _587, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _617 = _591 + _607;
    float _619 = fma(_611, _587, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _623 = _613 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _625;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _617 + _629;
    bool _633 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _635 = isnan(_503);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _623 * _623;
    float _647 = fma(_627, _587, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _649 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _651 = isnan(_503);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _663 = fma(_631, _631, _645);
    float _665 = -_643;
    float _667 = _665 + 1.0;
    bool _669 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _671 = isnan(_503);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _661);
    float _683 = sqrt(_663);
    float _685 = _659 * _667;
    float _687 = -_659;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _699 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].z, _681);
    float _701 = _679 * _689;
    float _703 = -_679;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _711 = fma(_697, _583, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _713 = _615 * _701;
    float _715 = _619 * _701;
    float _717 = _647 * _701;
    float _719 = _555 + _599;
    float _721 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].x, _713);
    float _723 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].y, _715);
    bool _725 = _683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _727 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].z, _717);
    float _729 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _731 = fma(_709, _583, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _733 = fma(_693, _583, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _735 = fma(_711, _685, _727);
    float _737 = _719 + _729;
    float _739 = fma(_731, _685, _721);
    float _741 = fma(_733, _685, _723);
    float _743 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].z, _735);
    float _745 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].x, _739);
    float _747 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].y, _741);
    float _749 = _735;
    float _751 = _617;
    float _753 = _613;
    if (!_725)
    {
        _749 = _737;
    }
    float _755 = _749;
    bool _757 = !_725;
    float _759 = _755;
    if (!_757)
    {
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _765 = _683 + _763;
        float _767 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _769 = rsqrt(_663);
        float _771 = _765 * _761;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = _773 * 6.283185482025146484375;
        float _777 = cos(_775);
        float _779 = _773 * 6.283185482025146484375;
        float _781 = sin(_779);
        float _783 = _777 + (-1.0);
        float _785 = _783 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = fma(_781, _767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _789 = fma(_737, _777, _785);
        float _791 = _769 * _787;
        float _793 = fma(_631, _791, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _795 = fma(_623, _791, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _759 = _789;
        _751 = _793;
        _753 = _795;
    }
    float _797 = _759;
    float _799 = _751;
    float _801 = _753;
    float _803 = -_719;
    float _805 = _803 + _797;
    float _807 = -_591;
    float _809 = _807 + _799;
    float _811 = -_579;
    float _813 = _811 + _801;
    float _815 = _805 * _805;
    float _817 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = fma(_809, _809, _815);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _825 = fma(_813, _813, _819);
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _829 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _831 = sqrt(_825);
    float _833 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _835 = _719 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_56.y = 1.0;
    float _837 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _719 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _847 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[1].x, _835);
    float _849 = _719 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _851 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _857 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _859 = isnan(0.5);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _865 = _861 || _863;
    float _867 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[0].x, _845);
    bool _869 = _831 > 0.0;
    float _871 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[1].z, _847);
    float _873 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[2].x, _849);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _851;
    out.m_58.y = _853;
    out.m_58.z = _855;
    out.m_58.w = _827;
    float _877 = _719 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _879 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[0].z, _867);
    float _881 = _871 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    out.m_60.x = _837;
    out.m_60.y = _841;
    out.m_60.z = _843;
    out.m_60.w = _875;
    float _883 = _879 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _885 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[2].z, _873);
    float _887 = _881 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _889 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[3].x, _877);
    float _891 = _885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _893 = _881 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _895 = _881 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _897 = _881 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _899 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _887);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _893);
    float _903 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[6].x, _895);
    float _905 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _897);
    float _907 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[3].z, _889);
    float _909 = _891 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _911 = !_869;
    float _913 = _799;
    float _915 = _797;
    float _917 = _801;
    float _919 = _893;
    float _921 = _889;
    if (!_911)
    {
        float _923 = _237 * _237;
        float _925 = rsqrt(_825);
        float _927 = fma(_277, _277, _923);
        float _929 = fma(_279, _279, _927);
        float _931 = sqrt(_929);
        float _933 = _809 * _925;
        float _935 = _805 * _925;
        float _937 = _813 * _925;
        bool _939 = _931 > 0.0;
        bool _941 = !_939;
        _919 = _929;
        _921 = _923;
        if (!_941)
        {
            float _943 = rsqrt(_929);
            float _945 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _947 = _237 * _943;
            float _949 = _277 * _943;
            float _951 = _935 * _947;
            float _953 = _279 * _943;
            float _955 = fma(_933, _949, _951);
            float _957 = _945 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _959 = fma(_937, _953, _955);
            float _961 = _959 * _957;
            float _963 = fma(_277, _961, _799);
            float _965 = fma(_237, _961, _797);
            float _967 = fma(_279, _961, _801);
            _913 = _963;
            _915 = _965;
            _917 = _967;
            _919 = _943;
            _921 = _953;
        }
    }
    float _969 = _913;
    float _971 = _915;
    float _973 = _917;
    float _975 = _919;
    float _977 = _921;
    float _979 = _907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _981 = _909 + _905;
    float _983 = _977;
    float _985 = _975;
    float _987 = _973;
    if (_865)
    {
        _983 = _969;
    }
    float _989 = _983;
    float _991 = _989;
    if (_865)
    {
        _985 = _971;
    }
    float _993 = _985;
    float _995 = _993;
    if (!_865)
    {
        float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _999 = _719 + _997;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1003 = _591 + _1001;
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1007 = _999 * _999;
        float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1011 = _579 + _1009;
        float _1013 = fma(_1003, _1003, _1007);
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1017 = fma(_1011, _1011, _1013);
        float _1019 = sqrt(_1017);
        float _1021 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1023 = -_579;
        float _1025 = _1023 + _973;
        float _1027 = precise::min(_1019, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1029 = _1027 * _1015;
        float _1031 = -_591;
        float _1033 = _1031 + _969;
        float _1035 = -_719;
        float _1037 = _1035 + _971;
        float _1039 = _1021 * _1029;
        float _1041 = fma(_1033, _1039, _591);
        float _1043 = fma(_1037, _1039, _719);
        float _1045 = fma(_1025, _1039, _579);
        _995 = _1043;
        _991 = _1041;
        _987 = _1045;
    }
    float _1047 = _995;
    float _1049 = _991;
    float _1051 = _987;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = -_237;
    float _1057 = _1055 + _1047;
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1067 = -_277;
    float _1069 = _1067 + _1049;
    float _1071 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1059);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1063);
    float _1077 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1079 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1071);
    float _1081 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1083 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[7].w, _981);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1089 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1075);
    float _1091 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1093 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[6].z, _903);
    float _1097 = 1.0 / _1083;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1103 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1105 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1107 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1101);
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1103);
    float _1113 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1095);
    float _1115 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1107);
    float _1117 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1109);
    float _1119 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1105);
    float _1121 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1123 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1115);
    float _1125 = 1.0 / _1117;
    float _1127 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1119);
    float _1129 = _1113 * _1097;
    float _1131 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1123);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1121);
    float _1135 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1127);
    float _1137 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    bool _1139 = _1129 > 0.0;
    float _1141 = _1131 + _1117;
    float _1143 = -_279;
    float _1145 = _1143 + _1051;
    float _1147 = _891 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    bool _1149 = _1129 < 1.0;
    bool _1151 = _1149 && _1139;
    float _1153 = _1141 * 0.5;
    float _1155 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1137);
    float _1157 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _1159 = _1133 * _1125;
    float _1161 = _1135 * _1125;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1155);
    float _1165 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1167 = _891 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    bool _1169 = _1159 > (-1.0);
    bool _1171 = _1169 && _1151;
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1157);
    float _1177 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1165);
    bool _1179 = _1161 > (-1.0);
    bool _1181 = _1179 && _1171;
    float _1183 = 1.0 / _1173;
    out.gl_Position.x = _1133;
    out.gl_Position.y = _1135;
    out.gl_Position.z = _1131;
    out.gl_Position.w = _1117;
    float _1185 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1175);
    bool _1187 = _1159 < 1.0;
    bool _1189 = _1187 && _1181;
    float _1191 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1177);
    out.m_62.z = _1153;
    out.m_62.w = _1117;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _1195 = _1161 < 1.0;
    bool _1197 = _1195 && _1189;
    float _1199 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _1201 = _1147 + _899;
    float _1203 = _1167 + _901;
    float _1205 = _1193 * _1183;
    float _1207 = _1199 * _1183;
    float _1209 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1211 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1203);
    float _1213 = _1209 * _1097;
    float _1215 = _1211 * _1097;
    bool _1217 = !_1197;
    float _1249;
    if (!_1217)
    {
        float _1219 = -_1215;
        float _1221 = _1161 + _1219;
        float _1223 = -_1213;
        float _1225 = _1159 + _1223;
        float _1227 = -_1205;
        float _1229 = _1159 + _1227;
        float _1231 = -_1207;
        float _1233 = _1161 + _1231;
        float _1235 = _1221 * _1221;
        float _1237 = fma(_1225, _1225, _1235);
        float _1239 = sqrt(_1237);
        bool _1241 = _1239 > 0.0;
        float _1243 = _1239;
        if (!_1241)
        {
            _1243 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _1245 = _1243;
        bool _1247 = !_1241;
        _1249 = _1245;
        _1251 = _1247;
        if (!_1251)
        {
            float _1253 = _1233 * _1233;
            float _1255 = fma(_1229, _1229, _1253);
            float _1257 = rsqrt(_1237);
            float _1259 = sqrt(_1255);
            float _1261 = _1225 * _1257;
            float _1263 = _1221 * _1257;
            bool _1265 = _1259 > 0.0;
            float _1267 = _1257;
            if (!_1265)
            {
                _1267 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _1269 = _1267;
            bool _1271 = !_1265;
            _1249 = _1269;
            _1251 = _1271;
            if (!_1251)
            {
                float _1273 = _565 * _979;
                float _1275 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1277 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].x, _909);
                float _1279 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1167);
                float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
                float _1283 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1277);
                float _1285 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1279);
                float _1287 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1281);
                float _1289 = rsqrt(_1255);
                float _1291 = _1275 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1293 = 1.0 / _1283;
                float _1295 = _1233 * _1291;
                float _1297 = _1229 * _1291;
                float _1299 = _1295 * _1295;
                float _1301 = fma(_1297, _1297, _1299);
                float _1303 = _1285 * _1293;
                float _1305 = _1287 * _1293;
                float _1307 = sqrt(_1301);
                float _1309 = _1303 * _1303;
                float _1311 = fma(_1305, _1305, _1309);
                float _1313 = _1233 * _1289;
                float _1315 = _1229 * _1289;
                float _1317 = sqrt(_1311);
                float _1319 = _1263 * _1313;
                float _1321 = fma(_1261, _1315, _1319);
                float _1323 = precise::min(0.0, _1321);
                float _1325 = _1117 * _1323;
                float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1317);
                float _1329 = fma(_1297, _1325, _1133);
                float _1331 = fma(_1295, _1325, _1135);
                float _1333 = 1.0 / _1327;
                out.gl_Position.x = _1329;
                out.gl_Position.y = _1331;
                float _1335 = _1317 * _1333;
                out.m_56.y = _1335;
                _1249 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _1251 = true;
            }
        }
    }
    else
    {
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1337;
        _1249 = 0.0;
    }
    _1251 = false;
    float _1339 = _1249;
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_35.x = _1341;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _495 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_35.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1398 = as_type<float>(_97);
        out.gl_Position.z = _1398;
    }
    if (!_85)
    {
        return out;
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_81);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _99 = as_type<int>(_131);
    }
    int _133 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1467 = as_type<float>(_133);
        out.gl_Position.z = _1467;
    }
    if (_125)
    {
        return out;
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_44.x;
    float _145 = in.m_44.y;
    float _147 = in.m_44.z;
    float _149 = in.m_46.x;
    float _151 = in.m_46.y;
    float _153 = in.m_46.z;
    float _155 = in.m_48.x;
    float _157 = in.m_48.y;
    float _159 = in.m_48.z;
    float _161 = _139 * _137;
    float _163 = in.m_50.x;
    float _165 = in.m_50.y;
    float _167 = in.m_50.z;
    float _169 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    int _171 = as_type<int>(_141) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_141) & 2;
    bool _177 = _175 != 0;
    float _179 = floor(_169);
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _169 * 6.283185482025146484375;
    float _187 = _185 * 0.15915493667125701904296875;
    bool _189 = !_177;
    int _191 = _189 ? (-1090519040) : 1056964608;
    float _193 = _145 * _151;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _145 * _157;
    float _205 = _187 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_173;
    int _211 = _209 ? (-1090519040) : 1056964608;
    float _213 = _145 * _165;
    float _215 = fma(_143, _149, _193);
    bool _217 = !_197;
    int _219 = _217 ? 0 : 1;
    float _221 = fma(_143, _155, _203);
    float _223 = fma(_143, _163, _213);
    bool _225 = !_183;
    int _227 = _225 ? 0 : 1;
    out.m_52.x = as_type<float>(_211);
    out.m_52.y = as_type<float>(_191);
    int _229 = abs(_219);
    float _231 = -_179;
    float _233 = _169 + _231;
    int _235 = abs(_227);
    float _237 = fma(_147, _153, _215);
    float _239 = -_233;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = fma(_207, 0.5, 0.5);
    float _247 = float(_229);
    bool _249 = !_201;
    int _251 = _249 ? 0 : 1;
    bool _253 = _233 < 0.5;
    float _255 = float(_253);
    float _257 = abs(_241);
    float _259 = _247 * _257;
    int _261 = abs(_251);
    float _263 = -_245;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_235);
    float _269 = -_255;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_261);
    float _275 = fma(_267, _265, _259);
    float _277 = fma(_147, _159, _221);
    float _279 = fma(_147, _167, _223);
    float _281 = abs(_271);
    float _283 = fma(_273, _281, _275);
    bool _285 = !_243;
    float _301;
    if (!_285)
    {
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_81);
        float _307 = 1.0 / _305;
        float _309 = _115 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _311 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = 1.0 / _327;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _341 = 1.0 / _335;
    bool _343 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_311);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _331;
    float _357 = _315 * _337;
    bool _359 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _361 = isnan(_311);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_353;
    float _373 = _371 + 1.0;
    float _375 = _319 * _341;
    bool _377 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _379 = isnan(_311);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _387 * _373;
    float _403 = -_387;
    float _405 = _403 + 1.0;
    float _407 = _323 * _355;
    float _409 = -_369;
    float _411 = _409 + 1.0;
    float _413 = _399 * _405;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = _353 * _411;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = fma(_423, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = fma(_427, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = fma(_431, _407, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_435, _407, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _437 * _413;
    float _447 = _439 * _413;
    float _449 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _461 = fma(_441, _401, _449);
    float _463 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_443, _401, _459);
    float _469 = fma(_463, _419, _461);
    float _471 = fma(_465, _419, _467);
    float _473 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[146].x, _469);
    float _475 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[146].y, _471);
    bool _477 = !_339;
    float _493;
    if (!_477)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _481 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_81);
        float _499 = 1.0 / _497;
        float _501 = _115 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = in.m_54.x;
    float _507 = in.m_54.y;
    float _509 = in.m_32.x;
    float _511 = in.m_32.y;
    float _513 = in.m_32.z;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _515;
    float _519 = in.m_50.w;
    float _521 = 1.0 / _517;
    float _523 = in.m_48.w;
    float _525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_211));
    float _527 = _473 * _505;
    float _529 = _475 * _507;
    float _531 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _533 = _157 * _511;
    float _535 = _151 * _511;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _541 = _165 * _511;
    float _543 = fma(_155, _509, _533);
    float _545 = fma(_149, _509, _535);
    float _547 = 1.0 / _539;
    float _549 = fma(_163, _509, _541);
    float _551 = _283 * _529;
    float _553 = _283 * _527;
    float _555 = fma(_153, _513, _545);
    float _557 = fma(_167, _513, _549);
    float _559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_191));
    float _561 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _563 = fma(_159, _513, _543);
    float _565 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _569 = _503 + _567;
    float _571 = _561 * _559;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _575 = _503 + _573;
    float _577 = _565 * _525;
    float _579 = _557 + _519;
    float _581 = _571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _583 = _569 * _547;
    float _585 = _571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _587 = _575 * _521;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _581);
    float _591 = _563 + _523;
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _585);
    float _595 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].z, _589);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].z, _593);
    float _599 = in.m_46.w;
    float _601 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _603;
    float _607 = _597 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _609;
    float _613 = _579 + _601;
    float _615 = fma(_605, _587, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _617 = _591 + _607;
    float _619 = fma(_611, _587, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _623 = _613 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _625;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _617 + _629;
    bool _633 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _635 = isnan(_503);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _623 * _623;
    float _647 = fma(_627, _587, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _649 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _651 = isnan(_503);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _663 = fma(_631, _631, _645);
    float _665 = -_643;
    float _667 = _665 + 1.0;
    bool _669 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _671 = isnan(_503);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _661);
    float _683 = sqrt(_663);
    float _685 = _659 * _667;
    float _687 = -_659;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _699 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].z, _681);
    float _701 = _679 * _689;
    float _703 = -_679;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _711 = fma(_697, _583, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _713 = _615 * _701;
    float _715 = _619 * _701;
    float _717 = _647 * _701;
    float _719 = _555 + _599;
    float _721 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].x, _713);
    float _723 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].y, _715);
    bool _725 = _683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _727 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].z, _717);
    float _729 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _731 = fma(_709, _583, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _733 = fma(_693, _583, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _735 = fma(_711, _685, _727);
    float _737 = _719 + _729;
    float _739 = fma(_731, _685, _721);
    float _741 = fma(_733, _685, _723);
    float _743 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].z, _735);
    float _745 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].x, _739);
    float _747 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].y, _741);
    float _749 = _735;
    float _751 = _617;
    float _753 = _613;
    if (!_725)
    {
        _749 = _737;
    }
    float _755 = _749;
    bool _757 = !_725;
    float _759 = _755;
    if (!_757)
    {
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _765 = _683 + _763;
        float _767 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _769 = rsqrt(_663);
        float _771 = _765 * _761;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = _773 * 6.283185482025146484375;
        float _777 = cos(_775);
        float _779 = _773 * 6.283185482025146484375;
        float _781 = sin(_779);
        float _783 = _777 + (-1.0);
        float _785 = _783 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = fma(_781, _767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _789 = fma(_737, _777, _785);
        float _791 = _769 * _787;
        float _793 = fma(_631, _791, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _795 = fma(_623, _791, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _759 = _789;
        _751 = _793;
        _753 = _795;
    }
    float _797 = _759;
    float _799 = _751;
    float _801 = _753;
    float _803 = -_719;
    float _805 = _803 + _797;
    float _807 = -_591;
    float _809 = _807 + _799;
    float _811 = -_579;
    float _813 = _811 + _801;
    float _815 = _805 * _805;
    float _817 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = fma(_809, _809, _815);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _825 = fma(_813, _813, _819);
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _829 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _831 = sqrt(_825);
    float _833 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _835 = _719 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_56.y = 1.0;
    float _837 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _719 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _847 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[1].x, _835);
    float _849 = _719 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _851 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _857 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _859 = isnan(0.5);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _865 = _861 || _863;
    float _867 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[0].x, _845);
    bool _869 = _831 > 0.0;
    float _871 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[1].z, _847);
    float _873 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[2].x, _849);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _851;
    out.m_58.y = _853;
    out.m_58.z = _855;
    out.m_58.w = _827;
    float _877 = _719 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _879 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[0].z, _867);
    float _881 = _871 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    out.m_60.x = _837;
    out.m_60.y = _841;
    out.m_60.z = _843;
    out.m_60.w = _875;
    float _883 = _879 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _885 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[2].z, _873);
    float _887 = _881 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _889 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[3].x, _877);
    float _891 = _885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _893 = _881 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _895 = _881 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _897 = _881 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _899 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _887);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _893);
    float _903 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[6].x, _895);
    float _905 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _897);
    float _907 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[3].z, _889);
    float _909 = _891 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _911 = !_869;
    float _913 = _799;
    float _915 = _797;
    float _917 = _801;
    float _919 = _893;
    float _921 = _889;
    if (!_911)
    {
        float _923 = _237 * _237;
        float _925 = rsqrt(_825);
        float _927 = fma(_277, _277, _923);
        float _929 = fma(_279, _279, _927);
        float _931 = sqrt(_929);
        float _933 = _809 * _925;
        float _935 = _805 * _925;
        float _937 = _813 * _925;
        bool _939 = _931 > 0.0;
        bool _941 = !_939;
        _919 = _929;
        _921 = _923;
        if (!_941)
        {
            float _943 = rsqrt(_929);
            float _945 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _947 = _237 * _943;
            float _949 = _277 * _943;
            float _951 = _935 * _947;
            float _953 = _279 * _943;
            float _955 = fma(_933, _949, _951);
            float _957 = _945 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _959 = fma(_937, _953, _955);
            float _961 = _959 * _957;
            float _963 = fma(_277, _961, _799);
            float _965 = fma(_237, _961, _797);
            float _967 = fma(_279, _961, _801);
            _913 = _963;
            _915 = _965;
            _917 = _967;
            _919 = _943;
            _921 = _953;
        }
    }
    float _969 = _913;
    float _971 = _915;
    float _973 = _917;
    float _975 = _919;
    float _977 = _921;
    float _979 = _907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _981 = _909 + _905;
    float _983 = _977;
    float _985 = _975;
    float _987 = _973;
    if (_865)
    {
        _983 = _969;
    }
    float _989 = _983;
    float _991 = _989;
    if (_865)
    {
        _985 = _971;
    }
    float _993 = _985;
    float _995 = _993;
    if (!_865)
    {
        float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _999 = _719 + _997;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1003 = _591 + _1001;
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1007 = _999 * _999;
        float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1011 = _579 + _1009;
        float _1013 = fma(_1003, _1003, _1007);
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1017 = fma(_1011, _1011, _1013);
        float _1019 = sqrt(_1017);
        float _1021 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1023 = -_579;
        float _1025 = _1023 + _973;
        float _1027 = precise::min(_1019, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1029 = _1027 * _1015;
        float _1031 = -_591;
        float _1033 = _1031 + _969;
        float _1035 = -_719;
        float _1037 = _1035 + _971;
        float _1039 = _1021 * _1029;
        float _1041 = fma(_1033, _1039, _591);
        float _1043 = fma(_1037, _1039, _719);
        float _1045 = fma(_1025, _1039, _579);
        _995 = _1043;
        _991 = _1041;
        _987 = _1045;
    }
    float _1047 = _995;
    float _1049 = _991;
    float _1051 = _987;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = -_237;
    float _1057 = _1055 + _1047;
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1067 = -_277;
    float _1069 = _1067 + _1049;
    float _1071 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1059);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1063);
    float _1077 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1079 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1071);
    float _1081 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1083 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[7].w, _981);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1089 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1075);
    float _1091 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1093 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[6].z, _903);
    float _1097 = 1.0 / _1083;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1103 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1105 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1107 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1101);
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1103);
    float _1113 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1095);
    float _1115 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1107);
    float _1117 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1109);
    float _1119 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1105);
    float _1121 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1123 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1115);
    float _1125 = 1.0 / _1117;
    float _1127 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1119);
    float _1129 = _1113 * _1097;
    float _1131 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1123);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1121);
    float _1135 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1127);
    float _1137 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    bool _1139 = _1129 > 0.0;
    float _1141 = _1131 + _1117;
    float _1143 = -_279;
    float _1145 = _1143 + _1051;
    float _1147 = _891 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    bool _1149 = _1129 < 1.0;
    bool _1151 = _1149 && _1139;
    float _1153 = _1141 * 0.5;
    float _1155 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1137);
    float _1157 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _1159 = _1133 * _1125;
    float _1161 = _1135 * _1125;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1155);
    float _1165 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1167 = _891 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    bool _1169 = _1159 > (-1.0);
    bool _1171 = _1169 && _1151;
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1157);
    float _1177 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1165);
    bool _1179 = _1161 > (-1.0);
    bool _1181 = _1179 && _1171;
    float _1183 = 1.0 / _1173;
    out.gl_Position.x = _1133;
    out.gl_Position.y = _1135;
    out.gl_Position.z = _1131;
    out.gl_Position.w = _1117;
    float _1185 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1175);
    bool _1187 = _1159 < 1.0;
    bool _1189 = _1187 && _1181;
    float _1191 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1177);
    out.m_62.z = _1153;
    out.m_62.w = _1117;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _1195 = _1161 < 1.0;
    bool _1197 = _1195 && _1189;
    float _1199 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _1201 = _1147 + _899;
    float _1203 = _1167 + _901;
    float _1205 = _1193 * _1183;
    float _1207 = _1199 * _1183;
    float _1209 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1211 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1203);
    float _1213 = _1209 * _1097;
    float _1215 = _1211 * _1097;
    bool _1217 = !_1197;
    float _1249;
    if (!_1217)
    {
        float _1219 = -_1215;
        float _1221 = _1161 + _1219;
        float _1223 = -_1213;
        float _1225 = _1159 + _1223;
        float _1227 = -_1205;
        float _1229 = _1159 + _1227;
        float _1231 = -_1207;
        float _1233 = _1161 + _1231;
        float _1235 = _1221 * _1221;
        float _1237 = fma(_1225, _1225, _1235);
        float _1239 = sqrt(_1237);
        bool _1241 = _1239 > 0.0;
        float _1243 = _1239;
        if (!_1241)
        {
            _1243 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _1245 = _1243;
        bool _1247 = !_1241;
        _1249 = _1245;
        _1251 = _1247;
        if (!_1251)
        {
            float _1253 = _1233 * _1233;
            float _1255 = fma(_1229, _1229, _1253);
            float _1257 = rsqrt(_1237);
            float _1259 = sqrt(_1255);
            float _1261 = _1225 * _1257;
            float _1263 = _1221 * _1257;
            bool _1265 = _1259 > 0.0;
            float _1267 = _1257;
            if (!_1265)
            {
                _1267 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _1269 = _1267;
            bool _1271 = !_1265;
            _1249 = _1269;
            _1251 = _1271;
            if (!_1251)
            {
                float _1273 = _565 * _979;
                float _1275 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1277 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].x, _909);
                float _1279 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1167);
                float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
                float _1283 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1277);
                float _1285 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1279);
                float _1287 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1281);
                float _1289 = rsqrt(_1255);
                float _1291 = _1275 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1293 = 1.0 / _1283;
                float _1295 = _1233 * _1291;
                float _1297 = _1229 * _1291;
                float _1299 = _1295 * _1295;
                float _1301 = fma(_1297, _1297, _1299);
                float _1303 = _1285 * _1293;
                float _1305 = _1287 * _1293;
                float _1307 = sqrt(_1301);
                float _1309 = _1303 * _1303;
                float _1311 = fma(_1305, _1305, _1309);
                float _1313 = _1233 * _1289;
                float _1315 = _1229 * _1289;
                float _1317 = sqrt(_1311);
                float _1319 = _1263 * _1313;
                float _1321 = fma(_1261, _1315, _1319);
                float _1323 = precise::min(0.0, _1321);
                float _1325 = _1117 * _1323;
                float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1317);
                float _1329 = fma(_1297, _1325, _1133);
                float _1331 = fma(_1295, _1325, _1135);
                float _1333 = 1.0 / _1327;
                out.gl_Position.x = _1329;
                out.gl_Position.y = _1331;
                float _1335 = _1317 * _1333;
                out.m_56.y = _1335;
                _1249 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _1251 = true;
            }
        }
    }
    else
    {
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1337;
        _1249 = 0.0;
    }
    _1251 = false;
    float _1339 = _1249;
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_35.x = _1341;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _495 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_35.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1398 = as_type<float>(_97);
        out.gl_Position.z = _1398;
    }
    if (!_85)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_81);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _99 = as_type<int>(_131);
    }
    int _133 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1467 = as_type<float>(_133);
        out.gl_Position.z = _1467;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_44.x;
    float _145 = in.m_44.y;
    float _147 = in.m_44.z;
    float _149 = in.m_46.x;
    float _151 = in.m_46.y;
    float _153 = in.m_46.z;
    float _155 = in.m_48.x;
    float _157 = in.m_48.y;
    float _159 = in.m_48.z;
    float _161 = _139 * _137;
    float _163 = in.m_50.x;
    float _165 = in.m_50.y;
    float _167 = in.m_50.z;
    float _169 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    int _171 = as_type<int>(_141) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_141) & 2;
    bool _177 = _175 != 0;
    float _179 = floor(_169);
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _169 * 6.283185482025146484375;
    float _187 = _185 * 0.15915493667125701904296875;
    bool _189 = !_177;
    int _191 = _189 ? (-1090519040) : 1056964608;
    float _193 = _145 * _151;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _145 * _157;
    float _205 = _187 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_173;
    int _211 = _209 ? (-1090519040) : 1056964608;
    float _213 = _145 * _165;
    float _215 = fma(_143, _149, _193);
    bool _217 = !_197;
    int _219 = _217 ? 0 : 1;
    float _221 = fma(_143, _155, _203);
    float _223 = fma(_143, _163, _213);
    bool _225 = !_183;
    int _227 = _225 ? 0 : 1;
    out.m_52.x = as_type<float>(_211);
    out.m_52.y = as_type<float>(_191);
    int _229 = abs(_219);
    float _231 = -_179;
    float _233 = _169 + _231;
    int _235 = abs(_227);
    float _237 = fma(_147, _153, _215);
    float _239 = -_233;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = fma(_207, 0.5, 0.5);
    float _247 = float(_229);
    bool _249 = !_201;
    int _251 = _249 ? 0 : 1;
    bool _253 = _233 < 0.5;
    float _255 = float(_253);
    float _257 = abs(_241);
    float _259 = _247 * _257;
    int _261 = abs(_251);
    float _263 = -_245;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_235);
    float _269 = -_255;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_261);
    float _275 = fma(_267, _265, _259);
    float _277 = fma(_147, _159, _221);
    float _279 = fma(_147, _167, _223);
    float _281 = abs(_271);
    float _283 = fma(_273, _281, _275);
    bool _285 = !_243;
    float _301;
    if (!_285)
    {
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_81);
        float _307 = 1.0 / _305;
        float _309 = _115 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _311 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = 1.0 / _327;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _341 = 1.0 / _335;
    bool _343 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_311);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _331;
    float _357 = _315 * _337;
    bool _359 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _361 = isnan(_311);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_353;
    float _373 = _371 + 1.0;
    float _375 = _319 * _341;
    bool _377 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _379 = isnan(_311);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _387 * _373;
    float _403 = -_387;
    float _405 = _403 + 1.0;
    float _407 = _323 * _355;
    float _409 = -_369;
    float _411 = _409 + 1.0;
    float _413 = _399 * _405;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = _353 * _411;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _437 = fma(_423, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = fma(_427, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = fma(_431, _407, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_435, _407, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _437 * _413;
    float _447 = _439 * _413;
    float _449 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _461 = fma(_441, _401, _449);
    float _463 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_443, _401, _459);
    float _469 = fma(_463, _419, _461);
    float _471 = fma(_465, _419, _467);
    float _473 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[146].x, _469);
    float _475 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[146].y, _471);
    bool _477 = !_339;
    float _493;
    if (!_477)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _481 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_81);
        float _499 = 1.0 / _497;
        float _501 = _115 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = in.m_54.x;
    float _507 = in.m_54.y;
    float _509 = in.m_32.x;
    float _511 = in.m_32.y;
    float _513 = in.m_32.z;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _515;
    float _519 = in.m_50.w;
    float _521 = 1.0 / _517;
    float _523 = in.m_48.w;
    float _525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_211));
    float _527 = _473 * _505;
    float _529 = _475 * _507;
    float _531 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _533 = _157 * _511;
    float _535 = _151 * _511;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _541 = _165 * _511;
    float _543 = fma(_155, _509, _533);
    float _545 = fma(_149, _509, _535);
    float _547 = 1.0 / _539;
    float _549 = fma(_163, _509, _541);
    float _551 = _283 * _529;
    float _553 = _283 * _527;
    float _555 = fma(_153, _513, _545);
    float _557 = fma(_167, _513, _549);
    float _559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_191));
    float _561 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _563 = fma(_159, _513, _543);
    float _565 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _569 = _503 + _567;
    float _571 = _561 * _559;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _575 = _503 + _573;
    float _577 = _565 * _525;
    float _579 = _557 + _519;
    float _581 = _571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _583 = _569 * _547;
    float _585 = _571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _587 = _575 * _521;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _581);
    float _591 = _563 + _523;
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _585);
    float _595 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].z, _589);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].z, _593);
    float _599 = in.m_46.w;
    float _601 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _603;
    float _607 = _597 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _609;
    float _613 = _579 + _601;
    float _615 = fma(_605, _587, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _617 = _591 + _607;
    float _619 = fma(_611, _587, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _623 = _613 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _625;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _617 + _629;
    bool _633 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _635 = isnan(_503);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _623 * _623;
    float _647 = fma(_627, _587, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _649 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _651 = isnan(_503);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _663 = fma(_631, _631, _645);
    float _665 = -_643;
    float _667 = _665 + 1.0;
    bool _669 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _671 = isnan(_503);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _661);
    float _683 = sqrt(_663);
    float _685 = _659 * _667;
    float _687 = -_659;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _699 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].z, _681);
    float _701 = _679 * _689;
    float _703 = -_679;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _711 = fma(_697, _583, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _713 = _615 * _701;
    float _715 = _619 * _701;
    float _717 = _647 * _701;
    float _719 = _555 + _599;
    float _721 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].x, _713);
    float _723 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].y, _715);
    bool _725 = _683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _727 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[107].z, _717);
    float _729 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _731 = fma(_709, _583, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _733 = fma(_693, _583, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _735 = fma(_711, _685, _727);
    float _737 = _719 + _729;
    float _739 = fma(_731, _685, _721);
    float _741 = fma(_733, _685, _723);
    float _743 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].z, _735);
    float _745 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].x, _739);
    float _747 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[109].y, _741);
    float _749 = _735;
    float _751 = _617;
    float _753 = _613;
    if (!_725)
    {
        _749 = _737;
    }
    float _755 = _749;
    bool _757 = !_725;
    float _759 = _755;
    if (!_757)
    {
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _765 = _683 + _763;
        float _767 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _769 = rsqrt(_663);
        float _771 = _765 * _761;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = _773 * 6.283185482025146484375;
        float _777 = cos(_775);
        float _779 = _773 * 6.283185482025146484375;
        float _781 = sin(_779);
        float _783 = _777 + (-1.0);
        float _785 = _783 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = fma(_781, _767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _789 = fma(_737, _777, _785);
        float _791 = _769 * _787;
        float _793 = fma(_631, _791, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _795 = fma(_623, _791, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _759 = _789;
        _751 = _793;
        _753 = _795;
    }
    float _797 = _759;
    float _799 = _751;
    float _801 = _753;
    float _803 = -_719;
    float _805 = _803 + _797;
    float _807 = -_591;
    float _809 = _807 + _799;
    float _811 = -_579;
    float _813 = _811 + _801;
    float _815 = _805 * _805;
    float _817 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = fma(_809, _809, _815);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _825 = fma(_813, _813, _819);
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _829 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _831 = sqrt(_825);
    float _833 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _835 = _719 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_56.y = 1.0;
    float _837 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _719 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _847 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[1].x, _835);
    float _849 = _719 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _851 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _857 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _859 = isnan(0.5);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _865 = _861 || _863;
    float _867 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[0].x, _845);
    bool _869 = _831 > 0.0;
    float _871 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[1].z, _847);
    float _873 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[2].x, _849);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _851;
    out.m_58.y = _853;
    out.m_58.z = _855;
    out.m_58.w = _827;
    float _877 = _719 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _879 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[0].z, _867);
    float _881 = _871 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    out.m_60.x = _837;
    out.m_60.y = _841;
    out.m_60.z = _843;
    out.m_60.w = _875;
    float _883 = _879 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _885 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[2].z, _873);
    float _887 = _881 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _889 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[3].x, _877);
    float _891 = _885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _893 = _881 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _895 = _881 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _897 = _881 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _899 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _887);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _893);
    float _903 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[6].x, _895);
    float _905 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _897);
    float _907 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[3].z, _889);
    float _909 = _891 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    bool _911 = !_869;
    float _913 = _799;
    float _915 = _797;
    float _917 = _801;
    float _919 = _893;
    float _921 = _889;
    if (!_911)
    {
        float _923 = _237 * _237;
        float _925 = rsqrt(_825);
        float _927 = fma(_277, _277, _923);
        float _929 = fma(_279, _279, _927);
        float _931 = sqrt(_929);
        float _933 = _809 * _925;
        float _935 = _805 * _925;
        float _937 = _813 * _925;
        bool _939 = _931 > 0.0;
        bool _941 = !_939;
        _919 = _929;
        _921 = _923;
        if (!_941)
        {
            float _943 = rsqrt(_929);
            float _945 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _947 = _237 * _943;
            float _949 = _277 * _943;
            float _951 = _935 * _947;
            float _953 = _279 * _943;
            float _955 = fma(_933, _949, _951);
            float _957 = _945 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _959 = fma(_937, _953, _955);
            float _961 = _959 * _957;
            float _963 = fma(_277, _961, _799);
            float _965 = fma(_237, _961, _797);
            float _967 = fma(_279, _961, _801);
            _913 = _963;
            _915 = _965;
            _917 = _967;
            _919 = _943;
            _921 = _953;
        }
    }
    float _969 = _913;
    float _971 = _915;
    float _973 = _917;
    float _975 = _919;
    float _977 = _921;
    float _979 = _907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _981 = _909 + _905;
    float _983 = _977;
    float _985 = _975;
    float _987 = _973;
    if (_865)
    {
        _983 = _969;
    }
    float _989 = _983;
    float _991 = _989;
    if (_865)
    {
        _985 = _971;
    }
    float _993 = _985;
    float _995 = _993;
    if (!_865)
    {
        float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _999 = _719 + _997;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1003 = _591 + _1001;
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1007 = _999 * _999;
        float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1011 = _579 + _1009;
        float _1013 = fma(_1003, _1003, _1007);
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1017 = fma(_1011, _1011, _1013);
        float _1019 = sqrt(_1017);
        float _1021 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1023 = -_579;
        float _1025 = _1023 + _973;
        float _1027 = precise::min(_1019, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1029 = _1027 * _1015;
        float _1031 = -_591;
        float _1033 = _1031 + _969;
        float _1035 = -_719;
        float _1037 = _1035 + _971;
        float _1039 = _1021 * _1029;
        float _1041 = fma(_1033, _1039, _591);
        float _1043 = fma(_1037, _1039, _719);
        float _1045 = fma(_1025, _1039, _579);
        _995 = _1043;
        _991 = _1041;
        _987 = _1045;
    }
    float _1047 = _995;
    float _1049 = _991;
    float _1051 = _987;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = -_237;
    float _1057 = _1055 + _1047;
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1067 = -_277;
    float _1069 = _1067 + _1049;
    float _1071 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1059);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1063);
    float _1077 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1079 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1071);
    float _1081 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1083 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[7].w, _981);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1089 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1075);
    float _1091 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1093 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[6].z, _903);
    float _1097 = 1.0 / _1083;
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1103 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1105 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1107 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1101);
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1103);
    float _1113 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1095);
    float _1115 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1107);
    float _1117 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1109);
    float _1119 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1105);
    float _1121 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1123 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1115);
    float _1125 = 1.0 / _1117;
    float _1127 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1119);
    float _1129 = _1113 * _1097;
    float _1131 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1123);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1121);
    float _1135 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1127);
    float _1137 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    bool _1139 = _1129 > 0.0;
    float _1141 = _1131 + _1117;
    float _1143 = -_279;
    float _1145 = _1143 + _1051;
    float _1147 = _891 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    bool _1149 = _1129 < 1.0;
    bool _1151 = _1149 && _1139;
    float _1153 = _1141 * 0.5;
    float _1155 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1137);
    float _1157 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _1159 = _1133 * _1125;
    float _1161 = _1135 * _1125;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1155);
    float _1165 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1167 = _891 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    bool _1169 = _1159 > (-1.0);
    bool _1171 = _1169 && _1151;
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1157);
    float _1177 = fma(_1069, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1165);
    bool _1179 = _1161 > (-1.0);
    bool _1181 = _1179 && _1171;
    float _1183 = 1.0 / _1173;
    out.gl_Position.x = _1133;
    out.gl_Position.y = _1135;
    out.gl_Position.z = _1131;
    out.gl_Position.w = _1117;
    float _1185 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1175);
    bool _1187 = _1159 < 1.0;
    bool _1189 = _1187 && _1181;
    float _1191 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1177);
    out.m_62.z = _1153;
    out.m_62.w = _1117;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _1195 = _1161 < 1.0;
    bool _1197 = _1195 && _1189;
    float _1199 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _1201 = _1147 + _899;
    float _1203 = _1167 + _901;
    float _1205 = _1193 * _1183;
    float _1207 = _1199 * _1183;
    float _1209 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1211 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1203);
    float _1213 = _1209 * _1097;
    float _1215 = _1211 * _1097;
    bool _1217 = !_1197;
    float _1249;
    if (!_1217)
    {
        float _1219 = -_1215;
        float _1221 = _1161 + _1219;
        float _1223 = -_1213;
        float _1225 = _1159 + _1223;
        float _1227 = -_1205;
        float _1229 = _1159 + _1227;
        float _1231 = -_1207;
        float _1233 = _1161 + _1231;
        float _1235 = _1221 * _1221;
        float _1237 = fma(_1225, _1225, _1235);
        float _1239 = sqrt(_1237);
        bool _1241 = _1239 > 0.0;
        float _1243 = _1239;
        if (!_1241)
        {
            _1243 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _1245 = _1243;
        bool _1247 = !_1241;
        _1249 = _1245;
        _1251 = _1247;
        if (!_1251)
        {
            float _1253 = _1233 * _1233;
            float _1255 = fma(_1229, _1229, _1253);
            float _1257 = rsqrt(_1237);
            float _1259 = sqrt(_1255);
            float _1261 = _1225 * _1257;
            float _1263 = _1221 * _1257;
            bool _1265 = _1259 > 0.0;
            float _1267 = _1257;
            if (!_1265)
            {
                _1267 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _1269 = _1267;
            bool _1271 = !_1265;
            _1249 = _1269;
            _1251 = _1271;
            if (!_1251)
            {
                float _1273 = _565 * _979;
                float _1275 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1277 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].x, _909);
                float _1279 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1167);
                float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
                float _1283 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1277);
                float _1285 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1279);
                float _1287 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1281);
                float _1289 = rsqrt(_1255);
                float _1291 = _1275 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1293 = 1.0 / _1283;
                float _1295 = _1233 * _1291;
                float _1297 = _1229 * _1291;
                float _1299 = _1295 * _1295;
                float _1301 = fma(_1297, _1297, _1299);
                float _1303 = _1285 * _1293;
                float _1305 = _1287 * _1293;
                float _1307 = sqrt(_1301);
                float _1309 = _1303 * _1303;
                float _1311 = fma(_1305, _1305, _1309);
                float _1313 = _1233 * _1289;
                float _1315 = _1229 * _1289;
                float _1317 = sqrt(_1311);
                float _1319 = _1263 * _1313;
                float _1321 = fma(_1261, _1315, _1319);
                float _1323 = precise::min(0.0, _1321);
                float _1325 = _1117 * _1323;
                float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1317);
                float _1329 = fma(_1297, _1325, _1133);
                float _1331 = fma(_1295, _1325, _1135);
                float _1333 = 1.0 / _1327;
                out.gl_Position.x = _1329;
                out.gl_Position.y = _1331;
                float _1335 = _1317 * _1333;
                out.m_56.y = _1335;
                _1249 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _1251 = true;
            }
        }
    }
    else
    {
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1337;
        _1249 = 0.0;
    }
    _1251 = false;
    float _1339 = _1249;
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_35.x = _1341;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

