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
    float4 m_41 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _933 = false;
    bool _415 = false;
    bool _267 = false;
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
        float _1312 = as_type<float>(_87);
        out.gl_Position.z = _1312;
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
        float _1381 = as_type<float>(_123);
        out.gl_Position.z = _1381;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    bool _281 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_275);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_275);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -_291;
    float _315 = _313 + 1.0;
    float _317 = 1.0 / _311;
    bool _319 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_275);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _303 * _315;
    float _333 = -_303;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = _329 * _335;
    float _341 = 1.0 / _307;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _279 * _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _275 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = _355 * _317;
    float _367 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_349, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = _367 * _339;
    float _379 = _369 * _339;
    float _381 = fma(_373, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _331, _383);
    float _389 = fma(_375, _331, _385);
    float _391 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    bool _395 = !_337;
    float _413;
    if (!_395)
    {
        float _397 = in.m_41.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_71);
        float _419 = 1.0 / _417;
        float _421 = _105 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    float _425 = in.m_39.x;
    float _427 = in.m_39.y;
    float _429 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = in.m_41.x;
    float _435 = in.m_41.y;
    float _437 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _439 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = as_type<float>(int(gl_VertexIndex));
    float _447 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _449 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _451 = 1.0 / _443;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _457 = _393 * _427;
    float _459 = _391 * _425;
    float _461 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    bool _463 = _433 > 0.5;
    float _465 = 1.0 / _455;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _471 = _435 > 0.5;
    float _473 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
    float _475 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _477 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _479 = as_type<int>(_445) & 1;
    bool _481 = _479 != 0;
    int _483 = as_type<int>(_445) & 2;
    bool _485 = _483 != 0;
    float _487 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _489 = 1.0 / _469;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _493 = _491 != 0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _499 = !_485;
    float _501 = _499 ? (-0.5) : 0.5;
    float _503 = _473 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _507 = _505 != 0;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _509;
    bool _513 = !_481;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _501);
    float _519 = 1.0 / _497;
    float _521 = _511 * _451;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _523;
    float _527 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _515);
    float _529 = _475 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _537 = _525 * _489;
    float _539 = _477 * _527;
    float _541 = _529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = _529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _545 = _533 * _465;
    float _547 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _549 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].x, _543);
    bool _553 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = isnan(_423);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _423 + _565;
    float _569 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[24].z, _549);
    float _571 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[26].z, _551);
    float _573 = _487 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _575 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_423);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = _569 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _589 = _571 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _591 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _593 = isnan(_423);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_563;
    float _605 = _603 + 1.0;
    float _607 = _547 + _587;
    float _609 = _573 + _589;
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = -_601;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _621 = _607 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _625 = _609 + _623;
    float _627 = _585 * _605;
    float _629 = _563 * _617;
    float _631 = _621 * _621;
    float _633 = _625 * _625;
    bool _635 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_423);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_521, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _649 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_423);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _631 + _633;
    float _663 = _529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _665 = -_645;
    float _667 = _665 + 1.0;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _423 + _669;
    float _673 = sqrt(_661);
    float _675 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _663);
    float _677 = _659 * _667;
    float _679 = -_659;
    float _681 = _679 + 1.0;
    float _683 = _645 * _613;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _687 = _423 + _685;
    float _689 = _647 * _677;
    float _691 = fma(_545, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _693 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[25].z, _675);
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _697 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _689);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _703 = fma(_537, _687, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _707 = _423 + _705;
    float _709 = fma(_691, _683, _697);
    float _711 = _693 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _713 = _673 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _717 = _701 * _519;
    float _719 = fma(_703, _627, _709);
    float _721 = -_515;
    float _723 = _463 ? _721 : _515;
    float _725 = _503 + _711;
    float _727 = -_501;
    float _729 = _471 ? _727 : _501;
    float _731 = fma(_717, _707, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _733 = !_493;
    float _735 = _733 ? _515 : _723;
    bool _737 = !_507;
    float _739 = _737 ? _501 : _729;
    float _741 = _691;
    float _743 = _723;
    float _745 = _515;
    float _747 = _501;
    float _749 = _729;
    if (!_713)
    {
        _741 = _633;
    }
    float _751 = _741;
    float _753 = _751;
    if (!_713)
    {
        _743 = _631;
    }
    float _755 = _743;
    float _757 = _755;
    if (!_713)
    {
        _745 = _607;
    }
    float _759 = _745;
    float _761 = _759;
    if (!_713)
    {
        _747 = _609;
    }
    float _763 = _747;
    float _765 = _763;
    if (!_713)
    {
        _749 = _725;
    }
    float _767 = _749;
    bool _769 = !_713;
    float _771 = _767;
    if (!_769)
    {
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _777 = _673 + _775;
        float _779 = rsqrt(_661);
        float _781 = _777 * _773;
        float _783 = _725 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = _781 * 0.15915493667125701904296875;
        float _787 = _785 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = _785 * 6.283185482025146484375;
        float _793 = cos(_791);
        float _795 = fma(_789, _783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _797 = _779 * _795;
        float _799 = fma(_621, _797, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _801 = _793 + (-1.0);
        float _803 = fma(_625, _797, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _805 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _807 = _799 + _805;
        float _809 = _801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _813 = _803 + _811;
        float _815 = _807 * _807;
        float _817 = fma(_725, _793, _809);
        float _819 = _813 * _813;
        _771 = _817;
        _757 = _815;
        _753 = _819;
        _761 = _799;
        _765 = _803;
    }
    float _821 = _771;
    float _823 = _757;
    float _825 = _753;
    float _827 = _761;
    float _829 = _765;
    float _831 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _833 = _821 + _831;
    float _835 = _735 + 0.5;
    float _837 = fma(_731, _629, _719);
    float _839 = -_739;
    float _841 = _839 + 0.5;
    float _843 = fma(_833, _833, _823);
    float _845 = _835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _847 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[119].x, _837);
    float _849 = _843 + _825;
    float _851 = _845 * _695;
    float _853 = _841 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _857 = sqrt(_849);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _867 = _853 * _715;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _871 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _847 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _851;
    out.m_46.y = _867;
    bool _885 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _887 = isnan(_857);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _893 = _889 || _891;
    out.m_48.x = _875;
    out.m_48.y = _877;
    out.m_48.z = _879;
    out.m_50.x = _871;
    out.m_50.y = _873;
    out.m_50.z = _881;
    out.m_50.w = _883;
    float _895 = _863;
    float _897 = _829;
    if (!_893)
    {
        _895 = 1.0;
    }
    float _899 = _895;
    bool _901 = !_893;
    float _903 = _899;
    if (!_901)
    {
        bool _905 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _907 = isnan(_857);
        bool _909 = _905 || _907;
        bool _911 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _913 = _909 || _911;
        if (!_913)
        {
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = _857 + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _921 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _919;
            float _923 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _925 = _923 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _927 = 1.0 / _921;
            float _929 = _917 * _927;
            float _931 = fma(_929, _925, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _903 = _931;
            _933 = true;
        }
        else
        {
            bool _935 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _937 = isnan(_857);
            bool _939 = _935 || _937;
            bool _941 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _943 = _939 || _941;
            if (!_943)
            {
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _857 + _945;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _953 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _955 = _953 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _957 = 1.0 / _951;
                float _959 = _947 * _957;
                float _961 = fma(_959, _955, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _903 = _961;
                _933 = true;
            }
            else
            {
                _903 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _933 = false;
    float _963 = _903;
    float _965 = _503 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _967 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _969 = _827 + _967;
    float _971 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _965);
    bool _973 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    float _983 = _503 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _985 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _987 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.5);
    bool _993 = _989 || _991;
    float _995 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].z, _971);
    float _997 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _999 = _821 + _997;
    float _1001 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _983);
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1005 = _829 + _1003;
    float _1007 = _995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1009 = fma(_969, _963, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1011 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1001);
    float _1013 = fma(_999, _963, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1015 = 1.0 / _1007;
    float _1017 = fma(_1005, _963, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1021 = _969;
    float _1023 = _963;
    if (_993)
    {
        _1021 = _1009;
    }
    float _1025 = _1021;
    float _1027 = _1019 + _1007;
    float _1029 = _1025;
    if (_993)
    {
        _897 = _1013;
    }
    float _1031 = _897;
    float _1033 = _1031;
    if (_993)
    {
        _1023 = _1017;
    }
    float _1035 = _1023;
    float _1037 = _1035;
    if (!_993)
    {
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1041 = _503 + _1039;
        float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1045 = _547 + _1043;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1049 = _1041 * _1041;
        float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1053 = _573 + _1051;
        float _1055 = fma(_1045, _1045, _1049);
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1059 = fma(_1053, _1053, _1055);
        float _1061 = sqrt(_1059);
        float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1065 = -_573;
        float _1067 = _1065 + _1017;
        float _1069 = precise::min(_1061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1071 = _1069 * _1057;
        float _1073 = -_547;
        float _1075 = _1073 + _1009;
        float _1077 = _1063 * _1071;
        float _1079 = -_503;
        float _1081 = _1079 + _1013;
        float _1083 = fma(_1075, _1077, _547);
        float _1085 = fma(_1081, _1077, _503);
        float _1087 = fma(_1067, _1077, _573);
        _1033 = _1085;
        _1029 = _1083;
        _1037 = _1087;
    }
    float _1089 = _1033;
    float _1091 = _1029;
    float _1093 = _1037;
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1097 = _1027 * _1015;
    float _1099 = _1097 * 0.5;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1105 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1107 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1111 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1103);
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1105);
    float _1115 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1107);
    float _1117 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1109);
    float _1119 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1111);
    float _1121 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1113);
    float _1123 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1125 = _1101;
    if (_981)
    {
        _1125 = 1.0;
    }
    float _1127 = _1125;
    float _1129 = _1127;
    if (!_981)
    {
        float _1131 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1135 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1133);
        float _1137 = _1131 * 0.15915493667125701904296875;
        float _1139 = _1137 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        float _1143 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1145 = _1143 * 0.15915493667125701904296875;
        float _1147 = _1137 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = 1.0 / _1141;
        float _1153 = _1145 * 6.283185482025146484375;
        float _1155 = cos(_1153);
        float _1157 = _1149 * _1151;
        float _1159 = 1.0 / _1135;
        float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1163 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1161;
        float _1165 = _1155 * _1157;
        float _1167 = _1145 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = 1.0 / _1165;
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1175 = _1159 * _1173;
        float _1177 = 1.0 / _1163;
        float _1179 = _1169 * _1171;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = fma(_1179, _1175, _1181);
        float _1185 = _1183 * _1177;
        float _1187 = precise::clamp(_1185, 0.0, 1.0);
        _1129 = _1187;
    }
    float _1189 = _1129;
    float _1191 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1193 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1195 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1197 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1199 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1201 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1193);
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1195);
    float _1207 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1197);
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1199);
    float _1211 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1203);
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1205);
    float _1217 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1207);
    float _1219 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1209);
    bool _1221 = _1189 > 0.0;
    bool _1223 = isnan(_1189);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    float _1231 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1233 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1235 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1215);
    float _1239 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1243 = _1233 + _1235;
    float _1245 = _1237 + _1235;
    float _1247 = _1235 * 0.5;
    float _1249 = _1243 * 0.5;
    float _1251 = _1245 * 0.5;
    float _1253 = fma(_1239, -0.5, _1247);
    out.m_35.x = _1241;
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1239;
    out.gl_Position.z = _1237;
    out.gl_Position.w = _1235;
    out.m_52.x = _1249;
    out.m_52.y = _1253;
    out.m_52.z = _1251;
    out.m_52.w = _1235;
    if (_1229)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1255;
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
    bool _933 = false;
    bool _415 = false;
    bool _267 = false;
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
        float _1312 = as_type<float>(_87);
        out.gl_Position.z = _1312;
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
        float _1381 = as_type<float>(_123);
        out.gl_Position.z = _1381;
    }
    if (_115)
    {
        return out;
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    bool _281 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_275);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_275);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -_291;
    float _315 = _313 + 1.0;
    float _317 = 1.0 / _311;
    bool _319 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_275);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _303 * _315;
    float _333 = -_303;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = _329 * _335;
    float _341 = 1.0 / _307;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _279 * _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _275 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = _355 * _317;
    float _367 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_349, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = _367 * _339;
    float _379 = _369 * _339;
    float _381 = fma(_373, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _331, _383);
    float _389 = fma(_375, _331, _385);
    float _391 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    bool _395 = !_337;
    float _413;
    if (!_395)
    {
        float _397 = in.m_41.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_71);
        float _419 = 1.0 / _417;
        float _421 = _105 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    float _425 = in.m_39.x;
    float _427 = in.m_39.y;
    float _429 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = in.m_41.x;
    float _435 = in.m_41.y;
    float _437 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _439 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = as_type<float>(int(gl_VertexIndex));
    float _447 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _449 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _451 = 1.0 / _443;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _457 = _393 * _427;
    float _459 = _391 * _425;
    float _461 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    bool _463 = _433 > 0.5;
    float _465 = 1.0 / _455;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _471 = _435 > 0.5;
    float _473 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
    float _475 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _477 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _479 = as_type<int>(_445) & 1;
    bool _481 = _479 != 0;
    int _483 = as_type<int>(_445) & 2;
    bool _485 = _483 != 0;
    float _487 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _489 = 1.0 / _469;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _493 = _491 != 0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _499 = !_485;
    float _501 = _499 ? (-0.5) : 0.5;
    float _503 = _473 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _507 = _505 != 0;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _509;
    bool _513 = !_481;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _501);
    float _519 = 1.0 / _497;
    float _521 = _511 * _451;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _523;
    float _527 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _515);
    float _529 = _475 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _537 = _525 * _489;
    float _539 = _477 * _527;
    float _541 = _529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = _529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _545 = _533 * _465;
    float _547 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _549 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].x, _543);
    bool _553 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = isnan(_423);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _423 + _565;
    float _569 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[24].z, _549);
    float _571 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[26].z, _551);
    float _573 = _487 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _575 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_423);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = _569 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _589 = _571 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _591 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _593 = isnan(_423);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_563;
    float _605 = _603 + 1.0;
    float _607 = _547 + _587;
    float _609 = _573 + _589;
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = -_601;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _621 = _607 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _625 = _609 + _623;
    float _627 = _585 * _605;
    float _629 = _563 * _617;
    float _631 = _621 * _621;
    float _633 = _625 * _625;
    bool _635 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_423);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_521, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _649 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_423);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _631 + _633;
    float _663 = _529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _665 = -_645;
    float _667 = _665 + 1.0;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _423 + _669;
    float _673 = sqrt(_661);
    float _675 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _663);
    float _677 = _659 * _667;
    float _679 = -_659;
    float _681 = _679 + 1.0;
    float _683 = _645 * _613;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _687 = _423 + _685;
    float _689 = _647 * _677;
    float _691 = fma(_545, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _693 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[25].z, _675);
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _697 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _689);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _703 = fma(_537, _687, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _707 = _423 + _705;
    float _709 = fma(_691, _683, _697);
    float _711 = _693 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _713 = _673 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _717 = _701 * _519;
    float _719 = fma(_703, _627, _709);
    float _721 = -_515;
    float _723 = _463 ? _721 : _515;
    float _725 = _503 + _711;
    float _727 = -_501;
    float _729 = _471 ? _727 : _501;
    float _731 = fma(_717, _707, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _733 = !_493;
    float _735 = _733 ? _515 : _723;
    bool _737 = !_507;
    float _739 = _737 ? _501 : _729;
    float _741 = _691;
    float _743 = _723;
    float _745 = _515;
    float _747 = _501;
    float _749 = _729;
    if (!_713)
    {
        _741 = _633;
    }
    float _751 = _741;
    float _753 = _751;
    if (!_713)
    {
        _743 = _631;
    }
    float _755 = _743;
    float _757 = _755;
    if (!_713)
    {
        _745 = _607;
    }
    float _759 = _745;
    float _761 = _759;
    if (!_713)
    {
        _747 = _609;
    }
    float _763 = _747;
    float _765 = _763;
    if (!_713)
    {
        _749 = _725;
    }
    float _767 = _749;
    bool _769 = !_713;
    float _771 = _767;
    if (!_769)
    {
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _777 = _673 + _775;
        float _779 = rsqrt(_661);
        float _781 = _777 * _773;
        float _783 = _725 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = _781 * 0.15915493667125701904296875;
        float _787 = _785 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = _785 * 6.283185482025146484375;
        float _793 = cos(_791);
        float _795 = fma(_789, _783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _797 = _779 * _795;
        float _799 = fma(_621, _797, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _801 = _793 + (-1.0);
        float _803 = fma(_625, _797, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _805 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _807 = _799 + _805;
        float _809 = _801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _813 = _803 + _811;
        float _815 = _807 * _807;
        float _817 = fma(_725, _793, _809);
        float _819 = _813 * _813;
        _771 = _817;
        _757 = _815;
        _753 = _819;
        _761 = _799;
        _765 = _803;
    }
    float _821 = _771;
    float _823 = _757;
    float _825 = _753;
    float _827 = _761;
    float _829 = _765;
    float _831 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _833 = _821 + _831;
    float _835 = _735 + 0.5;
    float _837 = fma(_731, _629, _719);
    float _839 = -_739;
    float _841 = _839 + 0.5;
    float _843 = fma(_833, _833, _823);
    float _845 = _835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _847 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[119].x, _837);
    float _849 = _843 + _825;
    float _851 = _845 * _695;
    float _853 = _841 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _857 = sqrt(_849);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _867 = _853 * _715;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _871 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _847 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _851;
    out.m_46.y = _867;
    bool _885 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _887 = isnan(_857);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _893 = _889 || _891;
    out.m_48.x = _875;
    out.m_48.y = _877;
    out.m_48.z = _879;
    out.m_50.x = _871;
    out.m_50.y = _873;
    out.m_50.z = _881;
    out.m_50.w = _883;
    float _895 = _863;
    float _897 = _829;
    if (!_893)
    {
        _895 = 1.0;
    }
    float _899 = _895;
    bool _901 = !_893;
    float _903 = _899;
    if (!_901)
    {
        bool _905 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _907 = isnan(_857);
        bool _909 = _905 || _907;
        bool _911 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _913 = _909 || _911;
        if (!_913)
        {
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = _857 + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _921 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _919;
            float _923 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _925 = _923 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _927 = 1.0 / _921;
            float _929 = _917 * _927;
            float _931 = fma(_929, _925, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _903 = _931;
            _933 = true;
        }
        else
        {
            bool _935 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _937 = isnan(_857);
            bool _939 = _935 || _937;
            bool _941 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _943 = _939 || _941;
            if (!_943)
            {
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _857 + _945;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _953 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _955 = _953 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _957 = 1.0 / _951;
                float _959 = _947 * _957;
                float _961 = fma(_959, _955, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _903 = _961;
                _933 = true;
            }
            else
            {
                _903 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _933 = false;
    float _963 = _903;
    float _965 = _503 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _967 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _969 = _827 + _967;
    float _971 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _965);
    bool _973 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    float _983 = _503 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _985 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _987 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.5);
    bool _993 = _989 || _991;
    float _995 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].z, _971);
    float _997 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _999 = _821 + _997;
    float _1001 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _983);
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1005 = _829 + _1003;
    float _1007 = _995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1009 = fma(_969, _963, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1011 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1001);
    float _1013 = fma(_999, _963, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1015 = 1.0 / _1007;
    float _1017 = fma(_1005, _963, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1021 = _969;
    float _1023 = _963;
    if (_993)
    {
        _1021 = _1009;
    }
    float _1025 = _1021;
    float _1027 = _1019 + _1007;
    float _1029 = _1025;
    if (_993)
    {
        _897 = _1013;
    }
    float _1031 = _897;
    float _1033 = _1031;
    if (_993)
    {
        _1023 = _1017;
    }
    float _1035 = _1023;
    float _1037 = _1035;
    if (!_993)
    {
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1041 = _503 + _1039;
        float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1045 = _547 + _1043;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1049 = _1041 * _1041;
        float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1053 = _573 + _1051;
        float _1055 = fma(_1045, _1045, _1049);
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1059 = fma(_1053, _1053, _1055);
        float _1061 = sqrt(_1059);
        float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1065 = -_573;
        float _1067 = _1065 + _1017;
        float _1069 = precise::min(_1061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1071 = _1069 * _1057;
        float _1073 = -_547;
        float _1075 = _1073 + _1009;
        float _1077 = _1063 * _1071;
        float _1079 = -_503;
        float _1081 = _1079 + _1013;
        float _1083 = fma(_1075, _1077, _547);
        float _1085 = fma(_1081, _1077, _503);
        float _1087 = fma(_1067, _1077, _573);
        _1033 = _1085;
        _1029 = _1083;
        _1037 = _1087;
    }
    float _1089 = _1033;
    float _1091 = _1029;
    float _1093 = _1037;
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1097 = _1027 * _1015;
    float _1099 = _1097 * 0.5;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1105 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1107 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1111 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1103);
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1105);
    float _1115 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1107);
    float _1117 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1109);
    float _1119 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1111);
    float _1121 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1113);
    float _1123 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1125 = _1101;
    if (_981)
    {
        _1125 = 1.0;
    }
    float _1127 = _1125;
    float _1129 = _1127;
    if (!_981)
    {
        float _1131 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1135 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1133);
        float _1137 = _1131 * 0.15915493667125701904296875;
        float _1139 = _1137 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        float _1143 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1145 = _1143 * 0.15915493667125701904296875;
        float _1147 = _1137 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = 1.0 / _1141;
        float _1153 = _1145 * 6.283185482025146484375;
        float _1155 = cos(_1153);
        float _1157 = _1149 * _1151;
        float _1159 = 1.0 / _1135;
        float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1163 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1161;
        float _1165 = _1155 * _1157;
        float _1167 = _1145 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = 1.0 / _1165;
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1175 = _1159 * _1173;
        float _1177 = 1.0 / _1163;
        float _1179 = _1169 * _1171;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = fma(_1179, _1175, _1181);
        float _1185 = _1183 * _1177;
        float _1187 = precise::clamp(_1185, 0.0, 1.0);
        _1129 = _1187;
    }
    float _1189 = _1129;
    float _1191 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1193 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1195 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1197 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1199 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1201 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1193);
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1195);
    float _1207 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1197);
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1199);
    float _1211 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1203);
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1205);
    float _1217 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1207);
    float _1219 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1209);
    bool _1221 = _1189 > 0.0;
    bool _1223 = isnan(_1189);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    float _1231 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1233 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1235 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1215);
    float _1239 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1243 = _1233 + _1235;
    float _1245 = _1237 + _1235;
    float _1247 = _1235 * 0.5;
    float _1249 = _1243 * 0.5;
    float _1251 = _1245 * 0.5;
    float _1253 = fma(_1239, -0.5, _1247);
    out.m_35.x = _1241;
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1239;
    out.gl_Position.z = _1237;
    out.gl_Position.w = _1235;
    out.m_52.x = _1249;
    out.m_52.y = _1253;
    out.m_52.z = _1251;
    out.m_52.w = _1235;
    if (_1229)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1255;
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
    bool _933 = false;
    bool _415 = false;
    bool _267 = false;
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
        float _1312 = as_type<float>(_87);
        out.gl_Position.z = _1312;
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
        float _1381 = as_type<float>(_123);
        out.gl_Position.z = _1381;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    bool _281 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_275);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_275);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -_291;
    float _315 = _313 + 1.0;
    float _317 = 1.0 / _311;
    bool _319 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_275);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _303 * _315;
    float _333 = -_303;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = _329 * _335;
    float _341 = 1.0 / _307;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _279 * _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _275 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = _355 * _317;
    float _367 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_349, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = _367 * _339;
    float _379 = _369 * _339;
    float _381 = fma(_373, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _331, _383);
    float _389 = fma(_375, _331, _385);
    float _391 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    bool _395 = !_337;
    float _413;
    if (!_395)
    {
        float _397 = in.m_41.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_71);
        float _419 = 1.0 / _417;
        float _421 = _105 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    float _425 = in.m_39.x;
    float _427 = in.m_39.y;
    float _429 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = in.m_41.x;
    float _435 = in.m_41.y;
    float _437 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _439 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = as_type<float>(int(gl_VertexIndex));
    float _447 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _449 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _451 = 1.0 / _443;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _457 = _393 * _427;
    float _459 = _391 * _425;
    float _461 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    bool _463 = _433 > 0.5;
    float _465 = 1.0 / _455;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _471 = _435 > 0.5;
    float _473 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
    float _475 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _477 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _479 = as_type<int>(_445) & 1;
    bool _481 = _479 != 0;
    int _483 = as_type<int>(_445) & 2;
    bool _485 = _483 != 0;
    float _487 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _489 = 1.0 / _469;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _493 = _491 != 0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _499 = !_485;
    float _501 = _499 ? (-0.5) : 0.5;
    float _503 = _473 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _507 = _505 != 0;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _509;
    bool _513 = !_481;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _501);
    float _519 = 1.0 / _497;
    float _521 = _511 * _451;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _523;
    float _527 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _515);
    float _529 = _475 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _537 = _525 * _489;
    float _539 = _477 * _527;
    float _541 = _529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = _529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _545 = _533 * _465;
    float _547 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _549 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].x, _543);
    bool _553 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = isnan(_423);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _423 + _565;
    float _569 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[24].z, _549);
    float _571 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[26].z, _551);
    float _573 = _487 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _575 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_423);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = _569 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _589 = _571 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _591 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _593 = isnan(_423);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_563;
    float _605 = _603 + 1.0;
    float _607 = _547 + _587;
    float _609 = _573 + _589;
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = -_601;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _621 = _607 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _625 = _609 + _623;
    float _627 = _585 * _605;
    float _629 = _563 * _617;
    float _631 = _621 * _621;
    float _633 = _625 * _625;
    bool _635 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_423);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_521, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _649 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_423);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _631 + _633;
    float _663 = _529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _665 = -_645;
    float _667 = _665 + 1.0;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _423 + _669;
    float _673 = sqrt(_661);
    float _675 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _663);
    float _677 = _659 * _667;
    float _679 = -_659;
    float _681 = _679 + 1.0;
    float _683 = _645 * _613;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _687 = _423 + _685;
    float _689 = _647 * _677;
    float _691 = fma(_545, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _693 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[25].z, _675);
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _697 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _689);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _703 = fma(_537, _687, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _707 = _423 + _705;
    float _709 = fma(_691, _683, _697);
    float _711 = _693 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _713 = _673 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _717 = _701 * _519;
    float _719 = fma(_703, _627, _709);
    float _721 = -_515;
    float _723 = _463 ? _721 : _515;
    float _725 = _503 + _711;
    float _727 = -_501;
    float _729 = _471 ? _727 : _501;
    float _731 = fma(_717, _707, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _733 = !_493;
    float _735 = _733 ? _515 : _723;
    bool _737 = !_507;
    float _739 = _737 ? _501 : _729;
    float _741 = _691;
    float _743 = _723;
    float _745 = _515;
    float _747 = _501;
    float _749 = _729;
    if (!_713)
    {
        _741 = _633;
    }
    float _751 = _741;
    float _753 = _751;
    if (!_713)
    {
        _743 = _631;
    }
    float _755 = _743;
    float _757 = _755;
    if (!_713)
    {
        _745 = _607;
    }
    float _759 = _745;
    float _761 = _759;
    if (!_713)
    {
        _747 = _609;
    }
    float _763 = _747;
    float _765 = _763;
    if (!_713)
    {
        _749 = _725;
    }
    float _767 = _749;
    bool _769 = !_713;
    float _771 = _767;
    if (!_769)
    {
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _777 = _673 + _775;
        float _779 = rsqrt(_661);
        float _781 = _777 * _773;
        float _783 = _725 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = _781 * 0.15915493667125701904296875;
        float _787 = _785 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = _785 * 6.283185482025146484375;
        float _793 = cos(_791);
        float _795 = fma(_789, _783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _797 = _779 * _795;
        float _799 = fma(_621, _797, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _801 = _793 + (-1.0);
        float _803 = fma(_625, _797, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _805 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _807 = _799 + _805;
        float _809 = _801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _813 = _803 + _811;
        float _815 = _807 * _807;
        float _817 = fma(_725, _793, _809);
        float _819 = _813 * _813;
        _771 = _817;
        _757 = _815;
        _753 = _819;
        _761 = _799;
        _765 = _803;
    }
    float _821 = _771;
    float _823 = _757;
    float _825 = _753;
    float _827 = _761;
    float _829 = _765;
    float _831 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _833 = _821 + _831;
    float _835 = _735 + 0.5;
    float _837 = fma(_731, _629, _719);
    float _839 = -_739;
    float _841 = _839 + 0.5;
    float _843 = fma(_833, _833, _823);
    float _845 = _835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _847 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[119].x, _837);
    float _849 = _843 + _825;
    float _851 = _845 * _695;
    float _853 = _841 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _857 = sqrt(_849);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _867 = _853 * _715;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _871 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _847 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _851;
    out.m_46.y = _867;
    bool _885 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _887 = isnan(_857);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _893 = _889 || _891;
    out.m_48.x = _875;
    out.m_48.y = _877;
    out.m_48.z = _879;
    out.m_50.x = _871;
    out.m_50.y = _873;
    out.m_50.z = _881;
    out.m_50.w = _883;
    float _895 = _863;
    float _897 = _829;
    if (!_893)
    {
        _895 = 1.0;
    }
    float _899 = _895;
    bool _901 = !_893;
    float _903 = _899;
    if (!_901)
    {
        bool _905 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _907 = isnan(_857);
        bool _909 = _905 || _907;
        bool _911 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _913 = _909 || _911;
        if (!_913)
        {
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = _857 + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _921 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _919;
            float _923 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _925 = _923 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _927 = 1.0 / _921;
            float _929 = _917 * _927;
            float _931 = fma(_929, _925, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _903 = _931;
            _933 = true;
        }
        else
        {
            bool _935 = _857 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _937 = isnan(_857);
            bool _939 = _935 || _937;
            bool _941 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _943 = _939 || _941;
            if (!_943)
            {
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _857 + _945;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _953 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _955 = _953 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _957 = 1.0 / _951;
                float _959 = _947 * _957;
                float _961 = fma(_959, _955, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _903 = _961;
                _933 = true;
            }
            else
            {
                _903 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _933 = false;
    float _963 = _903;
    float _965 = _503 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _967 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _969 = _827 + _967;
    float _971 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _965);
    bool _973 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    float _983 = _503 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _985 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _987 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.5);
    bool _993 = _989 || _991;
    float _995 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].z, _971);
    float _997 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _999 = _821 + _997;
    float _1001 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _983);
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1005 = _829 + _1003;
    float _1007 = _995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1009 = fma(_969, _963, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1011 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1001);
    float _1013 = fma(_999, _963, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1015 = 1.0 / _1007;
    float _1017 = fma(_1005, _963, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1021 = _969;
    float _1023 = _963;
    if (_993)
    {
        _1021 = _1009;
    }
    float _1025 = _1021;
    float _1027 = _1019 + _1007;
    float _1029 = _1025;
    if (_993)
    {
        _897 = _1013;
    }
    float _1031 = _897;
    float _1033 = _1031;
    if (_993)
    {
        _1023 = _1017;
    }
    float _1035 = _1023;
    float _1037 = _1035;
    if (!_993)
    {
        float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1041 = _503 + _1039;
        float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1045 = _547 + _1043;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1049 = _1041 * _1041;
        float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1053 = _573 + _1051;
        float _1055 = fma(_1045, _1045, _1049);
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1059 = fma(_1053, _1053, _1055);
        float _1061 = sqrt(_1059);
        float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1065 = -_573;
        float _1067 = _1065 + _1017;
        float _1069 = precise::min(_1061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1071 = _1069 * _1057;
        float _1073 = -_547;
        float _1075 = _1073 + _1009;
        float _1077 = _1063 * _1071;
        float _1079 = -_503;
        float _1081 = _1079 + _1013;
        float _1083 = fma(_1075, _1077, _547);
        float _1085 = fma(_1081, _1077, _503);
        float _1087 = fma(_1067, _1077, _573);
        _1033 = _1085;
        _1029 = _1083;
        _1037 = _1087;
    }
    float _1089 = _1033;
    float _1091 = _1029;
    float _1093 = _1037;
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1097 = _1027 * _1015;
    float _1099 = _1097 * 0.5;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1105 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1107 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1111 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1103);
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1105);
    float _1115 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1107);
    float _1117 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1109);
    float _1119 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1111);
    float _1121 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1113);
    float _1123 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1125 = _1101;
    if (_981)
    {
        _1125 = 1.0;
    }
    float _1127 = _1125;
    float _1129 = _1127;
    if (!_981)
    {
        float _1131 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1135 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1133);
        float _1137 = _1131 * 0.15915493667125701904296875;
        float _1139 = _1137 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        float _1143 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1145 = _1143 * 0.15915493667125701904296875;
        float _1147 = _1137 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = 1.0 / _1141;
        float _1153 = _1145 * 6.283185482025146484375;
        float _1155 = cos(_1153);
        float _1157 = _1149 * _1151;
        float _1159 = 1.0 / _1135;
        float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1163 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1161;
        float _1165 = _1155 * _1157;
        float _1167 = _1145 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = 1.0 / _1165;
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1175 = _1159 * _1173;
        float _1177 = 1.0 / _1163;
        float _1179 = _1169 * _1171;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = fma(_1179, _1175, _1181);
        float _1185 = _1183 * _1177;
        float _1187 = precise::clamp(_1185, 0.0, 1.0);
        _1129 = _1187;
    }
    float _1189 = _1129;
    float _1191 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1193 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1195 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1197 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1199 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1201 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1193);
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1195);
    float _1207 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1197);
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1199);
    float _1211 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1203);
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1205);
    float _1217 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1207);
    float _1219 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1209);
    bool _1221 = _1189 > 0.0;
    bool _1223 = isnan(_1189);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    float _1231 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1233 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1235 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1215);
    float _1239 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1243 = _1233 + _1235;
    float _1245 = _1237 + _1235;
    float _1247 = _1235 * 0.5;
    float _1249 = _1243 * 0.5;
    float _1251 = _1245 * 0.5;
    float _1253 = fma(_1239, -0.5, _1247);
    out.m_35.x = _1241;
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1239;
    out.gl_Position.z = _1237;
    out.gl_Position.w = _1235;
    out.m_52.x = _1249;
    out.m_52.y = _1253;
    out.m_52.z = _1251;
    out.m_52.w = _1235;
    if (_1229)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1255;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

