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
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1783 = false;
    bool _907 = false;
    bool _739 = false;
    bool _559 = false;
    bool _445 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2044 = as_type<float>(_89);
        out.gl_Position.z = _2044;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2114 = as_type<float>(_127);
        out.gl_Position.z = _2114;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    float _157 = 0.0;
    float _159 = _131;
    if (!_143)
    {
        float _161 = _131 * _131;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    bool _303 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_297);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _297 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = in.m_42.x;
    float _333 = in.m_42.y;
    bool _335 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_297);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _321;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _351 = 1.0 / _325;
    float _353 = _301 * _347;
    bool _355 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_297);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = _365 * _329;
    float _377 = -_365;
    float _379 = _377 + 1.0;
    float _381 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = fma(_373, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _317 * _351;
    float _387 = _345 * _379;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -_345;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _401 = _381 * _387;
    float _403 = _383 * _387;
    float _405 = fma(_391, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_399, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _409 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _413 = fma(_405, _375, _409);
    float _415 = fma(_407, _375, _411);
    float _417 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    float _421 = _417 * _331;
    float _423 = _419 * _333;
    bool _425 = !_349;
    float _443;
    if (!_425)
    {
        float _427 = in.m_44.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_73);
        float _449 = 1.0 / _447;
        float _451 = _107 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = _453 + _455;
    bool _459 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _461 = isnan(_453);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _471;
    bool _475 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _477 = isnan(_453);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _491;
    float _495 = 1.0 / _473;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _499 = _485 * _489;
    float _501 = -_485;
    float _503 = _501 + 1.0;
    float _505 = _457 * _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _507;
    float _511 = fma(_493, _505, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = fma(_509, _505, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _519 = fma(_515, _505, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _521 = _511 * _499;
    float _523 = _519 * _499;
    float _525 = _517 * _499;
    float _527 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _521);
    float _529 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _523);
    float _531 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _525);
    float _533 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].x, _527);
    float _535 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].y, _529);
    float _537 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].z, _531);
    bool _539 = !_497;
    float _557;
    if (!_539)
    {
        float _541 = in.m_44.x;
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_73);
        float _563 = 1.0 / _561;
        float _565 = _107 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _571 = _567 + _569;
    float _573 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _585 = isnan(_567);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _599 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_567);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _577;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _613;
    float _617 = -_593;
    float _619 = _617 + 1.0;
    bool _621 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_567);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _635 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _637 = _609 * _619;
    float _639 = -_609;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _581;
    float _645 = 1.0 / _597;
    float _647 = _615 * _611;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = fma(_647, _571, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _655 = _631 * _641;
    bool _657 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _659 = isnan(_567);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _651 * _643;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _567 + _675;
    float _679 = -_631;
    float _681 = _679 + 1.0;
    float _683 = -_667;
    float _685 = _683 + 1.0;
    float _687 = fma(_669, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = _673 * _645;
    float _691 = _653 * _655;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _695 = _567 + _693;
    float _697 = _593 * _685;
    float _699 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    float _703 = fma(_689, _695, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _705 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_687, _637, _701);
    float _711 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_703, _697, _709);
    float _715 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[118].x, _713);
    float _717 = _715 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _705;
    out.m_46.y = _707;
    out.m_46.z = _711;
    out.m_46.w = _717;
    bool _719 = !_635;
    float _737;
    if (!_719)
    {
        float _721 = in.m_44.x;
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _725 = _721 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _729 = _727 * _723;
        float _731 = floor(_729);
        float _733 = -_731;
        float _735 = _729 + _733;
        _737 = _735;
        _739 = true;
    }
    else
    {
        float _741 = float(_73);
        float _743 = 1.0 / _741;
        float _745 = _107 * _743;
        _737 = _745;
    }
    _739 = false;
    float _747 = _737;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _751 = _747 + _749;
    bool _753 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _755 = isnan(_747);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _767 = _747 + _765;
    bool _769 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _771 = isnan(_747);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _791 = isnan(_747);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_763;
    float _803 = _801 + 1.0;
    float _805 = 1.0 / _783;
    float _807 = _799 * _803;
    float _809 = -_799;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _813;
    bool _817 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _819 = 1.0 / _787;
    float _821 = _779 * _811;
    float _823 = -_779;
    float _825 = _823 + 1.0;
    float _827 = _751 * _805;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _833;
    float _837 = fma(_815, _827, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _839 = fma(_831, _827, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _841 = fma(_835, _827, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _843 = _767 * _819;
    float _845 = _837 * _821;
    float _847 = _839 * _821;
    float _849 = _841 * _821;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _863 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].x, _845);
    float _865 = fma(_853, _843, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _867 = fma(_857, _843, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _869 = fma(_861, _843, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _871 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].y, _847);
    float _873 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].z, _849);
    float _875 = fma(_865, _807, _863);
    float _877 = fma(_867, _807, _871);
    float _879 = fma(_869, _807, _873);
    float _881 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].x, _875);
    float _883 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].y, _877);
    float _885 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].z, _879);
    bool _887 = !_817;
    float _905;
    if (!_887)
    {
        float _889 = in.m_44.x;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _893 = _889 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _897 = _895 * _891;
        float _899 = floor(_897);
        float _901 = -_899;
        float _903 = _897 + _901;
        _905 = _903;
        _907 = true;
    }
    else
    {
        float _909 = float(_73);
        float _911 = 1.0 / _909;
        float _913 = _107 * _911;
        _905 = _913;
    }
    _907 = false;
    float _915 = _905;
    float _917 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _919 = log2(_917);
    float _921 = in.m_44.z;
    float _923 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    float _929 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _933 = _931 != 0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = in.m_44.x;
    float _941 = in.m_44.y;
    float _943 = 1.0 / _937;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _953 = _919 * _107;
    float _955 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _923);
    float _957 = 1.0 / _947;
    float _959 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _963 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _965 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _967 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _969 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _961);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _971;
    float _975 = 1.0 / _951;
    float _977 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _967);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _979;
    float _983 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _969);
    float _985 = _973 * _943;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _991 = _939 * 2.0;
    float _993 = exp2(_953);
    float _995 = _981 * _957;
    bool _997 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _999 = isnan(_915);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = _941 * 2.0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1021 = _1019 != 0;
    float _1023 = _921 * 2.0;
    bool _1025 = _939 > 0.5;
    float _1027 = _989 * _975;
    bool _1029 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1031 = isnan(1.0);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1037 = _1033 || _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1041 = 1.0 + _1039;
    float _1043 = -_183;
    int _1045 = _1025 ? as_type<int>(_1043) : as_type<int>(_183);
    float _1047 = floor(_1023);
    bool _1049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1057 = _1053 || _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _915 + _1059;
    bool _1063 = !_927;
    float _1065 = _1063 ? _183 : as_type<float>(_1045);
    float _1067 = -_993;
    float _1069 = _1067 + 1.0;
    bool _1071 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1073 = isnan(_915);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -_1007;
    float _1085 = _1083 + 1.0;
    float _1087 = fma(_985, _1061, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1089 = floor(_991);
    float _1091 = _1057 ? _1069 : 0.0;
    float _1093 = _1081 * _1085;
    bool _1095 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1097 = isnan(_915);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    float _1111 = _977 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1113 = _1065 + 0.5;
    float _1115 = _963 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1117 = 1.0 / _1041;
    bool _1119 = _1047 > 0.0;
    float _1121 = _1105 * _1109;
    bool _1123 = _1047 >= 0.0;
    bool _1125 = isnan(_1047);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan(0.0);
    bool _1131 = _1127 || _1129;
    float _1133 = -_1105;
    float _1135 = _1133 + 1.0;
    bool _1137 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1139 = isnan(_915);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = _1111 + _1149;
    int _1153 = _1131 ? 0 : 1;
    float _1155 = floor(_1009);
    bool _1157 = _1089 >= 0.0;
    bool _1159 = isnan(_1089);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.0);
    bool _1165 = _1161 || _1163;
    float _1167 = _1147 * _1135;
    bool _1169 = !_1013;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = -_1147;
    float _1175 = _1173 + 1.0;
    float _1177 = _983 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1179 = _1087 * _1167;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1183 = _915 + _1181;
    if (_1037)
    {
        float _1185 = _1091 * _1117;
        _109 = _1185;
    }
    float _1187 = _109;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1191 = _915 + _1189;
    int _1193 = _1165 ? 0 : 1;
    float _1195 = fma(_1027, _1183, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1197 = _1089 > 0.0;
    float _1199 = fma(_995, _1191, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1203 = ~_1153;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1179);
    bool _1211 = _1155 > 0.0;
    float _1213 = _1151 * _1151;
    bool _1215 = _1155 >= 0.0;
    bool _1217 = isnan(_1155);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan(0.0);
    bool _1223 = _1219 || _1221;
    float _1225 = _941 + _939;
    int _1227 = _1207;
    if (!_1119)
    {
        int _1229 = ~_1153;
        int _1231 = _1229 + 1;
        _1227 = _1231;
    }
    int _1233 = _1227;
    float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1237 = _941 > 0.5;
    float _1239 = _1225 + (-1.0);
    int _1241 = _1223 ? 0 : 1;
    float _1243 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1245 = abs(_1171);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1249 = -_187;
    int _1251 = _1237 ? as_type<int>(_1249) : as_type<int>(_187);
    float _1253 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1255 = ~_1241;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    float _1261 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = float(_1245);
    float _1265 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = float(_1233);
    float _1269 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1271 = _1259;
    if (!_1211)
    {
        int _1273 = ~_1241;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = fma(_1195, _1121, _1209);
    bool _1281 = !_933;
    float _1283 = _1281 ? _187 : as_type<float>(_1251);
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1287 = _1115 + _1285;
    bool _1289 = !_1017;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = _1269 * _1201;
    int _1295 = ~_1193;
    int _1297 = _1295 + 1;
    int _1299 = _1297 + 1;
    float _1301 = fma(_1199, _1093, _1279);
    int _1303 = _1299;
    float _1305 = _1301;
    if (!_1197)
    {
        int _1307 = ~_1193;
        int _1309 = _1307 + 1;
        _1303 = _1309;
    }
    int _1311 = _1303;
    float _1313 = _1263 * _1267;
    float _1315 = -_1283;
    float _1317 = _1315 + 0.5;
    int _1319 = abs(_1291);
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1323 = _1177 + _1321;
    float _1325 = fma(_1287, _1287, _1213);
    float _1327 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1329 = in.m_48.x;
    float _1331 = in.m_48.y;
    float _1333 = in.m_48.z;
    float _1335 = _1313 * (-2.0);
    float _1337 = fma(_1323, _1323, _1325);
    float _1339 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1327);
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1343 = float(_1319);
    float _1345 = fma(_1247, _1335, _1247);
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1339);
    float _1349 = rsqrt(_1337);
    float _1351 = float(_1311);
    float _1353 = _1341 * _1235;
    float _1355 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1301);
    bool _1357 = _1347 >= 0.0;
    float _1359 = _1343 * _1351;
    out.m_50.x = _1293;
    out.m_50.y = _1353;
    float _1361 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_52.x = _1253;
    out.m_52.y = _1261;
    out.m_52.z = _1265;
    out.m_52.w = _1361;
    float _1363 = _1151 * _1349;
    float _1365 = _1287 * _1349;
    if (_1357)
    {
        _1305 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1367 = _1305;
    float _1369 = fma(_1335, _1329, _1329);
    float _1371 = -_1363;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    float _1375 = -_1365;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1379 = _1323 * _1349;
    float _1381 = _1373 * _1373;
    int _1383 = as_type<int>(_1367);
    if (_1357)
    {
        float _1385 = _1367 * 5.0;
        _1383 = as_type<int>(_1385);
    }
    int _1387 = _1383;
    if (_1357)
    {
        out.m_35.x = 0.0;
    }
    float _1389 = -_1379;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1323);
    float _1393 = fma(_1377, _1377, _1381);
    float _1395 = _939 + (-0.5);
    if (_1357)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4100 = as_type<float>(_1387);
        out.gl_Position.z = _4100;
    }
    float _1397 = fma(_1391, _1391, _1393);
    float _1399 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1369);
    bool _1401 = !_1021;
    int _1403 = _1401 ? 0 : 1;
    if (_1357)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1405 = -_1363;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1409 = -_1365;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1413 = -_1379;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1177);
    int _1417 = abs(_1403);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1421 = _1407 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1425 = _1411 + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1429 = _1415 + _1427;
    float _1431 = _941 + _921;
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1435 = float(_1417);
    float _1437 = _1359 * (-2.0);
    float _1439 = _1431 + (-1.0);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1443 = float(_1277);
    float _1445 = _921 + _939;
    float _1447 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1449 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1441);
    float _1451 = _941 + (-0.5);
    float _1453 = _1435 * _1443;
    float _1455 = _1445 + (-1.0);
    float _1457 = fma(_1447, _1437, _1447);
    bool _1459 = _1449 >= 0.0;
    float _1461 = fma(_1437, _1331, _1331);
    float _1463 = _1453 * (-2.0);
    float _1465 = _921 + (-0.5);
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1461);
    float _1469 = fma(_1345, _1187, _1399);
    float _1471 = fma(_1463, _1333, _1333);
    float _1473 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1475 = fma(_1457, _1187, _1467);
    float _1477 = _1469 * 0.15915493667125701904296875;
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1471);
    float _1481 = fma(_1473, _1463, _1473);
    float _1483 = _1475 * 0.15915493667125701904296875;
    float _1485 = _1461;
    int _1487 = as_type<int>(_1471);
    if (_1459)
    {
        _1485 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1489 = _1485;
    float _1491 = sqrt(_1397);
    float _1493 = fma(_1481, _1187, _1479);
    if (_1459)
    {
        out.m_35.x = 0.0;
    }
    if (_1459)
    {
        float _1495 = _1489 * 5.0;
        _1487 = as_type<int>(_1495);
    }
    int _1497 = _1487;
    float _1499 = _1493 * 0.15915493667125701904296875;
    float _1501 = _1477 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    if (_1459)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4292 = as_type<float>(_1497);
        out.gl_Position.z = _4292;
    }
    float _1505 = _1477 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    float _1509 = _1483 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = _1483 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    if (_1459)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1517 = _1499 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = _1349 * _1491;
    float _1523 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1527 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1531 = _1521 * _1523;
    float _1533 = _1507 * _1515;
    float _1535 = _1499 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = _1521 * _1527;
    float _1541 = _1525 * _1531;
    float _1543 = _1503 * _1511;
    float _1545 = _1507 * _1511;
    float _1547 = _1529 * _1539;
    float _1549 = _1519 * _1541;
    float _1551 = _1511 * _1519;
    float _1553 = _1515 * _1519;
    float _1555 = _1503 * _1515;
    float _1557 = _1507 * _1549;
    float _1559 = fma(_1537, _1533, _1543);
    float _1561 = -_1541;
    float _1563 = _1537 * _1561;
    float _1565 = -_1555;
    float _1567 = fma(_1537, _1545, _1565);
    float _1569 = -_1545;
    float _1571 = fma(_1537, _1555, _1569);
    float _1573 = fma(_1559, _1547, _1557);
    float _1575 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1577 = _1575 * 0.5;
    float _1579 = _1503 * _1549;
    float _1581 = fma(_1553, _1547, _1563);
    float _1583 = fma(_1537, _1543, _1533);
    float _1585 = fma(_1567, _1577, _1573);
    float _1587 = fma(_1571, _1547, _1579);
    float _1589 = fma(_1551, _1577, _1581);
    float _1591 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1593 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = fma(_1583, _1577, _1587);
    float _1597 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1591);
    float _1599 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1601 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1597);
    float _1603 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1599);
    float _1605 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1607 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1609 = _1115 + _1605;
    float _1611 = _1177 + _1607;
    float _1613 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1617 = _1609 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1621 = _1611 + _1619;
    float _1623 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1613);
    float _1625 = _1617 * _1617;
    float _1627 = _1621 * _1621;
    float _1629 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1623);
    float _1631 = _1625 + _1627;
    float _1633 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1635 = sqrt(_1631);
    float _1637 = _1111 + _1633;
    bool _1639 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = _1595;
    float _1643 = _1629;
    float _1645 = _1633;
    float _1647 = _1609;
    float _1649 = _1627;
    if (!_1639)
    {
        _1641 = _1609;
    }
    float _1651 = _1641;
    float _1653 = _1651;
    if (!_1639)
    {
        _1643 = _1625;
    }
    float _1655 = _1643;
    float _1657 = _1655;
    if (!_1639)
    {
        _1645 = _1611;
    }
    float _1659 = _1645;
    float _1661 = _1659;
    if (!_1639)
    {
        _1647 = _1637;
    }
    float _1663 = _1647;
    bool _1665 = !_1639;
    float _1667 = _1663;
    if (!_1665)
    {
        float _1669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1673 = _1635 + _1671;
        float _1675 = rsqrt(_1631);
        float _1677 = _1673 * _1669;
        float _1679 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = _1677 * 0.15915493667125701904296875;
        float _1683 = _1681 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = _1681 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        float _1691 = fma(_1685, _1679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1693 = _1675 * _1691;
        float _1695 = _1689 + (-1.0);
        float _1697 = fma(_1617, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1699 = fma(_1621, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1701 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1705 = _1697 + _1703;
        float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1709 = _1699 + _1707;
        float _1711 = fma(_1637, _1689, _1701);
        float _1713 = _1705 * _1705;
        float _1715 = _1709 * _1709;
        _1667 = _1711;
        _1657 = _1713;
        _1649 = _1715;
        _1653 = _1697;
        _1661 = _1699;
    }
    float _1717 = _1667;
    float _1719 = _1657;
    float _1721 = _1649;
    float _1723 = _1653;
    float _1725 = _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1729 = _1717 + _1727;
    float _1731 = fma(_1729, _1729, _1719);
    float _1733 = _1731 + _1721;
    float _1735 = sqrt(_1733);
    bool _1737 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1739 = isnan(_1735);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1745 = _1741 || _1743;
    float _1747 = _1719;
    if (!_1745)
    {
        _1747 = 1.0;
    }
    float _1749 = _1747;
    bool _1751 = !_1745;
    float _1753 = _1749;
    if (!_1751)
    {
        bool _1755 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1757 = isnan(_1735);
        bool _1759 = _1755 || _1757;
        bool _1761 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1763 = _1759 || _1761;
        if (!_1763)
        {
            float _1765 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1767 = _1735 + _1765;
            float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1771 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1769;
            float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1775 = _1773 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1777 = 1.0 / _1771;
            float _1779 = _1767 * _1777;
            float _1781 = fma(_1779, _1775, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1753 = _1781;
            _1783 = true;
        }
        else
        {
            bool _1785 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1787 = isnan(_1735);
            bool _1789 = _1785 || _1787;
            bool _1791 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1793 = _1789 || _1791;
            if (!_1793)
            {
                float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1797 = _1735 + _1795;
                float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1801 = _1799 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1805 = _1803 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1807 = 1.0 / _1801;
                float _1809 = _1797 * _1807;
                float _1811 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1753 = _1811;
                _1783 = true;
            }
            else
            {
                _1753 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1783 = false;
    float _1813 = _1753;
    float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1817 = _1723 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1821 = _1717 + _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1825 = _1725 + _1823;
    bool _1827 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.5);
    bool _1835 = _1831 || _1833;
    float _1837 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1839 = fma(_1821, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1841 = fma(_1825, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = -_1365;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _1847 = -_1363;
    float _1849 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1839);
    float _1851 = -_1379;
    float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1841);
    float _1855 = _1849;
    float _1857 = _1845;
    float _1859 = _1853;
    if (!_1835)
    {
        float _1861 = _1421 * _1421;
        float _1863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1865 = -_1177;
        float _1867 = _1865 + _1841;
        float _1869 = fma(_1425, _1425, _1861);
        float _1871 = fma(_1429, _1429, _1869);
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1875 = sqrt(_1871);
        float _1877 = 1.0 / _1521;
        float _1879 = precise::min(_1875, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1881 = _1879 * _1863;
        float _1883 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1885 = _1881 * _1877;
        float _1887 = -_1115;
        float _1889 = _1887 + _1837;
        float _1891 = -_1111;
        float _1893 = _1891 + _1839;
        float _1895 = _1883 * _1885;
        float _1897 = _1867 * _1885;
        float _1899 = fma(_1889, _1895, _1411);
        float _1901 = fma(_1893, _1895, _1407);
        float _1903 = fma(_1883, _1897, _1415);
        _1855 = _1901;
        _1857 = _1899;
        _1859 = _1903;
    }
    float _1905 = _1855;
    float _1907 = _1857;
    float _1909 = _1859;
    float _1911 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1919 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1911);
    float _1921 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1917);
    float _1927 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1919);
    float _1929 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1921);
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1933 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1925);
    float _1935 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1939 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1941 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1943 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1945 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1947 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1943);
    float _1953 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1955 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1947);
    float _1957 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1959 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1951);
    float _1961 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1953);
    float _1963 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1955);
    float _1965 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1957);
    float _1967 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1959);
    float _1969 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _1971 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1963);
    float _1973 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1965);
    float _1975 = _1967 + _1971;
    float _1977 = _1969 + _1971;
    float _1979 = _1971 * 0.5;
    float _1981 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1983 = _1975 * 0.5;
    float _1985 = _1977 * 0.5;
    float _1987 = fma(_1973, -0.5, _1979);
    out.m_35.x = _1981;
    out.gl_Position.x = _1967;
    out.gl_Position.y = _1973;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1971;
    out.m_54.x = _1983;
    out.m_54.y = _1987;
    out.m_54.z = _1985;
    out.m_54.w = _1971;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1783 = false;
    bool _907 = false;
    bool _739 = false;
    bool _559 = false;
    bool _445 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2044 = as_type<float>(_89);
        out.gl_Position.z = _2044;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2114 = as_type<float>(_127);
        out.gl_Position.z = _2114;
    }
    if (_119)
    {
        return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    float _157 = 0.0;
    float _159 = _131;
    if (!_143)
    {
        float _161 = _131 * _131;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    bool _303 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_297);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _297 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = in.m_42.x;
    float _333 = in.m_42.y;
    bool _335 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_297);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _321;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _351 = 1.0 / _325;
    float _353 = _301 * _347;
    bool _355 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_297);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = _365 * _329;
    float _377 = -_365;
    float _379 = _377 + 1.0;
    float _381 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = fma(_373, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _317 * _351;
    float _387 = _345 * _379;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -_345;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _401 = _381 * _387;
    float _403 = _383 * _387;
    float _405 = fma(_391, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_399, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _409 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _413 = fma(_405, _375, _409);
    float _415 = fma(_407, _375, _411);
    float _417 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    float _421 = _417 * _331;
    float _423 = _419 * _333;
    bool _425 = !_349;
    float _443;
    if (!_425)
    {
        float _427 = in.m_44.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_73);
        float _449 = 1.0 / _447;
        float _451 = _107 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = _453 + _455;
    bool _459 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _461 = isnan(_453);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _471;
    bool _475 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _477 = isnan(_453);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _491;
    float _495 = 1.0 / _473;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _499 = _485 * _489;
    float _501 = -_485;
    float _503 = _501 + 1.0;
    float _505 = _457 * _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _507;
    float _511 = fma(_493, _505, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = fma(_509, _505, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _519 = fma(_515, _505, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _521 = _511 * _499;
    float _523 = _519 * _499;
    float _525 = _517 * _499;
    float _527 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _521);
    float _529 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _523);
    float _531 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _525);
    float _533 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].x, _527);
    float _535 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].y, _529);
    float _537 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].z, _531);
    bool _539 = !_497;
    float _557;
    if (!_539)
    {
        float _541 = in.m_44.x;
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_73);
        float _563 = 1.0 / _561;
        float _565 = _107 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _571 = _567 + _569;
    float _573 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _585 = isnan(_567);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _599 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_567);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _577;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _613;
    float _617 = -_593;
    float _619 = _617 + 1.0;
    bool _621 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_567);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _635 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _637 = _609 * _619;
    float _639 = -_609;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _581;
    float _645 = 1.0 / _597;
    float _647 = _615 * _611;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = fma(_647, _571, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _655 = _631 * _641;
    bool _657 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _659 = isnan(_567);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _651 * _643;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _567 + _675;
    float _679 = -_631;
    float _681 = _679 + 1.0;
    float _683 = -_667;
    float _685 = _683 + 1.0;
    float _687 = fma(_669, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = _673 * _645;
    float _691 = _653 * _655;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _695 = _567 + _693;
    float _697 = _593 * _685;
    float _699 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    float _703 = fma(_689, _695, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _705 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_687, _637, _701);
    float _711 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_703, _697, _709);
    float _715 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[118].x, _713);
    float _717 = _715 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _705;
    out.m_46.y = _707;
    out.m_46.z = _711;
    out.m_46.w = _717;
    bool _719 = !_635;
    float _737;
    if (!_719)
    {
        float _721 = in.m_44.x;
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _725 = _721 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _729 = _727 * _723;
        float _731 = floor(_729);
        float _733 = -_731;
        float _735 = _729 + _733;
        _737 = _735;
        _739 = true;
    }
    else
    {
        float _741 = float(_73);
        float _743 = 1.0 / _741;
        float _745 = _107 * _743;
        _737 = _745;
    }
    _739 = false;
    float _747 = _737;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _751 = _747 + _749;
    bool _753 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _755 = isnan(_747);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _767 = _747 + _765;
    bool _769 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _771 = isnan(_747);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _791 = isnan(_747);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_763;
    float _803 = _801 + 1.0;
    float _805 = 1.0 / _783;
    float _807 = _799 * _803;
    float _809 = -_799;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _813;
    bool _817 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _819 = 1.0 / _787;
    float _821 = _779 * _811;
    float _823 = -_779;
    float _825 = _823 + 1.0;
    float _827 = _751 * _805;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _833;
    float _837 = fma(_815, _827, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _839 = fma(_831, _827, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _841 = fma(_835, _827, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _843 = _767 * _819;
    float _845 = _837 * _821;
    float _847 = _839 * _821;
    float _849 = _841 * _821;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _863 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].x, _845);
    float _865 = fma(_853, _843, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _867 = fma(_857, _843, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _869 = fma(_861, _843, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _871 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].y, _847);
    float _873 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].z, _849);
    float _875 = fma(_865, _807, _863);
    float _877 = fma(_867, _807, _871);
    float _879 = fma(_869, _807, _873);
    float _881 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].x, _875);
    float _883 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].y, _877);
    float _885 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].z, _879);
    bool _887 = !_817;
    float _905;
    if (!_887)
    {
        float _889 = in.m_44.x;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _893 = _889 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _897 = _895 * _891;
        float _899 = floor(_897);
        float _901 = -_899;
        float _903 = _897 + _901;
        _905 = _903;
        _907 = true;
    }
    else
    {
        float _909 = float(_73);
        float _911 = 1.0 / _909;
        float _913 = _107 * _911;
        _905 = _913;
    }
    _907 = false;
    float _915 = _905;
    float _917 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _919 = log2(_917);
    float _921 = in.m_44.z;
    float _923 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    float _929 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _933 = _931 != 0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = in.m_44.x;
    float _941 = in.m_44.y;
    float _943 = 1.0 / _937;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _953 = _919 * _107;
    float _955 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _923);
    float _957 = 1.0 / _947;
    float _959 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _963 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _965 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _967 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _969 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _961);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _971;
    float _975 = 1.0 / _951;
    float _977 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _967);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _979;
    float _983 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _969);
    float _985 = _973 * _943;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _991 = _939 * 2.0;
    float _993 = exp2(_953);
    float _995 = _981 * _957;
    bool _997 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _999 = isnan(_915);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = _941 * 2.0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1021 = _1019 != 0;
    float _1023 = _921 * 2.0;
    bool _1025 = _939 > 0.5;
    float _1027 = _989 * _975;
    bool _1029 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1031 = isnan(1.0);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1037 = _1033 || _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1041 = 1.0 + _1039;
    float _1043 = -_183;
    int _1045 = _1025 ? as_type<int>(_1043) : as_type<int>(_183);
    float _1047 = floor(_1023);
    bool _1049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1057 = _1053 || _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _915 + _1059;
    bool _1063 = !_927;
    float _1065 = _1063 ? _183 : as_type<float>(_1045);
    float _1067 = -_993;
    float _1069 = _1067 + 1.0;
    bool _1071 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1073 = isnan(_915);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -_1007;
    float _1085 = _1083 + 1.0;
    float _1087 = fma(_985, _1061, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1089 = floor(_991);
    float _1091 = _1057 ? _1069 : 0.0;
    float _1093 = _1081 * _1085;
    bool _1095 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1097 = isnan(_915);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    float _1111 = _977 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1113 = _1065 + 0.5;
    float _1115 = _963 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1117 = 1.0 / _1041;
    bool _1119 = _1047 > 0.0;
    float _1121 = _1105 * _1109;
    bool _1123 = _1047 >= 0.0;
    bool _1125 = isnan(_1047);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan(0.0);
    bool _1131 = _1127 || _1129;
    float _1133 = -_1105;
    float _1135 = _1133 + 1.0;
    bool _1137 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1139 = isnan(_915);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = _1111 + _1149;
    int _1153 = _1131 ? 0 : 1;
    float _1155 = floor(_1009);
    bool _1157 = _1089 >= 0.0;
    bool _1159 = isnan(_1089);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.0);
    bool _1165 = _1161 || _1163;
    float _1167 = _1147 * _1135;
    bool _1169 = !_1013;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = -_1147;
    float _1175 = _1173 + 1.0;
    float _1177 = _983 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1179 = _1087 * _1167;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1183 = _915 + _1181;
    if (_1037)
    {
        float _1185 = _1091 * _1117;
        _109 = _1185;
    }
    float _1187 = _109;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1191 = _915 + _1189;
    int _1193 = _1165 ? 0 : 1;
    float _1195 = fma(_1027, _1183, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1197 = _1089 > 0.0;
    float _1199 = fma(_995, _1191, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1203 = ~_1153;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1179);
    bool _1211 = _1155 > 0.0;
    float _1213 = _1151 * _1151;
    bool _1215 = _1155 >= 0.0;
    bool _1217 = isnan(_1155);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan(0.0);
    bool _1223 = _1219 || _1221;
    float _1225 = _941 + _939;
    int _1227 = _1207;
    if (!_1119)
    {
        int _1229 = ~_1153;
        int _1231 = _1229 + 1;
        _1227 = _1231;
    }
    int _1233 = _1227;
    float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1237 = _941 > 0.5;
    float _1239 = _1225 + (-1.0);
    int _1241 = _1223 ? 0 : 1;
    float _1243 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1245 = abs(_1171);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1249 = -_187;
    int _1251 = _1237 ? as_type<int>(_1249) : as_type<int>(_187);
    float _1253 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1255 = ~_1241;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    float _1261 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = float(_1245);
    float _1265 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = float(_1233);
    float _1269 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1271 = _1259;
    if (!_1211)
    {
        int _1273 = ~_1241;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = fma(_1195, _1121, _1209);
    bool _1281 = !_933;
    float _1283 = _1281 ? _187 : as_type<float>(_1251);
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1287 = _1115 + _1285;
    bool _1289 = !_1017;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = _1269 * _1201;
    int _1295 = ~_1193;
    int _1297 = _1295 + 1;
    int _1299 = _1297 + 1;
    float _1301 = fma(_1199, _1093, _1279);
    int _1303 = _1299;
    float _1305 = _1301;
    if (!_1197)
    {
        int _1307 = ~_1193;
        int _1309 = _1307 + 1;
        _1303 = _1309;
    }
    int _1311 = _1303;
    float _1313 = _1263 * _1267;
    float _1315 = -_1283;
    float _1317 = _1315 + 0.5;
    int _1319 = abs(_1291);
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1323 = _1177 + _1321;
    float _1325 = fma(_1287, _1287, _1213);
    float _1327 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1329 = in.m_48.x;
    float _1331 = in.m_48.y;
    float _1333 = in.m_48.z;
    float _1335 = _1313 * (-2.0);
    float _1337 = fma(_1323, _1323, _1325);
    float _1339 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1327);
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1343 = float(_1319);
    float _1345 = fma(_1247, _1335, _1247);
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1339);
    float _1349 = rsqrt(_1337);
    float _1351 = float(_1311);
    float _1353 = _1341 * _1235;
    float _1355 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1301);
    bool _1357 = _1347 >= 0.0;
    float _1359 = _1343 * _1351;
    out.m_50.x = _1293;
    out.m_50.y = _1353;
    float _1361 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_52.x = _1253;
    out.m_52.y = _1261;
    out.m_52.z = _1265;
    out.m_52.w = _1361;
    float _1363 = _1151 * _1349;
    float _1365 = _1287 * _1349;
    if (_1357)
    {
        _1305 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1367 = _1305;
    float _1369 = fma(_1335, _1329, _1329);
    float _1371 = -_1363;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    float _1375 = -_1365;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1379 = _1323 * _1349;
    float _1381 = _1373 * _1373;
    int _1383 = as_type<int>(_1367);
    if (_1357)
    {
        float _1385 = _1367 * 5.0;
        _1383 = as_type<int>(_1385);
    }
    int _1387 = _1383;
    if (_1357)
    {
        out.m_35.x = 0.0;
    }
    float _1389 = -_1379;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1323);
    float _1393 = fma(_1377, _1377, _1381);
    float _1395 = _939 + (-0.5);
    if (_1357)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4100 = as_type<float>(_1387);
        out.gl_Position.z = _4100;
    }
    float _1397 = fma(_1391, _1391, _1393);
    float _1399 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1369);
    bool _1401 = !_1021;
    int _1403 = _1401 ? 0 : 1;
    if (_1357)
    {
        return out;
    }
    float _1405 = -_1363;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1409 = -_1365;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1413 = -_1379;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1177);
    int _1417 = abs(_1403);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1421 = _1407 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1425 = _1411 + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1429 = _1415 + _1427;
    float _1431 = _941 + _921;
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1435 = float(_1417);
    float _1437 = _1359 * (-2.0);
    float _1439 = _1431 + (-1.0);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1443 = float(_1277);
    float _1445 = _921 + _939;
    float _1447 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1449 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1441);
    float _1451 = _941 + (-0.5);
    float _1453 = _1435 * _1443;
    float _1455 = _1445 + (-1.0);
    float _1457 = fma(_1447, _1437, _1447);
    bool _1459 = _1449 >= 0.0;
    float _1461 = fma(_1437, _1331, _1331);
    float _1463 = _1453 * (-2.0);
    float _1465 = _921 + (-0.5);
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1461);
    float _1469 = fma(_1345, _1187, _1399);
    float _1471 = fma(_1463, _1333, _1333);
    float _1473 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1475 = fma(_1457, _1187, _1467);
    float _1477 = _1469 * 0.15915493667125701904296875;
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1471);
    float _1481 = fma(_1473, _1463, _1473);
    float _1483 = _1475 * 0.15915493667125701904296875;
    float _1485 = _1461;
    int _1487 = as_type<int>(_1471);
    if (_1459)
    {
        _1485 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1489 = _1485;
    float _1491 = sqrt(_1397);
    float _1493 = fma(_1481, _1187, _1479);
    if (_1459)
    {
        out.m_35.x = 0.0;
    }
    if (_1459)
    {
        float _1495 = _1489 * 5.0;
        _1487 = as_type<int>(_1495);
    }
    int _1497 = _1487;
    float _1499 = _1493 * 0.15915493667125701904296875;
    float _1501 = _1477 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    if (_1459)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4292 = as_type<float>(_1497);
        out.gl_Position.z = _4292;
    }
    float _1505 = _1477 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    float _1509 = _1483 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = _1483 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    if (_1459)
    {
        return out;
    }
    float _1517 = _1499 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = _1349 * _1491;
    float _1523 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1527 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1531 = _1521 * _1523;
    float _1533 = _1507 * _1515;
    float _1535 = _1499 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = _1521 * _1527;
    float _1541 = _1525 * _1531;
    float _1543 = _1503 * _1511;
    float _1545 = _1507 * _1511;
    float _1547 = _1529 * _1539;
    float _1549 = _1519 * _1541;
    float _1551 = _1511 * _1519;
    float _1553 = _1515 * _1519;
    float _1555 = _1503 * _1515;
    float _1557 = _1507 * _1549;
    float _1559 = fma(_1537, _1533, _1543);
    float _1561 = -_1541;
    float _1563 = _1537 * _1561;
    float _1565 = -_1555;
    float _1567 = fma(_1537, _1545, _1565);
    float _1569 = -_1545;
    float _1571 = fma(_1537, _1555, _1569);
    float _1573 = fma(_1559, _1547, _1557);
    float _1575 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1577 = _1575 * 0.5;
    float _1579 = _1503 * _1549;
    float _1581 = fma(_1553, _1547, _1563);
    float _1583 = fma(_1537, _1543, _1533);
    float _1585 = fma(_1567, _1577, _1573);
    float _1587 = fma(_1571, _1547, _1579);
    float _1589 = fma(_1551, _1577, _1581);
    float _1591 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1593 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = fma(_1583, _1577, _1587);
    float _1597 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1591);
    float _1599 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1601 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1597);
    float _1603 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1599);
    float _1605 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1607 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1609 = _1115 + _1605;
    float _1611 = _1177 + _1607;
    float _1613 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1617 = _1609 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1621 = _1611 + _1619;
    float _1623 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1613);
    float _1625 = _1617 * _1617;
    float _1627 = _1621 * _1621;
    float _1629 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1623);
    float _1631 = _1625 + _1627;
    float _1633 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1635 = sqrt(_1631);
    float _1637 = _1111 + _1633;
    bool _1639 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = _1595;
    float _1643 = _1629;
    float _1645 = _1633;
    float _1647 = _1609;
    float _1649 = _1627;
    if (!_1639)
    {
        _1641 = _1609;
    }
    float _1651 = _1641;
    float _1653 = _1651;
    if (!_1639)
    {
        _1643 = _1625;
    }
    float _1655 = _1643;
    float _1657 = _1655;
    if (!_1639)
    {
        _1645 = _1611;
    }
    float _1659 = _1645;
    float _1661 = _1659;
    if (!_1639)
    {
        _1647 = _1637;
    }
    float _1663 = _1647;
    bool _1665 = !_1639;
    float _1667 = _1663;
    if (!_1665)
    {
        float _1669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1673 = _1635 + _1671;
        float _1675 = rsqrt(_1631);
        float _1677 = _1673 * _1669;
        float _1679 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = _1677 * 0.15915493667125701904296875;
        float _1683 = _1681 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = _1681 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        float _1691 = fma(_1685, _1679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1693 = _1675 * _1691;
        float _1695 = _1689 + (-1.0);
        float _1697 = fma(_1617, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1699 = fma(_1621, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1701 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1705 = _1697 + _1703;
        float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1709 = _1699 + _1707;
        float _1711 = fma(_1637, _1689, _1701);
        float _1713 = _1705 * _1705;
        float _1715 = _1709 * _1709;
        _1667 = _1711;
        _1657 = _1713;
        _1649 = _1715;
        _1653 = _1697;
        _1661 = _1699;
    }
    float _1717 = _1667;
    float _1719 = _1657;
    float _1721 = _1649;
    float _1723 = _1653;
    float _1725 = _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1729 = _1717 + _1727;
    float _1731 = fma(_1729, _1729, _1719);
    float _1733 = _1731 + _1721;
    float _1735 = sqrt(_1733);
    bool _1737 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1739 = isnan(_1735);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1745 = _1741 || _1743;
    float _1747 = _1719;
    if (!_1745)
    {
        _1747 = 1.0;
    }
    float _1749 = _1747;
    bool _1751 = !_1745;
    float _1753 = _1749;
    if (!_1751)
    {
        bool _1755 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1757 = isnan(_1735);
        bool _1759 = _1755 || _1757;
        bool _1761 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1763 = _1759 || _1761;
        if (!_1763)
        {
            float _1765 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1767 = _1735 + _1765;
            float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1771 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1769;
            float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1775 = _1773 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1777 = 1.0 / _1771;
            float _1779 = _1767 * _1777;
            float _1781 = fma(_1779, _1775, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1753 = _1781;
            _1783 = true;
        }
        else
        {
            bool _1785 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1787 = isnan(_1735);
            bool _1789 = _1785 || _1787;
            bool _1791 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1793 = _1789 || _1791;
            if (!_1793)
            {
                float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1797 = _1735 + _1795;
                float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1801 = _1799 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1805 = _1803 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1807 = 1.0 / _1801;
                float _1809 = _1797 * _1807;
                float _1811 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1753 = _1811;
                _1783 = true;
            }
            else
            {
                _1753 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1783 = false;
    float _1813 = _1753;
    float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1817 = _1723 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1821 = _1717 + _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1825 = _1725 + _1823;
    bool _1827 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.5);
    bool _1835 = _1831 || _1833;
    float _1837 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1839 = fma(_1821, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1841 = fma(_1825, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = -_1365;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _1847 = -_1363;
    float _1849 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1839);
    float _1851 = -_1379;
    float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1841);
    float _1855 = _1849;
    float _1857 = _1845;
    float _1859 = _1853;
    if (!_1835)
    {
        float _1861 = _1421 * _1421;
        float _1863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1865 = -_1177;
        float _1867 = _1865 + _1841;
        float _1869 = fma(_1425, _1425, _1861);
        float _1871 = fma(_1429, _1429, _1869);
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1875 = sqrt(_1871);
        float _1877 = 1.0 / _1521;
        float _1879 = precise::min(_1875, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1881 = _1879 * _1863;
        float _1883 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1885 = _1881 * _1877;
        float _1887 = -_1115;
        float _1889 = _1887 + _1837;
        float _1891 = -_1111;
        float _1893 = _1891 + _1839;
        float _1895 = _1883 * _1885;
        float _1897 = _1867 * _1885;
        float _1899 = fma(_1889, _1895, _1411);
        float _1901 = fma(_1893, _1895, _1407);
        float _1903 = fma(_1883, _1897, _1415);
        _1855 = _1901;
        _1857 = _1899;
        _1859 = _1903;
    }
    float _1905 = _1855;
    float _1907 = _1857;
    float _1909 = _1859;
    float _1911 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1919 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1911);
    float _1921 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1917);
    float _1927 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1919);
    float _1929 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1921);
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1933 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1925);
    float _1935 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1939 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1941 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1943 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1945 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1947 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1943);
    float _1953 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1955 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1947);
    float _1957 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1959 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1951);
    float _1961 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1953);
    float _1963 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1955);
    float _1965 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1957);
    float _1967 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1959);
    float _1969 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _1971 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1963);
    float _1973 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1965);
    float _1975 = _1967 + _1971;
    float _1977 = _1969 + _1971;
    float _1979 = _1971 * 0.5;
    float _1981 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1983 = _1975 * 0.5;
    float _1985 = _1977 * 0.5;
    float _1987 = fma(_1973, -0.5, _1979);
    out.m_35.x = _1981;
    out.gl_Position.x = _1967;
    out.gl_Position.y = _1973;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1971;
    out.m_54.x = _1983;
    out.m_54.y = _1987;
    out.m_54.z = _1985;
    out.m_54.w = _1971;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1783 = false;
    bool _907 = false;
    bool _739 = false;
    bool _559 = false;
    bool _445 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2044 = as_type<float>(_89);
        out.gl_Position.z = _2044;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2114 = as_type<float>(_127);
        out.gl_Position.z = _2114;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    float _157 = 0.0;
    float _159 = _131;
    if (!_143)
    {
        float _161 = _131 * _131;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    bool _303 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_297);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _297 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = in.m_42.x;
    float _333 = in.m_42.y;
    bool _335 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_297);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _321;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _351 = 1.0 / _325;
    float _353 = _301 * _347;
    bool _355 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_297);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = _365 * _329;
    float _377 = -_365;
    float _379 = _377 + 1.0;
    float _381 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = fma(_373, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _317 * _351;
    float _387 = _345 * _379;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -_345;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _401 = _381 * _387;
    float _403 = _383 * _387;
    float _405 = fma(_391, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_399, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _409 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _413 = fma(_405, _375, _409);
    float _415 = fma(_407, _375, _411);
    float _417 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    float _421 = _417 * _331;
    float _423 = _419 * _333;
    bool _425 = !_349;
    float _443;
    if (!_425)
    {
        float _427 = in.m_44.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_73);
        float _449 = 1.0 / _447;
        float _451 = _107 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = _453 + _455;
    bool _459 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _461 = isnan(_453);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _471;
    bool _475 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _477 = isnan(_453);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _491;
    float _495 = 1.0 / _473;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _499 = _485 * _489;
    float _501 = -_485;
    float _503 = _501 + 1.0;
    float _505 = _457 * _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _507;
    float _511 = fma(_493, _505, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = fma(_509, _505, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _519 = fma(_515, _505, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _521 = _511 * _499;
    float _523 = _519 * _499;
    float _525 = _517 * _499;
    float _527 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _521);
    float _529 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _523);
    float _531 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _525);
    float _533 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].x, _527);
    float _535 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].y, _529);
    float _537 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[108].z, _531);
    bool _539 = !_497;
    float _557;
    if (!_539)
    {
        float _541 = in.m_44.x;
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_73);
        float _563 = 1.0 / _561;
        float _565 = _107 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _571 = _567 + _569;
    float _573 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _585 = isnan(_567);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _599 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_567);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _577;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _613;
    float _617 = -_593;
    float _619 = _617 + 1.0;
    bool _621 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_567);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _635 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _637 = _609 * _619;
    float _639 = -_609;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _581;
    float _645 = 1.0 / _597;
    float _647 = _615 * _611;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = fma(_647, _571, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _655 = _631 * _641;
    bool _657 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _659 = isnan(_567);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _651 * _643;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _567 + _675;
    float _679 = -_631;
    float _681 = _679 + 1.0;
    float _683 = -_667;
    float _685 = _683 + 1.0;
    float _687 = fma(_669, _677, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = _673 * _645;
    float _691 = _653 * _655;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _695 = _567 + _693;
    float _697 = _593 * _685;
    float _699 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    float _703 = fma(_689, _695, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _705 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_687, _637, _701);
    float _711 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_703, _697, _709);
    float _715 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[118].x, _713);
    float _717 = _715 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _705;
    out.m_46.y = _707;
    out.m_46.z = _711;
    out.m_46.w = _717;
    bool _719 = !_635;
    float _737;
    if (!_719)
    {
        float _721 = in.m_44.x;
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _725 = _721 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _729 = _727 * _723;
        float _731 = floor(_729);
        float _733 = -_731;
        float _735 = _729 + _733;
        _737 = _735;
        _739 = true;
    }
    else
    {
        float _741 = float(_73);
        float _743 = 1.0 / _741;
        float _745 = _107 * _743;
        _737 = _745;
    }
    _739 = false;
    float _747 = _737;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _751 = _747 + _749;
    bool _753 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _755 = isnan(_747);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _767 = _747 + _765;
    bool _769 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _771 = isnan(_747);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _791 = isnan(_747);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_763;
    float _803 = _801 + 1.0;
    float _805 = 1.0 / _783;
    float _807 = _799 * _803;
    float _809 = -_799;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _813;
    bool _817 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _819 = 1.0 / _787;
    float _821 = _779 * _811;
    float _823 = -_779;
    float _825 = _823 + 1.0;
    float _827 = _751 * _805;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _833;
    float _837 = fma(_815, _827, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _839 = fma(_831, _827, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _841 = fma(_835, _827, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _843 = _767 * _819;
    float _845 = _837 * _821;
    float _847 = _839 * _821;
    float _849 = _841 * _821;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _863 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].x, _845);
    float _865 = fma(_853, _843, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _867 = fma(_857, _843, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _869 = fma(_861, _843, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _871 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].y, _847);
    float _873 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[123].z, _849);
    float _875 = fma(_865, _807, _863);
    float _877 = fma(_867, _807, _871);
    float _879 = fma(_869, _807, _873);
    float _881 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].x, _875);
    float _883 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].y, _877);
    float _885 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].z, _879);
    bool _887 = !_817;
    float _905;
    if (!_887)
    {
        float _889 = in.m_44.x;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _893 = _889 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _897 = _895 * _891;
        float _899 = floor(_897);
        float _901 = -_899;
        float _903 = _897 + _901;
        _905 = _903;
        _907 = true;
    }
    else
    {
        float _909 = float(_73);
        float _911 = 1.0 / _909;
        float _913 = _107 * _911;
        _905 = _913;
    }
    _907 = false;
    float _915 = _905;
    float _917 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _919 = log2(_917);
    float _921 = in.m_44.z;
    float _923 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    float _929 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _933 = _931 != 0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = in.m_44.x;
    float _941 = in.m_44.y;
    float _943 = 1.0 / _937;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _953 = _919 * _107;
    float _955 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _923);
    float _957 = 1.0 / _947;
    float _959 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _963 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _965 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _967 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _969 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _961);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _971;
    float _975 = 1.0 / _951;
    float _977 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _967);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _979;
    float _983 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _969);
    float _985 = _973 * _943;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _991 = _939 * 2.0;
    float _993 = exp2(_953);
    float _995 = _981 * _957;
    bool _997 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _999 = isnan(_915);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = _941 * 2.0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1021 = _1019 != 0;
    float _1023 = _921 * 2.0;
    bool _1025 = _939 > 0.5;
    float _1027 = _989 * _975;
    bool _1029 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1031 = isnan(1.0);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1037 = _1033 || _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1041 = 1.0 + _1039;
    float _1043 = -_183;
    int _1045 = _1025 ? as_type<int>(_1043) : as_type<int>(_183);
    float _1047 = floor(_1023);
    bool _1049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1057 = _1053 || _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _915 + _1059;
    bool _1063 = !_927;
    float _1065 = _1063 ? _183 : as_type<float>(_1045);
    float _1067 = -_993;
    float _1069 = _1067 + 1.0;
    bool _1071 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1073 = isnan(_915);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -_1007;
    float _1085 = _1083 + 1.0;
    float _1087 = fma(_985, _1061, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1089 = floor(_991);
    float _1091 = _1057 ? _1069 : 0.0;
    float _1093 = _1081 * _1085;
    bool _1095 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1097 = isnan(_915);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    float _1111 = _977 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1113 = _1065 + 0.5;
    float _1115 = _963 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1117 = 1.0 / _1041;
    bool _1119 = _1047 > 0.0;
    float _1121 = _1105 * _1109;
    bool _1123 = _1047 >= 0.0;
    bool _1125 = isnan(_1047);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan(0.0);
    bool _1131 = _1127 || _1129;
    float _1133 = -_1105;
    float _1135 = _1133 + 1.0;
    bool _1137 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1139 = isnan(_915);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = _1111 + _1149;
    int _1153 = _1131 ? 0 : 1;
    float _1155 = floor(_1009);
    bool _1157 = _1089 >= 0.0;
    bool _1159 = isnan(_1089);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.0);
    bool _1165 = _1161 || _1163;
    float _1167 = _1147 * _1135;
    bool _1169 = !_1013;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = -_1147;
    float _1175 = _1173 + 1.0;
    float _1177 = _983 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1179 = _1087 * _1167;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1183 = _915 + _1181;
    if (_1037)
    {
        float _1185 = _1091 * _1117;
        _109 = _1185;
    }
    float _1187 = _109;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1191 = _915 + _1189;
    int _1193 = _1165 ? 0 : 1;
    float _1195 = fma(_1027, _1183, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1197 = _1089 > 0.0;
    float _1199 = fma(_995, _1191, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1203 = ~_1153;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1179);
    bool _1211 = _1155 > 0.0;
    float _1213 = _1151 * _1151;
    bool _1215 = _1155 >= 0.0;
    bool _1217 = isnan(_1155);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan(0.0);
    bool _1223 = _1219 || _1221;
    float _1225 = _941 + _939;
    int _1227 = _1207;
    if (!_1119)
    {
        int _1229 = ~_1153;
        int _1231 = _1229 + 1;
        _1227 = _1231;
    }
    int _1233 = _1227;
    float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1237 = _941 > 0.5;
    float _1239 = _1225 + (-1.0);
    int _1241 = _1223 ? 0 : 1;
    float _1243 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1245 = abs(_1171);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1249 = -_187;
    int _1251 = _1237 ? as_type<int>(_1249) : as_type<int>(_187);
    float _1253 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1255 = ~_1241;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    float _1261 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = float(_1245);
    float _1265 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = float(_1233);
    float _1269 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1271 = _1259;
    if (!_1211)
    {
        int _1273 = ~_1241;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = fma(_1195, _1121, _1209);
    bool _1281 = !_933;
    float _1283 = _1281 ? _187 : as_type<float>(_1251);
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1287 = _1115 + _1285;
    bool _1289 = !_1017;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = _1269 * _1201;
    int _1295 = ~_1193;
    int _1297 = _1295 + 1;
    int _1299 = _1297 + 1;
    float _1301 = fma(_1199, _1093, _1279);
    int _1303 = _1299;
    float _1305 = _1301;
    if (!_1197)
    {
        int _1307 = ~_1193;
        int _1309 = _1307 + 1;
        _1303 = _1309;
    }
    int _1311 = _1303;
    float _1313 = _1263 * _1267;
    float _1315 = -_1283;
    float _1317 = _1315 + 0.5;
    int _1319 = abs(_1291);
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1323 = _1177 + _1321;
    float _1325 = fma(_1287, _1287, _1213);
    float _1327 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1329 = in.m_48.x;
    float _1331 = in.m_48.y;
    float _1333 = in.m_48.z;
    float _1335 = _1313 * (-2.0);
    float _1337 = fma(_1323, _1323, _1325);
    float _1339 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1327);
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1343 = float(_1319);
    float _1345 = fma(_1247, _1335, _1247);
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1339);
    float _1349 = rsqrt(_1337);
    float _1351 = float(_1311);
    float _1353 = _1341 * _1235;
    float _1355 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1301);
    bool _1357 = _1347 >= 0.0;
    float _1359 = _1343 * _1351;
    out.m_50.x = _1293;
    out.m_50.y = _1353;
    float _1361 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_52.x = _1253;
    out.m_52.y = _1261;
    out.m_52.z = _1265;
    out.m_52.w = _1361;
    float _1363 = _1151 * _1349;
    float _1365 = _1287 * _1349;
    if (_1357)
    {
        _1305 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1367 = _1305;
    float _1369 = fma(_1335, _1329, _1329);
    float _1371 = -_1363;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    float _1375 = -_1365;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1379 = _1323 * _1349;
    float _1381 = _1373 * _1373;
    int _1383 = as_type<int>(_1367);
    if (_1357)
    {
        float _1385 = _1367 * 5.0;
        _1383 = as_type<int>(_1385);
    }
    int _1387 = _1383;
    if (_1357)
    {
        out.m_35.x = 0.0;
    }
    float _1389 = -_1379;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1323);
    float _1393 = fma(_1377, _1377, _1381);
    float _1395 = _939 + (-0.5);
    if (_1357)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4100 = as_type<float>(_1387);
        out.gl_Position.z = _4100;
    }
    float _1397 = fma(_1391, _1391, _1393);
    float _1399 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1369);
    bool _1401 = !_1021;
    int _1403 = _1401 ? 0 : 1;
    if (_1357)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1405 = -_1363;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1409 = -_1365;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1413 = -_1379;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1177);
    int _1417 = abs(_1403);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1421 = _1407 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1425 = _1411 + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1429 = _1415 + _1427;
    float _1431 = _941 + _921;
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1435 = float(_1417);
    float _1437 = _1359 * (-2.0);
    float _1439 = _1431 + (-1.0);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1443 = float(_1277);
    float _1445 = _921 + _939;
    float _1447 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1449 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1441);
    float _1451 = _941 + (-0.5);
    float _1453 = _1435 * _1443;
    float _1455 = _1445 + (-1.0);
    float _1457 = fma(_1447, _1437, _1447);
    bool _1459 = _1449 >= 0.0;
    float _1461 = fma(_1437, _1331, _1331);
    float _1463 = _1453 * (-2.0);
    float _1465 = _921 + (-0.5);
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1461);
    float _1469 = fma(_1345, _1187, _1399);
    float _1471 = fma(_1463, _1333, _1333);
    float _1473 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1475 = fma(_1457, _1187, _1467);
    float _1477 = _1469 * 0.15915493667125701904296875;
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1471);
    float _1481 = fma(_1473, _1463, _1473);
    float _1483 = _1475 * 0.15915493667125701904296875;
    float _1485 = _1461;
    int _1487 = as_type<int>(_1471);
    if (_1459)
    {
        _1485 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1489 = _1485;
    float _1491 = sqrt(_1397);
    float _1493 = fma(_1481, _1187, _1479);
    if (_1459)
    {
        out.m_35.x = 0.0;
    }
    if (_1459)
    {
        float _1495 = _1489 * 5.0;
        _1487 = as_type<int>(_1495);
    }
    int _1497 = _1487;
    float _1499 = _1493 * 0.15915493667125701904296875;
    float _1501 = _1477 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    if (_1459)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4292 = as_type<float>(_1497);
        out.gl_Position.z = _4292;
    }
    float _1505 = _1477 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    float _1509 = _1483 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = _1483 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    if (_1459)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1517 = _1499 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = _1349 * _1491;
    float _1523 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1527 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1531 = _1521 * _1523;
    float _1533 = _1507 * _1515;
    float _1535 = _1499 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = _1521 * _1527;
    float _1541 = _1525 * _1531;
    float _1543 = _1503 * _1511;
    float _1545 = _1507 * _1511;
    float _1547 = _1529 * _1539;
    float _1549 = _1519 * _1541;
    float _1551 = _1511 * _1519;
    float _1553 = _1515 * _1519;
    float _1555 = _1503 * _1515;
    float _1557 = _1507 * _1549;
    float _1559 = fma(_1537, _1533, _1543);
    float _1561 = -_1541;
    float _1563 = _1537 * _1561;
    float _1565 = -_1555;
    float _1567 = fma(_1537, _1545, _1565);
    float _1569 = -_1545;
    float _1571 = fma(_1537, _1555, _1569);
    float _1573 = fma(_1559, _1547, _1557);
    float _1575 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1577 = _1575 * 0.5;
    float _1579 = _1503 * _1549;
    float _1581 = fma(_1553, _1547, _1563);
    float _1583 = fma(_1537, _1543, _1533);
    float _1585 = fma(_1567, _1577, _1573);
    float _1587 = fma(_1571, _1547, _1579);
    float _1589 = fma(_1551, _1577, _1581);
    float _1591 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1593 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = fma(_1583, _1577, _1587);
    float _1597 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1591);
    float _1599 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1601 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1597);
    float _1603 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1599);
    float _1605 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1607 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1609 = _1115 + _1605;
    float _1611 = _1177 + _1607;
    float _1613 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1617 = _1609 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1621 = _1611 + _1619;
    float _1623 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1613);
    float _1625 = _1617 * _1617;
    float _1627 = _1621 * _1621;
    float _1629 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1623);
    float _1631 = _1625 + _1627;
    float _1633 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1635 = sqrt(_1631);
    float _1637 = _1111 + _1633;
    bool _1639 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = _1595;
    float _1643 = _1629;
    float _1645 = _1633;
    float _1647 = _1609;
    float _1649 = _1627;
    if (!_1639)
    {
        _1641 = _1609;
    }
    float _1651 = _1641;
    float _1653 = _1651;
    if (!_1639)
    {
        _1643 = _1625;
    }
    float _1655 = _1643;
    float _1657 = _1655;
    if (!_1639)
    {
        _1645 = _1611;
    }
    float _1659 = _1645;
    float _1661 = _1659;
    if (!_1639)
    {
        _1647 = _1637;
    }
    float _1663 = _1647;
    bool _1665 = !_1639;
    float _1667 = _1663;
    if (!_1665)
    {
        float _1669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1673 = _1635 + _1671;
        float _1675 = rsqrt(_1631);
        float _1677 = _1673 * _1669;
        float _1679 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = _1677 * 0.15915493667125701904296875;
        float _1683 = _1681 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = _1681 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        float _1691 = fma(_1685, _1679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1693 = _1675 * _1691;
        float _1695 = _1689 + (-1.0);
        float _1697 = fma(_1617, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1699 = fma(_1621, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1701 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1705 = _1697 + _1703;
        float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1709 = _1699 + _1707;
        float _1711 = fma(_1637, _1689, _1701);
        float _1713 = _1705 * _1705;
        float _1715 = _1709 * _1709;
        _1667 = _1711;
        _1657 = _1713;
        _1649 = _1715;
        _1653 = _1697;
        _1661 = _1699;
    }
    float _1717 = _1667;
    float _1719 = _1657;
    float _1721 = _1649;
    float _1723 = _1653;
    float _1725 = _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1729 = _1717 + _1727;
    float _1731 = fma(_1729, _1729, _1719);
    float _1733 = _1731 + _1721;
    float _1735 = sqrt(_1733);
    bool _1737 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1739 = isnan(_1735);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1745 = _1741 || _1743;
    float _1747 = _1719;
    if (!_1745)
    {
        _1747 = 1.0;
    }
    float _1749 = _1747;
    bool _1751 = !_1745;
    float _1753 = _1749;
    if (!_1751)
    {
        bool _1755 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1757 = isnan(_1735);
        bool _1759 = _1755 || _1757;
        bool _1761 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1763 = _1759 || _1761;
        if (!_1763)
        {
            float _1765 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1767 = _1735 + _1765;
            float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1771 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1769;
            float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1775 = _1773 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1777 = 1.0 / _1771;
            float _1779 = _1767 * _1777;
            float _1781 = fma(_1779, _1775, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1753 = _1781;
            _1783 = true;
        }
        else
        {
            bool _1785 = _1735 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1787 = isnan(_1735);
            bool _1789 = _1785 || _1787;
            bool _1791 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1793 = _1789 || _1791;
            if (!_1793)
            {
                float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1797 = _1735 + _1795;
                float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1801 = _1799 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1805 = _1803 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1807 = 1.0 / _1801;
                float _1809 = _1797 * _1807;
                float _1811 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1753 = _1811;
                _1783 = true;
            }
            else
            {
                _1753 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1783 = false;
    float _1813 = _1753;
    float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1817 = _1723 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1821 = _1717 + _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1825 = _1725 + _1823;
    bool _1827 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.5);
    bool _1835 = _1831 || _1833;
    float _1837 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1839 = fma(_1821, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1841 = fma(_1825, _1813, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = -_1365;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _1847 = -_1363;
    float _1849 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1839);
    float _1851 = -_1379;
    float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1841);
    float _1855 = _1849;
    float _1857 = _1845;
    float _1859 = _1853;
    if (!_1835)
    {
        float _1861 = _1421 * _1421;
        float _1863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1865 = -_1177;
        float _1867 = _1865 + _1841;
        float _1869 = fma(_1425, _1425, _1861);
        float _1871 = fma(_1429, _1429, _1869);
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1875 = sqrt(_1871);
        float _1877 = 1.0 / _1521;
        float _1879 = precise::min(_1875, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1881 = _1879 * _1863;
        float _1883 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1885 = _1881 * _1877;
        float _1887 = -_1115;
        float _1889 = _1887 + _1837;
        float _1891 = -_1111;
        float _1893 = _1891 + _1839;
        float _1895 = _1883 * _1885;
        float _1897 = _1867 * _1885;
        float _1899 = fma(_1889, _1895, _1411);
        float _1901 = fma(_1893, _1895, _1407);
        float _1903 = fma(_1883, _1897, _1415);
        _1855 = _1901;
        _1857 = _1899;
        _1859 = _1903;
    }
    float _1905 = _1855;
    float _1907 = _1857;
    float _1909 = _1859;
    float _1911 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1919 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1911);
    float _1921 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1917);
    float _1927 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1919);
    float _1929 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1921);
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1933 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1925);
    float _1935 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1939 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1941 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1943 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1945 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1947 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1943);
    float _1953 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1955 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1947);
    float _1957 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1959 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1951);
    float _1961 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1953);
    float _1963 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1955);
    float _1965 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1957);
    float _1967 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1959);
    float _1969 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _1971 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1963);
    float _1973 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1965);
    float _1975 = _1967 + _1971;
    float _1977 = _1969 + _1971;
    float _1979 = _1971 * 0.5;
    float _1981 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1983 = _1975 * 0.5;
    float _1985 = _1977 * 0.5;
    float _1987 = fma(_1973, -0.5, _1979);
    out.m_35.x = _1981;
    out.gl_Position.x = _1967;
    out.gl_Position.y = _1973;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1971;
    out.m_54.x = _1983;
    out.m_54.y = _1987;
    out.m_54.z = _1985;
    out.m_54.w = _1971;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

