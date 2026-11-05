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
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _787 = false;
    bool _607 = false;
    bool _439 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1438 = as_type<float>(_85);
        out.gl_Position.z = _1438;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_121);
        out.gl_Position.z = _1507;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _291 + _309;
    bool _313 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_291);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _331;
    bool _339 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_291);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _323 * _335;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _359 = _349 * _355;
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _311 * _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = fma(_373, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _295 * _361;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = in.m_40.x;
    float _393 = in.m_40.y;
    float _395 = fma(_365, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _395 * _359;
    float _401 = _397 * _359;
    float _403 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _405 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _407 = fma(_383, _351, _403);
    float _409 = fma(_381, _351, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _391;
    float _417 = _413 * _393;
    bool _419 = !_357;
    float _437;
    if (!_419)
    {
        float _421 = in.m_42.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_69);
        float _443 = 1.0 / _441;
        float _445 = _103 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _447 + _449;
    bool _453 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _455 = isnan(_447);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _447 + _465;
    bool _469 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_447);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _489 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _491 = isnan(_447);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_463;
    float _503 = _501 + 1.0;
    float _505 = 1.0 / _487;
    float _507 = _499 * _503;
    float _509 = -_499;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _513;
    bool _517 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _519 = 1.0 / _483;
    float _521 = _479 * _511;
    float _523 = -_479;
    float _525 = _523 + 1.0;
    float _527 = _467 * _505;
    float _529 = _451 * _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _535;
    float _539 = fma(_515, _529, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _541 = fma(_533, _529, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _543 = fma(_537, _529, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _545 = _539 * _521;
    float _547 = _541 * _521;
    float _549 = _543 * _521;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].x, _545);
    float _565 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].y, _547);
    float _567 = fma(_553, _527, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_557, _527, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = fma(_561, _527, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _573 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].z, _549);
    float _575 = fma(_567, _507, _563);
    float _577 = fma(_569, _507, _565);
    float _579 = fma(_571, _507, _573);
    float _581 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].x, _575);
    float _583 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].y, _577);
    float _585 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].z, _579);
    bool _587 = !_517;
    float _605;
    if (!_587)
    {
        float _589 = in.m_42.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_69);
        float _611 = 1.0 / _609;
        float _613 = _103 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_615);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _647 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_615);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _625;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _685 = 1.0 / _629;
    float _687 = 1.0 / _645;
    float _689 = _663 * _659;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = _657 * _667;
    float _697 = -_657;
    float _699 = _697 + 1.0;
    float _701 = fma(_689, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _703;
    float _707 = _679 * _699;
    float _709 = _693 * _685;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _615 + _711;
    bool _715 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _717 = isnan(_615);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _701 * _707;
    float _729 = -_679;
    float _731 = _729 + 1.0;
    float _733 = fma(_709, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _615 + _735;
    float _739 = _705 * _687;
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    float _747 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _749 = fma(_739, _737, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = _641 * _743;
    float _753 = fma(_733, _695, _745);
    float _755 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = fma(_749, _751, _753);
    float _761 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[118].x, _759);
    float _763 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _755;
    out.m_44.y = _763;
    out.m_44.z = _757;
    out.m_44.w = _765;
    bool _767 = !_683;
    float _785;
    if (!_767)
    {
        float _769 = in.m_42.x;
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _773 = _769 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _777 = _775 * _771;
        float _779 = floor(_777);
        float _781 = -_779;
        float _783 = _777 + _781;
        _785 = _783;
        _787 = true;
    }
    else
    {
        float _789 = float(_69);
        float _791 = 1.0 / _789;
        float _793 = _103 * _791;
        _785 = _793;
    }
    _787 = false;
    float _795 = _785;
    float _797 = in.m_42.x;
    float _799 = in.m_42.y;
    float _801 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _809 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _801);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _811;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _821 = _819 != 0;
    float _823 = 1.0 / _807;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _827 = _795 + _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _833 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _835 = _797 > 0.5;
    bool _837 = _799 > 0.5;
    bool _839 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _841 = isnan(_795);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = _813 * _823;
    bool _853 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _855 = isnan(_795);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _867 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _869 = fma(_851, _827, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _871 = -_177;
    int _873 = _835 ? as_type<int>(_871) : as_type<int>(_177);
    float _875 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _865);
    float _877 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _867);
    float _879 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _809);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _875);
    float _887 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _877);
    bool _889 = !_817;
    float _891 = _889 ? _177 : as_type<float>(_873);
    float _893 = _849 * _883;
    float _895 = _885 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _879 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _901 = _869 * _893;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _905 = _895 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _909 = _897 + _907;
    float _911 = -_849;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _917 = _899 + _915;
    float _919 = _905 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _921 = _891 + 0.5;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _925 = -_181;
    int _927 = _837 ? as_type<int>(_925) : as_type<int>(_181);
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[28].x, _919);
    float _931 = _921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _933 = !_821;
    float _935 = _933 ? _181 : as_type<float>(_927);
    float _937 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[28].z, _929);
    float _939 = _905 * _905;
    float _941 = _931 * _803;
    float _943 = -_935;
    float _945 = _943 + 0.5;
    bool _947 = _937 >= 0.0;
    float _949 = fma(_909, _909, _939);
    float _951 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[132].x, _923);
    float _953 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _955 = fma(_917, _917, _949);
    float _957 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _961 = rsqrt(_955);
    float _963 = _953 * _831;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _967 = _949;
    if (_947)
    {
        _967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _969 = _967;
    float _971 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _941;
    out.m_46.y = _963;
    int _975 = as_type<int>(_969);
    if (_947)
    {
        float _977 = _969 * 5.0;
        _975 = as_type<int>(_977);
    }
    int _979 = _975;
    out.m_48.x = _971;
    out.m_48.y = _973;
    out.m_48.z = _833;
    out.m_48.w = _957;
    if (_947)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2905 = as_type<float>(_979);
        out.gl_Position.z = _2905;
    }
    float _981 = _905 * _961;
    float _983 = _909 * _961;
    if (_947)
    {
        out.m_33.x = 0.0;
    }
    if (_947)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _985 = -_981;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _989 = _917 * _961;
    float _991 = -_983;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _995 = -_981;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1001 = _987 + _999;
    float _1003 = -_989;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1009 = _993 + _1007;
    float _1011 = -_983;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1015 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _1005 + _1017;
    float _1021 = _997 * _997;
    float _1023 = -_989;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1027 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    float _1029 = fma(_1013, _1013, _1021);
    float _1031 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1027);
    float _1033 = fma(_1025, _1025, _1029);
    bool _1035 = _1031 >= 0.0;
    float _1037 = sqrt(_1033);
    float _1039 = _1019;
    if (_1035)
    {
        _1039 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1041 = _1039;
    int _1043 = as_type<int>(_1041);
    if (_1035)
    {
        out.m_33.x = 0.0;
    }
    float _1045 = _961 * _1037;
    if (_1035)
    {
        float _1047 = _1041 * 5.0;
        _1043 = as_type<int>(_1047);
    }
    int _1049 = _1043;
    if (_1035)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3043 = as_type<float>(_1049);
        out.gl_Position.z = _3043;
    }
    if (_1035)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1051 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1055 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1059 = _1045 * _1051;
    float _1061 = _1045 * _1055;
    float _1063 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1065 = _1063 * 0.5;
    float _1067 = _1053 * _1059;
    bool _1069 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1071 = isnan(0.5);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1077 = _1073 || _1075;
    float _1079 = _1057 * _1061;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1081);
    float _1087 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1089 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1085);
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1087);
    float _1093 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1095 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1097 = _899 + _1093;
    float _1099 = _897 + _1095;
    float _1101 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1107 = _1097 + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1111 = _1099 + _1109;
    float _1113 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1115 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1117 = _1107 * _1107;
    float _1119 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1113);
    float _1121 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1115);
    float _1123 = fma(_1111, _1111, _1117);
    float _1125 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1131 = sqrt(_1123);
    float _1133 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1135 = _1129 + _1127;
    float _1137 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1139 = 1.0 / _1127;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = _895 + _1141;
    bool _1145 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = _1067;
    float _1149 = _1141;
    float _1151 = _1065;
    if (!_1145)
    {
        _1147 = _1099;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_1145)
    {
        _1149 = _1097;
    }
    float _1157 = _1149;
    float _1159 = _1157;
    if (!_1145)
    {
        _1151 = _1143;
    }
    float _1161 = _1151;
    bool _1163 = !_1145;
    float _1165 = _1161;
    if (!_1163)
    {
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1171 = _1131 + _1169;
        float _1173 = _1143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = rsqrt(_1123);
        float _1177 = _1171 * _1167;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = _1179 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = _1179 * 6.283185482025146484375;
        float _1187 = sin(_1185);
        float _1189 = _1183 + (-1.0);
        float _1191 = fma(_1187, _1173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1193 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = _1175 * _1191;
        float _1197 = fma(_1143, _1183, _1193);
        float _1199 = fma(_1111, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1201 = fma(_1107, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1165 = _1197;
        _1155 = _1199;
        _1159 = _1201;
    }
    float _1203 = _1165;
    float _1205 = _1155;
    float _1207 = _1159;
    float _1209 = -_981;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1213 = _1135 * _1139;
    float _1215 = _1213 * 0.5;
    float _1217 = -_983;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1205);
    float _1221 = -_989;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1207);
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1227 = _1203;
    if (_1077)
    {
        _1227 = 1.0;
    }
    float _1229 = _1227;
    float _1231 = _1229;
    if (!_1077)
    {
        float _1233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1235 * 0.15915493667125701904296875;
        float _1241 = _1237 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1247 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1245);
        float _1249 = _1237 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1243;
        float _1255 = _1239 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1239 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1265;
        float _1269 = _1257 * _1259;
        float _1271 = 1.0 / _1247;
        float _1273 = 1.0 / _1269;
        float _1275 = 1.0 / _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1279 = _1271 * _1277;
        float _1281 = _1263 * _1273;
        float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1285 = fma(_1281, _1279, _1283);
        float _1287 = _1285 * _1275;
        float _1289 = precise::clamp(_1287, 0.0, 1.0);
        _1231 = _1289;
    }
    float _1291 = _1231;
    float _1293 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1295 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1225);
    float _1297 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1299 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1301 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1293);
    float _1303 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1295);
    float _1305 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1297);
    float _1307 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1299);
    float _1309 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1301);
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1313 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1305);
    float _1315 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1307);
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1325 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1327 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1319);
    float _1331 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1321);
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1323);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1325);
    float _1337 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1339 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1329);
    float _1341 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1331);
    float _1343 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1333);
    float _1345 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1335);
    bool _1347 = _1291 > 0.0;
    bool _1349 = isnan(_1291);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1359 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1339);
    float _1361 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1341);
    float _1363 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1345);
    float _1365 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1369 = _1359 + _1363;
    float _1371 = _1365 + _1363;
    float _1373 = _1363 * 0.5;
    float _1375 = _1369 * 0.5;
    float _1377 = _1371 * 0.5;
    float _1379 = fma(_1361, -0.5, _1373);
    out.m_33.x = _1367;
    out.gl_Position.x = _1359;
    out.gl_Position.y = _1361;
    out.gl_Position.z = _1365;
    out.gl_Position.w = _1363;
    out.m_50.x = _1375;
    out.m_50.y = _1379;
    out.m_50.z = _1377;
    out.m_50.w = _1363;
    if (_1355)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1381 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1381;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _787 = false;
    bool _607 = false;
    bool _439 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1438 = as_type<float>(_85);
        out.gl_Position.z = _1438;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_121);
        out.gl_Position.z = _1507;
    }
    if (_113)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _291 + _309;
    bool _313 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_291);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _331;
    bool _339 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_291);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _323 * _335;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _359 = _349 * _355;
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _311 * _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = fma(_373, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _295 * _361;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = in.m_40.x;
    float _393 = in.m_40.y;
    float _395 = fma(_365, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _395 * _359;
    float _401 = _397 * _359;
    float _403 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _405 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _407 = fma(_383, _351, _403);
    float _409 = fma(_381, _351, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _391;
    float _417 = _413 * _393;
    bool _419 = !_357;
    float _437;
    if (!_419)
    {
        float _421 = in.m_42.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_69);
        float _443 = 1.0 / _441;
        float _445 = _103 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _447 + _449;
    bool _453 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _455 = isnan(_447);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _447 + _465;
    bool _469 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_447);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _489 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _491 = isnan(_447);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_463;
    float _503 = _501 + 1.0;
    float _505 = 1.0 / _487;
    float _507 = _499 * _503;
    float _509 = -_499;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _513;
    bool _517 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _519 = 1.0 / _483;
    float _521 = _479 * _511;
    float _523 = -_479;
    float _525 = _523 + 1.0;
    float _527 = _467 * _505;
    float _529 = _451 * _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _535;
    float _539 = fma(_515, _529, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _541 = fma(_533, _529, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _543 = fma(_537, _529, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _545 = _539 * _521;
    float _547 = _541 * _521;
    float _549 = _543 * _521;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].x, _545);
    float _565 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].y, _547);
    float _567 = fma(_553, _527, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_557, _527, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = fma(_561, _527, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _573 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].z, _549);
    float _575 = fma(_567, _507, _563);
    float _577 = fma(_569, _507, _565);
    float _579 = fma(_571, _507, _573);
    float _581 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].x, _575);
    float _583 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].y, _577);
    float _585 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].z, _579);
    bool _587 = !_517;
    float _605;
    if (!_587)
    {
        float _589 = in.m_42.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_69);
        float _611 = 1.0 / _609;
        float _613 = _103 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_615);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _647 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_615);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _625;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _685 = 1.0 / _629;
    float _687 = 1.0 / _645;
    float _689 = _663 * _659;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = _657 * _667;
    float _697 = -_657;
    float _699 = _697 + 1.0;
    float _701 = fma(_689, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _703;
    float _707 = _679 * _699;
    float _709 = _693 * _685;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _615 + _711;
    bool _715 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _717 = isnan(_615);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _701 * _707;
    float _729 = -_679;
    float _731 = _729 + 1.0;
    float _733 = fma(_709, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _615 + _735;
    float _739 = _705 * _687;
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    float _747 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _749 = fma(_739, _737, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = _641 * _743;
    float _753 = fma(_733, _695, _745);
    float _755 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = fma(_749, _751, _753);
    float _761 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[118].x, _759);
    float _763 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _755;
    out.m_44.y = _763;
    out.m_44.z = _757;
    out.m_44.w = _765;
    bool _767 = !_683;
    float _785;
    if (!_767)
    {
        float _769 = in.m_42.x;
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _773 = _769 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _777 = _775 * _771;
        float _779 = floor(_777);
        float _781 = -_779;
        float _783 = _777 + _781;
        _785 = _783;
        _787 = true;
    }
    else
    {
        float _789 = float(_69);
        float _791 = 1.0 / _789;
        float _793 = _103 * _791;
        _785 = _793;
    }
    _787 = false;
    float _795 = _785;
    float _797 = in.m_42.x;
    float _799 = in.m_42.y;
    float _801 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _809 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _801);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _811;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _821 = _819 != 0;
    float _823 = 1.0 / _807;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _827 = _795 + _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _833 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _835 = _797 > 0.5;
    bool _837 = _799 > 0.5;
    bool _839 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _841 = isnan(_795);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = _813 * _823;
    bool _853 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _855 = isnan(_795);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _867 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _869 = fma(_851, _827, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _871 = -_177;
    int _873 = _835 ? as_type<int>(_871) : as_type<int>(_177);
    float _875 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _865);
    float _877 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _867);
    float _879 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _809);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _875);
    float _887 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _877);
    bool _889 = !_817;
    float _891 = _889 ? _177 : as_type<float>(_873);
    float _893 = _849 * _883;
    float _895 = _885 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _879 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _901 = _869 * _893;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _905 = _895 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _909 = _897 + _907;
    float _911 = -_849;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _917 = _899 + _915;
    float _919 = _905 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _921 = _891 + 0.5;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _925 = -_181;
    int _927 = _837 ? as_type<int>(_925) : as_type<int>(_181);
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[28].x, _919);
    float _931 = _921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _933 = !_821;
    float _935 = _933 ? _181 : as_type<float>(_927);
    float _937 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[28].z, _929);
    float _939 = _905 * _905;
    float _941 = _931 * _803;
    float _943 = -_935;
    float _945 = _943 + 0.5;
    bool _947 = _937 >= 0.0;
    float _949 = fma(_909, _909, _939);
    float _951 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[132].x, _923);
    float _953 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _955 = fma(_917, _917, _949);
    float _957 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _961 = rsqrt(_955);
    float _963 = _953 * _831;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _967 = _949;
    if (_947)
    {
        _967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _969 = _967;
    float _971 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _941;
    out.m_46.y = _963;
    int _975 = as_type<int>(_969);
    if (_947)
    {
        float _977 = _969 * 5.0;
        _975 = as_type<int>(_977);
    }
    int _979 = _975;
    out.m_48.x = _971;
    out.m_48.y = _973;
    out.m_48.z = _833;
    out.m_48.w = _957;
    if (_947)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2905 = as_type<float>(_979);
        out.gl_Position.z = _2905;
    }
    float _981 = _905 * _961;
    float _983 = _909 * _961;
    if (_947)
    {
        out.m_33.x = 0.0;
    }
    if (_947)
    {
        return out;
    }
    float _985 = -_981;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _989 = _917 * _961;
    float _991 = -_983;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _995 = -_981;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1001 = _987 + _999;
    float _1003 = -_989;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1009 = _993 + _1007;
    float _1011 = -_983;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1015 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _1005 + _1017;
    float _1021 = _997 * _997;
    float _1023 = -_989;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1027 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    float _1029 = fma(_1013, _1013, _1021);
    float _1031 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1027);
    float _1033 = fma(_1025, _1025, _1029);
    bool _1035 = _1031 >= 0.0;
    float _1037 = sqrt(_1033);
    float _1039 = _1019;
    if (_1035)
    {
        _1039 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1041 = _1039;
    int _1043 = as_type<int>(_1041);
    if (_1035)
    {
        out.m_33.x = 0.0;
    }
    float _1045 = _961 * _1037;
    if (_1035)
    {
        float _1047 = _1041 * 5.0;
        _1043 = as_type<int>(_1047);
    }
    int _1049 = _1043;
    if (_1035)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3043 = as_type<float>(_1049);
        out.gl_Position.z = _3043;
    }
    if (_1035)
    {
        return out;
    }
    float _1051 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1055 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1059 = _1045 * _1051;
    float _1061 = _1045 * _1055;
    float _1063 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1065 = _1063 * 0.5;
    float _1067 = _1053 * _1059;
    bool _1069 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1071 = isnan(0.5);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1077 = _1073 || _1075;
    float _1079 = _1057 * _1061;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1081);
    float _1087 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1089 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1085);
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1087);
    float _1093 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1095 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1097 = _899 + _1093;
    float _1099 = _897 + _1095;
    float _1101 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1107 = _1097 + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1111 = _1099 + _1109;
    float _1113 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1115 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1117 = _1107 * _1107;
    float _1119 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1113);
    float _1121 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1115);
    float _1123 = fma(_1111, _1111, _1117);
    float _1125 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1131 = sqrt(_1123);
    float _1133 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1135 = _1129 + _1127;
    float _1137 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1139 = 1.0 / _1127;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = _895 + _1141;
    bool _1145 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = _1067;
    float _1149 = _1141;
    float _1151 = _1065;
    if (!_1145)
    {
        _1147 = _1099;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_1145)
    {
        _1149 = _1097;
    }
    float _1157 = _1149;
    float _1159 = _1157;
    if (!_1145)
    {
        _1151 = _1143;
    }
    float _1161 = _1151;
    bool _1163 = !_1145;
    float _1165 = _1161;
    if (!_1163)
    {
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1171 = _1131 + _1169;
        float _1173 = _1143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = rsqrt(_1123);
        float _1177 = _1171 * _1167;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = _1179 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = _1179 * 6.283185482025146484375;
        float _1187 = sin(_1185);
        float _1189 = _1183 + (-1.0);
        float _1191 = fma(_1187, _1173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1193 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = _1175 * _1191;
        float _1197 = fma(_1143, _1183, _1193);
        float _1199 = fma(_1111, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1201 = fma(_1107, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1165 = _1197;
        _1155 = _1199;
        _1159 = _1201;
    }
    float _1203 = _1165;
    float _1205 = _1155;
    float _1207 = _1159;
    float _1209 = -_981;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1213 = _1135 * _1139;
    float _1215 = _1213 * 0.5;
    float _1217 = -_983;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1205);
    float _1221 = -_989;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1207);
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1227 = _1203;
    if (_1077)
    {
        _1227 = 1.0;
    }
    float _1229 = _1227;
    float _1231 = _1229;
    if (!_1077)
    {
        float _1233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1235 * 0.15915493667125701904296875;
        float _1241 = _1237 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1247 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1245);
        float _1249 = _1237 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1243;
        float _1255 = _1239 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1239 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1265;
        float _1269 = _1257 * _1259;
        float _1271 = 1.0 / _1247;
        float _1273 = 1.0 / _1269;
        float _1275 = 1.0 / _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1279 = _1271 * _1277;
        float _1281 = _1263 * _1273;
        float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1285 = fma(_1281, _1279, _1283);
        float _1287 = _1285 * _1275;
        float _1289 = precise::clamp(_1287, 0.0, 1.0);
        _1231 = _1289;
    }
    float _1291 = _1231;
    float _1293 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1295 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1225);
    float _1297 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1299 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1301 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1293);
    float _1303 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1295);
    float _1305 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1297);
    float _1307 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1299);
    float _1309 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1301);
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1313 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1305);
    float _1315 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1307);
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1325 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1327 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1319);
    float _1331 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1321);
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1323);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1325);
    float _1337 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1339 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1329);
    float _1341 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1331);
    float _1343 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1333);
    float _1345 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1335);
    bool _1347 = _1291 > 0.0;
    bool _1349 = isnan(_1291);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1359 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1339);
    float _1361 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1341);
    float _1363 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1345);
    float _1365 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1369 = _1359 + _1363;
    float _1371 = _1365 + _1363;
    float _1373 = _1363 * 0.5;
    float _1375 = _1369 * 0.5;
    float _1377 = _1371 * 0.5;
    float _1379 = fma(_1361, -0.5, _1373);
    out.m_33.x = _1367;
    out.gl_Position.x = _1359;
    out.gl_Position.y = _1361;
    out.gl_Position.z = _1365;
    out.gl_Position.w = _1363;
    out.m_50.x = _1375;
    out.m_50.y = _1379;
    out.m_50.z = _1377;
    out.m_50.w = _1363;
    if (_1355)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1381 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1381;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _787 = false;
    bool _607 = false;
    bool _439 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1438 = as_type<float>(_85);
        out.gl_Position.z = _1438;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_121);
        out.gl_Position.z = _1507;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _291 + _309;
    bool _313 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_291);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _331;
    bool _339 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_291);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _323 * _335;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _359 = _349 * _355;
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _311 * _337;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = fma(_373, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _295 * _361;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = in.m_40.x;
    float _393 = in.m_40.y;
    float _395 = fma(_365, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _395 * _359;
    float _401 = _397 * _359;
    float _403 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _405 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _407 = fma(_383, _351, _403);
    float _409 = fma(_381, _351, _405);
    float _411 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].x, _407);
    float _413 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[145].y, _409);
    float _415 = _411 * _391;
    float _417 = _413 * _393;
    bool _419 = !_357;
    float _437;
    if (!_419)
    {
        float _421 = in.m_42.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_69);
        float _443 = 1.0 / _441;
        float _445 = _103 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _447 + _449;
    bool _453 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _455 = isnan(_447);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _447 + _465;
    bool _469 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_447);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _489 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _491 = isnan(_447);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_463;
    float _503 = _501 + 1.0;
    float _505 = 1.0 / _487;
    float _507 = _499 * _503;
    float _509 = -_499;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _513;
    bool _517 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _519 = 1.0 / _483;
    float _521 = _479 * _511;
    float _523 = -_479;
    float _525 = _523 + 1.0;
    float _527 = _467 * _505;
    float _529 = _451 * _519;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _535;
    float _539 = fma(_515, _529, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _541 = fma(_533, _529, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _543 = fma(_537, _529, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _545 = _539 * _521;
    float _547 = _541 * _521;
    float _549 = _543 * _521;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].x, _545);
    float _565 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].y, _547);
    float _567 = fma(_553, _527, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_557, _527, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = fma(_561, _527, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _573 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[107].z, _549);
    float _575 = fma(_567, _507, _563);
    float _577 = fma(_569, _507, _565);
    float _579 = fma(_571, _507, _573);
    float _581 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].x, _575);
    float _583 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].y, _577);
    float _585 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[109].z, _579);
    bool _587 = !_517;
    float _605;
    if (!_587)
    {
        float _589 = in.m_42.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_69);
        float _611 = 1.0 / _609;
        float _613 = _103 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_615);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _647 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_615);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _625;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _685 = 1.0 / _629;
    float _687 = 1.0 / _645;
    float _689 = _663 * _659;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = _657 * _667;
    float _697 = -_657;
    float _699 = _697 + 1.0;
    float _701 = fma(_689, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _703;
    float _707 = _679 * _699;
    float _709 = _693 * _685;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _615 + _711;
    bool _715 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _717 = isnan(_615);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _701 * _707;
    float _729 = -_679;
    float _731 = _729 + 1.0;
    float _733 = fma(_709, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _615 + _735;
    float _739 = _705 * _687;
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    float _747 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _749 = fma(_739, _737, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = _641 * _743;
    float _753 = fma(_733, _695, _745);
    float _755 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = fma(_749, _751, _753);
    float _761 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[118].x, _759);
    float _763 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _755;
    out.m_44.y = _763;
    out.m_44.z = _757;
    out.m_44.w = _765;
    bool _767 = !_683;
    float _785;
    if (!_767)
    {
        float _769 = in.m_42.x;
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _773 = _769 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _777 = _775 * _771;
        float _779 = floor(_777);
        float _781 = -_779;
        float _783 = _777 + _781;
        _785 = _783;
        _787 = true;
    }
    else
    {
        float _789 = float(_69);
        float _791 = 1.0 / _789;
        float _793 = _103 * _791;
        _785 = _793;
    }
    _787 = false;
    float _795 = _785;
    float _797 = in.m_42.x;
    float _799 = in.m_42.y;
    float _801 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _809 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _801);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _811;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _821 = _819 != 0;
    float _823 = 1.0 / _807;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _827 = _795 + _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _833 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _835 = _797 > 0.5;
    bool _837 = _799 > 0.5;
    bool _839 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _841 = isnan(_795);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = _813 * _823;
    bool _853 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _855 = isnan(_795);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _867 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _869 = fma(_851, _827, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _871 = -_177;
    int _873 = _835 ? as_type<int>(_871) : as_type<int>(_177);
    float _875 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _865);
    float _877 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _867);
    float _879 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _809);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _875);
    float _887 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _877);
    bool _889 = !_817;
    float _891 = _889 ? _177 : as_type<float>(_873);
    float _893 = _849 * _883;
    float _895 = _885 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _879 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _901 = _869 * _893;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _905 = _895 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _909 = _897 + _907;
    float _911 = -_849;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _917 = _899 + _915;
    float _919 = _905 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _921 = _891 + 0.5;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _925 = -_181;
    int _927 = _837 ? as_type<int>(_925) : as_type<int>(_181);
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[28].x, _919);
    float _931 = _921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _933 = !_821;
    float _935 = _933 ? _181 : as_type<float>(_927);
    float _937 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[28].z, _929);
    float _939 = _905 * _905;
    float _941 = _931 * _803;
    float _943 = -_935;
    float _945 = _943 + 0.5;
    bool _947 = _937 >= 0.0;
    float _949 = fma(_909, _909, _939);
    float _951 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[132].x, _923);
    float _953 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _955 = fma(_917, _917, _949);
    float _957 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _961 = rsqrt(_955);
    float _963 = _953 * _831;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _967 = _949;
    if (_947)
    {
        _967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _969 = _967;
    float _971 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _941;
    out.m_46.y = _963;
    int _975 = as_type<int>(_969);
    if (_947)
    {
        float _977 = _969 * 5.0;
        _975 = as_type<int>(_977);
    }
    int _979 = _975;
    out.m_48.x = _971;
    out.m_48.y = _973;
    out.m_48.z = _833;
    out.m_48.w = _957;
    if (_947)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2905 = as_type<float>(_979);
        out.gl_Position.z = _2905;
    }
    float _981 = _905 * _961;
    float _983 = _909 * _961;
    if (_947)
    {
        out.m_33.x = 0.0;
    }
    if (_947)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _985 = -_981;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _989 = _917 * _961;
    float _991 = -_983;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _995 = -_981;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1001 = _987 + _999;
    float _1003 = -_989;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1009 = _993 + _1007;
    float _1011 = -_983;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1015 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _1005 + _1017;
    float _1021 = _997 * _997;
    float _1023 = -_989;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1027 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    float _1029 = fma(_1013, _1013, _1021);
    float _1031 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1027);
    float _1033 = fma(_1025, _1025, _1029);
    bool _1035 = _1031 >= 0.0;
    float _1037 = sqrt(_1033);
    float _1039 = _1019;
    if (_1035)
    {
        _1039 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1041 = _1039;
    int _1043 = as_type<int>(_1041);
    if (_1035)
    {
        out.m_33.x = 0.0;
    }
    float _1045 = _961 * _1037;
    if (_1035)
    {
        float _1047 = _1041 * 5.0;
        _1043 = as_type<int>(_1047);
    }
    int _1049 = _1043;
    if (_1035)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3043 = as_type<float>(_1049);
        out.gl_Position.z = _3043;
    }
    if (_1035)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1051 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1055 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1059 = _1045 * _1051;
    float _1061 = _1045 * _1055;
    float _1063 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1065 = _1063 * 0.5;
    float _1067 = _1053 * _1059;
    bool _1069 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1071 = isnan(0.5);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1077 = _1073 || _1075;
    float _1079 = _1057 * _1061;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1081);
    float _1087 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1089 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1085);
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1087);
    float _1093 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1095 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1097 = _899 + _1093;
    float _1099 = _897 + _1095;
    float _1101 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1107 = _1097 + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1111 = _1099 + _1109;
    float _1113 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1115 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1117 = _1107 * _1107;
    float _1119 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1113);
    float _1121 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1115);
    float _1123 = fma(_1111, _1111, _1117);
    float _1125 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1131 = sqrt(_1123);
    float _1133 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1135 = _1129 + _1127;
    float _1137 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1139 = 1.0 / _1127;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = _895 + _1141;
    bool _1145 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = _1067;
    float _1149 = _1141;
    float _1151 = _1065;
    if (!_1145)
    {
        _1147 = _1099;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_1145)
    {
        _1149 = _1097;
    }
    float _1157 = _1149;
    float _1159 = _1157;
    if (!_1145)
    {
        _1151 = _1143;
    }
    float _1161 = _1151;
    bool _1163 = !_1145;
    float _1165 = _1161;
    if (!_1163)
    {
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1171 = _1131 + _1169;
        float _1173 = _1143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = rsqrt(_1123);
        float _1177 = _1171 * _1167;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = _1179 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = _1179 * 6.283185482025146484375;
        float _1187 = sin(_1185);
        float _1189 = _1183 + (-1.0);
        float _1191 = fma(_1187, _1173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1193 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = _1175 * _1191;
        float _1197 = fma(_1143, _1183, _1193);
        float _1199 = fma(_1111, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1201 = fma(_1107, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1165 = _1197;
        _1155 = _1199;
        _1159 = _1201;
    }
    float _1203 = _1165;
    float _1205 = _1155;
    float _1207 = _1159;
    float _1209 = -_981;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1213 = _1135 * _1139;
    float _1215 = _1213 * 0.5;
    float _1217 = -_983;
    float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1205);
    float _1221 = -_989;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1207);
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1227 = _1203;
    if (_1077)
    {
        _1227 = 1.0;
    }
    float _1229 = _1227;
    float _1231 = _1229;
    if (!_1077)
    {
        float _1233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1235 * 0.15915493667125701904296875;
        float _1241 = _1237 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1247 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1245);
        float _1249 = _1237 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1243;
        float _1255 = _1239 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1239 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1265;
        float _1269 = _1257 * _1259;
        float _1271 = 1.0 / _1247;
        float _1273 = 1.0 / _1269;
        float _1275 = 1.0 / _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1279 = _1271 * _1277;
        float _1281 = _1263 * _1273;
        float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1285 = fma(_1281, _1279, _1283);
        float _1287 = _1285 * _1275;
        float _1289 = precise::clamp(_1287, 0.0, 1.0);
        _1231 = _1289;
    }
    float _1291 = _1231;
    float _1293 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1295 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1225);
    float _1297 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1299 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1301 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1293);
    float _1303 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1295);
    float _1305 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1297);
    float _1307 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1299);
    float _1309 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1301);
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1313 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1305);
    float _1315 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1307);
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1325 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1327 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1319);
    float _1331 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1321);
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1323);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1325);
    float _1337 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1339 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1329);
    float _1341 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1331);
    float _1343 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1333);
    float _1345 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1335);
    bool _1347 = _1291 > 0.0;
    bool _1349 = isnan(_1291);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1359 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1339);
    float _1361 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1341);
    float _1363 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1345);
    float _1365 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1369 = _1359 + _1363;
    float _1371 = _1365 + _1363;
    float _1373 = _1363 * 0.5;
    float _1375 = _1369 * 0.5;
    float _1377 = _1371 * 0.5;
    float _1379 = fma(_1361, -0.5, _1373);
    out.m_33.x = _1367;
    out.gl_Position.x = _1359;
    out.gl_Position.y = _1361;
    out.gl_Position.z = _1365;
    out.gl_Position.w = _1363;
    out.m_50.x = _1375;
    out.m_50.y = _1379;
    out.m_50.z = _1377;
    out.m_50.w = _1363;
    if (_1355)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1381 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1381;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

