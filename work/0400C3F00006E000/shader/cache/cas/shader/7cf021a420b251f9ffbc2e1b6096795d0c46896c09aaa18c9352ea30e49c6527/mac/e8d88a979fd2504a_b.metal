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
    float4 m_50 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
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
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1133 = false;
    bool _609 = false;
    bool _441 = false;
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
        float _1442 = as_type<float>(_87);
        out.gl_Position.z = _1442;
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
        float _1511 = as_type<float>(_123);
        out.gl_Position.z = _1511;
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_44.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_71);
        float _445 = 1.0 / _443;
        float _447 = _105 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = _449 + _451;
    bool _455 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_449);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _449 + _467;
    bool _471 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_449);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _491 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _493 = isnan(_449);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_465;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _489;
    float _509 = _501 * _505;
    float _511 = -_501;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _515;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _521 = 1.0 / _485;
    float _523 = _481 * _513;
    float _525 = -_481;
    float _527 = _525 + 1.0;
    float _529 = _469 * _507;
    float _531 = _453 * _521;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = fma(_517, _531, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _543 = fma(_535, _531, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _545 = fma(_539, _531, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _541 * _523;
    float _549 = _543 * _523;
    float _551 = _545 * _523;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _565 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _567 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _549);
    float _569 = fma(_555, _529, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _571 = fma(_559, _529, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _573 = fma(_563, _529, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _575 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _551);
    float _577 = fma(_569, _509, _565);
    float _579 = fma(_571, _509, _567);
    float _581 = fma(_573, _509, _575);
    float _583 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _577);
    float _585 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _579);
    float _587 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _581);
    bool _589 = !_519;
    float _607;
    if (!_589)
    {
        float _591 = in.m_44.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_71);
        float _613 = 1.0 / _611;
        float _615 = _105 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = in.m_44.x;
    float _621 = in.m_44.y;
    float _623 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    float _635 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _623);
    float _637 = 1.0 / _627;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _629);
    float _645 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _635);
    float _647 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = 1.0 / _641;
    bool _653 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _655 = isnan(_617);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _633 * _637;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _617 + _667;
    bool _671 = _621 > 0.5;
    float _673 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _681 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _683 = isnan(_617);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _673);
    bool _695 = _619 > 0.5;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _617 + _697;
    float _701 = -_691;
    float _703 = _701 + 1.0;
    float _705 = _677 * _651;
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _711 = _709 != 0;
    float _713 = _663 * _703;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _717 = _715 != 0;
    float _719 = -_663;
    float _721 = _719 + 1.0;
    bool _723 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _725 = isnan(_617);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _679 * _713;
    float _737 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _739 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _643);
    float _741 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = -_733;
    float _745 = _743 + 1.0;
    float _747 = _737 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _749 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[115].x, _735);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _741 + _751;
    float _755 = _691 * _745;
    float _757 = _739 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _761 = _747 + _759;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _765 = fma(_705, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _767 = -_183;
    int _769 = _671 ? as_type<int>(_767) : as_type<int>(_183);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = _757 + _771;
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[28].x, _763);
    float _777 = fma(_765, _755, _749);
    bool _779 = !_717;
    float _781 = _779 ? _183 : as_type<float>(_769);
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[28].z, _775);
    float _787 = -_179;
    int _789 = _695 ? as_type<int>(_787) : as_type<int>(_179);
    float _791 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[117].x, _777);
    float _793 = -_781;
    float _795 = _793 + 0.5;
    float _797 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _799 = _785 >= 0.0;
    float _801 = _753 * _753;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _805 = !_711;
    float _807 = _805 ? _179 : as_type<float>(_789);
    float _809 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_761, _761, _801);
    float _813 = _803 * _707;
    float _815 = _807 + 0.5;
    float _817 = fma(_773, _773, _811);
    float _819 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = rsqrt(_817);
    float _823 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _647;
    float _829 = _741;
    if (_799)
    {
        _827 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _827;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _837 = _823 * _783;
    float _839 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _849 = as_type<int>(_831);
    if (_799)
    {
        float _851 = _831 * 5.0;
        _849 = as_type<int>(_851);
    }
    int _853 = _849;
    out.m_46.x = _837;
    out.m_46.y = _813;
    float _855 = _753 * _821;
    float _857 = _761 * _821;
    out.m_48.x = _841;
    out.m_48.y = _843;
    out.m_48.z = _845;
    out.m_50.x = _839;
    out.m_50.y = _819;
    out.m_50.z = _809;
    out.m_50.w = _847;
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2717 = as_type<float>(_853);
        out.gl_Position.z = _2717;
    }
    if (_799)
    {
        out.m_35.x = 0.0;
    }
    if (_799)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _859 = -_855;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _741);
    float _863 = _773 * _821;
    float _865 = -_857;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _747);
    float _869 = -_855;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _875 = _861 + _873;
    float _877 = -_863;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[18].w, _757);
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _867 + _881;
    float _885 = -_857;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _761);
    float _889 = _875 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _893 = _879 + _891;
    float _895 = -_863;
    float _897 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _773);
    float _899 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[28].x, _889);
    float _901 = _871 * _871;
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[28].z, _899);
    float _905 = fma(_887, _887, _901);
    bool _907 = _903 >= 0.0;
    float _909 = fma(_897, _897, _905);
    float _911 = sqrt(_909);
    float _913 = _893;
    if (_907)
    {
        _913 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _915 = _913;
    int _917 = as_type<int>(_915);
    if (_907)
    {
        out.m_35.x = 0.0;
    }
    if (_907)
    {
        float _919 = _915 * 5.0;
        _917 = as_type<int>(_919);
    }
    int _921 = _917;
    if (_907)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_921);
        out.gl_Position.z = _2846;
    }
    float _923 = _821 * _911;
    if (_907)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _925 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _929 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _933 = _923 * _925;
    float _935 = _923 * _929;
    float _937 = _927 * _933;
    float _939 = _931 * _935;
    float _941 = _923 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _943 = _941 * 0.5;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _947 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _949 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _951 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _945);
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _947);
    float _955 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _949);
    float _957 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _951);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _953);
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _955);
    float _963 = _957 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _965 = _959 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _967 = _961 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _969 = _747 + _963;
    float _971 = _757 + _965;
    float _973 = _741 + _967;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _977 = _969 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _981 = _971 + _979;
    float _983 = _977 * _977;
    float _985 = _981 * _981;
    float _987 = _983 + _985;
    float _989 = sqrt(_987);
    bool _991 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _993 = _961;
    float _995 = _943;
    float _997 = _967;
    float _999 = _985;
    if (!_991)
    {
        _993 = _983;
    }
    float _1001 = _993;
    float _1003 = _1001;
    if (!_991)
    {
        _995 = _969;
    }
    float _1005 = _995;
    float _1007 = _1005;
    if (!_991)
    {
        _997 = _971;
    }
    float _1009 = _997;
    float _1011 = _1009;
    if (!_991)
    {
        _829 = _973;
    }
    float _1013 = _829;
    bool _1015 = !_991;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _989 + _1021;
        float _1025 = _973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1027 = rsqrt(_987);
        float _1029 = _1023 * _1019;
        float _1031 = _1029 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = fma(_1035, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1043 = _1027 * _1041;
        float _1045 = _1039 + (-1.0);
        float _1047 = fma(_977, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1049 = fma(_981, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1051 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1055 = _1047 + _1053;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1059 = _1049 + _1057;
        float _1061 = fma(_973, _1039, _1051);
        float _1063 = _1055 * _1055;
        float _1065 = _1059 * _1059;
        _1017 = _1061;
        _1003 = _1063;
        _999 = _1065;
        _1007 = _1047;
        _1011 = _1049;
    }
    float _1067 = _1017;
    float _1069 = _1003;
    float _1071 = _999;
    float _1073 = _1007;
    float _1075 = _1011;
    float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1079 = _1067 + _1077;
    float _1081 = fma(_1079, _1079, _1069);
    float _1083 = _1081 + _1071;
    float _1085 = sqrt(_1083);
    bool _1087 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1089 = isnan(_1085);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1095 = _1091 || _1093;
    float _1097 = _1069;
    if (!_1095)
    {
        _1097 = 1.0;
    }
    float _1099 = _1097;
    bool _1101 = !_1095;
    float _1103 = _1099;
    if (!_1101)
    {
        bool _1105 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1107 = isnan(_1085);
        bool _1109 = _1105 || _1107;
        bool _1111 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1113 = _1109 || _1111;
        if (!_1113)
        {
            float _1115 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1117 = _1085 + _1115;
            float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1121 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1119;
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1125 = _1123 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1127 = 1.0 / _1121;
            float _1129 = _1117 * _1127;
            float _1131 = fma(_1129, _1125, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1103 = _1131;
            _1133 = true;
        }
        else
        {
            bool _1135 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1137 = isnan(_1085);
            bool _1139 = _1135 || _1137;
            bool _1141 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1143 = _1139 || _1141;
            if (!_1143)
            {
                float _1145 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1147 = _1085 + _1145;
                float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1151 = _1149 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1155 = _1153 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1157 = 1.0 / _1151;
                float _1159 = _1147 * _1157;
                float _1161 = fma(_1159, _1155, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1103 = _1161;
                _1133 = true;
            }
            else
            {
                _1103 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1133 = false;
    float _1163 = _1103;
    float _1165 = _861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1167 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1169 = _1067 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1173 = _1073 + _1171;
    float _1175 = _861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1177 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1165);
    float _1179 = fma(_1169, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1183 = _1075 + _1181;
    float _1185 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1177);
    float _1187 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1175);
    float _1191 = -_855;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1179);
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1197 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan(0.5);
    bool _1205 = _1201 || _1203;
    float _1207 = fma(_1183, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1209 = -_857;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1213 = 1.0 / _1195;
    float _1215 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1189);
    float _1217 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1219 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1221 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1223 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1225 = -_863;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1207);
    float _1229 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1217);
    float _1233 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1219);
    float _1235 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1221);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1223);
    float _1239 = _1229 + _1195;
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1231);
    float _1243 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1235);
    float _1247 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1237);
    float _1249 = _1239 * _1213;
    float _1251 = _1249 * 0.5;
    float _1253 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1255 = _1227;
    if (_1205)
    {
        _1255 = 1.0;
    }
    float _1257 = _1255;
    float _1259 = _1257;
    if (!_1205)
    {
        float _1261 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1265 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1263);
        float _1267 = _1261 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1275 = _1273 * 0.15915493667125701904296875;
        float _1277 = _1267 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1271;
        float _1283 = _1275 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1265;
        float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1291;
        float _1295 = _1285 * _1287;
        float _1297 = _1275 * 6.283185482025146484375;
        float _1299 = sin(_1297);
        float _1301 = 1.0 / _1295;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1305 = _1289 * _1303;
        float _1307 = 1.0 / _1293;
        float _1309 = _1299 * _1301;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1313 = fma(_1309, _1305, _1311);
        float _1315 = _1313 * _1307;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        _1259 = _1317;
    }
    float _1319 = _1259;
    float _1321 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1323 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1325 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1327 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1329 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1331 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1333 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1323);
    float _1335 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1325);
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1327);
    float _1339 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1329);
    float _1341 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1333);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1335);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1339);
    bool _1351 = _1319 > 0.0;
    bool _1353 = isnan(_1319);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan(0.0);
    bool _1359 = _1355 || _1357;
    float _1361 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1363 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1365 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1345);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1349);
    float _1369 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1347);
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1373 = _1365 + _1367;
    float _1375 = _1369 + _1367;
    float _1377 = _1367 * 0.5;
    float _1379 = _1373 * 0.5;
    float _1381 = _1375 * 0.5;
    float _1383 = fma(_1363, -0.5, _1377);
    out.m_35.x = _1371;
    out.gl_Position.x = _1365;
    out.gl_Position.y = _1363;
    out.gl_Position.z = _1369;
    out.gl_Position.w = _1367;
    out.m_52.x = _1379;
    out.m_52.y = _1383;
    out.m_52.z = _1381;
    out.m_52.w = _1367;
    if (_1359)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1385;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1133 = false;
    bool _609 = false;
    bool _441 = false;
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
        float _1442 = as_type<float>(_87);
        out.gl_Position.z = _1442;
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
        float _1511 = as_type<float>(_123);
        out.gl_Position.z = _1511;
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_44.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_71);
        float _445 = 1.0 / _443;
        float _447 = _105 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = _449 + _451;
    bool _455 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_449);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _449 + _467;
    bool _471 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_449);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _491 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _493 = isnan(_449);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_465;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _489;
    float _509 = _501 * _505;
    float _511 = -_501;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _515;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _521 = 1.0 / _485;
    float _523 = _481 * _513;
    float _525 = -_481;
    float _527 = _525 + 1.0;
    float _529 = _469 * _507;
    float _531 = _453 * _521;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = fma(_517, _531, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _543 = fma(_535, _531, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _545 = fma(_539, _531, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _541 * _523;
    float _549 = _543 * _523;
    float _551 = _545 * _523;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _565 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _567 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _549);
    float _569 = fma(_555, _529, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _571 = fma(_559, _529, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _573 = fma(_563, _529, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _575 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _551);
    float _577 = fma(_569, _509, _565);
    float _579 = fma(_571, _509, _567);
    float _581 = fma(_573, _509, _575);
    float _583 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _577);
    float _585 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _579);
    float _587 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _581);
    bool _589 = !_519;
    float _607;
    if (!_589)
    {
        float _591 = in.m_44.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_71);
        float _613 = 1.0 / _611;
        float _615 = _105 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = in.m_44.x;
    float _621 = in.m_44.y;
    float _623 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    float _635 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _623);
    float _637 = 1.0 / _627;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _629);
    float _645 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _635);
    float _647 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = 1.0 / _641;
    bool _653 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _655 = isnan(_617);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _633 * _637;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _617 + _667;
    bool _671 = _621 > 0.5;
    float _673 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _681 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _683 = isnan(_617);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _673);
    bool _695 = _619 > 0.5;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _617 + _697;
    float _701 = -_691;
    float _703 = _701 + 1.0;
    float _705 = _677 * _651;
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _711 = _709 != 0;
    float _713 = _663 * _703;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _717 = _715 != 0;
    float _719 = -_663;
    float _721 = _719 + 1.0;
    bool _723 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _725 = isnan(_617);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _679 * _713;
    float _737 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _739 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _643);
    float _741 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = -_733;
    float _745 = _743 + 1.0;
    float _747 = _737 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _749 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[115].x, _735);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _741 + _751;
    float _755 = _691 * _745;
    float _757 = _739 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _761 = _747 + _759;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _765 = fma(_705, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _767 = -_183;
    int _769 = _671 ? as_type<int>(_767) : as_type<int>(_183);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = _757 + _771;
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[28].x, _763);
    float _777 = fma(_765, _755, _749);
    bool _779 = !_717;
    float _781 = _779 ? _183 : as_type<float>(_769);
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[28].z, _775);
    float _787 = -_179;
    int _789 = _695 ? as_type<int>(_787) : as_type<int>(_179);
    float _791 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[117].x, _777);
    float _793 = -_781;
    float _795 = _793 + 0.5;
    float _797 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _799 = _785 >= 0.0;
    float _801 = _753 * _753;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _805 = !_711;
    float _807 = _805 ? _179 : as_type<float>(_789);
    float _809 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_761, _761, _801);
    float _813 = _803 * _707;
    float _815 = _807 + 0.5;
    float _817 = fma(_773, _773, _811);
    float _819 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = rsqrt(_817);
    float _823 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _647;
    float _829 = _741;
    if (_799)
    {
        _827 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _827;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _837 = _823 * _783;
    float _839 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _849 = as_type<int>(_831);
    if (_799)
    {
        float _851 = _831 * 5.0;
        _849 = as_type<int>(_851);
    }
    int _853 = _849;
    out.m_46.x = _837;
    out.m_46.y = _813;
    float _855 = _753 * _821;
    float _857 = _761 * _821;
    out.m_48.x = _841;
    out.m_48.y = _843;
    out.m_48.z = _845;
    out.m_50.x = _839;
    out.m_50.y = _819;
    out.m_50.z = _809;
    out.m_50.w = _847;
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2717 = as_type<float>(_853);
        out.gl_Position.z = _2717;
    }
    if (_799)
    {
        out.m_35.x = 0.0;
    }
    if (_799)
    {
        return out;
    }
    float _859 = -_855;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _741);
    float _863 = _773 * _821;
    float _865 = -_857;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _747);
    float _869 = -_855;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _875 = _861 + _873;
    float _877 = -_863;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[18].w, _757);
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _867 + _881;
    float _885 = -_857;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _761);
    float _889 = _875 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _893 = _879 + _891;
    float _895 = -_863;
    float _897 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _773);
    float _899 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[28].x, _889);
    float _901 = _871 * _871;
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[28].z, _899);
    float _905 = fma(_887, _887, _901);
    bool _907 = _903 >= 0.0;
    float _909 = fma(_897, _897, _905);
    float _911 = sqrt(_909);
    float _913 = _893;
    if (_907)
    {
        _913 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _915 = _913;
    int _917 = as_type<int>(_915);
    if (_907)
    {
        out.m_35.x = 0.0;
    }
    if (_907)
    {
        float _919 = _915 * 5.0;
        _917 = as_type<int>(_919);
    }
    int _921 = _917;
    if (_907)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_921);
        out.gl_Position.z = _2846;
    }
    float _923 = _821 * _911;
    if (_907)
    {
        return out;
    }
    float _925 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _929 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _933 = _923 * _925;
    float _935 = _923 * _929;
    float _937 = _927 * _933;
    float _939 = _931 * _935;
    float _941 = _923 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _943 = _941 * 0.5;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _947 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _949 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _951 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _945);
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _947);
    float _955 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _949);
    float _957 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _951);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _953);
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _955);
    float _963 = _957 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _965 = _959 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _967 = _961 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _969 = _747 + _963;
    float _971 = _757 + _965;
    float _973 = _741 + _967;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _977 = _969 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _981 = _971 + _979;
    float _983 = _977 * _977;
    float _985 = _981 * _981;
    float _987 = _983 + _985;
    float _989 = sqrt(_987);
    bool _991 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _993 = _961;
    float _995 = _943;
    float _997 = _967;
    float _999 = _985;
    if (!_991)
    {
        _993 = _983;
    }
    float _1001 = _993;
    float _1003 = _1001;
    if (!_991)
    {
        _995 = _969;
    }
    float _1005 = _995;
    float _1007 = _1005;
    if (!_991)
    {
        _997 = _971;
    }
    float _1009 = _997;
    float _1011 = _1009;
    if (!_991)
    {
        _829 = _973;
    }
    float _1013 = _829;
    bool _1015 = !_991;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _989 + _1021;
        float _1025 = _973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1027 = rsqrt(_987);
        float _1029 = _1023 * _1019;
        float _1031 = _1029 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = fma(_1035, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1043 = _1027 * _1041;
        float _1045 = _1039 + (-1.0);
        float _1047 = fma(_977, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1049 = fma(_981, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1051 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1055 = _1047 + _1053;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1059 = _1049 + _1057;
        float _1061 = fma(_973, _1039, _1051);
        float _1063 = _1055 * _1055;
        float _1065 = _1059 * _1059;
        _1017 = _1061;
        _1003 = _1063;
        _999 = _1065;
        _1007 = _1047;
        _1011 = _1049;
    }
    float _1067 = _1017;
    float _1069 = _1003;
    float _1071 = _999;
    float _1073 = _1007;
    float _1075 = _1011;
    float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1079 = _1067 + _1077;
    float _1081 = fma(_1079, _1079, _1069);
    float _1083 = _1081 + _1071;
    float _1085 = sqrt(_1083);
    bool _1087 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1089 = isnan(_1085);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1095 = _1091 || _1093;
    float _1097 = _1069;
    if (!_1095)
    {
        _1097 = 1.0;
    }
    float _1099 = _1097;
    bool _1101 = !_1095;
    float _1103 = _1099;
    if (!_1101)
    {
        bool _1105 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1107 = isnan(_1085);
        bool _1109 = _1105 || _1107;
        bool _1111 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1113 = _1109 || _1111;
        if (!_1113)
        {
            float _1115 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1117 = _1085 + _1115;
            float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1121 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1119;
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1125 = _1123 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1127 = 1.0 / _1121;
            float _1129 = _1117 * _1127;
            float _1131 = fma(_1129, _1125, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1103 = _1131;
            _1133 = true;
        }
        else
        {
            bool _1135 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1137 = isnan(_1085);
            bool _1139 = _1135 || _1137;
            bool _1141 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1143 = _1139 || _1141;
            if (!_1143)
            {
                float _1145 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1147 = _1085 + _1145;
                float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1151 = _1149 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1155 = _1153 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1157 = 1.0 / _1151;
                float _1159 = _1147 * _1157;
                float _1161 = fma(_1159, _1155, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1103 = _1161;
                _1133 = true;
            }
            else
            {
                _1103 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1133 = false;
    float _1163 = _1103;
    float _1165 = _861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1167 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1169 = _1067 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1173 = _1073 + _1171;
    float _1175 = _861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1177 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1165);
    float _1179 = fma(_1169, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1183 = _1075 + _1181;
    float _1185 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1177);
    float _1187 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1175);
    float _1191 = -_855;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1179);
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1197 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan(0.5);
    bool _1205 = _1201 || _1203;
    float _1207 = fma(_1183, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1209 = -_857;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1213 = 1.0 / _1195;
    float _1215 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1189);
    float _1217 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1219 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1221 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1223 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1225 = -_863;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1207);
    float _1229 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1217);
    float _1233 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1219);
    float _1235 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1221);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1223);
    float _1239 = _1229 + _1195;
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1231);
    float _1243 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1235);
    float _1247 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1237);
    float _1249 = _1239 * _1213;
    float _1251 = _1249 * 0.5;
    float _1253 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1255 = _1227;
    if (_1205)
    {
        _1255 = 1.0;
    }
    float _1257 = _1255;
    float _1259 = _1257;
    if (!_1205)
    {
        float _1261 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1265 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1263);
        float _1267 = _1261 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1275 = _1273 * 0.15915493667125701904296875;
        float _1277 = _1267 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1271;
        float _1283 = _1275 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1265;
        float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1291;
        float _1295 = _1285 * _1287;
        float _1297 = _1275 * 6.283185482025146484375;
        float _1299 = sin(_1297);
        float _1301 = 1.0 / _1295;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1305 = _1289 * _1303;
        float _1307 = 1.0 / _1293;
        float _1309 = _1299 * _1301;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1313 = fma(_1309, _1305, _1311);
        float _1315 = _1313 * _1307;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        _1259 = _1317;
    }
    float _1319 = _1259;
    float _1321 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1323 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1325 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1327 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1329 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1331 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1333 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1323);
    float _1335 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1325);
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1327);
    float _1339 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1329);
    float _1341 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1333);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1335);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1339);
    bool _1351 = _1319 > 0.0;
    bool _1353 = isnan(_1319);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan(0.0);
    bool _1359 = _1355 || _1357;
    float _1361 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1363 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1365 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1345);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1349);
    float _1369 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1347);
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1373 = _1365 + _1367;
    float _1375 = _1369 + _1367;
    float _1377 = _1367 * 0.5;
    float _1379 = _1373 * 0.5;
    float _1381 = _1375 * 0.5;
    float _1383 = fma(_1363, -0.5, _1377);
    out.m_35.x = _1371;
    out.gl_Position.x = _1365;
    out.gl_Position.y = _1363;
    out.gl_Position.z = _1369;
    out.gl_Position.w = _1367;
    out.m_52.x = _1379;
    out.m_52.y = _1383;
    out.m_52.z = _1381;
    out.m_52.w = _1367;
    if (_1359)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1385;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1133 = false;
    bool _609 = false;
    bool _441 = false;
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
        float _1442 = as_type<float>(_87);
        out.gl_Position.z = _1442;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1511 = as_type<float>(_123);
        out.gl_Position.z = _1511;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_44.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_71);
        float _445 = 1.0 / _443;
        float _447 = _105 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = _449 + _451;
    bool _455 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_449);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _449 + _467;
    bool _471 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_449);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _491 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _493 = isnan(_449);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_465;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _489;
    float _509 = _501 * _505;
    float _511 = -_501;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _515;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _521 = 1.0 / _485;
    float _523 = _481 * _513;
    float _525 = -_481;
    float _527 = _525 + 1.0;
    float _529 = _469 * _507;
    float _531 = _453 * _521;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = fma(_517, _531, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _543 = fma(_535, _531, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _545 = fma(_539, _531, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _541 * _523;
    float _549 = _543 * _523;
    float _551 = _545 * _523;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _565 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _567 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _549);
    float _569 = fma(_555, _529, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _571 = fma(_559, _529, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _573 = fma(_563, _529, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _575 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _551);
    float _577 = fma(_569, _509, _565);
    float _579 = fma(_571, _509, _567);
    float _581 = fma(_573, _509, _575);
    float _583 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _577);
    float _585 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _579);
    float _587 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _581);
    bool _589 = !_519;
    float _607;
    if (!_589)
    {
        float _591 = in.m_44.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_71);
        float _613 = 1.0 / _611;
        float _615 = _105 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = in.m_44.x;
    float _621 = in.m_44.y;
    float _623 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    float _635 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _623);
    float _637 = 1.0 / _627;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _629);
    float _645 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _635);
    float _647 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = 1.0 / _641;
    bool _653 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _655 = isnan(_617);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _633 * _637;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _617 + _667;
    bool _671 = _621 > 0.5;
    float _673 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _681 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _683 = isnan(_617);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _673);
    bool _695 = _619 > 0.5;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _617 + _697;
    float _701 = -_691;
    float _703 = _701 + 1.0;
    float _705 = _677 * _651;
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _711 = _709 != 0;
    float _713 = _663 * _703;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _717 = _715 != 0;
    float _719 = -_663;
    float _721 = _719 + 1.0;
    bool _723 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _725 = isnan(_617);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _679 * _713;
    float _737 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _739 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _643);
    float _741 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = -_733;
    float _745 = _743 + 1.0;
    float _747 = _737 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _749 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[115].x, _735);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _741 + _751;
    float _755 = _691 * _745;
    float _757 = _739 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _761 = _747 + _759;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _765 = fma(_705, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _767 = -_183;
    int _769 = _671 ? as_type<int>(_767) : as_type<int>(_183);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = _757 + _771;
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[28].x, _763);
    float _777 = fma(_765, _755, _749);
    bool _779 = !_717;
    float _781 = _779 ? _183 : as_type<float>(_769);
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[28].z, _775);
    float _787 = -_179;
    int _789 = _695 ? as_type<int>(_787) : as_type<int>(_179);
    float _791 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[117].x, _777);
    float _793 = -_781;
    float _795 = _793 + 0.5;
    float _797 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _799 = _785 >= 0.0;
    float _801 = _753 * _753;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _805 = !_711;
    float _807 = _805 ? _179 : as_type<float>(_789);
    float _809 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_761, _761, _801);
    float _813 = _803 * _707;
    float _815 = _807 + 0.5;
    float _817 = fma(_773, _773, _811);
    float _819 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = rsqrt(_817);
    float _823 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _647;
    float _829 = _741;
    if (_799)
    {
        _827 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _827;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _837 = _823 * _783;
    float _839 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _849 = as_type<int>(_831);
    if (_799)
    {
        float _851 = _831 * 5.0;
        _849 = as_type<int>(_851);
    }
    int _853 = _849;
    out.m_46.x = _837;
    out.m_46.y = _813;
    float _855 = _753 * _821;
    float _857 = _761 * _821;
    out.m_48.x = _841;
    out.m_48.y = _843;
    out.m_48.z = _845;
    out.m_50.x = _839;
    out.m_50.y = _819;
    out.m_50.z = _809;
    out.m_50.w = _847;
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2717 = as_type<float>(_853);
        out.gl_Position.z = _2717;
    }
    if (_799)
    {
        out.m_35.x = 0.0;
    }
    if (_799)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _859 = -_855;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _741);
    float _863 = _773 * _821;
    float _865 = -_857;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _747);
    float _869 = -_855;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _875 = _861 + _873;
    float _877 = -_863;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[18].w, _757);
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _867 + _881;
    float _885 = -_857;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _761);
    float _889 = _875 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _893 = _879 + _891;
    float _895 = -_863;
    float _897 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _773);
    float _899 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[28].x, _889);
    float _901 = _871 * _871;
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[28].z, _899);
    float _905 = fma(_887, _887, _901);
    bool _907 = _903 >= 0.0;
    float _909 = fma(_897, _897, _905);
    float _911 = sqrt(_909);
    float _913 = _893;
    if (_907)
    {
        _913 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _915 = _913;
    int _917 = as_type<int>(_915);
    if (_907)
    {
        out.m_35.x = 0.0;
    }
    if (_907)
    {
        float _919 = _915 * 5.0;
        _917 = as_type<int>(_919);
    }
    int _921 = _917;
    if (_907)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_921);
        out.gl_Position.z = _2846;
    }
    float _923 = _821 * _911;
    if (_907)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _925 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _929 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _933 = _923 * _925;
    float _935 = _923 * _929;
    float _937 = _927 * _933;
    float _939 = _931 * _935;
    float _941 = _923 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _943 = _941 * 0.5;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _947 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _949 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _951 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _945);
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _947);
    float _955 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _949);
    float _957 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _951);
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _953);
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _955);
    float _963 = _957 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _965 = _959 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _967 = _961 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _969 = _747 + _963;
    float _971 = _757 + _965;
    float _973 = _741 + _967;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _977 = _969 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _981 = _971 + _979;
    float _983 = _977 * _977;
    float _985 = _981 * _981;
    float _987 = _983 + _985;
    float _989 = sqrt(_987);
    bool _991 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _993 = _961;
    float _995 = _943;
    float _997 = _967;
    float _999 = _985;
    if (!_991)
    {
        _993 = _983;
    }
    float _1001 = _993;
    float _1003 = _1001;
    if (!_991)
    {
        _995 = _969;
    }
    float _1005 = _995;
    float _1007 = _1005;
    if (!_991)
    {
        _997 = _971;
    }
    float _1009 = _997;
    float _1011 = _1009;
    if (!_991)
    {
        _829 = _973;
    }
    float _1013 = _829;
    bool _1015 = !_991;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _989 + _1021;
        float _1025 = _973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1027 = rsqrt(_987);
        float _1029 = _1023 * _1019;
        float _1031 = _1029 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = fma(_1035, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1043 = _1027 * _1041;
        float _1045 = _1039 + (-1.0);
        float _1047 = fma(_977, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1049 = fma(_981, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1051 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1055 = _1047 + _1053;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1059 = _1049 + _1057;
        float _1061 = fma(_973, _1039, _1051);
        float _1063 = _1055 * _1055;
        float _1065 = _1059 * _1059;
        _1017 = _1061;
        _1003 = _1063;
        _999 = _1065;
        _1007 = _1047;
        _1011 = _1049;
    }
    float _1067 = _1017;
    float _1069 = _1003;
    float _1071 = _999;
    float _1073 = _1007;
    float _1075 = _1011;
    float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1079 = _1067 + _1077;
    float _1081 = fma(_1079, _1079, _1069);
    float _1083 = _1081 + _1071;
    float _1085 = sqrt(_1083);
    bool _1087 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1089 = isnan(_1085);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1095 = _1091 || _1093;
    float _1097 = _1069;
    if (!_1095)
    {
        _1097 = 1.0;
    }
    float _1099 = _1097;
    bool _1101 = !_1095;
    float _1103 = _1099;
    if (!_1101)
    {
        bool _1105 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1107 = isnan(_1085);
        bool _1109 = _1105 || _1107;
        bool _1111 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1113 = _1109 || _1111;
        if (!_1113)
        {
            float _1115 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1117 = _1085 + _1115;
            float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1121 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1119;
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1125 = _1123 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1127 = 1.0 / _1121;
            float _1129 = _1117 * _1127;
            float _1131 = fma(_1129, _1125, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1103 = _1131;
            _1133 = true;
        }
        else
        {
            bool _1135 = _1085 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1137 = isnan(_1085);
            bool _1139 = _1135 || _1137;
            bool _1141 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1143 = _1139 || _1141;
            if (!_1143)
            {
                float _1145 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1147 = _1085 + _1145;
                float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1151 = _1149 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1155 = _1153 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1157 = 1.0 / _1151;
                float _1159 = _1147 * _1157;
                float _1161 = fma(_1159, _1155, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1103 = _1161;
                _1133 = true;
            }
            else
            {
                _1103 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1133 = false;
    float _1163 = _1103;
    float _1165 = _861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1167 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1169 = _1067 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1173 = _1073 + _1171;
    float _1175 = _861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1177 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1165);
    float _1179 = fma(_1169, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1183 = _1075 + _1181;
    float _1185 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1177);
    float _1187 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1175);
    float _1191 = -_855;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1179);
    float _1195 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1197 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan(0.5);
    bool _1205 = _1201 || _1203;
    float _1207 = fma(_1183, _1163, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1209 = -_857;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1213 = 1.0 / _1195;
    float _1215 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1189);
    float _1217 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1219 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1221 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1223 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1225 = -_863;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1207);
    float _1229 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1231 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1217);
    float _1233 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1219);
    float _1235 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1221);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1223);
    float _1239 = _1229 + _1195;
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1231);
    float _1243 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1235);
    float _1247 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1237);
    float _1249 = _1239 * _1213;
    float _1251 = _1249 * 0.5;
    float _1253 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1255 = _1227;
    if (_1205)
    {
        _1255 = 1.0;
    }
    float _1257 = _1255;
    float _1259 = _1257;
    if (!_1205)
    {
        float _1261 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1265 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1263);
        float _1267 = _1261 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1275 = _1273 * 0.15915493667125701904296875;
        float _1277 = _1267 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1271;
        float _1283 = _1275 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1265;
        float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1291;
        float _1295 = _1285 * _1287;
        float _1297 = _1275 * 6.283185482025146484375;
        float _1299 = sin(_1297);
        float _1301 = 1.0 / _1295;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1305 = _1289 * _1303;
        float _1307 = 1.0 / _1293;
        float _1309 = _1299 * _1301;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1313 = fma(_1309, _1305, _1311);
        float _1315 = _1313 * _1307;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        _1259 = _1317;
    }
    float _1319 = _1259;
    float _1321 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1323 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1325 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1327 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1329 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1331 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1333 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1323);
    float _1335 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1325);
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1327);
    float _1339 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1329);
    float _1341 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1333);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1335);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1339);
    bool _1351 = _1319 > 0.0;
    bool _1353 = isnan(_1319);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan(0.0);
    bool _1359 = _1355 || _1357;
    float _1361 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1363 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1365 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1345);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1349);
    float _1369 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1347);
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1373 = _1365 + _1367;
    float _1375 = _1369 + _1367;
    float _1377 = _1367 * 0.5;
    float _1379 = _1373 * 0.5;
    float _1381 = _1375 * 0.5;
    float _1383 = fma(_1363, -0.5, _1377);
    out.m_35.x = _1371;
    out.gl_Position.x = _1365;
    out.gl_Position.y = _1363;
    out.gl_Position.z = _1369;
    out.gl_Position.w = _1367;
    out.m_52.x = _1379;
    out.m_52.y = _1383;
    out.m_52.z = _1381;
    out.m_52.w = _1367;
    if (_1359)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1385;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

