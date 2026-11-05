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
    bool _1737 = false;
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
        float _1998 = as_type<float>(_89);
        out.gl_Position.z = _1998;
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
        float _2068 = as_type<float>(_127);
        out.gl_Position.z = _2068;
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
    bool _319 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _337;
    bool _345 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_297);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _329 * _341;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _369 = _355 * _361;
    float _371 = 1.0 / _333;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = -_355;
    float _379 = _377 + 1.0;
    float _381 = _317 * _343;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = fma(_365, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = fma(_385, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = _301 * _371;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = in.m_42.x;
    float _399 = in.m_42.y;
    float _401 = fma(_375, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = _403 * _369;
    float _407 = _401 * _369;
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _411 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _413 = fma(_389, _357, _409);
    float _415 = fma(_387, _357, _411);
    float _417 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    float _421 = _417 * _397;
    float _423 = _419 * _399;
    bool _425 = !_367;
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
    float _917 = in.m_44.z;
    float _919 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _921 = log2(_919);
    float _923 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _925 = in.m_44.x;
    float _927 = in.m_44.y;
    float _929 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _935 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _923);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _941 = 1.0 / _933;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _945 = _943 != 0;
    float _947 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _951 = _949 != 0;
    float _953 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _955 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = _921 * _107;
    float _959 = 1.0 / _939;
    float _961 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _953);
    float _963 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _965 = _917 * 2.0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _977 = _975 != 0;
    float _979 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _961);
    float _981 = exp2(_957);
    bool _983 = _925 > 0.5;
    float _985 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _935);
    float _987 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _963);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _989;
    float _993 = -_183;
    int _995 = _983 ? as_type<int>(_993) : as_type<int>(_183);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _999 = _997 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1001 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1003 = isnan(1.0);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1009 = _1005 || _1007;
    float _1011 = floor(_965);
    float _1013 = _991 * _941;
    bool _1015 = !_945;
    float _1017 = _1015 ? _183 : as_type<float>(_995);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1021 = 1.0 + _1019;
    bool _1023 = _927 > 0.5;
    float _1025 = _999 * _959;
    bool _1027 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1035 = _1031 || _1033;
    float _1037 = _925 * 2.0;
    float _1039 = -_981;
    float _1041 = _1039 + 1.0;
    bool _1043 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1045 = isnan(_915);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _927 + _925;
    float _1057 = -_187;
    int _1059 = _1023 ? as_type<int>(_1057) : as_type<int>(_187);
    float _1061 = 1.0 / _1021;
    float _1063 = _1035 ? _1041 : 0.0;
    float _1065 = _1055 + (-1.0);
    bool _1067 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1069 = isnan(_915);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = _927 * 2.0;
    bool _1081 = _1011 > 0.0;
    float _1083 = _985 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1085 = _1011 >= 0.0;
    bool _1087 = isnan(_1011);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = floor(_1037);
    float _1097 = _1017 + 0.5;
    bool _1099 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1101 = isnan(_915);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1113 = !_951;
    float _1115 = _1113 ? _187 : as_type<float>(_1059);
    float _1117 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _915 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1125 = _915 + _1123;
    float _1127 = -_1053;
    float _1129 = _1127 + 1.0;
    float _1131 = floor(_1079);
    float _1133 = fma(_1013, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1135 = _1093 ? 0 : 1;
    float _1137 = _1109 * _1129;
    float _1139 = -_1109;
    float _1141 = _1139 + 1.0;
    if (_1009)
    {
        float _1143 = _1063 * _1061;
        _109 = _1143;
    }
    float _1145 = _109;
    float _1147 = -_1115;
    float _1149 = _1147 + 0.5;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1153 = _1083 + _1151;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = _1077 * _1141;
    bool _1159 = _1095 > 0.0;
    float _1161 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1163 = _1095 >= 0.0;
    bool _1165 = isnan(_1095);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    float _1173 = _1133 * _1157;
    float _1175 = -_1077;
    float _1177 = _1175 + 1.0;
    float _1179 = fma(_1025, _1125, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1181 = ~_1135;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1189 = _1111 + _1187;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1173);
    int _1193 = _1185;
    if (!_1081)
    {
        int _1195 = ~_1135;
        int _1197 = _1195 + 1;
        _1193 = _1197;
    }
    int _1199 = _1193;
    float _1201 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1203 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1205 = _1153 * _1153;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1209 = _1161 + _1207;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1213 = _1203 * _1155;
    float _1215 = fma(_1189, _1189, _1205);
    float _1217 = fma(_1179, _1137, _1191);
    int _1219 = _1171 ? 0 : 1;
    float _1221 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1223 = fma(_1209, _1209, _1215);
    bool _1225 = _1131 > 0.0;
    float _1227 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1217);
    bool _1229 = _1131 >= 0.0;
    bool _1231 = isnan(_1131);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1241 = !_969;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = rsqrt(_1223);
    float _1247 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1249 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1239);
    int _1251 = abs(_1243);
    float _1253 = _1201 * _1211;
    float _1255 = in.m_48.x;
    float _1257 = in.m_48.y;
    float _1259 = in.m_48.z;
    float _1261 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1249);
    bool _1263 = !_973;
    int _1265 = _1263 ? 0 : 1;
    int _1267 = _1237 ? 0 : 1;
    out.m_50.x = _1253;
    out.m_50.y = _1213;
    bool _1269 = _1261 >= 0.0;
    int _1271 = ~_1219;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    int _1277 = abs(_1265);
    int _1279 = _1275;
    float _1281 = _1261;
    if (!_1159)
    {
        int _1283 = ~_1219;
        int _1285 = _1283 + 1;
        _1279 = _1285;
    }
    int _1287 = _1279;
    int _1289 = ~_1267;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1153 * _1245;
    int _1301 = _1293;
    if (!_1225)
    {
        int _1303 = ~_1267;
        int _1305 = _1303 + 1;
        _1301 = _1305;
    }
    int _1307 = _1301;
    if (_1269)
    {
        out.m_35.x = 0.0;
    }
    float _1309 = _1189 * _1245;
    float _1311 = float(_1251);
    float _1313 = -_1299;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1317 = float(_1199);
    float _1319 = -_1309;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1189);
    float _1323 = float(_1277);
    float _1325 = _1315 * _1315;
    float _1327 = float(_1287);
    float _1329 = _1311 * _1317;
    int _1331 = as_type<int>(_1329);
    if (_1269)
    {
        _1281 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1333 = _1281;
    float _1335 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1337 = fma(_1321, _1321, _1325);
    float _1339 = _1323 * _1327;
    float _1341 = _1329 * (-2.0);
    float _1343 = _1209 * _1245;
    if (_1269)
    {
        float _1345 = _1333 * 5.0;
        _1331 = as_type<int>(_1345);
    }
    int _1347 = _1331;
    float _1349 = _925 + (-0.5);
    float _1351 = fma(_1341, _1255, _1255);
    float _1353 = -_1343;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    out.m_52.x = _1295;
    out.m_52.y = _1297;
    out.m_52.z = _947;
    out.m_52.w = _1335;
    float _1357 = fma(_1117, _1341, _1117);
    float _1359 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1351);
    float _1361 = fma(_1355, _1355, _1337);
    float _1363 = _1259;
    if (_1269)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4006 = as_type<float>(_1347);
        out.gl_Position.z = _4006;
    }
    bool _1365 = !_977;
    int _1367 = _1365 ? 0 : 1;
    if (_1269)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1369 = -_1299;
    float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1083);
    float _1373 = -_1309;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1377 = -_1343;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1161);
    int _1381 = abs(_1367);
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1385 = _1371 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = _1375 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = _1379 + _1391;
    float _1395 = _927 + _917;
    float _1397 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1399 = _927 + (-0.5);
    float _1401 = float(_1381);
    float _1403 = _1395 + (-1.0);
    float _1405 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1397);
    float _1407 = float(_1307);
    float _1409 = _1339 * (-2.0);
    float _1411 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1413 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1405);
    float _1415 = _917 + _925;
    float _1417 = _1401 * _1407;
    float _1419 = fma(_1411, _1409, _1411);
    float _1421 = fma(_1357, _1145, _1359);
    bool _1423 = _1413 >= 0.0;
    float _1425 = fma(_1409, _1257, _1257);
    float _1427 = _1415 + (-1.0);
    float _1429 = _1417 * (-2.0);
    float _1431 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1425);
    float _1433 = _1421 * 0.15915493667125701904296875;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1437 = fma(_1429, _1259, _1259);
    float _1439 = fma(_1419, _1145, _1431);
    float _1441 = _917 + (-0.5);
    float _1443 = fma(_1435, _1429, _1435);
    float _1445 = sqrt(_1361);
    float _1447 = _1439 * 0.15915493667125701904296875;
    if (_1423)
    {
        _1363 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1449 = _1363;
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1437);
    int _1453 = as_type<int>(_1449);
    if (_1423)
    {
        out.m_35.x = 0.0;
    }
    if (_1423)
    {
        float _1455 = _1449 * 5.0;
        _1453 = as_type<int>(_1455);
    }
    int _1457 = _1453;
    float _1459 = _1433 * 6.283185482025146484375;
    float _1461 = sin(_1459);
    float _1463 = fma(_1443, _1145, _1451);
    if (_1423)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4185 = as_type<float>(_1457);
        out.gl_Position.z = _4185;
    }
    float _1465 = _1463 * 0.15915493667125701904296875;
    float _1467 = _1433 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = _1447 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = _1447 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    if (_1423)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1479 = _1465 * 6.283185482025146484375;
    float _1481 = cos(_1479);
    float _1483 = _1245 * _1445;
    float _1485 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1489 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1493 = _1483 * _1485;
    float _1495 = _1461 * _1473;
    float _1497 = _1465 * 6.283185482025146484375;
    float _1499 = sin(_1497);
    float _1501 = _1483 * _1489;
    float _1503 = _1487 * _1493;
    float _1505 = _1469 * _1477;
    float _1507 = _1491 * _1501;
    float _1509 = _1469 * _1473;
    float _1511 = _1481 * _1503;
    float _1513 = _1473 * _1481;
    float _1515 = _1477 * _1481;
    float _1517 = _1461 * _1477;
    float _1519 = _1469 * _1511;
    float _1521 = fma(_1499, _1505, _1495);
    float _1523 = -_1503;
    float _1525 = _1499 * _1523;
    float _1527 = -_1517;
    float _1529 = fma(_1499, _1509, _1527);
    float _1531 = -_1509;
    float _1533 = fma(_1499, _1517, _1531);
    float _1535 = fma(_1521, _1507, _1519);
    float _1537 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1539 = _1537 * 0.5;
    float _1541 = _1461 * _1511;
    float _1543 = fma(_1515, _1507, _1525);
    float _1545 = fma(_1499, _1495, _1505);
    float _1547 = fma(_1529, _1539, _1535);
    float _1549 = fma(_1533, _1507, _1541);
    float _1551 = fma(_1513, _1539, _1543);
    float _1553 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1557 = fma(_1545, _1539, _1549);
    float _1559 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1553);
    float _1561 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1555);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1559);
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1561);
    float _1567 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1569 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1571 = _1111 + _1567;
    float _1573 = _1161 + _1569;
    float _1575 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1579 = _1571 + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1583 = _1573 + _1581;
    float _1585 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1575);
    float _1587 = _1579 * _1579;
    float _1589 = _1583 * _1583;
    float _1591 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1585);
    float _1593 = _1587 + _1589;
    float _1595 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1597 = sqrt(_1593);
    float _1599 = _1083 + _1595;
    bool _1601 = _1597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = _1595;
    float _1605 = _1557;
    float _1607 = _1589;
    float _1609 = _1571;
    float _1611 = _1573;
    if (!_1601)
    {
        _1603 = _1587;
    }
    float _1613 = _1603;
    float _1615 = _1613;
    if (!_1601)
    {
        _1605 = _1599;
    }
    float _1617 = _1605;
    bool _1619 = !_1601;
    float _1621 = _1617;
    if (!_1619)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1627 = _1597 + _1625;
        float _1629 = rsqrt(_1593);
        float _1631 = _1627 * _1623;
        float _1633 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = _1631 * 0.15915493667125701904296875;
        float _1637 = _1635 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = _1635 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = fma(_1639, _1633, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1647 = _1629 * _1645;
        float _1649 = _1643 + (-1.0);
        float _1651 = fma(_1579, _1647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1653 = fma(_1583, _1647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1655 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1659 = _1651 + _1657;
        float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1663 = _1653 + _1661;
        float _1665 = fma(_1599, _1643, _1655);
        float _1667 = _1659 * _1659;
        float _1669 = _1663 * _1663;
        _1621 = _1665;
        _1615 = _1667;
        _1607 = _1669;
        _1609 = _1651;
        _1611 = _1653;
    }
    float _1671 = _1621;
    float _1673 = _1615;
    float _1675 = _1607;
    float _1677 = _1609;
    float _1679 = _1611;
    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1683 = _1671 + _1681;
    float _1685 = fma(_1683, _1683, _1673);
    float _1687 = _1685 + _1675;
    float _1689 = sqrt(_1687);
    bool _1691 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1693 = isnan(_1689);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1699 = _1695 || _1697;
    float _1701 = _1673;
    if (!_1699)
    {
        _1701 = 1.0;
    }
    float _1703 = _1701;
    bool _1705 = !_1699;
    float _1707 = _1703;
    if (!_1705)
    {
        bool _1709 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1711 = isnan(_1689);
        bool _1713 = _1709 || _1711;
        bool _1715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1717 = _1713 || _1715;
        if (!_1717)
        {
            float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1721 = _1689 + _1719;
            float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1725 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1723;
            float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1731 = 1.0 / _1725;
            float _1733 = _1721 * _1731;
            float _1735 = fma(_1733, _1729, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1707 = _1735;
            _1737 = true;
        }
        else
        {
            bool _1739 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1741 = isnan(_1689);
            bool _1743 = _1739 || _1741;
            bool _1745 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1747 = _1743 || _1745;
            if (!_1747)
            {
                float _1749 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1751 = _1689 + _1749;
                float _1753 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1755 = _1753 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1759 = _1757 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1761 = 1.0 / _1755;
                float _1763 = _1751 * _1761;
                float _1765 = fma(_1763, _1759, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1707 = _1765;
                _1737 = true;
            }
            else
            {
                _1707 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1737 = false;
    float _1767 = _1707;
    float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1771 = _1677 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1775 = _1671 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1779 = _1679 + _1777;
    bool _1781 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(0.5);
    bool _1789 = _1785 || _1787;
    float _1791 = fma(_1771, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1793 = fma(_1775, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1795 = fma(_1779, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1797 = -_1309;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1791);
    float _1801 = -_1299;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1793);
    float _1805 = -_1343;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1795);
    float _1809 = _1803;
    float _1811 = _1799;
    float _1813 = _1807;
    if (!_1789)
    {
        float _1815 = _1385 * _1385;
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = -_1161;
        float _1821 = _1819 + _1795;
        float _1823 = fma(_1389, _1389, _1815);
        float _1825 = fma(_1393, _1393, _1823);
        float _1827 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1829 = sqrt(_1825);
        float _1831 = 1.0 / _1483;
        float _1833 = precise::min(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1835 = _1833 * _1817;
        float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = _1835 * _1831;
        float _1841 = -_1111;
        float _1843 = _1841 + _1791;
        float _1845 = -_1083;
        float _1847 = _1845 + _1793;
        float _1849 = _1837 * _1839;
        float _1851 = _1821 * _1839;
        float _1853 = fma(_1843, _1849, _1375);
        float _1855 = fma(_1847, _1849, _1371);
        float _1857 = fma(_1837, _1851, _1379);
        _1809 = _1855;
        _1811 = _1853;
        _1813 = _1857;
    }
    float _1859 = _1809;
    float _1861 = _1811;
    float _1863 = _1813;
    float _1865 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1871 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1865);
    float _1875 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1867);
    float _1877 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1869);
    float _1879 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1885 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1887 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    float _1889 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1895 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1905 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1907 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1899);
    float _1909 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1901);
    float _1911 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1903);
    float _1913 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1915 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1917 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1909);
    float _1919 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1911);
    float _1921 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1913);
    float _1923 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1925 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1917);
    float _1927 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1919);
    float _1929 = _1921 + _1925;
    float _1931 = _1923 + _1925;
    float _1933 = _1925 * 0.5;
    float _1935 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1937 = _1929 * 0.5;
    float _1939 = _1931 * 0.5;
    float _1941 = fma(_1927, -0.5, _1933);
    out.m_35.x = _1935;
    out.gl_Position.x = _1921;
    out.gl_Position.y = _1927;
    out.gl_Position.z = _1923;
    out.gl_Position.w = _1925;
    out.m_54.x = _1937;
    out.m_54.y = _1941;
    out.m_54.z = _1939;
    out.m_54.w = _1925;
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
    bool _1737 = false;
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
        float _1998 = as_type<float>(_89);
        out.gl_Position.z = _1998;
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
        float _2068 = as_type<float>(_127);
        out.gl_Position.z = _2068;
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
    bool _319 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _337;
    bool _345 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_297);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _329 * _341;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _369 = _355 * _361;
    float _371 = 1.0 / _333;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = -_355;
    float _379 = _377 + 1.0;
    float _381 = _317 * _343;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = fma(_365, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = fma(_385, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = _301 * _371;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = in.m_42.x;
    float _399 = in.m_42.y;
    float _401 = fma(_375, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = _403 * _369;
    float _407 = _401 * _369;
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _411 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _413 = fma(_389, _357, _409);
    float _415 = fma(_387, _357, _411);
    float _417 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    float _421 = _417 * _397;
    float _423 = _419 * _399;
    bool _425 = !_367;
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
    float _917 = in.m_44.z;
    float _919 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _921 = log2(_919);
    float _923 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _925 = in.m_44.x;
    float _927 = in.m_44.y;
    float _929 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _935 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _923);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _941 = 1.0 / _933;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _945 = _943 != 0;
    float _947 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _951 = _949 != 0;
    float _953 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _955 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = _921 * _107;
    float _959 = 1.0 / _939;
    float _961 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _953);
    float _963 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _965 = _917 * 2.0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _977 = _975 != 0;
    float _979 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _961);
    float _981 = exp2(_957);
    bool _983 = _925 > 0.5;
    float _985 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _935);
    float _987 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _963);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _989;
    float _993 = -_183;
    int _995 = _983 ? as_type<int>(_993) : as_type<int>(_183);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _999 = _997 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1001 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1003 = isnan(1.0);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1009 = _1005 || _1007;
    float _1011 = floor(_965);
    float _1013 = _991 * _941;
    bool _1015 = !_945;
    float _1017 = _1015 ? _183 : as_type<float>(_995);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1021 = 1.0 + _1019;
    bool _1023 = _927 > 0.5;
    float _1025 = _999 * _959;
    bool _1027 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1035 = _1031 || _1033;
    float _1037 = _925 * 2.0;
    float _1039 = -_981;
    float _1041 = _1039 + 1.0;
    bool _1043 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1045 = isnan(_915);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _927 + _925;
    float _1057 = -_187;
    int _1059 = _1023 ? as_type<int>(_1057) : as_type<int>(_187);
    float _1061 = 1.0 / _1021;
    float _1063 = _1035 ? _1041 : 0.0;
    float _1065 = _1055 + (-1.0);
    bool _1067 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1069 = isnan(_915);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = _927 * 2.0;
    bool _1081 = _1011 > 0.0;
    float _1083 = _985 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1085 = _1011 >= 0.0;
    bool _1087 = isnan(_1011);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = floor(_1037);
    float _1097 = _1017 + 0.5;
    bool _1099 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1101 = isnan(_915);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1113 = !_951;
    float _1115 = _1113 ? _187 : as_type<float>(_1059);
    float _1117 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _915 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1125 = _915 + _1123;
    float _1127 = -_1053;
    float _1129 = _1127 + 1.0;
    float _1131 = floor(_1079);
    float _1133 = fma(_1013, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1135 = _1093 ? 0 : 1;
    float _1137 = _1109 * _1129;
    float _1139 = -_1109;
    float _1141 = _1139 + 1.0;
    if (_1009)
    {
        float _1143 = _1063 * _1061;
        _109 = _1143;
    }
    float _1145 = _109;
    float _1147 = -_1115;
    float _1149 = _1147 + 0.5;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1153 = _1083 + _1151;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = _1077 * _1141;
    bool _1159 = _1095 > 0.0;
    float _1161 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1163 = _1095 >= 0.0;
    bool _1165 = isnan(_1095);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    float _1173 = _1133 * _1157;
    float _1175 = -_1077;
    float _1177 = _1175 + 1.0;
    float _1179 = fma(_1025, _1125, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1181 = ~_1135;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1189 = _1111 + _1187;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1173);
    int _1193 = _1185;
    if (!_1081)
    {
        int _1195 = ~_1135;
        int _1197 = _1195 + 1;
        _1193 = _1197;
    }
    int _1199 = _1193;
    float _1201 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1203 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1205 = _1153 * _1153;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1209 = _1161 + _1207;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1213 = _1203 * _1155;
    float _1215 = fma(_1189, _1189, _1205);
    float _1217 = fma(_1179, _1137, _1191);
    int _1219 = _1171 ? 0 : 1;
    float _1221 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1223 = fma(_1209, _1209, _1215);
    bool _1225 = _1131 > 0.0;
    float _1227 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1217);
    bool _1229 = _1131 >= 0.0;
    bool _1231 = isnan(_1131);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1241 = !_969;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = rsqrt(_1223);
    float _1247 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1249 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1239);
    int _1251 = abs(_1243);
    float _1253 = _1201 * _1211;
    float _1255 = in.m_48.x;
    float _1257 = in.m_48.y;
    float _1259 = in.m_48.z;
    float _1261 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1249);
    bool _1263 = !_973;
    int _1265 = _1263 ? 0 : 1;
    int _1267 = _1237 ? 0 : 1;
    out.m_50.x = _1253;
    out.m_50.y = _1213;
    bool _1269 = _1261 >= 0.0;
    int _1271 = ~_1219;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    int _1277 = abs(_1265);
    int _1279 = _1275;
    float _1281 = _1261;
    if (!_1159)
    {
        int _1283 = ~_1219;
        int _1285 = _1283 + 1;
        _1279 = _1285;
    }
    int _1287 = _1279;
    int _1289 = ~_1267;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1153 * _1245;
    int _1301 = _1293;
    if (!_1225)
    {
        int _1303 = ~_1267;
        int _1305 = _1303 + 1;
        _1301 = _1305;
    }
    int _1307 = _1301;
    if (_1269)
    {
        out.m_35.x = 0.0;
    }
    float _1309 = _1189 * _1245;
    float _1311 = float(_1251);
    float _1313 = -_1299;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1317 = float(_1199);
    float _1319 = -_1309;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1189);
    float _1323 = float(_1277);
    float _1325 = _1315 * _1315;
    float _1327 = float(_1287);
    float _1329 = _1311 * _1317;
    int _1331 = as_type<int>(_1329);
    if (_1269)
    {
        _1281 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1333 = _1281;
    float _1335 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1337 = fma(_1321, _1321, _1325);
    float _1339 = _1323 * _1327;
    float _1341 = _1329 * (-2.0);
    float _1343 = _1209 * _1245;
    if (_1269)
    {
        float _1345 = _1333 * 5.0;
        _1331 = as_type<int>(_1345);
    }
    int _1347 = _1331;
    float _1349 = _925 + (-0.5);
    float _1351 = fma(_1341, _1255, _1255);
    float _1353 = -_1343;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    out.m_52.x = _1295;
    out.m_52.y = _1297;
    out.m_52.z = _947;
    out.m_52.w = _1335;
    float _1357 = fma(_1117, _1341, _1117);
    float _1359 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1351);
    float _1361 = fma(_1355, _1355, _1337);
    float _1363 = _1259;
    if (_1269)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4006 = as_type<float>(_1347);
        out.gl_Position.z = _4006;
    }
    bool _1365 = !_977;
    int _1367 = _1365 ? 0 : 1;
    if (_1269)
    {
        return out;
    }
    float _1369 = -_1299;
    float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1083);
    float _1373 = -_1309;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1377 = -_1343;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1161);
    int _1381 = abs(_1367);
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1385 = _1371 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = _1375 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = _1379 + _1391;
    float _1395 = _927 + _917;
    float _1397 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1399 = _927 + (-0.5);
    float _1401 = float(_1381);
    float _1403 = _1395 + (-1.0);
    float _1405 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1397);
    float _1407 = float(_1307);
    float _1409 = _1339 * (-2.0);
    float _1411 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1413 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1405);
    float _1415 = _917 + _925;
    float _1417 = _1401 * _1407;
    float _1419 = fma(_1411, _1409, _1411);
    float _1421 = fma(_1357, _1145, _1359);
    bool _1423 = _1413 >= 0.0;
    float _1425 = fma(_1409, _1257, _1257);
    float _1427 = _1415 + (-1.0);
    float _1429 = _1417 * (-2.0);
    float _1431 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1425);
    float _1433 = _1421 * 0.15915493667125701904296875;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1437 = fma(_1429, _1259, _1259);
    float _1439 = fma(_1419, _1145, _1431);
    float _1441 = _917 + (-0.5);
    float _1443 = fma(_1435, _1429, _1435);
    float _1445 = sqrt(_1361);
    float _1447 = _1439 * 0.15915493667125701904296875;
    if (_1423)
    {
        _1363 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1449 = _1363;
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1437);
    int _1453 = as_type<int>(_1449);
    if (_1423)
    {
        out.m_35.x = 0.0;
    }
    if (_1423)
    {
        float _1455 = _1449 * 5.0;
        _1453 = as_type<int>(_1455);
    }
    int _1457 = _1453;
    float _1459 = _1433 * 6.283185482025146484375;
    float _1461 = sin(_1459);
    float _1463 = fma(_1443, _1145, _1451);
    if (_1423)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4185 = as_type<float>(_1457);
        out.gl_Position.z = _4185;
    }
    float _1465 = _1463 * 0.15915493667125701904296875;
    float _1467 = _1433 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = _1447 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = _1447 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    if (_1423)
    {
        return out;
    }
    float _1479 = _1465 * 6.283185482025146484375;
    float _1481 = cos(_1479);
    float _1483 = _1245 * _1445;
    float _1485 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1489 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1493 = _1483 * _1485;
    float _1495 = _1461 * _1473;
    float _1497 = _1465 * 6.283185482025146484375;
    float _1499 = sin(_1497);
    float _1501 = _1483 * _1489;
    float _1503 = _1487 * _1493;
    float _1505 = _1469 * _1477;
    float _1507 = _1491 * _1501;
    float _1509 = _1469 * _1473;
    float _1511 = _1481 * _1503;
    float _1513 = _1473 * _1481;
    float _1515 = _1477 * _1481;
    float _1517 = _1461 * _1477;
    float _1519 = _1469 * _1511;
    float _1521 = fma(_1499, _1505, _1495);
    float _1523 = -_1503;
    float _1525 = _1499 * _1523;
    float _1527 = -_1517;
    float _1529 = fma(_1499, _1509, _1527);
    float _1531 = -_1509;
    float _1533 = fma(_1499, _1517, _1531);
    float _1535 = fma(_1521, _1507, _1519);
    float _1537 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1539 = _1537 * 0.5;
    float _1541 = _1461 * _1511;
    float _1543 = fma(_1515, _1507, _1525);
    float _1545 = fma(_1499, _1495, _1505);
    float _1547 = fma(_1529, _1539, _1535);
    float _1549 = fma(_1533, _1507, _1541);
    float _1551 = fma(_1513, _1539, _1543);
    float _1553 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1557 = fma(_1545, _1539, _1549);
    float _1559 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1553);
    float _1561 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1555);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1559);
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1561);
    float _1567 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1569 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1571 = _1111 + _1567;
    float _1573 = _1161 + _1569;
    float _1575 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1579 = _1571 + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1583 = _1573 + _1581;
    float _1585 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1575);
    float _1587 = _1579 * _1579;
    float _1589 = _1583 * _1583;
    float _1591 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1585);
    float _1593 = _1587 + _1589;
    float _1595 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1597 = sqrt(_1593);
    float _1599 = _1083 + _1595;
    bool _1601 = _1597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = _1595;
    float _1605 = _1557;
    float _1607 = _1589;
    float _1609 = _1571;
    float _1611 = _1573;
    if (!_1601)
    {
        _1603 = _1587;
    }
    float _1613 = _1603;
    float _1615 = _1613;
    if (!_1601)
    {
        _1605 = _1599;
    }
    float _1617 = _1605;
    bool _1619 = !_1601;
    float _1621 = _1617;
    if (!_1619)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1627 = _1597 + _1625;
        float _1629 = rsqrt(_1593);
        float _1631 = _1627 * _1623;
        float _1633 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = _1631 * 0.15915493667125701904296875;
        float _1637 = _1635 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = _1635 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = fma(_1639, _1633, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1647 = _1629 * _1645;
        float _1649 = _1643 + (-1.0);
        float _1651 = fma(_1579, _1647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1653 = fma(_1583, _1647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1655 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1659 = _1651 + _1657;
        float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1663 = _1653 + _1661;
        float _1665 = fma(_1599, _1643, _1655);
        float _1667 = _1659 * _1659;
        float _1669 = _1663 * _1663;
        _1621 = _1665;
        _1615 = _1667;
        _1607 = _1669;
        _1609 = _1651;
        _1611 = _1653;
    }
    float _1671 = _1621;
    float _1673 = _1615;
    float _1675 = _1607;
    float _1677 = _1609;
    float _1679 = _1611;
    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1683 = _1671 + _1681;
    float _1685 = fma(_1683, _1683, _1673);
    float _1687 = _1685 + _1675;
    float _1689 = sqrt(_1687);
    bool _1691 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1693 = isnan(_1689);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1699 = _1695 || _1697;
    float _1701 = _1673;
    if (!_1699)
    {
        _1701 = 1.0;
    }
    float _1703 = _1701;
    bool _1705 = !_1699;
    float _1707 = _1703;
    if (!_1705)
    {
        bool _1709 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1711 = isnan(_1689);
        bool _1713 = _1709 || _1711;
        bool _1715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1717 = _1713 || _1715;
        if (!_1717)
        {
            float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1721 = _1689 + _1719;
            float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1725 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1723;
            float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1731 = 1.0 / _1725;
            float _1733 = _1721 * _1731;
            float _1735 = fma(_1733, _1729, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1707 = _1735;
            _1737 = true;
        }
        else
        {
            bool _1739 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1741 = isnan(_1689);
            bool _1743 = _1739 || _1741;
            bool _1745 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1747 = _1743 || _1745;
            if (!_1747)
            {
                float _1749 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1751 = _1689 + _1749;
                float _1753 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1755 = _1753 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1759 = _1757 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1761 = 1.0 / _1755;
                float _1763 = _1751 * _1761;
                float _1765 = fma(_1763, _1759, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1707 = _1765;
                _1737 = true;
            }
            else
            {
                _1707 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1737 = false;
    float _1767 = _1707;
    float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1771 = _1677 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1775 = _1671 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1779 = _1679 + _1777;
    bool _1781 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(0.5);
    bool _1789 = _1785 || _1787;
    float _1791 = fma(_1771, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1793 = fma(_1775, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1795 = fma(_1779, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1797 = -_1309;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1791);
    float _1801 = -_1299;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1793);
    float _1805 = -_1343;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1795);
    float _1809 = _1803;
    float _1811 = _1799;
    float _1813 = _1807;
    if (!_1789)
    {
        float _1815 = _1385 * _1385;
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = -_1161;
        float _1821 = _1819 + _1795;
        float _1823 = fma(_1389, _1389, _1815);
        float _1825 = fma(_1393, _1393, _1823);
        float _1827 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1829 = sqrt(_1825);
        float _1831 = 1.0 / _1483;
        float _1833 = precise::min(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1835 = _1833 * _1817;
        float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = _1835 * _1831;
        float _1841 = -_1111;
        float _1843 = _1841 + _1791;
        float _1845 = -_1083;
        float _1847 = _1845 + _1793;
        float _1849 = _1837 * _1839;
        float _1851 = _1821 * _1839;
        float _1853 = fma(_1843, _1849, _1375);
        float _1855 = fma(_1847, _1849, _1371);
        float _1857 = fma(_1837, _1851, _1379);
        _1809 = _1855;
        _1811 = _1853;
        _1813 = _1857;
    }
    float _1859 = _1809;
    float _1861 = _1811;
    float _1863 = _1813;
    float _1865 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1871 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1865);
    float _1875 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1867);
    float _1877 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1869);
    float _1879 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1885 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1887 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    float _1889 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1895 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1905 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1907 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1899);
    float _1909 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1901);
    float _1911 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1903);
    float _1913 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1915 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1917 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1909);
    float _1919 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1911);
    float _1921 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1913);
    float _1923 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1925 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1917);
    float _1927 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1919);
    float _1929 = _1921 + _1925;
    float _1931 = _1923 + _1925;
    float _1933 = _1925 * 0.5;
    float _1935 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1937 = _1929 * 0.5;
    float _1939 = _1931 * 0.5;
    float _1941 = fma(_1927, -0.5, _1933);
    out.m_35.x = _1935;
    out.gl_Position.x = _1921;
    out.gl_Position.y = _1927;
    out.gl_Position.z = _1923;
    out.gl_Position.w = _1925;
    out.m_54.x = _1937;
    out.m_54.y = _1941;
    out.m_54.z = _1939;
    out.m_54.w = _1925;
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
    bool _1737 = false;
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
        float _1998 = as_type<float>(_89);
        out.gl_Position.z = _1998;
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
        float _2068 = as_type<float>(_127);
        out.gl_Position.z = _2068;
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
    bool _319 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _337;
    bool _345 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_297);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _329 * _341;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _369 = _355 * _361;
    float _371 = 1.0 / _333;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = -_355;
    float _379 = _377 + 1.0;
    float _381 = _317 * _343;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = fma(_365, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = fma(_385, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = _301 * _371;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = in.m_42.x;
    float _399 = in.m_42.y;
    float _401 = fma(_375, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = _403 * _369;
    float _407 = _401 * _369;
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _411 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _413 = fma(_389, _357, _409);
    float _415 = fma(_387, _357, _411);
    float _417 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    float _421 = _417 * _397;
    float _423 = _419 * _399;
    bool _425 = !_367;
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
    float _917 = in.m_44.z;
    float _919 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _921 = log2(_919);
    float _923 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _925 = in.m_44.x;
    float _927 = in.m_44.y;
    float _929 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _935 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _923);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _941 = 1.0 / _933;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _945 = _943 != 0;
    float _947 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _951 = _949 != 0;
    float _953 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _955 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = _921 * _107;
    float _959 = 1.0 / _939;
    float _961 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _953);
    float _963 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _965 = _917 * 2.0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _977 = _975 != 0;
    float _979 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _961);
    float _981 = exp2(_957);
    bool _983 = _925 > 0.5;
    float _985 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _935);
    float _987 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _963);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _989;
    float _993 = -_183;
    int _995 = _983 ? as_type<int>(_993) : as_type<int>(_183);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _999 = _997 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1001 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1003 = isnan(1.0);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1009 = _1005 || _1007;
    float _1011 = floor(_965);
    float _1013 = _991 * _941;
    bool _1015 = !_945;
    float _1017 = _1015 ? _183 : as_type<float>(_995);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1021 = 1.0 + _1019;
    bool _1023 = _927 > 0.5;
    float _1025 = _999 * _959;
    bool _1027 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1035 = _1031 || _1033;
    float _1037 = _925 * 2.0;
    float _1039 = -_981;
    float _1041 = _1039 + 1.0;
    bool _1043 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1045 = isnan(_915);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _927 + _925;
    float _1057 = -_187;
    int _1059 = _1023 ? as_type<int>(_1057) : as_type<int>(_187);
    float _1061 = 1.0 / _1021;
    float _1063 = _1035 ? _1041 : 0.0;
    float _1065 = _1055 + (-1.0);
    bool _1067 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1069 = isnan(_915);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = _927 * 2.0;
    bool _1081 = _1011 > 0.0;
    float _1083 = _985 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1085 = _1011 >= 0.0;
    bool _1087 = isnan(_1011);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = floor(_1037);
    float _1097 = _1017 + 0.5;
    bool _1099 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1101 = isnan(_915);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1113 = !_951;
    float _1115 = _1113 ? _187 : as_type<float>(_1059);
    float _1117 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _915 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1125 = _915 + _1123;
    float _1127 = -_1053;
    float _1129 = _1127 + 1.0;
    float _1131 = floor(_1079);
    float _1133 = fma(_1013, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1135 = _1093 ? 0 : 1;
    float _1137 = _1109 * _1129;
    float _1139 = -_1109;
    float _1141 = _1139 + 1.0;
    if (_1009)
    {
        float _1143 = _1063 * _1061;
        _109 = _1143;
    }
    float _1145 = _109;
    float _1147 = -_1115;
    float _1149 = _1147 + 0.5;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1153 = _1083 + _1151;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = _1077 * _1141;
    bool _1159 = _1095 > 0.0;
    float _1161 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1163 = _1095 >= 0.0;
    bool _1165 = isnan(_1095);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    float _1173 = _1133 * _1157;
    float _1175 = -_1077;
    float _1177 = _1175 + 1.0;
    float _1179 = fma(_1025, _1125, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1181 = ~_1135;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1189 = _1111 + _1187;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1173);
    int _1193 = _1185;
    if (!_1081)
    {
        int _1195 = ~_1135;
        int _1197 = _1195 + 1;
        _1193 = _1197;
    }
    int _1199 = _1193;
    float _1201 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1203 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1205 = _1153 * _1153;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1209 = _1161 + _1207;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1213 = _1203 * _1155;
    float _1215 = fma(_1189, _1189, _1205);
    float _1217 = fma(_1179, _1137, _1191);
    int _1219 = _1171 ? 0 : 1;
    float _1221 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1223 = fma(_1209, _1209, _1215);
    bool _1225 = _1131 > 0.0;
    float _1227 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1217);
    bool _1229 = _1131 >= 0.0;
    bool _1231 = isnan(_1131);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1241 = !_969;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = rsqrt(_1223);
    float _1247 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1249 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1239);
    int _1251 = abs(_1243);
    float _1253 = _1201 * _1211;
    float _1255 = in.m_48.x;
    float _1257 = in.m_48.y;
    float _1259 = in.m_48.z;
    float _1261 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1249);
    bool _1263 = !_973;
    int _1265 = _1263 ? 0 : 1;
    int _1267 = _1237 ? 0 : 1;
    out.m_50.x = _1253;
    out.m_50.y = _1213;
    bool _1269 = _1261 >= 0.0;
    int _1271 = ~_1219;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    int _1277 = abs(_1265);
    int _1279 = _1275;
    float _1281 = _1261;
    if (!_1159)
    {
        int _1283 = ~_1219;
        int _1285 = _1283 + 1;
        _1279 = _1285;
    }
    int _1287 = _1279;
    int _1289 = ~_1267;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1153 * _1245;
    int _1301 = _1293;
    if (!_1225)
    {
        int _1303 = ~_1267;
        int _1305 = _1303 + 1;
        _1301 = _1305;
    }
    int _1307 = _1301;
    if (_1269)
    {
        out.m_35.x = 0.0;
    }
    float _1309 = _1189 * _1245;
    float _1311 = float(_1251);
    float _1313 = -_1299;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1317 = float(_1199);
    float _1319 = -_1309;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1189);
    float _1323 = float(_1277);
    float _1325 = _1315 * _1315;
    float _1327 = float(_1287);
    float _1329 = _1311 * _1317;
    int _1331 = as_type<int>(_1329);
    if (_1269)
    {
        _1281 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1333 = _1281;
    float _1335 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1337 = fma(_1321, _1321, _1325);
    float _1339 = _1323 * _1327;
    float _1341 = _1329 * (-2.0);
    float _1343 = _1209 * _1245;
    if (_1269)
    {
        float _1345 = _1333 * 5.0;
        _1331 = as_type<int>(_1345);
    }
    int _1347 = _1331;
    float _1349 = _925 + (-0.5);
    float _1351 = fma(_1341, _1255, _1255);
    float _1353 = -_1343;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    out.m_52.x = _1295;
    out.m_52.y = _1297;
    out.m_52.z = _947;
    out.m_52.w = _1335;
    float _1357 = fma(_1117, _1341, _1117);
    float _1359 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1351);
    float _1361 = fma(_1355, _1355, _1337);
    float _1363 = _1259;
    if (_1269)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4006 = as_type<float>(_1347);
        out.gl_Position.z = _4006;
    }
    bool _1365 = !_977;
    int _1367 = _1365 ? 0 : 1;
    if (_1269)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1369 = -_1299;
    float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1083);
    float _1373 = -_1309;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1377 = -_1343;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1161);
    int _1381 = abs(_1367);
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1385 = _1371 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = _1375 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = _1379 + _1391;
    float _1395 = _927 + _917;
    float _1397 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1399 = _927 + (-0.5);
    float _1401 = float(_1381);
    float _1403 = _1395 + (-1.0);
    float _1405 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1397);
    float _1407 = float(_1307);
    float _1409 = _1339 * (-2.0);
    float _1411 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1413 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1405);
    float _1415 = _917 + _925;
    float _1417 = _1401 * _1407;
    float _1419 = fma(_1411, _1409, _1411);
    float _1421 = fma(_1357, _1145, _1359);
    bool _1423 = _1413 >= 0.0;
    float _1425 = fma(_1409, _1257, _1257);
    float _1427 = _1415 + (-1.0);
    float _1429 = _1417 * (-2.0);
    float _1431 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1425);
    float _1433 = _1421 * 0.15915493667125701904296875;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1437 = fma(_1429, _1259, _1259);
    float _1439 = fma(_1419, _1145, _1431);
    float _1441 = _917 + (-0.5);
    float _1443 = fma(_1435, _1429, _1435);
    float _1445 = sqrt(_1361);
    float _1447 = _1439 * 0.15915493667125701904296875;
    if (_1423)
    {
        _1363 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1449 = _1363;
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1437);
    int _1453 = as_type<int>(_1449);
    if (_1423)
    {
        out.m_35.x = 0.0;
    }
    if (_1423)
    {
        float _1455 = _1449 * 5.0;
        _1453 = as_type<int>(_1455);
    }
    int _1457 = _1453;
    float _1459 = _1433 * 6.283185482025146484375;
    float _1461 = sin(_1459);
    float _1463 = fma(_1443, _1145, _1451);
    if (_1423)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4185 = as_type<float>(_1457);
        out.gl_Position.z = _4185;
    }
    float _1465 = _1463 * 0.15915493667125701904296875;
    float _1467 = _1433 * 6.283185482025146484375;
    float _1469 = cos(_1467);
    float _1471 = _1447 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = _1447 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    if (_1423)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1479 = _1465 * 6.283185482025146484375;
    float _1481 = cos(_1479);
    float _1483 = _1245 * _1445;
    float _1485 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1489 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1493 = _1483 * _1485;
    float _1495 = _1461 * _1473;
    float _1497 = _1465 * 6.283185482025146484375;
    float _1499 = sin(_1497);
    float _1501 = _1483 * _1489;
    float _1503 = _1487 * _1493;
    float _1505 = _1469 * _1477;
    float _1507 = _1491 * _1501;
    float _1509 = _1469 * _1473;
    float _1511 = _1481 * _1503;
    float _1513 = _1473 * _1481;
    float _1515 = _1477 * _1481;
    float _1517 = _1461 * _1477;
    float _1519 = _1469 * _1511;
    float _1521 = fma(_1499, _1505, _1495);
    float _1523 = -_1503;
    float _1525 = _1499 * _1523;
    float _1527 = -_1517;
    float _1529 = fma(_1499, _1509, _1527);
    float _1531 = -_1509;
    float _1533 = fma(_1499, _1517, _1531);
    float _1535 = fma(_1521, _1507, _1519);
    float _1537 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1539 = _1537 * 0.5;
    float _1541 = _1461 * _1511;
    float _1543 = fma(_1515, _1507, _1525);
    float _1545 = fma(_1499, _1495, _1505);
    float _1547 = fma(_1529, _1539, _1535);
    float _1549 = fma(_1533, _1507, _1541);
    float _1551 = fma(_1513, _1539, _1543);
    float _1553 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1557 = fma(_1545, _1539, _1549);
    float _1559 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1553);
    float _1561 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1555);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1559);
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1561);
    float _1567 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1569 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1571 = _1111 + _1567;
    float _1573 = _1161 + _1569;
    float _1575 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1579 = _1571 + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1583 = _1573 + _1581;
    float _1585 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1575);
    float _1587 = _1579 * _1579;
    float _1589 = _1583 * _1583;
    float _1591 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1585);
    float _1593 = _1587 + _1589;
    float _1595 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1597 = sqrt(_1593);
    float _1599 = _1083 + _1595;
    bool _1601 = _1597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = _1595;
    float _1605 = _1557;
    float _1607 = _1589;
    float _1609 = _1571;
    float _1611 = _1573;
    if (!_1601)
    {
        _1603 = _1587;
    }
    float _1613 = _1603;
    float _1615 = _1613;
    if (!_1601)
    {
        _1605 = _1599;
    }
    float _1617 = _1605;
    bool _1619 = !_1601;
    float _1621 = _1617;
    if (!_1619)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1627 = _1597 + _1625;
        float _1629 = rsqrt(_1593);
        float _1631 = _1627 * _1623;
        float _1633 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = _1631 * 0.15915493667125701904296875;
        float _1637 = _1635 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = _1635 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = fma(_1639, _1633, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1647 = _1629 * _1645;
        float _1649 = _1643 + (-1.0);
        float _1651 = fma(_1579, _1647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1653 = fma(_1583, _1647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1655 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1659 = _1651 + _1657;
        float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1663 = _1653 + _1661;
        float _1665 = fma(_1599, _1643, _1655);
        float _1667 = _1659 * _1659;
        float _1669 = _1663 * _1663;
        _1621 = _1665;
        _1615 = _1667;
        _1607 = _1669;
        _1609 = _1651;
        _1611 = _1653;
    }
    float _1671 = _1621;
    float _1673 = _1615;
    float _1675 = _1607;
    float _1677 = _1609;
    float _1679 = _1611;
    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1683 = _1671 + _1681;
    float _1685 = fma(_1683, _1683, _1673);
    float _1687 = _1685 + _1675;
    float _1689 = sqrt(_1687);
    bool _1691 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1693 = isnan(_1689);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1699 = _1695 || _1697;
    float _1701 = _1673;
    if (!_1699)
    {
        _1701 = 1.0;
    }
    float _1703 = _1701;
    bool _1705 = !_1699;
    float _1707 = _1703;
    if (!_1705)
    {
        bool _1709 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1711 = isnan(_1689);
        bool _1713 = _1709 || _1711;
        bool _1715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1717 = _1713 || _1715;
        if (!_1717)
        {
            float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1721 = _1689 + _1719;
            float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1725 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1723;
            float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1731 = 1.0 / _1725;
            float _1733 = _1721 * _1731;
            float _1735 = fma(_1733, _1729, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1707 = _1735;
            _1737 = true;
        }
        else
        {
            bool _1739 = _1689 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1741 = isnan(_1689);
            bool _1743 = _1739 || _1741;
            bool _1745 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1747 = _1743 || _1745;
            if (!_1747)
            {
                float _1749 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1751 = _1689 + _1749;
                float _1753 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1755 = _1753 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1759 = _1757 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1761 = 1.0 / _1755;
                float _1763 = _1751 * _1761;
                float _1765 = fma(_1763, _1759, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1707 = _1765;
                _1737 = true;
            }
            else
            {
                _1707 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1737 = false;
    float _1767 = _1707;
    float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1771 = _1677 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1775 = _1671 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1779 = _1679 + _1777;
    bool _1781 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(0.5);
    bool _1789 = _1785 || _1787;
    float _1791 = fma(_1771, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1793 = fma(_1775, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1795 = fma(_1779, _1767, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1797 = -_1309;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1791);
    float _1801 = -_1299;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1793);
    float _1805 = -_1343;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1795);
    float _1809 = _1803;
    float _1811 = _1799;
    float _1813 = _1807;
    if (!_1789)
    {
        float _1815 = _1385 * _1385;
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = -_1161;
        float _1821 = _1819 + _1795;
        float _1823 = fma(_1389, _1389, _1815);
        float _1825 = fma(_1393, _1393, _1823);
        float _1827 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1829 = sqrt(_1825);
        float _1831 = 1.0 / _1483;
        float _1833 = precise::min(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1835 = _1833 * _1817;
        float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = _1835 * _1831;
        float _1841 = -_1111;
        float _1843 = _1841 + _1791;
        float _1845 = -_1083;
        float _1847 = _1845 + _1793;
        float _1849 = _1837 * _1839;
        float _1851 = _1821 * _1839;
        float _1853 = fma(_1843, _1849, _1375);
        float _1855 = fma(_1847, _1849, _1371);
        float _1857 = fma(_1837, _1851, _1379);
        _1809 = _1855;
        _1811 = _1853;
        _1813 = _1857;
    }
    float _1859 = _1809;
    float _1861 = _1811;
    float _1863 = _1813;
    float _1865 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1871 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1865);
    float _1875 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1867);
    float _1877 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1869);
    float _1879 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1885 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1877);
    float _1887 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    float _1889 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1895 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1905 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1907 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1899);
    float _1909 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1901);
    float _1911 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1903);
    float _1913 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1915 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1917 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1909);
    float _1919 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1911);
    float _1921 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1913);
    float _1923 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1925 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1917);
    float _1927 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1919);
    float _1929 = _1921 + _1925;
    float _1931 = _1923 + _1925;
    float _1933 = _1925 * 0.5;
    float _1935 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1937 = _1929 * 0.5;
    float _1939 = _1931 * 0.5;
    float _1941 = fma(_1927, -0.5, _1933);
    out.m_35.x = _1935;
    out.gl_Position.x = _1921;
    out.gl_Position.y = _1927;
    out.gl_Position.z = _1923;
    out.gl_Position.w = _1925;
    out.m_54.x = _1937;
    out.m_54.y = _1941;
    out.m_54.z = _1939;
    out.m_54.w = _1925;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

