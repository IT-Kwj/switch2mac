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
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1339 = false;
    bool _789 = false;
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
        float _1718 = as_type<float>(_87);
        out.gl_Position.z = _1718;
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
        float _1787 = as_type<float>(_123);
        out.gl_Position.z = _1787;
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
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _617 + _619;
    float _623 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_617);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _651 = isnan(_617);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _627;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    bool _671 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_617);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = 1.0 / _631;
    float _689 = 1.0 / _647;
    float _691 = _665 * _661;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _659 * _669;
    float _699 = -_659;
    float _701 = _699 + 1.0;
    float _703 = fma(_691, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _705;
    float _709 = _681 * _701;
    float _711 = _695 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _715 = _617 + _713;
    bool _717 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _719 = isnan(_617);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = _703 * _709;
    float _731 = -_681;
    float _733 = _731 + 1.0;
    float _735 = fma(_711, _715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = _617 + _737;
    float _741 = _707 * _689;
    float _743 = -_727;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _729);
    float _749 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _751 = fma(_741, _739, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _753 = _643 * _745;
    float _755 = fma(_735, _697, _747);
    float _757 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_751, _753, _755);
    float _763 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[118].x, _761);
    float _765 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _757;
    out.m_46.y = _765;
    out.m_46.z = _759;
    out.m_46.w = _767;
    bool _769 = !_685;
    float _787;
    if (!_769)
    {
        float _771 = in.m_44.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _787 = _785;
        _789 = true;
    }
    else
    {
        float _791 = float(_71);
        float _793 = 1.0 / _791;
        float _795 = _105 * _793;
        _787 = _795;
    }
    _789 = false;
    float _797 = _787;
    float _799 = in.m_44.x;
    float _801 = in.m_44.y;
    float _803 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _815 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _803);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _823 = _821 != 0;
    float _825 = 1.0 / _809;
    float _827 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _815);
    bool _829 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _831 = isnan(_797);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _843 = _797 + _841;
    bool _845 = _799 > 0.5;
    float _847 = 1.0 / _813;
    bool _849 = _801 > 0.5;
    float _851 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _853 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _851);
    float _857 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _797 + _863;
    float _867 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _855);
    float _869 = _843 * _825;
    float _871 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    bool _873 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _875 = isnan(_797);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_861, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _887 = _865 * _847;
    bool _889 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _891 = isnan(_797);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _901;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _905;
    float _909 = -_883;
    float _911 = _909 + 1.0;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_903, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _919 = fma(_907, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _921 = -_899;
    float _923 = _921 + 1.0;
    float _925 = _899 * _911;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _935 = _839 * _923;
    float _937 = -_839;
    float _939 = _937 + 1.0;
    float _941 = fma(_929, _887, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _943 = fma(_933, _887, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _945 = _917 * _935;
    float _947 = _919 * _935;
    float _949 = _885 * _935;
    float _951 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _955 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _959 = fma(_915, _887, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _961 = fma(_941, _925, _953);
    float _963 = _827 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _951 + _965;
    float _969 = _871 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _971 = -_179;
    int _973 = _845 ? as_type<int>(_971) : as_type<int>(_179);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _977 = _963 + _975;
    float _979 = _967 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _969 + _981;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _987 = -_183;
    int _989 = _849 ? as_type<int>(_987) : as_type<int>(_183);
    float _991 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[28].x, _979);
    float _993 = fma(_943, _925, _955);
    bool _995 = !_819;
    float _997 = _995 ? _179 : as_type<float>(_973);
    float _999 = fma(_959, _925, _957);
    float _1001 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _991);
    bool _1003 = !_823;
    float _1005 = _1003 ? _183 : as_type<float>(_989);
    float _1007 = _967 * _967;
    float _1009 = _997 + 0.5;
    float _1011 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].x, _961);
    bool _1013 = _1001 >= 0.0;
    float _1015 = -_1005;
    float _1017 = _1015 + 0.5;
    float _1019 = fma(_977, _977, _1007);
    float _1021 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1023 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].y, _993);
    float _1025 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1027 = fma(_983, _983, _1019);
    float _1029 = _1021 * _985;
    float _1031 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].z, _999);
    float _1033 = _1025 * _805;
    float _1035 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1037 = rsqrt(_1027);
    float _1039 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1041 = _1011;
    int _1043 = as_type<int>(_1039);
    if (_1013)
    {
        _1041 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1045 = _1041;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1013)
    {
        float _1055 = _1045 * 5.0;
        _1043 = as_type<int>(_1055);
    }
    int _1057 = _1043;
    out.m_48.x = _1029;
    out.m_48.y = _1033;
    out.m_50.x = _1051;
    out.m_50.y = _1049;
    out.m_50.z = _1053;
    float _1059 = _967 * _1037;
    float _1061 = as_type<float>(_1057);
    if (_1013)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_1057);
        out.gl_Position.z = _3321;
    }
    float _1063 = _977 * _1037;
    if (_1013)
    {
        out.m_35.x = 0.0;
    }
    if (_1013)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1065 = -_1059;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1069 = _983 * _1037;
    float _1071 = -_1063;
    float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1075 = -_1059;
    float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1081 = _1067 + _1079;
    float _1083 = -_1069;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1089 = _1073 + _1087;
    float _1091 = -_1063;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1085 + _1097;
    float _1101 = _1077 * _1077;
    float _1103 = -_1069;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1107 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1095);
    float _1109 = fma(_1093, _1093, _1101);
    float _1111 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1107);
    float _1113 = fma(_1105, _1105, _1109);
    bool _1115 = _1111 >= 0.0;
    float _1117 = sqrt(_1113);
    if (_1115)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1119 = _1061;
    int _1121 = as_type<int>(_1119);
    if (_1115)
    {
        out.m_35.x = 0.0;
    }
    float _1123 = _1037 * _1117;
    if (_1115)
    {
        float _1125 = _1119 * 5.0;
        _1121 = as_type<int>(_1125);
    }
    int _1127 = _1121;
    if (_1115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3455 = as_type<float>(_1127);
        out.gl_Position.z = _3455;
    }
    if (_1115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1129 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1131 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1137 = _1123 * _1129;
    float _1139 = _1123 * _1131;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1143 = _1141 * 0.5;
    float _1145 = _1133 * _1137;
    float _1147 = _1135 * _1139;
    float _1149 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1153 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1149);
    float _1155 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1151);
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1153);
    float _1159 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1155);
    float _1161 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1163 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1165 = _963 + _1161;
    float _1167 = _969 + _1163;
    float _1169 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1173 = _1165 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1177 = _1167 + _1175;
    float _1179 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1169);
    float _1181 = _1173 * _1173;
    float _1183 = _1177 * _1177;
    float _1185 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1179);
    float _1187 = _1181 + _1183;
    float _1189 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = sqrt(_1187);
    float _1193 = _951 + _1189;
    bool _1195 = _1191 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1197 = _1143;
    float _1199 = _1189;
    float _1201 = _1145;
    float _1203 = _1169;
    float _1205 = _1183;
    if (!_1195)
    {
        _1197 = _1181;
    }
    float _1207 = _1197;
    float _1209 = _1207;
    if (!_1195)
    {
        _1199 = _1165;
    }
    float _1211 = _1199;
    float _1213 = _1211;
    if (!_1195)
    {
        _1201 = _1167;
    }
    float _1215 = _1201;
    float _1217 = _1215;
    if (!_1195)
    {
        _1203 = _1193;
    }
    float _1219 = _1203;
    bool _1221 = !_1195;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1191 + _1227;
        float _1231 = rsqrt(_1187);
        float _1233 = _1229 * _1225;
        float _1235 = _1193 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = fma(_1241, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1249 = _1231 * _1247;
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1173, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1255 = fma(_1177, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1257 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1261 = _1253 + _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1265 = _1255 + _1263;
        float _1267 = fma(_1193, _1245, _1257);
        float _1269 = _1261 * _1261;
        float _1271 = _1265 * _1265;
        _1223 = _1267;
        _1209 = _1269;
        _1205 = _1271;
        _1213 = _1253;
        _1217 = _1255;
    }
    float _1273 = _1223;
    float _1275 = _1209;
    float _1277 = _1205;
    float _1279 = _1213;
    float _1281 = _1217;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1285 = _1273 + _1283;
    float _1287 = fma(_1285, _1285, _1275);
    float _1289 = _1287 + _1277;
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1295 = isnan(_1291);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1275;
    if (!_1301)
    {
        _1303 = 1.0;
    }
    float _1305 = _1303;
    bool _1307 = !_1301;
    float _1309 = _1305;
    if (!_1307)
    {
        bool _1311 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1313 = isnan(_1291);
        bool _1315 = _1311 || _1313;
        bool _1317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1319 = _1315 || _1317;
        if (!_1319)
        {
            float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1323 = _1291 + _1321;
            float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1327 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1325;
            float _1329 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1331 = _1329 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1333 = 1.0 / _1327;
            float _1335 = _1323 * _1333;
            float _1337 = fma(_1335, _1331, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1309 = _1337;
            _1339 = true;
        }
        else
        {
            bool _1341 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1343 = isnan(_1291);
            bool _1345 = _1341 || _1343;
            bool _1347 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1349 = _1345 || _1347;
            if (!_1349)
            {
                float _1351 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1353 = _1291 + _1351;
                float _1355 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1357 = _1355 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1359 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1361 = _1359 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1363 = 1.0 / _1357;
                float _1365 = _1353 * _1363;
                float _1367 = fma(_1365, _1361, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1309 = _1367;
                _1339 = true;
            }
            else
            {
                _1309 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1339 = false;
    float _1369 = _1309;
    float _1371 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1373 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1375 = _1279 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1273 + _1377;
    float _1381 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1371);
    float _1383 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1385 = fma(_1375, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1381);
    float _1399 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1383);
    float _1401 = fma(_1379, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1405 = _1281 + _1403;
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1409 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1399);
    float _1411 = -_1063;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1415 = 1.0 / _1407;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1419 = fma(_1405, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1421 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.5);
    bool _1429 = _1425 || _1427;
    float _1431 = -_1059;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1401);
    float _1435 = _1417 + _1407;
    float _1437 = -_1069;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1419);
    float _1441 = _1417;
    float _1443 = _1433;
    float _1445 = _1439;
    if (_1395)
    {
        _1441 = _1413;
    }
    float _1447 = _1441;
    float _1449 = _1447;
    if (!_1395)
    {
        float _1451 = _1081 * _1081;
        float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1455 = -_969;
        float _1457 = _1455 + _1419;
        float _1459 = -_963;
        float _1461 = _1459 + _1385;
        float _1463 = fma(_1089, _1089, _1451);
        float _1465 = -_951;
        float _1467 = _1465 + _1401;
        float _1469 = fma(_1099, _1099, _1463);
        float _1471 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1473 = sqrt(_1469);
        float _1475 = 1.0 / _1123;
        float _1477 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1479 = precise::min(_1473, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1481 = _1479 * _1453;
        float _1483 = _1481 * _1475;
        float _1485 = _1477 * _1483;
        float _1487 = _1457 * _1483;
        float _1489 = fma(_1467, _1485, _1067);
        float _1491 = fma(_1461, _1485, _1073);
        float _1493 = fma(_1477, _1487, _1085);
        _1443 = _1489;
        _1449 = _1491;
        _1445 = _1493;
    }
    float _1495 = _1443;
    float _1497 = _1449;
    float _1499 = _1445;
    float _1501 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1503 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1505 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1507 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1501);
    float _1511 = _1435 * _1415;
    float _1513 = _1511 * 0.5;
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1517 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1505);
    float _1519 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1507);
    float _1521 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1509);
    float _1523 = _1509;
    if (_1429)
    {
        _1523 = 1.0;
    }
    float _1525 = _1523;
    float _1527 = _1525;
    if (!_1429)
    {
        float _1529 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1533 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1531);
        float _1535 = _1529 * 0.15915493667125701904296875;
        float _1537 = _1535 * 6.283185482025146484375;
        float _1539 = cos(_1537);
        float _1541 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1543 = _1541 * 0.15915493667125701904296875;
        float _1545 = _1535 * 6.283185482025146484375;
        float _1547 = sin(_1545);
        float _1549 = 1.0 / _1539;
        float _1551 = _1543 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = _1547 * _1549;
        float _1557 = 1.0 / _1533;
        float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1559;
        float _1563 = _1553 * _1555;
        float _1565 = _1543 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = 1.0 / _1563;
        float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1573 = _1557 * _1571;
        float _1575 = 1.0 / _1561;
        float _1577 = _1567 * _1569;
        float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1581 = fma(_1577, _1573, _1579);
        float _1583 = _1581 * _1575;
        float _1585 = precise::clamp(_1583, 0.0, 1.0);
        _1527 = _1585;
    }
    float _1587 = _1527;
    float _1589 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1591 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1517);
    float _1595 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1519);
    float _1597 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1599 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1605 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1607 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1609 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1599);
    float _1611 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1601);
    float _1613 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1603);
    float _1615 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1605);
    float _1617 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1609);
    float _1621 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1611);
    float _1623 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1613);
    float _1625 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1615);
    bool _1627 = _1587 > 0.0;
    bool _1629 = isnan(_1587);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = _1587 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1639 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1619);
    float _1641 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1621);
    float _1643 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1645 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1623);
    float _1647 = _1637 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1649 = _1639 + _1643;
    float _1651 = _1645 + _1643;
    float _1653 = _1643 * 0.5;
    float _1655 = _1649 * 0.5;
    float _1657 = _1651 * 0.5;
    float _1659 = fma(_1641, -0.5, _1653);
    out.m_35.x = _1647;
    out.gl_Position.x = _1639;
    out.gl_Position.y = _1641;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1643;
    out.m_52.x = _1655;
    out.m_52.y = _1659;
    out.m_52.z = _1657;
    out.m_52.w = _1643;
    if (_1635)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1661 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1661;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1339 = false;
    bool _789 = false;
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
        float _1718 = as_type<float>(_87);
        out.gl_Position.z = _1718;
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
        float _1787 = as_type<float>(_123);
        out.gl_Position.z = _1787;
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
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _617 + _619;
    float _623 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_617);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _651 = isnan(_617);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _627;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    bool _671 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_617);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = 1.0 / _631;
    float _689 = 1.0 / _647;
    float _691 = _665 * _661;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _659 * _669;
    float _699 = -_659;
    float _701 = _699 + 1.0;
    float _703 = fma(_691, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _705;
    float _709 = _681 * _701;
    float _711 = _695 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _715 = _617 + _713;
    bool _717 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _719 = isnan(_617);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = _703 * _709;
    float _731 = -_681;
    float _733 = _731 + 1.0;
    float _735 = fma(_711, _715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = _617 + _737;
    float _741 = _707 * _689;
    float _743 = -_727;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _729);
    float _749 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _751 = fma(_741, _739, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _753 = _643 * _745;
    float _755 = fma(_735, _697, _747);
    float _757 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_751, _753, _755);
    float _763 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[118].x, _761);
    float _765 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _757;
    out.m_46.y = _765;
    out.m_46.z = _759;
    out.m_46.w = _767;
    bool _769 = !_685;
    float _787;
    if (!_769)
    {
        float _771 = in.m_44.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _787 = _785;
        _789 = true;
    }
    else
    {
        float _791 = float(_71);
        float _793 = 1.0 / _791;
        float _795 = _105 * _793;
        _787 = _795;
    }
    _789 = false;
    float _797 = _787;
    float _799 = in.m_44.x;
    float _801 = in.m_44.y;
    float _803 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _815 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _803);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _823 = _821 != 0;
    float _825 = 1.0 / _809;
    float _827 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _815);
    bool _829 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _831 = isnan(_797);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _843 = _797 + _841;
    bool _845 = _799 > 0.5;
    float _847 = 1.0 / _813;
    bool _849 = _801 > 0.5;
    float _851 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _853 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _851);
    float _857 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _797 + _863;
    float _867 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _855);
    float _869 = _843 * _825;
    float _871 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    bool _873 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _875 = isnan(_797);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_861, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _887 = _865 * _847;
    bool _889 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _891 = isnan(_797);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _901;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _905;
    float _909 = -_883;
    float _911 = _909 + 1.0;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_903, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _919 = fma(_907, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _921 = -_899;
    float _923 = _921 + 1.0;
    float _925 = _899 * _911;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _935 = _839 * _923;
    float _937 = -_839;
    float _939 = _937 + 1.0;
    float _941 = fma(_929, _887, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _943 = fma(_933, _887, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _945 = _917 * _935;
    float _947 = _919 * _935;
    float _949 = _885 * _935;
    float _951 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _955 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _959 = fma(_915, _887, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _961 = fma(_941, _925, _953);
    float _963 = _827 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _951 + _965;
    float _969 = _871 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _971 = -_179;
    int _973 = _845 ? as_type<int>(_971) : as_type<int>(_179);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _977 = _963 + _975;
    float _979 = _967 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _969 + _981;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _987 = -_183;
    int _989 = _849 ? as_type<int>(_987) : as_type<int>(_183);
    float _991 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[28].x, _979);
    float _993 = fma(_943, _925, _955);
    bool _995 = !_819;
    float _997 = _995 ? _179 : as_type<float>(_973);
    float _999 = fma(_959, _925, _957);
    float _1001 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _991);
    bool _1003 = !_823;
    float _1005 = _1003 ? _183 : as_type<float>(_989);
    float _1007 = _967 * _967;
    float _1009 = _997 + 0.5;
    float _1011 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].x, _961);
    bool _1013 = _1001 >= 0.0;
    float _1015 = -_1005;
    float _1017 = _1015 + 0.5;
    float _1019 = fma(_977, _977, _1007);
    float _1021 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1023 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].y, _993);
    float _1025 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1027 = fma(_983, _983, _1019);
    float _1029 = _1021 * _985;
    float _1031 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].z, _999);
    float _1033 = _1025 * _805;
    float _1035 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1037 = rsqrt(_1027);
    float _1039 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1041 = _1011;
    int _1043 = as_type<int>(_1039);
    if (_1013)
    {
        _1041 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1045 = _1041;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1013)
    {
        float _1055 = _1045 * 5.0;
        _1043 = as_type<int>(_1055);
    }
    int _1057 = _1043;
    out.m_48.x = _1029;
    out.m_48.y = _1033;
    out.m_50.x = _1051;
    out.m_50.y = _1049;
    out.m_50.z = _1053;
    float _1059 = _967 * _1037;
    float _1061 = as_type<float>(_1057);
    if (_1013)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_1057);
        out.gl_Position.z = _3321;
    }
    float _1063 = _977 * _1037;
    if (_1013)
    {
        out.m_35.x = 0.0;
    }
    if (_1013)
    {
        return out;
    }
    float _1065 = -_1059;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1069 = _983 * _1037;
    float _1071 = -_1063;
    float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1075 = -_1059;
    float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1081 = _1067 + _1079;
    float _1083 = -_1069;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1089 = _1073 + _1087;
    float _1091 = -_1063;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1085 + _1097;
    float _1101 = _1077 * _1077;
    float _1103 = -_1069;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1107 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1095);
    float _1109 = fma(_1093, _1093, _1101);
    float _1111 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1107);
    float _1113 = fma(_1105, _1105, _1109);
    bool _1115 = _1111 >= 0.0;
    float _1117 = sqrt(_1113);
    if (_1115)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1119 = _1061;
    int _1121 = as_type<int>(_1119);
    if (_1115)
    {
        out.m_35.x = 0.0;
    }
    float _1123 = _1037 * _1117;
    if (_1115)
    {
        float _1125 = _1119 * 5.0;
        _1121 = as_type<int>(_1125);
    }
    int _1127 = _1121;
    if (_1115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3455 = as_type<float>(_1127);
        out.gl_Position.z = _3455;
    }
    if (_1115)
    {
        return out;
    }
    float _1129 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1131 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1137 = _1123 * _1129;
    float _1139 = _1123 * _1131;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1143 = _1141 * 0.5;
    float _1145 = _1133 * _1137;
    float _1147 = _1135 * _1139;
    float _1149 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1153 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1149);
    float _1155 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1151);
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1153);
    float _1159 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1155);
    float _1161 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1163 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1165 = _963 + _1161;
    float _1167 = _969 + _1163;
    float _1169 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1173 = _1165 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1177 = _1167 + _1175;
    float _1179 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1169);
    float _1181 = _1173 * _1173;
    float _1183 = _1177 * _1177;
    float _1185 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1179);
    float _1187 = _1181 + _1183;
    float _1189 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = sqrt(_1187);
    float _1193 = _951 + _1189;
    bool _1195 = _1191 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1197 = _1143;
    float _1199 = _1189;
    float _1201 = _1145;
    float _1203 = _1169;
    float _1205 = _1183;
    if (!_1195)
    {
        _1197 = _1181;
    }
    float _1207 = _1197;
    float _1209 = _1207;
    if (!_1195)
    {
        _1199 = _1165;
    }
    float _1211 = _1199;
    float _1213 = _1211;
    if (!_1195)
    {
        _1201 = _1167;
    }
    float _1215 = _1201;
    float _1217 = _1215;
    if (!_1195)
    {
        _1203 = _1193;
    }
    float _1219 = _1203;
    bool _1221 = !_1195;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1191 + _1227;
        float _1231 = rsqrt(_1187);
        float _1233 = _1229 * _1225;
        float _1235 = _1193 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = fma(_1241, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1249 = _1231 * _1247;
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1173, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1255 = fma(_1177, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1257 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1261 = _1253 + _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1265 = _1255 + _1263;
        float _1267 = fma(_1193, _1245, _1257);
        float _1269 = _1261 * _1261;
        float _1271 = _1265 * _1265;
        _1223 = _1267;
        _1209 = _1269;
        _1205 = _1271;
        _1213 = _1253;
        _1217 = _1255;
    }
    float _1273 = _1223;
    float _1275 = _1209;
    float _1277 = _1205;
    float _1279 = _1213;
    float _1281 = _1217;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1285 = _1273 + _1283;
    float _1287 = fma(_1285, _1285, _1275);
    float _1289 = _1287 + _1277;
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1295 = isnan(_1291);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1275;
    if (!_1301)
    {
        _1303 = 1.0;
    }
    float _1305 = _1303;
    bool _1307 = !_1301;
    float _1309 = _1305;
    if (!_1307)
    {
        bool _1311 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1313 = isnan(_1291);
        bool _1315 = _1311 || _1313;
        bool _1317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1319 = _1315 || _1317;
        if (!_1319)
        {
            float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1323 = _1291 + _1321;
            float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1327 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1325;
            float _1329 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1331 = _1329 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1333 = 1.0 / _1327;
            float _1335 = _1323 * _1333;
            float _1337 = fma(_1335, _1331, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1309 = _1337;
            _1339 = true;
        }
        else
        {
            bool _1341 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1343 = isnan(_1291);
            bool _1345 = _1341 || _1343;
            bool _1347 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1349 = _1345 || _1347;
            if (!_1349)
            {
                float _1351 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1353 = _1291 + _1351;
                float _1355 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1357 = _1355 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1359 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1361 = _1359 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1363 = 1.0 / _1357;
                float _1365 = _1353 * _1363;
                float _1367 = fma(_1365, _1361, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1309 = _1367;
                _1339 = true;
            }
            else
            {
                _1309 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1339 = false;
    float _1369 = _1309;
    float _1371 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1373 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1375 = _1279 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1273 + _1377;
    float _1381 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1371);
    float _1383 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1385 = fma(_1375, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1381);
    float _1399 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1383);
    float _1401 = fma(_1379, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1405 = _1281 + _1403;
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1409 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1399);
    float _1411 = -_1063;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1415 = 1.0 / _1407;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1419 = fma(_1405, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1421 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.5);
    bool _1429 = _1425 || _1427;
    float _1431 = -_1059;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1401);
    float _1435 = _1417 + _1407;
    float _1437 = -_1069;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1419);
    float _1441 = _1417;
    float _1443 = _1433;
    float _1445 = _1439;
    if (_1395)
    {
        _1441 = _1413;
    }
    float _1447 = _1441;
    float _1449 = _1447;
    if (!_1395)
    {
        float _1451 = _1081 * _1081;
        float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1455 = -_969;
        float _1457 = _1455 + _1419;
        float _1459 = -_963;
        float _1461 = _1459 + _1385;
        float _1463 = fma(_1089, _1089, _1451);
        float _1465 = -_951;
        float _1467 = _1465 + _1401;
        float _1469 = fma(_1099, _1099, _1463);
        float _1471 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1473 = sqrt(_1469);
        float _1475 = 1.0 / _1123;
        float _1477 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1479 = precise::min(_1473, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1481 = _1479 * _1453;
        float _1483 = _1481 * _1475;
        float _1485 = _1477 * _1483;
        float _1487 = _1457 * _1483;
        float _1489 = fma(_1467, _1485, _1067);
        float _1491 = fma(_1461, _1485, _1073);
        float _1493 = fma(_1477, _1487, _1085);
        _1443 = _1489;
        _1449 = _1491;
        _1445 = _1493;
    }
    float _1495 = _1443;
    float _1497 = _1449;
    float _1499 = _1445;
    float _1501 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1503 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1505 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1507 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1501);
    float _1511 = _1435 * _1415;
    float _1513 = _1511 * 0.5;
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1517 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1505);
    float _1519 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1507);
    float _1521 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1509);
    float _1523 = _1509;
    if (_1429)
    {
        _1523 = 1.0;
    }
    float _1525 = _1523;
    float _1527 = _1525;
    if (!_1429)
    {
        float _1529 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1533 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1531);
        float _1535 = _1529 * 0.15915493667125701904296875;
        float _1537 = _1535 * 6.283185482025146484375;
        float _1539 = cos(_1537);
        float _1541 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1543 = _1541 * 0.15915493667125701904296875;
        float _1545 = _1535 * 6.283185482025146484375;
        float _1547 = sin(_1545);
        float _1549 = 1.0 / _1539;
        float _1551 = _1543 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = _1547 * _1549;
        float _1557 = 1.0 / _1533;
        float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1559;
        float _1563 = _1553 * _1555;
        float _1565 = _1543 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = 1.0 / _1563;
        float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1573 = _1557 * _1571;
        float _1575 = 1.0 / _1561;
        float _1577 = _1567 * _1569;
        float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1581 = fma(_1577, _1573, _1579);
        float _1583 = _1581 * _1575;
        float _1585 = precise::clamp(_1583, 0.0, 1.0);
        _1527 = _1585;
    }
    float _1587 = _1527;
    float _1589 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1591 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1517);
    float _1595 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1519);
    float _1597 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1599 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1605 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1607 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1609 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1599);
    float _1611 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1601);
    float _1613 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1603);
    float _1615 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1605);
    float _1617 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1609);
    float _1621 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1611);
    float _1623 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1613);
    float _1625 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1615);
    bool _1627 = _1587 > 0.0;
    bool _1629 = isnan(_1587);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = _1587 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1639 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1619);
    float _1641 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1621);
    float _1643 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1645 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1623);
    float _1647 = _1637 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1649 = _1639 + _1643;
    float _1651 = _1645 + _1643;
    float _1653 = _1643 * 0.5;
    float _1655 = _1649 * 0.5;
    float _1657 = _1651 * 0.5;
    float _1659 = fma(_1641, -0.5, _1653);
    out.m_35.x = _1647;
    out.gl_Position.x = _1639;
    out.gl_Position.y = _1641;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1643;
    out.m_52.x = _1655;
    out.m_52.y = _1659;
    out.m_52.z = _1657;
    out.m_52.w = _1643;
    if (_1635)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1661 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1661;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1339 = false;
    bool _789 = false;
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
        float _1718 = as_type<float>(_87);
        out.gl_Position.z = _1718;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1787 = as_type<float>(_123);
        out.gl_Position.z = _1787;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _617 + _619;
    float _623 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_617);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _651 = isnan(_617);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _627;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    bool _671 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_617);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = 1.0 / _631;
    float _689 = 1.0 / _647;
    float _691 = _665 * _661;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _659 * _669;
    float _699 = -_659;
    float _701 = _699 + 1.0;
    float _703 = fma(_691, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _705;
    float _709 = _681 * _701;
    float _711 = _695 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _715 = _617 + _713;
    bool _717 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _719 = isnan(_617);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = _703 * _709;
    float _731 = -_681;
    float _733 = _731 + 1.0;
    float _735 = fma(_711, _715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = _617 + _737;
    float _741 = _707 * _689;
    float _743 = -_727;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _729);
    float _749 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _751 = fma(_741, _739, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _753 = _643 * _745;
    float _755 = fma(_735, _697, _747);
    float _757 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_751, _753, _755);
    float _763 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[118].x, _761);
    float _765 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _757;
    out.m_46.y = _765;
    out.m_46.z = _759;
    out.m_46.w = _767;
    bool _769 = !_685;
    float _787;
    if (!_769)
    {
        float _771 = in.m_44.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _787 = _785;
        _789 = true;
    }
    else
    {
        float _791 = float(_71);
        float _793 = 1.0 / _791;
        float _795 = _105 * _793;
        _787 = _795;
    }
    _789 = false;
    float _797 = _787;
    float _799 = in.m_44.x;
    float _801 = in.m_44.y;
    float _803 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _815 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _803);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _823 = _821 != 0;
    float _825 = 1.0 / _809;
    float _827 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _815);
    bool _829 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _831 = isnan(_797);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _843 = _797 + _841;
    bool _845 = _799 > 0.5;
    float _847 = 1.0 / _813;
    bool _849 = _801 > 0.5;
    float _851 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _853 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _851);
    float _857 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _797 + _863;
    float _867 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _855);
    float _869 = _843 * _825;
    float _871 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    bool _873 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _875 = isnan(_797);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_861, _869, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _887 = _865 * _847;
    bool _889 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _891 = isnan(_797);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _901;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _905;
    float _909 = -_883;
    float _911 = _909 + 1.0;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_903, _869, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _919 = fma(_907, _869, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _921 = -_899;
    float _923 = _921 + 1.0;
    float _925 = _899 * _911;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _935 = _839 * _923;
    float _937 = -_839;
    float _939 = _937 + 1.0;
    float _941 = fma(_929, _887, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _943 = fma(_933, _887, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _945 = _917 * _935;
    float _947 = _919 * _935;
    float _949 = _885 * _935;
    float _951 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _955 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _959 = fma(_915, _887, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _961 = fma(_941, _925, _953);
    float _963 = _827 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _951 + _965;
    float _969 = _871 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _971 = -_179;
    int _973 = _845 ? as_type<int>(_971) : as_type<int>(_179);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _977 = _963 + _975;
    float _979 = _967 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _969 + _981;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _987 = -_183;
    int _989 = _849 ? as_type<int>(_987) : as_type<int>(_183);
    float _991 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[28].x, _979);
    float _993 = fma(_943, _925, _955);
    bool _995 = !_819;
    float _997 = _995 ? _179 : as_type<float>(_973);
    float _999 = fma(_959, _925, _957);
    float _1001 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _991);
    bool _1003 = !_823;
    float _1005 = _1003 ? _183 : as_type<float>(_989);
    float _1007 = _967 * _967;
    float _1009 = _997 + 0.5;
    float _1011 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].x, _961);
    bool _1013 = _1001 >= 0.0;
    float _1015 = -_1005;
    float _1017 = _1015 + 0.5;
    float _1019 = fma(_977, _977, _1007);
    float _1021 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1023 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].y, _993);
    float _1025 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1027 = fma(_983, _983, _1019);
    float _1029 = _1021 * _985;
    float _1031 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[125].z, _999);
    float _1033 = _1025 * _805;
    float _1035 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1037 = rsqrt(_1027);
    float _1039 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1041 = _1011;
    int _1043 = as_type<int>(_1039);
    if (_1013)
    {
        _1041 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1045 = _1041;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1013)
    {
        float _1055 = _1045 * 5.0;
        _1043 = as_type<int>(_1055);
    }
    int _1057 = _1043;
    out.m_48.x = _1029;
    out.m_48.y = _1033;
    out.m_50.x = _1051;
    out.m_50.y = _1049;
    out.m_50.z = _1053;
    float _1059 = _967 * _1037;
    float _1061 = as_type<float>(_1057);
    if (_1013)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_1057);
        out.gl_Position.z = _3321;
    }
    float _1063 = _977 * _1037;
    if (_1013)
    {
        out.m_35.x = 0.0;
    }
    if (_1013)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1065 = -_1059;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1069 = _983 * _1037;
    float _1071 = -_1063;
    float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1075 = -_1059;
    float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1081 = _1067 + _1079;
    float _1083 = -_1069;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1089 = _1073 + _1087;
    float _1091 = -_1063;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1085 + _1097;
    float _1101 = _1077 * _1077;
    float _1103 = -_1069;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1107 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1095);
    float _1109 = fma(_1093, _1093, _1101);
    float _1111 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1107);
    float _1113 = fma(_1105, _1105, _1109);
    bool _1115 = _1111 >= 0.0;
    float _1117 = sqrt(_1113);
    if (_1115)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1119 = _1061;
    int _1121 = as_type<int>(_1119);
    if (_1115)
    {
        out.m_35.x = 0.0;
    }
    float _1123 = _1037 * _1117;
    if (_1115)
    {
        float _1125 = _1119 * 5.0;
        _1121 = as_type<int>(_1125);
    }
    int _1127 = _1121;
    if (_1115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3455 = as_type<float>(_1127);
        out.gl_Position.z = _3455;
    }
    if (_1115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1129 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1131 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1137 = _1123 * _1129;
    float _1139 = _1123 * _1131;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1143 = _1141 * 0.5;
    float _1145 = _1133 * _1137;
    float _1147 = _1135 * _1139;
    float _1149 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1153 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1149);
    float _1155 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1151);
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1153);
    float _1159 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1155);
    float _1161 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1163 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1165 = _963 + _1161;
    float _1167 = _969 + _1163;
    float _1169 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1173 = _1165 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1177 = _1167 + _1175;
    float _1179 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1169);
    float _1181 = _1173 * _1173;
    float _1183 = _1177 * _1177;
    float _1185 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1179);
    float _1187 = _1181 + _1183;
    float _1189 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = sqrt(_1187);
    float _1193 = _951 + _1189;
    bool _1195 = _1191 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1197 = _1143;
    float _1199 = _1189;
    float _1201 = _1145;
    float _1203 = _1169;
    float _1205 = _1183;
    if (!_1195)
    {
        _1197 = _1181;
    }
    float _1207 = _1197;
    float _1209 = _1207;
    if (!_1195)
    {
        _1199 = _1165;
    }
    float _1211 = _1199;
    float _1213 = _1211;
    if (!_1195)
    {
        _1201 = _1167;
    }
    float _1215 = _1201;
    float _1217 = _1215;
    if (!_1195)
    {
        _1203 = _1193;
    }
    float _1219 = _1203;
    bool _1221 = !_1195;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1191 + _1227;
        float _1231 = rsqrt(_1187);
        float _1233 = _1229 * _1225;
        float _1235 = _1193 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = fma(_1241, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1249 = _1231 * _1247;
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1173, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1255 = fma(_1177, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1257 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1261 = _1253 + _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1265 = _1255 + _1263;
        float _1267 = fma(_1193, _1245, _1257);
        float _1269 = _1261 * _1261;
        float _1271 = _1265 * _1265;
        _1223 = _1267;
        _1209 = _1269;
        _1205 = _1271;
        _1213 = _1253;
        _1217 = _1255;
    }
    float _1273 = _1223;
    float _1275 = _1209;
    float _1277 = _1205;
    float _1279 = _1213;
    float _1281 = _1217;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1285 = _1273 + _1283;
    float _1287 = fma(_1285, _1285, _1275);
    float _1289 = _1287 + _1277;
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1295 = isnan(_1291);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1275;
    if (!_1301)
    {
        _1303 = 1.0;
    }
    float _1305 = _1303;
    bool _1307 = !_1301;
    float _1309 = _1305;
    if (!_1307)
    {
        bool _1311 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1313 = isnan(_1291);
        bool _1315 = _1311 || _1313;
        bool _1317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1319 = _1315 || _1317;
        if (!_1319)
        {
            float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1323 = _1291 + _1321;
            float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1327 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1325;
            float _1329 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1331 = _1329 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1333 = 1.0 / _1327;
            float _1335 = _1323 * _1333;
            float _1337 = fma(_1335, _1331, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1309 = _1337;
            _1339 = true;
        }
        else
        {
            bool _1341 = _1291 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1343 = isnan(_1291);
            bool _1345 = _1341 || _1343;
            bool _1347 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1349 = _1345 || _1347;
            if (!_1349)
            {
                float _1351 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1353 = _1291 + _1351;
                float _1355 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1357 = _1355 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1359 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1361 = _1359 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1363 = 1.0 / _1357;
                float _1365 = _1353 * _1363;
                float _1367 = fma(_1365, _1361, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1309 = _1367;
                _1339 = true;
            }
            else
            {
                _1309 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1339 = false;
    float _1369 = _1309;
    float _1371 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1373 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1375 = _1279 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1273 + _1377;
    float _1381 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1371);
    float _1383 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1385 = fma(_1375, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1381);
    float _1399 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1383);
    float _1401 = fma(_1379, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1405 = _1281 + _1403;
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1409 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1399);
    float _1411 = -_1063;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1415 = 1.0 / _1407;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1419 = fma(_1405, _1369, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1421 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.5);
    bool _1429 = _1425 || _1427;
    float _1431 = -_1059;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1401);
    float _1435 = _1417 + _1407;
    float _1437 = -_1069;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1419);
    float _1441 = _1417;
    float _1443 = _1433;
    float _1445 = _1439;
    if (_1395)
    {
        _1441 = _1413;
    }
    float _1447 = _1441;
    float _1449 = _1447;
    if (!_1395)
    {
        float _1451 = _1081 * _1081;
        float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1455 = -_969;
        float _1457 = _1455 + _1419;
        float _1459 = -_963;
        float _1461 = _1459 + _1385;
        float _1463 = fma(_1089, _1089, _1451);
        float _1465 = -_951;
        float _1467 = _1465 + _1401;
        float _1469 = fma(_1099, _1099, _1463);
        float _1471 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1473 = sqrt(_1469);
        float _1475 = 1.0 / _1123;
        float _1477 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1479 = precise::min(_1473, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1481 = _1479 * _1453;
        float _1483 = _1481 * _1475;
        float _1485 = _1477 * _1483;
        float _1487 = _1457 * _1483;
        float _1489 = fma(_1467, _1485, _1067);
        float _1491 = fma(_1461, _1485, _1073);
        float _1493 = fma(_1477, _1487, _1085);
        _1443 = _1489;
        _1449 = _1491;
        _1445 = _1493;
    }
    float _1495 = _1443;
    float _1497 = _1449;
    float _1499 = _1445;
    float _1501 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1503 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1505 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1507 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1501);
    float _1511 = _1435 * _1415;
    float _1513 = _1511 * 0.5;
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1517 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1505);
    float _1519 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1507);
    float _1521 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1509);
    float _1523 = _1509;
    if (_1429)
    {
        _1523 = 1.0;
    }
    float _1525 = _1523;
    float _1527 = _1525;
    if (!_1429)
    {
        float _1529 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1533 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1531);
        float _1535 = _1529 * 0.15915493667125701904296875;
        float _1537 = _1535 * 6.283185482025146484375;
        float _1539 = cos(_1537);
        float _1541 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1543 = _1541 * 0.15915493667125701904296875;
        float _1545 = _1535 * 6.283185482025146484375;
        float _1547 = sin(_1545);
        float _1549 = 1.0 / _1539;
        float _1551 = _1543 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = _1547 * _1549;
        float _1557 = 1.0 / _1533;
        float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1559;
        float _1563 = _1553 * _1555;
        float _1565 = _1543 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = 1.0 / _1563;
        float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1573 = _1557 * _1571;
        float _1575 = 1.0 / _1561;
        float _1577 = _1567 * _1569;
        float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1581 = fma(_1577, _1573, _1579);
        float _1583 = _1581 * _1575;
        float _1585 = precise::clamp(_1583, 0.0, 1.0);
        _1527 = _1585;
    }
    float _1587 = _1527;
    float _1589 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1591 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1517);
    float _1595 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1519);
    float _1597 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1599 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1605 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1607 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1609 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1599);
    float _1611 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1601);
    float _1613 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1603);
    float _1615 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1605);
    float _1617 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1609);
    float _1621 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1611);
    float _1623 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1613);
    float _1625 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1615);
    bool _1627 = _1587 > 0.0;
    bool _1629 = isnan(_1587);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = _1587 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1639 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1619);
    float _1641 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1621);
    float _1643 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1645 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1623);
    float _1647 = _1637 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1649 = _1639 + _1643;
    float _1651 = _1645 + _1643;
    float _1653 = _1643 * 0.5;
    float _1655 = _1649 * 0.5;
    float _1657 = _1651 * 0.5;
    float _1659 = fma(_1641, -0.5, _1653);
    out.m_35.x = _1647;
    out.gl_Position.x = _1639;
    out.gl_Position.y = _1641;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1643;
    out.m_52.x = _1655;
    out.m_52.y = _1659;
    out.m_52.z = _1657;
    out.m_52.w = _1643;
    if (_1635)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1661 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1661;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

