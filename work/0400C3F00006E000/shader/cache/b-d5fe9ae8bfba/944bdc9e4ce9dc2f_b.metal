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
    bool _1415 = false;
    bool _903 = false;
    bool _735 = false;
    bool _555 = false;
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
        float _1790 = as_type<float>(_87);
        out.gl_Position.z = _1790;
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
        float _1859 = as_type<float>(_123);
        out.gl_Position.z = _1859;
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
    bool _455 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _457 = isnan(_449);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _467;
    bool _471 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_449);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -_465;
    float _485 = _483 + 1.0;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    float _491 = 1.0 / _469;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _495 = _481 * _485;
    float _497 = -_481;
    float _499 = _497 + 1.0;
    float _501 = _453 * _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _503;
    float _507 = fma(_489, _501, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _509;
    float _513 = fma(_505, _501, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _515 = fma(_511, _501, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _517 = _507 * _495;
    float _519 = _513 * _495;
    float _521 = _515 * _495;
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].x, _517);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].y, _521);
    float _527 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].z, _519);
    float _529 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].x, _523);
    float _531 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].y, _525);
    float _533 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].z, _527);
    bool _535 = !_493;
    float _553;
    if (!_535)
    {
        float _537 = in.m_44.x;
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _541 = _537 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _545 = _543 * _539;
        float _547 = floor(_545);
        float _549 = -_547;
        float _551 = _545 + _549;
        _553 = _551;
        _555 = true;
    }
    else
    {
        float _557 = float(_71);
        float _559 = 1.0 / _557;
        float _561 = _105 * _559;
        _553 = _561;
    }
    _555 = false;
    float _563 = _553;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _563 + _565;
    float _569 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_563);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _597 = isnan(_563);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _573;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _609;
    float _613 = -_589;
    float _615 = _613 + 1.0;
    bool _617 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_563);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _633 = 1.0 / _577;
    float _635 = 1.0 / _593;
    float _637 = _611 * _607;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _643 = _605 * _615;
    float _645 = -_605;
    float _647 = _645 + 1.0;
    float _649 = fma(_637, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = _627 * _647;
    float _657 = _641 * _633;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _661 = _563 + _659;
    bool _663 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _665 = isnan(_563);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = _649 * _655;
    float _677 = -_627;
    float _679 = _677 + 1.0;
    float _681 = fma(_657, _661, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _685 = _563 + _683;
    float _687 = _653 * _635;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _695 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _697 = fma(_687, _685, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _699 = _589 * _691;
    float _701 = fma(_681, _643, _693);
    float _703 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = fma(_697, _699, _701);
    float _709 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[118].x, _707);
    float _711 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _703;
    out.m_46.y = _711;
    out.m_46.z = _705;
    out.m_46.w = _713;
    bool _715 = !_631;
    float _733;
    if (!_715)
    {
        float _717 = in.m_44.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        float _737 = float(_71);
        float _739 = 1.0 / _737;
        float _741 = _105 * _739;
        _733 = _741;
    }
    _735 = false;
    float _743 = _733;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _747 = _743 + _745;
    bool _749 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _751 = isnan(_743);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _763 = _743 + _761;
    bool _765 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _767 = isnan(_743);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _785 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _787 = isnan(_743);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = 1.0 / _779;
    float _799 = -_795;
    float _801 = _799 + 1.0;
    bool _803 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _805 = _775 * _801;
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = 1.0 / _783;
    float _813 = _747 * _797;
    float _815 = -_759;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _819;
    float _823 = _795 * _817;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _829;
    float _833 = fma(_821, _813, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _835 = _763 * _811;
    float _837 = fma(_827, _813, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _839 = fma(_831, _813, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _841 = _833 * _805;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _847 = _837 * _805;
    float _849 = _839 * _805;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _859 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].x, _847);
    float _861 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _863 = fma(_853, _835, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _865 = fma(_845, _835, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _867 = fma(_857, _835, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _869 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].z, _849);
    float _871 = fma(_863, _823, _859);
    float _873 = fma(_865, _823, _861);
    float _875 = fma(_867, _823, _869);
    float _877 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].x, _871);
    float _879 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].y, _873);
    float _881 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].z, _875);
    bool _883 = !_803;
    float _901;
    if (!_883)
    {
        float _885 = in.m_44.x;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _889 = _885 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _893 = _891 * _887;
        float _895 = floor(_893);
        float _897 = -_895;
        float _899 = _893 + _897;
        _901 = _899;
        _903 = true;
    }
    else
    {
        float _905 = float(_71);
        float _907 = 1.0 / _905;
        float _909 = _105 * _907;
        _901 = _909;
    }
    _903 = false;
    float _911 = _901;
    float _913 = in.m_44.x;
    float _915 = in.m_44.y;
    float _917 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _923;
    float _927 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _929 = 1.0 / _921;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _937 = _935 != 0;
    float _939 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _917);
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _943 = _941 != 0;
    float _945 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _927);
    bool _947 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _949 = isnan(_911);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _963 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _965 = isnan(_911);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _977 = _925 * _929;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _981 = _911 + _979;
    bool _983 = _913 > 0.5;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _987 = _915 > 0.5;
    float _989 = fma(_977, _981, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _991 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = isnan(_911);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1009 = 1.0 / _933;
    float _1011 = -_1001;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1003);
    float _1017 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _939);
    float _1019 = -_179;
    int _1021 = _983 ? as_type<int>(_1019) : as_type<int>(_179);
    float _1023 = _973 * _1013;
    float _1025 = -_973;
    float _1027 = _1025 + 1.0;
    float _1029 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1015);
    float _1031 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1033 = -_957;
    float _1035 = _1033 + 1.0;
    float _1037 = _989 * _1023;
    float _1039 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _945);
    float _1041 = -_183;
    int _1043 = _987 ? as_type<int>(_1041) : as_type<int>(_183);
    float _1045 = _1001 * _1035;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1049 = _911 + _1047;
    float _1051 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1037);
    float _1053 = _1007 * _1009;
    float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1057 = _1031 + _1055;
    float _1059 = _1039 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1061 = !_937;
    float _1063 = _1061 ? _179 : as_type<float>(_1021);
    float _1065 = fma(_1053, _1049, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1067 = _1029 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1069 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1073 = _1059 + _1071;
    bool _1075 = !_943;
    float _1077 = _1075 ? _183 : as_type<float>(_1043);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1067 + _1079;
    float _1083 = _1063 + 0.5;
    float _1085 = fma(_1065, _1045, _1051);
    float _1087 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1069);
    float _1091 = _1057 * _1057;
    float _1093 = -_1077;
    float _1095 = _1093 + 0.5;
    float _1097 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1099 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1089);
    float _1101 = fma(_1081, _1081, _1091);
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1105 = _1097 * _961;
    float _1107 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1085);
    bool _1109 = _1099 >= 0.0;
    float _1111 = fma(_1073, _1073, _1101);
    float _1113 = _1103 * _985;
    float _1115 = _877 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1117 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1119 = rsqrt(_1111);
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _975 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = _1107 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_48.x = _1105;
    out.m_48.y = _1113;
    float _1129 = _1103;
    int _1131 = as_type<int>(_1115);
    if (_1109)
    {
        _1129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1133 = _1129;
    out.m_50.x = _1121;
    out.m_50.y = _1087;
    out.m_50.z = _1125;
    out.m_50.w = _1127;
    if (_1109)
    {
        float _1135 = _1133 * 5.0;
        _1131 = as_type<int>(_1135);
    }
    int _1137 = _1131;
    if (_1109)
    {
        out.m_35.x = 0.0;
    }
    float _1139 = _1123 * _1119;
    if (_1109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3512 = as_type<float>(_1137);
        out.gl_Position.z = _3512;
    }
    float _1141 = _1081 * _1139;
    float _1143 = _1057 * _1139;
    if (_1109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1145 = -_1143;
    float _1147 = _1031 + _1145;
    float _1149 = _1073 * _1139;
    float _1151 = -_1141;
    float _1153 = _1067 + _1151;
    float _1155 = -_1143;
    float _1157 = _1057 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1161 = _1147 + _1159;
    float _1163 = -_1149;
    float _1165 = _1059 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = _1153 + _1167;
    float _1171 = -_1141;
    float _1173 = _1081 + _1171;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1179 = _1165 + _1177;
    float _1181 = _1157 * _1157;
    float _1183 = -_1149;
    float _1185 = _1073 + _1183;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1175);
    float _1189 = fma(_1173, _1173, _1181);
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1187);
    float _1193 = fma(_1185, _1185, _1189);
    bool _1195 = _1191 >= 0.0;
    float _1197 = sqrt(_1193);
    float _1199 = _1175;
    if (_1195)
    {
        _1199 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1201 = _1199;
    int _1203 = as_type<int>(_1201);
    if (_1195)
    {
        out.m_35.x = 0.0;
    }
    float _1205 = _1119 * _1197;
    if (_1195)
    {
        float _1207 = _1201 * 5.0;
        _1203 = as_type<int>(_1207);
    }
    int _1209 = _1203;
    if (_1195)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3633 = as_type<float>(_1209);
        out.gl_Position.z = _3633;
    }
    if (_1195)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1211 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1213 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1217 = _975 * _1205;
    float _1219 = _1205 * _1211;
    float _1221 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = _1221 * 0.5;
    float _1225 = _1215 * _1217;
    float _1227 = _1213 * _1219;
    float _1229 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1231 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1235 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1229);
    float _1237 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1231);
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1233);
    float _1241 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1235);
    float _1243 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1237);
    float _1245 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1239);
    float _1247 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1251 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1253 = _1067 + _1247;
    float _1255 = _1059 + _1249;
    float _1257 = _1031 + _1251;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1261 = _1253 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1265 = _1255 + _1263;
    float _1267 = _1261 * _1261;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 + _1269;
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = _1225;
    float _1279 = _1251;
    float _1281 = _1223;
    float _1283 = _1269;
    float _1285 = _1253;
    if (!_1275)
    {
        _1277 = _1267;
    }
    float _1287 = _1277;
    float _1289 = _1287;
    if (!_1275)
    {
        _1279 = _1255;
    }
    float _1291 = _1279;
    float _1293 = _1291;
    if (!_1275)
    {
        _1281 = _1257;
    }
    float _1295 = _1281;
    bool _1297 = !_1275;
    float _1299 = _1295;
    if (!_1297)
    {
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1305 = _1273 + _1303;
        float _1307 = rsqrt(_1271);
        float _1309 = _1305 * _1301;
        float _1311 = _1257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = _1309 * 0.15915493667125701904296875;
        float _1315 = _1313 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1313 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = fma(_1317, _1311, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1325 = _1307 * _1323;
        float _1327 = _1321 + (-1.0);
        float _1329 = fma(_1261, _1325, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1331 = fma(_1265, _1325, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1333 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1337 = _1329 + _1335;
        float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1341 = _1331 + _1339;
        float _1343 = fma(_1257, _1321, _1333);
        float _1345 = _1337 * _1337;
        float _1347 = _1341 * _1341;
        _1299 = _1343;
        _1289 = _1345;
        _1283 = _1347;
        _1285 = _1329;
        _1293 = _1331;
    }
    float _1349 = _1299;
    float _1351 = _1289;
    float _1353 = _1283;
    float _1355 = _1285;
    float _1357 = _1293;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1361 = _1349 + _1359;
    float _1363 = fma(_1361, _1361, _1351);
    float _1365 = _1363 + _1353;
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1371 = isnan(_1367);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1377 = _1373 || _1375;
    float _1379 = _1351;
    if (!_1377)
    {
        _1379 = 1.0;
    }
    float _1381 = _1379;
    bool _1383 = !_1377;
    float _1385 = _1381;
    if (!_1383)
    {
        bool _1387 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1389 = isnan(_1367);
        bool _1391 = _1387 || _1389;
        bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1395 = _1391 || _1393;
        if (!_1395)
        {
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = _1367 + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1403 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1401;
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1409 = 1.0 / _1403;
            float _1411 = _1399 * _1409;
            float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1385 = _1413;
            _1415 = true;
        }
        else
        {
            bool _1417 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1419 = isnan(_1367);
            bool _1421 = _1417 || _1419;
            bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1425 = _1421 || _1423;
            if (!_1425)
            {
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1367 + _1427;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1437 = _1435 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1439 = 1.0 / _1433;
                float _1441 = _1429 * _1439;
                float _1443 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1385 = _1443;
                _1415 = true;
            }
            else
            {
                _1385 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1415 = false;
    float _1445 = _1385;
    float _1447 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1453 = _1355 + _1451;
    float _1455 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    bool _1457 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(0.5);
    bool _1465 = _1461 || _1463;
    float _1467 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1449);
    float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1471 = _1349 + _1469;
    float _1473 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1477 = _1357 + _1475;
    float _1479 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1467);
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1483 = fma(_1453, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1485 = fma(_1471, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1487 = fma(_1477, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = 1.0 / _1481;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1493 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.5);
    bool _1501 = _1497 || _1499;
    float _1503 = -_1141;
    float _1505 = _1503 + _1483;
    float _1507 = -_1143;
    float _1509 = _1507 + _1485;
    float _1511 = -_1149;
    float _1513 = _1511 + _1487;
    float _1515 = _1491 + _1481;
    float _1517 = _1509;
    float _1519 = _1505;
    float _1521 = _1513;
    if (!_1465)
    {
        float _1523 = _1161 * _1161;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1527 = -_1059;
        float _1529 = _1527 + _1487;
        float _1531 = -_1067;
        float _1533 = _1531 + _1483;
        float _1535 = fma(_1169, _1169, _1523);
        float _1537 = fma(_1179, _1179, _1535);
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1541 = sqrt(_1537);
        float _1543 = 1.0 / _1205;
        float _1545 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1547 = precise::min(_1541, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1549 = _1547 * _1525;
        float _1551 = _1549 * _1543;
        float _1553 = -_1031;
        float _1555 = _1553 + _1485;
        float _1557 = _1545 * _1551;
        float _1559 = _1529 * _1551;
        float _1561 = fma(_1533, _1557, _1153);
        float _1563 = fma(_1555, _1557, _1147);
        float _1565 = fma(_1545, _1559, _1165);
        _1517 = _1563;
        _1519 = _1561;
        _1521 = _1565;
    }
    float _1567 = _1517;
    float _1569 = _1519;
    float _1571 = _1521;
    float _1573 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1579 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1573);
    float _1583 = _1515 * _1489;
    float _1585 = _1583 * 0.5;
    float _1587 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1575);
    float _1589 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1593 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1595 = _1581;
    if (_1501)
    {
        _1595 = 1.0;
    }
    float _1597 = _1595;
    float _1599 = _1597;
    if (!_1501)
    {
        float _1601 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1605 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1603);
        float _1607 = _1601 * 0.15915493667125701904296875;
        float _1609 = _1607 * 6.283185482025146484375;
        float _1611 = cos(_1609);
        float _1613 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1615 = _1613 * 0.15915493667125701904296875;
        float _1617 = _1607 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        float _1621 = 1.0 / _1611;
        float _1623 = _1615 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1605;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1631;
        float _1635 = _1625 * _1627;
        float _1637 = _1615 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = 1.0 / _1635;
        float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1645 = _1629 * _1643;
        float _1647 = 1.0 / _1633;
        float _1649 = _1639 * _1641;
        float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1653 = fma(_1649, _1645, _1651);
        float _1655 = _1653 * _1647;
        float _1657 = precise::clamp(_1655, 0.0, 1.0);
        _1599 = _1657;
    }
    float _1659 = _1599;
    float _1661 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1587);
    float _1663 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1665 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1589);
    float _1667 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1591);
    float _1669 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1681 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1671);
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1673);
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1689 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1691 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1681);
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1683);
    float _1695 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1697 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    bool _1699 = _1659 > 0.0;
    bool _1701 = isnan(_1659);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(0.0);
    bool _1707 = _1703 || _1705;
    float _1709 = _1659 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1711 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1691);
    float _1713 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1715 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1717 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1721 = _1711 + _1715;
    float _1723 = _1717 + _1715;
    float _1725 = _1715 * 0.5;
    float _1727 = _1721 * 0.5;
    float _1729 = _1723 * 0.5;
    float _1731 = fma(_1713, -0.5, _1725);
    out.m_35.x = _1719;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1713;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1715;
    out.m_52.x = _1727;
    out.m_52.y = _1731;
    out.m_52.z = _1729;
    out.m_52.w = _1715;
    if (_1707)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1733 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1733;
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
    bool _1415 = false;
    bool _903 = false;
    bool _735 = false;
    bool _555 = false;
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
        float _1790 = as_type<float>(_87);
        out.gl_Position.z = _1790;
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
        float _1859 = as_type<float>(_123);
        out.gl_Position.z = _1859;
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
    bool _455 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _457 = isnan(_449);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _467;
    bool _471 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_449);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -_465;
    float _485 = _483 + 1.0;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    float _491 = 1.0 / _469;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _495 = _481 * _485;
    float _497 = -_481;
    float _499 = _497 + 1.0;
    float _501 = _453 * _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _503;
    float _507 = fma(_489, _501, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _509;
    float _513 = fma(_505, _501, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _515 = fma(_511, _501, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _517 = _507 * _495;
    float _519 = _513 * _495;
    float _521 = _515 * _495;
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].x, _517);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].y, _521);
    float _527 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].z, _519);
    float _529 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].x, _523);
    float _531 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].y, _525);
    float _533 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].z, _527);
    bool _535 = !_493;
    float _553;
    if (!_535)
    {
        float _537 = in.m_44.x;
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _541 = _537 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _545 = _543 * _539;
        float _547 = floor(_545);
        float _549 = -_547;
        float _551 = _545 + _549;
        _553 = _551;
        _555 = true;
    }
    else
    {
        float _557 = float(_71);
        float _559 = 1.0 / _557;
        float _561 = _105 * _559;
        _553 = _561;
    }
    _555 = false;
    float _563 = _553;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _563 + _565;
    float _569 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_563);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _597 = isnan(_563);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _573;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _609;
    float _613 = -_589;
    float _615 = _613 + 1.0;
    bool _617 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_563);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _633 = 1.0 / _577;
    float _635 = 1.0 / _593;
    float _637 = _611 * _607;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _643 = _605 * _615;
    float _645 = -_605;
    float _647 = _645 + 1.0;
    float _649 = fma(_637, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = _627 * _647;
    float _657 = _641 * _633;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _661 = _563 + _659;
    bool _663 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _665 = isnan(_563);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = _649 * _655;
    float _677 = -_627;
    float _679 = _677 + 1.0;
    float _681 = fma(_657, _661, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _685 = _563 + _683;
    float _687 = _653 * _635;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _695 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _697 = fma(_687, _685, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _699 = _589 * _691;
    float _701 = fma(_681, _643, _693);
    float _703 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = fma(_697, _699, _701);
    float _709 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[118].x, _707);
    float _711 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _703;
    out.m_46.y = _711;
    out.m_46.z = _705;
    out.m_46.w = _713;
    bool _715 = !_631;
    float _733;
    if (!_715)
    {
        float _717 = in.m_44.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        float _737 = float(_71);
        float _739 = 1.0 / _737;
        float _741 = _105 * _739;
        _733 = _741;
    }
    _735 = false;
    float _743 = _733;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _747 = _743 + _745;
    bool _749 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _751 = isnan(_743);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _763 = _743 + _761;
    bool _765 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _767 = isnan(_743);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _785 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _787 = isnan(_743);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = 1.0 / _779;
    float _799 = -_795;
    float _801 = _799 + 1.0;
    bool _803 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _805 = _775 * _801;
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = 1.0 / _783;
    float _813 = _747 * _797;
    float _815 = -_759;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _819;
    float _823 = _795 * _817;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _829;
    float _833 = fma(_821, _813, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _835 = _763 * _811;
    float _837 = fma(_827, _813, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _839 = fma(_831, _813, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _841 = _833 * _805;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _847 = _837 * _805;
    float _849 = _839 * _805;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _859 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].x, _847);
    float _861 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _863 = fma(_853, _835, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _865 = fma(_845, _835, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _867 = fma(_857, _835, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _869 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].z, _849);
    float _871 = fma(_863, _823, _859);
    float _873 = fma(_865, _823, _861);
    float _875 = fma(_867, _823, _869);
    float _877 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].x, _871);
    float _879 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].y, _873);
    float _881 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].z, _875);
    bool _883 = !_803;
    float _901;
    if (!_883)
    {
        float _885 = in.m_44.x;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _889 = _885 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _893 = _891 * _887;
        float _895 = floor(_893);
        float _897 = -_895;
        float _899 = _893 + _897;
        _901 = _899;
        _903 = true;
    }
    else
    {
        float _905 = float(_71);
        float _907 = 1.0 / _905;
        float _909 = _105 * _907;
        _901 = _909;
    }
    _903 = false;
    float _911 = _901;
    float _913 = in.m_44.x;
    float _915 = in.m_44.y;
    float _917 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _923;
    float _927 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _929 = 1.0 / _921;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _937 = _935 != 0;
    float _939 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _917);
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _943 = _941 != 0;
    float _945 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _927);
    bool _947 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _949 = isnan(_911);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _963 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _965 = isnan(_911);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _977 = _925 * _929;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _981 = _911 + _979;
    bool _983 = _913 > 0.5;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _987 = _915 > 0.5;
    float _989 = fma(_977, _981, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _991 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = isnan(_911);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1009 = 1.0 / _933;
    float _1011 = -_1001;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1003);
    float _1017 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _939);
    float _1019 = -_179;
    int _1021 = _983 ? as_type<int>(_1019) : as_type<int>(_179);
    float _1023 = _973 * _1013;
    float _1025 = -_973;
    float _1027 = _1025 + 1.0;
    float _1029 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1015);
    float _1031 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1033 = -_957;
    float _1035 = _1033 + 1.0;
    float _1037 = _989 * _1023;
    float _1039 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _945);
    float _1041 = -_183;
    int _1043 = _987 ? as_type<int>(_1041) : as_type<int>(_183);
    float _1045 = _1001 * _1035;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1049 = _911 + _1047;
    float _1051 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1037);
    float _1053 = _1007 * _1009;
    float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1057 = _1031 + _1055;
    float _1059 = _1039 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1061 = !_937;
    float _1063 = _1061 ? _179 : as_type<float>(_1021);
    float _1065 = fma(_1053, _1049, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1067 = _1029 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1069 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1073 = _1059 + _1071;
    bool _1075 = !_943;
    float _1077 = _1075 ? _183 : as_type<float>(_1043);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1067 + _1079;
    float _1083 = _1063 + 0.5;
    float _1085 = fma(_1065, _1045, _1051);
    float _1087 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1069);
    float _1091 = _1057 * _1057;
    float _1093 = -_1077;
    float _1095 = _1093 + 0.5;
    float _1097 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1099 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1089);
    float _1101 = fma(_1081, _1081, _1091);
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1105 = _1097 * _961;
    float _1107 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1085);
    bool _1109 = _1099 >= 0.0;
    float _1111 = fma(_1073, _1073, _1101);
    float _1113 = _1103 * _985;
    float _1115 = _877 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1117 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1119 = rsqrt(_1111);
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _975 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = _1107 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_48.x = _1105;
    out.m_48.y = _1113;
    float _1129 = _1103;
    int _1131 = as_type<int>(_1115);
    if (_1109)
    {
        _1129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1133 = _1129;
    out.m_50.x = _1121;
    out.m_50.y = _1087;
    out.m_50.z = _1125;
    out.m_50.w = _1127;
    if (_1109)
    {
        float _1135 = _1133 * 5.0;
        _1131 = as_type<int>(_1135);
    }
    int _1137 = _1131;
    if (_1109)
    {
        out.m_35.x = 0.0;
    }
    float _1139 = _1123 * _1119;
    if (_1109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3512 = as_type<float>(_1137);
        out.gl_Position.z = _3512;
    }
    float _1141 = _1081 * _1139;
    float _1143 = _1057 * _1139;
    if (_1109)
    {
        return out;
    }
    float _1145 = -_1143;
    float _1147 = _1031 + _1145;
    float _1149 = _1073 * _1139;
    float _1151 = -_1141;
    float _1153 = _1067 + _1151;
    float _1155 = -_1143;
    float _1157 = _1057 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1161 = _1147 + _1159;
    float _1163 = -_1149;
    float _1165 = _1059 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = _1153 + _1167;
    float _1171 = -_1141;
    float _1173 = _1081 + _1171;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1179 = _1165 + _1177;
    float _1181 = _1157 * _1157;
    float _1183 = -_1149;
    float _1185 = _1073 + _1183;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1175);
    float _1189 = fma(_1173, _1173, _1181);
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1187);
    float _1193 = fma(_1185, _1185, _1189);
    bool _1195 = _1191 >= 0.0;
    float _1197 = sqrt(_1193);
    float _1199 = _1175;
    if (_1195)
    {
        _1199 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1201 = _1199;
    int _1203 = as_type<int>(_1201);
    if (_1195)
    {
        out.m_35.x = 0.0;
    }
    float _1205 = _1119 * _1197;
    if (_1195)
    {
        float _1207 = _1201 * 5.0;
        _1203 = as_type<int>(_1207);
    }
    int _1209 = _1203;
    if (_1195)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3633 = as_type<float>(_1209);
        out.gl_Position.z = _3633;
    }
    if (_1195)
    {
        return out;
    }
    float _1211 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1213 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1217 = _975 * _1205;
    float _1219 = _1205 * _1211;
    float _1221 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = _1221 * 0.5;
    float _1225 = _1215 * _1217;
    float _1227 = _1213 * _1219;
    float _1229 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1231 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1235 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1229);
    float _1237 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1231);
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1233);
    float _1241 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1235);
    float _1243 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1237);
    float _1245 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1239);
    float _1247 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1251 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1253 = _1067 + _1247;
    float _1255 = _1059 + _1249;
    float _1257 = _1031 + _1251;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1261 = _1253 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1265 = _1255 + _1263;
    float _1267 = _1261 * _1261;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 + _1269;
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = _1225;
    float _1279 = _1251;
    float _1281 = _1223;
    float _1283 = _1269;
    float _1285 = _1253;
    if (!_1275)
    {
        _1277 = _1267;
    }
    float _1287 = _1277;
    float _1289 = _1287;
    if (!_1275)
    {
        _1279 = _1255;
    }
    float _1291 = _1279;
    float _1293 = _1291;
    if (!_1275)
    {
        _1281 = _1257;
    }
    float _1295 = _1281;
    bool _1297 = !_1275;
    float _1299 = _1295;
    if (!_1297)
    {
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1305 = _1273 + _1303;
        float _1307 = rsqrt(_1271);
        float _1309 = _1305 * _1301;
        float _1311 = _1257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = _1309 * 0.15915493667125701904296875;
        float _1315 = _1313 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1313 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = fma(_1317, _1311, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1325 = _1307 * _1323;
        float _1327 = _1321 + (-1.0);
        float _1329 = fma(_1261, _1325, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1331 = fma(_1265, _1325, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1333 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1337 = _1329 + _1335;
        float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1341 = _1331 + _1339;
        float _1343 = fma(_1257, _1321, _1333);
        float _1345 = _1337 * _1337;
        float _1347 = _1341 * _1341;
        _1299 = _1343;
        _1289 = _1345;
        _1283 = _1347;
        _1285 = _1329;
        _1293 = _1331;
    }
    float _1349 = _1299;
    float _1351 = _1289;
    float _1353 = _1283;
    float _1355 = _1285;
    float _1357 = _1293;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1361 = _1349 + _1359;
    float _1363 = fma(_1361, _1361, _1351);
    float _1365 = _1363 + _1353;
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1371 = isnan(_1367);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1377 = _1373 || _1375;
    float _1379 = _1351;
    if (!_1377)
    {
        _1379 = 1.0;
    }
    float _1381 = _1379;
    bool _1383 = !_1377;
    float _1385 = _1381;
    if (!_1383)
    {
        bool _1387 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1389 = isnan(_1367);
        bool _1391 = _1387 || _1389;
        bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1395 = _1391 || _1393;
        if (!_1395)
        {
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = _1367 + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1403 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1401;
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1409 = 1.0 / _1403;
            float _1411 = _1399 * _1409;
            float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1385 = _1413;
            _1415 = true;
        }
        else
        {
            bool _1417 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1419 = isnan(_1367);
            bool _1421 = _1417 || _1419;
            bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1425 = _1421 || _1423;
            if (!_1425)
            {
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1367 + _1427;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1437 = _1435 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1439 = 1.0 / _1433;
                float _1441 = _1429 * _1439;
                float _1443 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1385 = _1443;
                _1415 = true;
            }
            else
            {
                _1385 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1415 = false;
    float _1445 = _1385;
    float _1447 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1453 = _1355 + _1451;
    float _1455 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    bool _1457 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(0.5);
    bool _1465 = _1461 || _1463;
    float _1467 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1449);
    float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1471 = _1349 + _1469;
    float _1473 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1477 = _1357 + _1475;
    float _1479 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1467);
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1483 = fma(_1453, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1485 = fma(_1471, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1487 = fma(_1477, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = 1.0 / _1481;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1493 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.5);
    bool _1501 = _1497 || _1499;
    float _1503 = -_1141;
    float _1505 = _1503 + _1483;
    float _1507 = -_1143;
    float _1509 = _1507 + _1485;
    float _1511 = -_1149;
    float _1513 = _1511 + _1487;
    float _1515 = _1491 + _1481;
    float _1517 = _1509;
    float _1519 = _1505;
    float _1521 = _1513;
    if (!_1465)
    {
        float _1523 = _1161 * _1161;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1527 = -_1059;
        float _1529 = _1527 + _1487;
        float _1531 = -_1067;
        float _1533 = _1531 + _1483;
        float _1535 = fma(_1169, _1169, _1523);
        float _1537 = fma(_1179, _1179, _1535);
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1541 = sqrt(_1537);
        float _1543 = 1.0 / _1205;
        float _1545 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1547 = precise::min(_1541, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1549 = _1547 * _1525;
        float _1551 = _1549 * _1543;
        float _1553 = -_1031;
        float _1555 = _1553 + _1485;
        float _1557 = _1545 * _1551;
        float _1559 = _1529 * _1551;
        float _1561 = fma(_1533, _1557, _1153);
        float _1563 = fma(_1555, _1557, _1147);
        float _1565 = fma(_1545, _1559, _1165);
        _1517 = _1563;
        _1519 = _1561;
        _1521 = _1565;
    }
    float _1567 = _1517;
    float _1569 = _1519;
    float _1571 = _1521;
    float _1573 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1579 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1573);
    float _1583 = _1515 * _1489;
    float _1585 = _1583 * 0.5;
    float _1587 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1575);
    float _1589 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1593 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1595 = _1581;
    if (_1501)
    {
        _1595 = 1.0;
    }
    float _1597 = _1595;
    float _1599 = _1597;
    if (!_1501)
    {
        float _1601 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1605 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1603);
        float _1607 = _1601 * 0.15915493667125701904296875;
        float _1609 = _1607 * 6.283185482025146484375;
        float _1611 = cos(_1609);
        float _1613 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1615 = _1613 * 0.15915493667125701904296875;
        float _1617 = _1607 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        float _1621 = 1.0 / _1611;
        float _1623 = _1615 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1605;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1631;
        float _1635 = _1625 * _1627;
        float _1637 = _1615 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = 1.0 / _1635;
        float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1645 = _1629 * _1643;
        float _1647 = 1.0 / _1633;
        float _1649 = _1639 * _1641;
        float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1653 = fma(_1649, _1645, _1651);
        float _1655 = _1653 * _1647;
        float _1657 = precise::clamp(_1655, 0.0, 1.0);
        _1599 = _1657;
    }
    float _1659 = _1599;
    float _1661 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1587);
    float _1663 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1665 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1589);
    float _1667 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1591);
    float _1669 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1681 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1671);
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1673);
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1689 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1691 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1681);
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1683);
    float _1695 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1697 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    bool _1699 = _1659 > 0.0;
    bool _1701 = isnan(_1659);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(0.0);
    bool _1707 = _1703 || _1705;
    float _1709 = _1659 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1711 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1691);
    float _1713 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1715 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1717 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1721 = _1711 + _1715;
    float _1723 = _1717 + _1715;
    float _1725 = _1715 * 0.5;
    float _1727 = _1721 * 0.5;
    float _1729 = _1723 * 0.5;
    float _1731 = fma(_1713, -0.5, _1725);
    out.m_35.x = _1719;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1713;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1715;
    out.m_52.x = _1727;
    out.m_52.y = _1731;
    out.m_52.z = _1729;
    out.m_52.w = _1715;
    if (_1707)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1733 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1733;
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
    bool _1415 = false;
    bool _903 = false;
    bool _735 = false;
    bool _555 = false;
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
        float _1790 = as_type<float>(_87);
        out.gl_Position.z = _1790;
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
        float _1859 = as_type<float>(_123);
        out.gl_Position.z = _1859;
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
    bool _455 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _457 = isnan(_449);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _467;
    bool _471 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_449);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -_465;
    float _485 = _483 + 1.0;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    float _491 = 1.0 / _469;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _495 = _481 * _485;
    float _497 = -_481;
    float _499 = _497 + 1.0;
    float _501 = _453 * _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _503;
    float _507 = fma(_489, _501, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _509;
    float _513 = fma(_505, _501, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _515 = fma(_511, _501, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _517 = _507 * _495;
    float _519 = _513 * _495;
    float _521 = _515 * _495;
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].x, _517);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].y, _521);
    float _527 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].z, _519);
    float _529 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].x, _523);
    float _531 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].y, _525);
    float _533 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].z, _527);
    bool _535 = !_493;
    float _553;
    if (!_535)
    {
        float _537 = in.m_44.x;
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _541 = _537 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _545 = _543 * _539;
        float _547 = floor(_545);
        float _549 = -_547;
        float _551 = _545 + _549;
        _553 = _551;
        _555 = true;
    }
    else
    {
        float _557 = float(_71);
        float _559 = 1.0 / _557;
        float _561 = _105 * _559;
        _553 = _561;
    }
    _555 = false;
    float _563 = _553;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _563 + _565;
    float _569 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_563);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _597 = isnan(_563);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _573;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _609;
    float _613 = -_589;
    float _615 = _613 + 1.0;
    bool _617 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_563);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _633 = 1.0 / _577;
    float _635 = 1.0 / _593;
    float _637 = _611 * _607;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _643 = _605 * _615;
    float _645 = -_605;
    float _647 = _645 + 1.0;
    float _649 = fma(_637, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = _627 * _647;
    float _657 = _641 * _633;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _661 = _563 + _659;
    bool _663 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _665 = isnan(_563);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = _649 * _655;
    float _677 = -_627;
    float _679 = _677 + 1.0;
    float _681 = fma(_657, _661, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _685 = _563 + _683;
    float _687 = _653 * _635;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _695 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _697 = fma(_687, _685, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _699 = _589 * _691;
    float _701 = fma(_681, _643, _693);
    float _703 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = fma(_697, _699, _701);
    float _709 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[118].x, _707);
    float _711 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _703;
    out.m_46.y = _711;
    out.m_46.z = _705;
    out.m_46.w = _713;
    bool _715 = !_631;
    float _733;
    if (!_715)
    {
        float _717 = in.m_44.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        float _737 = float(_71);
        float _739 = 1.0 / _737;
        float _741 = _105 * _739;
        _733 = _741;
    }
    _735 = false;
    float _743 = _733;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _747 = _743 + _745;
    bool _749 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _751 = isnan(_743);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _763 = _743 + _761;
    bool _765 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _767 = isnan(_743);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _785 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _787 = isnan(_743);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = 1.0 / _779;
    float _799 = -_795;
    float _801 = _799 + 1.0;
    bool _803 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _805 = _775 * _801;
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = 1.0 / _783;
    float _813 = _747 * _797;
    float _815 = -_759;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _819;
    float _823 = _795 * _817;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _829;
    float _833 = fma(_821, _813, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _835 = _763 * _811;
    float _837 = fma(_827, _813, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _839 = fma(_831, _813, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _841 = _833 * _805;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _847 = _837 * _805;
    float _849 = _839 * _805;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _859 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].x, _847);
    float _861 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _863 = fma(_853, _835, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _865 = fma(_845, _835, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _867 = fma(_857, _835, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _869 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[123].z, _849);
    float _871 = fma(_863, _823, _859);
    float _873 = fma(_865, _823, _861);
    float _875 = fma(_867, _823, _869);
    float _877 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].x, _871);
    float _879 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].y, _873);
    float _881 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[125].z, _875);
    bool _883 = !_803;
    float _901;
    if (!_883)
    {
        float _885 = in.m_44.x;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _889 = _885 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _893 = _891 * _887;
        float _895 = floor(_893);
        float _897 = -_895;
        float _899 = _893 + _897;
        _901 = _899;
        _903 = true;
    }
    else
    {
        float _905 = float(_71);
        float _907 = 1.0 / _905;
        float _909 = _105 * _907;
        _901 = _909;
    }
    _903 = false;
    float _911 = _901;
    float _913 = in.m_44.x;
    float _915 = in.m_44.y;
    float _917 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _923;
    float _927 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _929 = 1.0 / _921;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _937 = _935 != 0;
    float _939 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _917);
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _943 = _941 != 0;
    float _945 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _927);
    bool _947 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _949 = isnan(_911);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _963 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _965 = isnan(_911);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _977 = _925 * _929;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _981 = _911 + _979;
    bool _983 = _913 > 0.5;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _987 = _915 > 0.5;
    float _989 = fma(_977, _981, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _991 = _911 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = isnan(_911);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1009 = 1.0 / _933;
    float _1011 = -_1001;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1003);
    float _1017 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _939);
    float _1019 = -_179;
    int _1021 = _983 ? as_type<int>(_1019) : as_type<int>(_179);
    float _1023 = _973 * _1013;
    float _1025 = -_973;
    float _1027 = _1025 + 1.0;
    float _1029 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1015);
    float _1031 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1033 = -_957;
    float _1035 = _1033 + 1.0;
    float _1037 = _989 * _1023;
    float _1039 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _945);
    float _1041 = -_183;
    int _1043 = _987 ? as_type<int>(_1041) : as_type<int>(_183);
    float _1045 = _1001 * _1035;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1049 = _911 + _1047;
    float _1051 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1037);
    float _1053 = _1007 * _1009;
    float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1057 = _1031 + _1055;
    float _1059 = _1039 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1061 = !_937;
    float _1063 = _1061 ? _179 : as_type<float>(_1021);
    float _1065 = fma(_1053, _1049, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1067 = _1029 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1069 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1073 = _1059 + _1071;
    bool _1075 = !_943;
    float _1077 = _1075 ? _183 : as_type<float>(_1043);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1067 + _1079;
    float _1083 = _1063 + 0.5;
    float _1085 = fma(_1065, _1045, _1051);
    float _1087 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1069);
    float _1091 = _1057 * _1057;
    float _1093 = -_1077;
    float _1095 = _1093 + 0.5;
    float _1097 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1099 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1089);
    float _1101 = fma(_1081, _1081, _1091);
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1105 = _1097 * _961;
    float _1107 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1085);
    bool _1109 = _1099 >= 0.0;
    float _1111 = fma(_1073, _1073, _1101);
    float _1113 = _1103 * _985;
    float _1115 = _877 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1117 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1119 = rsqrt(_1111);
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _975 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = _1107 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_48.x = _1105;
    out.m_48.y = _1113;
    float _1129 = _1103;
    int _1131 = as_type<int>(_1115);
    if (_1109)
    {
        _1129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1133 = _1129;
    out.m_50.x = _1121;
    out.m_50.y = _1087;
    out.m_50.z = _1125;
    out.m_50.w = _1127;
    if (_1109)
    {
        float _1135 = _1133 * 5.0;
        _1131 = as_type<int>(_1135);
    }
    int _1137 = _1131;
    if (_1109)
    {
        out.m_35.x = 0.0;
    }
    float _1139 = _1123 * _1119;
    if (_1109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3512 = as_type<float>(_1137);
        out.gl_Position.z = _3512;
    }
    float _1141 = _1081 * _1139;
    float _1143 = _1057 * _1139;
    if (_1109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1145 = -_1143;
    float _1147 = _1031 + _1145;
    float _1149 = _1073 * _1139;
    float _1151 = -_1141;
    float _1153 = _1067 + _1151;
    float _1155 = -_1143;
    float _1157 = _1057 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1161 = _1147 + _1159;
    float _1163 = -_1149;
    float _1165 = _1059 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = _1153 + _1167;
    float _1171 = -_1141;
    float _1173 = _1081 + _1171;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1179 = _1165 + _1177;
    float _1181 = _1157 * _1157;
    float _1183 = -_1149;
    float _1185 = _1073 + _1183;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1175);
    float _1189 = fma(_1173, _1173, _1181);
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1187);
    float _1193 = fma(_1185, _1185, _1189);
    bool _1195 = _1191 >= 0.0;
    float _1197 = sqrt(_1193);
    float _1199 = _1175;
    if (_1195)
    {
        _1199 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1201 = _1199;
    int _1203 = as_type<int>(_1201);
    if (_1195)
    {
        out.m_35.x = 0.0;
    }
    float _1205 = _1119 * _1197;
    if (_1195)
    {
        float _1207 = _1201 * 5.0;
        _1203 = as_type<int>(_1207);
    }
    int _1209 = _1203;
    if (_1195)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3633 = as_type<float>(_1209);
        out.gl_Position.z = _3633;
    }
    if (_1195)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1211 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1213 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1217 = _975 * _1205;
    float _1219 = _1205 * _1211;
    float _1221 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = _1221 * 0.5;
    float _1225 = _1215 * _1217;
    float _1227 = _1213 * _1219;
    float _1229 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1231 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1235 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1229);
    float _1237 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1231);
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1233);
    float _1241 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1235);
    float _1243 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1237);
    float _1245 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1239);
    float _1247 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1251 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1253 = _1067 + _1247;
    float _1255 = _1059 + _1249;
    float _1257 = _1031 + _1251;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1261 = _1253 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1265 = _1255 + _1263;
    float _1267 = _1261 * _1261;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 + _1269;
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = _1225;
    float _1279 = _1251;
    float _1281 = _1223;
    float _1283 = _1269;
    float _1285 = _1253;
    if (!_1275)
    {
        _1277 = _1267;
    }
    float _1287 = _1277;
    float _1289 = _1287;
    if (!_1275)
    {
        _1279 = _1255;
    }
    float _1291 = _1279;
    float _1293 = _1291;
    if (!_1275)
    {
        _1281 = _1257;
    }
    float _1295 = _1281;
    bool _1297 = !_1275;
    float _1299 = _1295;
    if (!_1297)
    {
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1305 = _1273 + _1303;
        float _1307 = rsqrt(_1271);
        float _1309 = _1305 * _1301;
        float _1311 = _1257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = _1309 * 0.15915493667125701904296875;
        float _1315 = _1313 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1313 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = fma(_1317, _1311, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1325 = _1307 * _1323;
        float _1327 = _1321 + (-1.0);
        float _1329 = fma(_1261, _1325, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1331 = fma(_1265, _1325, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1333 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1337 = _1329 + _1335;
        float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1341 = _1331 + _1339;
        float _1343 = fma(_1257, _1321, _1333);
        float _1345 = _1337 * _1337;
        float _1347 = _1341 * _1341;
        _1299 = _1343;
        _1289 = _1345;
        _1283 = _1347;
        _1285 = _1329;
        _1293 = _1331;
    }
    float _1349 = _1299;
    float _1351 = _1289;
    float _1353 = _1283;
    float _1355 = _1285;
    float _1357 = _1293;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1361 = _1349 + _1359;
    float _1363 = fma(_1361, _1361, _1351);
    float _1365 = _1363 + _1353;
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1371 = isnan(_1367);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1377 = _1373 || _1375;
    float _1379 = _1351;
    if (!_1377)
    {
        _1379 = 1.0;
    }
    float _1381 = _1379;
    bool _1383 = !_1377;
    float _1385 = _1381;
    if (!_1383)
    {
        bool _1387 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1389 = isnan(_1367);
        bool _1391 = _1387 || _1389;
        bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1395 = _1391 || _1393;
        if (!_1395)
        {
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = _1367 + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1403 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1401;
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1409 = 1.0 / _1403;
            float _1411 = _1399 * _1409;
            float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1385 = _1413;
            _1415 = true;
        }
        else
        {
            bool _1417 = _1367 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1419 = isnan(_1367);
            bool _1421 = _1417 || _1419;
            bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1425 = _1421 || _1423;
            if (!_1425)
            {
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1367 + _1427;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1437 = _1435 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1439 = 1.0 / _1433;
                float _1441 = _1429 * _1439;
                float _1443 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1385 = _1443;
                _1415 = true;
            }
            else
            {
                _1385 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1415 = false;
    float _1445 = _1385;
    float _1447 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1453 = _1355 + _1451;
    float _1455 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    bool _1457 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(0.5);
    bool _1465 = _1461 || _1463;
    float _1467 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1449);
    float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1471 = _1349 + _1469;
    float _1473 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1477 = _1357 + _1475;
    float _1479 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1467);
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1483 = fma(_1453, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1485 = fma(_1471, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1487 = fma(_1477, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = 1.0 / _1481;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1493 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.5);
    bool _1501 = _1497 || _1499;
    float _1503 = -_1141;
    float _1505 = _1503 + _1483;
    float _1507 = -_1143;
    float _1509 = _1507 + _1485;
    float _1511 = -_1149;
    float _1513 = _1511 + _1487;
    float _1515 = _1491 + _1481;
    float _1517 = _1509;
    float _1519 = _1505;
    float _1521 = _1513;
    if (!_1465)
    {
        float _1523 = _1161 * _1161;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1527 = -_1059;
        float _1529 = _1527 + _1487;
        float _1531 = -_1067;
        float _1533 = _1531 + _1483;
        float _1535 = fma(_1169, _1169, _1523);
        float _1537 = fma(_1179, _1179, _1535);
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1541 = sqrt(_1537);
        float _1543 = 1.0 / _1205;
        float _1545 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1547 = precise::min(_1541, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1549 = _1547 * _1525;
        float _1551 = _1549 * _1543;
        float _1553 = -_1031;
        float _1555 = _1553 + _1485;
        float _1557 = _1545 * _1551;
        float _1559 = _1529 * _1551;
        float _1561 = fma(_1533, _1557, _1153);
        float _1563 = fma(_1555, _1557, _1147);
        float _1565 = fma(_1545, _1559, _1165);
        _1517 = _1563;
        _1519 = _1561;
        _1521 = _1565;
    }
    float _1567 = _1517;
    float _1569 = _1519;
    float _1571 = _1521;
    float _1573 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1579 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1573);
    float _1583 = _1515 * _1489;
    float _1585 = _1583 * 0.5;
    float _1587 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1575);
    float _1589 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1593 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1595 = _1581;
    if (_1501)
    {
        _1595 = 1.0;
    }
    float _1597 = _1595;
    float _1599 = _1597;
    if (!_1501)
    {
        float _1601 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1605 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1603);
        float _1607 = _1601 * 0.15915493667125701904296875;
        float _1609 = _1607 * 6.283185482025146484375;
        float _1611 = cos(_1609);
        float _1613 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1615 = _1613 * 0.15915493667125701904296875;
        float _1617 = _1607 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        float _1621 = 1.0 / _1611;
        float _1623 = _1615 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1605;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1631;
        float _1635 = _1625 * _1627;
        float _1637 = _1615 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = 1.0 / _1635;
        float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1645 = _1629 * _1643;
        float _1647 = 1.0 / _1633;
        float _1649 = _1639 * _1641;
        float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1653 = fma(_1649, _1645, _1651);
        float _1655 = _1653 * _1647;
        float _1657 = precise::clamp(_1655, 0.0, 1.0);
        _1599 = _1657;
    }
    float _1659 = _1599;
    float _1661 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1587);
    float _1663 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1665 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1589);
    float _1667 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1591);
    float _1669 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1681 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1671);
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1673);
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1689 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1691 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1681);
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1683);
    float _1695 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1697 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    bool _1699 = _1659 > 0.0;
    bool _1701 = isnan(_1659);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(0.0);
    bool _1707 = _1703 || _1705;
    float _1709 = _1659 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1711 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1691);
    float _1713 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1715 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1717 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1721 = _1711 + _1715;
    float _1723 = _1717 + _1715;
    float _1725 = _1715 * 0.5;
    float _1727 = _1721 * 0.5;
    float _1729 = _1723 * 0.5;
    float _1731 = fma(_1713, -0.5, _1725);
    out.m_35.x = _1719;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1713;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1715;
    out.m_52.x = _1727;
    out.m_52.y = _1731;
    out.m_52.z = _1729;
    out.m_52.w = _1715;
    if (_1707)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1733 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1733;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

