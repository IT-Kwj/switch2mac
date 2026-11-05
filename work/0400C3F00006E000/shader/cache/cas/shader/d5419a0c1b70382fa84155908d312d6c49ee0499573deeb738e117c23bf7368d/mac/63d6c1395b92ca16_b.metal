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
    float4 m_48 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1308 = as_type<float>(_85);
        out.gl_Position.z = _1308;
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
        float _1377 = as_type<float>(_121);
        out.gl_Position.z = _1377;
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
    float _617 = in.m_42.x;
    float _619 = in.m_42.y;
    float _621 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _635 = 1.0 / _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _627);
    float _643 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _645 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = 1.0 / _639;
    bool _651 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_615);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = _631 * _635;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _667 = _615 + _665;
    bool _669 = _619 > 0.5;
    float _671 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = fma(_663, _667, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _679 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = isnan(_615);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _671);
    bool _693 = _617 > 0.5;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _697 = _615 + _695;
    float _699 = -_689;
    float _701 = _699 + 1.0;
    float _703 = _675 * _649;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    float _711 = _661 * _701;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _715 = _713 != 0;
    float _717 = -_661;
    float _719 = _717 + 1.0;
    bool _721 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _723 = isnan(_615);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _677 * _711;
    float _735 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _691);
    float _737 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _739 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _741 = -_731;
    float _743 = _741 + 1.0;
    float _745 = _735 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _747 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _751 = _739 + _749;
    float _753 = _689 * _743;
    float _755 = _737 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _759 = _745 + _757;
    float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _763 = fma(_703, _697, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = -_181;
    int _767 = _669 ? as_type<int>(_765) : as_type<int>(_181);
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _771 = _755 + _769;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[28].x, _761);
    float _775 = fma(_763, _753, _747);
    bool _777 = !_715;
    float _779 = _777 ? _181 : as_type<float>(_767);
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[28].z, _773);
    float _785 = -_177;
    int _787 = _693 ? as_type<int>(_785) : as_type<int>(_177);
    float _789 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[117].x, _775);
    float _791 = -_779;
    float _793 = _791 + 0.5;
    float _795 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _797 = _783 >= 0.0;
    float _799 = _751 * _751;
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _803 = !_709;
    float _805 = _803 ? _177 : as_type<float>(_787);
    float _807 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = fma(_759, _759, _799);
    float _811 = _801 * _705;
    float _813 = _805 + 0.5;
    float _815 = fma(_771, _771, _809);
    float _817 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = rsqrt(_815);
    float _821 = _813 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _825 = _645;
    if (_797)
    {
        _825 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _827 = _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _833 = _821 * _781;
    float _835 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _831 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _845 = as_type<int>(_827);
    if (_797)
    {
        float _847 = _827 * 5.0;
        _845 = as_type<int>(_847);
    }
    int _849 = _845;
    out.m_44.x = _833;
    out.m_44.y = _811;
    float _851 = _751 * _819;
    float _853 = _759 * _819;
    out.m_46.x = _837;
    out.m_46.y = _839;
    out.m_46.z = _841;
    out.m_48.x = _835;
    out.m_48.y = _817;
    out.m_48.z = _807;
    out.m_48.w = _843;
    if (_797)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2582 = as_type<float>(_849);
        out.gl_Position.z = _2582;
    }
    if (_797)
    {
        out.m_33.x = 0.0;
    }
    if (_797)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _855 = -_851;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _859 = _771 * _819;
    float _861 = -_853;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[18].w, _745);
    float _865 = -_851;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _751);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _857 + _869;
    float _873 = -_859;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _755);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _879 = _863 + _877;
    float _881 = -_853;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _889 = _875 + _887;
    float _891 = -_859;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _895 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[28].x, _885);
    float _897 = _867 * _867;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[28].z, _895);
    float _901 = fma(_883, _883, _897);
    bool _903 = _899 >= 0.0;
    float _905 = fma(_893, _893, _901);
    float _907 = sqrt(_905);
    float _909 = _889;
    if (_903)
    {
        _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _911 = _909;
    int _913 = as_type<int>(_911);
    if (_903)
    {
        out.m_33.x = 0.0;
    }
    if (_903)
    {
        float _915 = _911 * 5.0;
        _913 = as_type<int>(_915);
    }
    int _917 = _913;
    if (_903)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2711 = as_type<float>(_917);
        out.gl_Position.z = _2711;
    }
    float _919 = _819 * _907;
    if (_903)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _921 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _925 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _929 = _919 * _921;
    float _931 = _919 * _925;
    float _933 = _919 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = _933 * 0.5;
    float _937 = _923 * _929;
    bool _939 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _941 = isnan(0.5);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _947 = _943 || _945;
    float _949 = _927 * _931;
    float _951 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _953 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _955 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _951);
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _953);
    float _959 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _955);
    float _961 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _957);
    float _963 = _959 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _965 = _961 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _967 = _755 + _963;
    float _969 = _745 + _965;
    float _971 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _975 = _967 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _979 = _969 + _977;
    float _981 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].x, _971);
    float _983 = _975 * _975;
    float _985 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _981);
    float _987 = fma(_979, _979, _983);
    float _989 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _991 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _995 = sqrt(_987);
    float _997 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _989);
    float _999 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].x, _991);
    float _1001 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _997);
    float _1003 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _999);
    float _1005 = 1.0 / _993;
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = _739 + _1007;
    float _1013 = _1009 + _993;
    bool _1015 = _995 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1017 = _991;
    float _1019 = _1007;
    float _1021 = _935;
    if (!_1015)
    {
        _1017 = _969;
    }
    float _1023 = _1017;
    float _1025 = _1023;
    if (!_1015)
    {
        _1019 = _967;
    }
    float _1027 = _1019;
    float _1029 = _1027;
    if (!_1015)
    {
        _1021 = _1011;
    }
    float _1031 = _1021;
    bool _1033 = !_1015;
    float _1035 = _1031;
    if (!_1033)
    {
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1041 = _995 + _1039;
        float _1043 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = rsqrt(_987);
        float _1047 = _1041 * _1037;
        float _1049 = _1047 * 0.15915493667125701904296875;
        float _1051 = _1049 * 6.283185482025146484375;
        float _1053 = cos(_1051);
        float _1055 = _1049 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = _1053 + (-1.0);
        float _1061 = fma(_1057, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1063 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = _1045 * _1061;
        float _1067 = fma(_1011, _1053, _1063);
        float _1069 = fma(_979, _1065, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1071 = fma(_975, _1065, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1035 = _1067;
        _1025 = _1069;
        _1029 = _1071;
    }
    float _1073 = _1035;
    float _1075 = _1025;
    float _1077 = _1029;
    float _1079 = -_851;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1073);
    float _1083 = _1013 * _1005;
    float _1085 = _1083 * 0.5;
    float _1087 = -_853;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1075);
    float _1091 = -_859;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1077);
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1097 = _1073;
    if (_947)
    {
        _1097 = 1.0;
    }
    float _1099 = _1097;
    float _1101 = _1099;
    if (!_947)
    {
        float _1103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1107 = _1103 * 0.15915493667125701904296875;
        float _1109 = _1105 * 0.15915493667125701904296875;
        float _1111 = _1107 * 6.283185482025146484375;
        float _1113 = cos(_1111);
        float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1117 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1115);
        float _1119 = _1107 * 6.283185482025146484375;
        float _1121 = sin(_1119);
        float _1123 = 1.0 / _1113;
        float _1125 = _1109 * 6.283185482025146484375;
        float _1127 = cos(_1125);
        float _1129 = _1121 * _1123;
        float _1131 = _1109 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1137 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1135;
        float _1139 = _1127 * _1129;
        float _1141 = 1.0 / _1117;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1137;
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1149 = _1141 * _1147;
        float _1151 = _1133 * _1143;
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1155 = fma(_1151, _1149, _1153);
        float _1157 = _1155 * _1145;
        float _1159 = precise::clamp(_1157, 0.0, 1.0);
        _1101 = _1159;
    }
    float _1161 = _1101;
    float _1163 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1165 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1167 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1169 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1163);
    float _1173 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1175 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1167);
    float _1177 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1183 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1175);
    float _1185 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1195 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1197 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1189);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1193);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1195);
    float _1207 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1199);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1203);
    float _1215 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1205);
    bool _1217 = _1161 > 0.0;
    bool _1219 = isnan(_1161);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1231 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1211);
    float _1233 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1215);
    float _1235 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1213);
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1239 = _1229 + _1233;
    float _1241 = _1235 + _1233;
    float _1243 = _1233 * 0.5;
    float _1245 = _1239 * 0.5;
    float _1247 = _1241 * 0.5;
    float _1249 = fma(_1231, -0.5, _1243);
    out.m_33.x = _1237;
    out.gl_Position.x = _1229;
    out.gl_Position.y = _1231;
    out.gl_Position.z = _1235;
    out.gl_Position.w = _1233;
    out.m_50.x = _1245;
    out.m_50.y = _1249;
    out.m_50.z = _1247;
    out.m_50.w = _1233;
    if (_1225)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1251;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1308 = as_type<float>(_85);
        out.gl_Position.z = _1308;
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
        float _1377 = as_type<float>(_121);
        out.gl_Position.z = _1377;
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
    float _617 = in.m_42.x;
    float _619 = in.m_42.y;
    float _621 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _635 = 1.0 / _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _627);
    float _643 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _645 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = 1.0 / _639;
    bool _651 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_615);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = _631 * _635;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _667 = _615 + _665;
    bool _669 = _619 > 0.5;
    float _671 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = fma(_663, _667, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _679 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = isnan(_615);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _671);
    bool _693 = _617 > 0.5;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _697 = _615 + _695;
    float _699 = -_689;
    float _701 = _699 + 1.0;
    float _703 = _675 * _649;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    float _711 = _661 * _701;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _715 = _713 != 0;
    float _717 = -_661;
    float _719 = _717 + 1.0;
    bool _721 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _723 = isnan(_615);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _677 * _711;
    float _735 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _691);
    float _737 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _739 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _741 = -_731;
    float _743 = _741 + 1.0;
    float _745 = _735 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _747 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _751 = _739 + _749;
    float _753 = _689 * _743;
    float _755 = _737 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _759 = _745 + _757;
    float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _763 = fma(_703, _697, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = -_181;
    int _767 = _669 ? as_type<int>(_765) : as_type<int>(_181);
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _771 = _755 + _769;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[28].x, _761);
    float _775 = fma(_763, _753, _747);
    bool _777 = !_715;
    float _779 = _777 ? _181 : as_type<float>(_767);
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[28].z, _773);
    float _785 = -_177;
    int _787 = _693 ? as_type<int>(_785) : as_type<int>(_177);
    float _789 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[117].x, _775);
    float _791 = -_779;
    float _793 = _791 + 0.5;
    float _795 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _797 = _783 >= 0.0;
    float _799 = _751 * _751;
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _803 = !_709;
    float _805 = _803 ? _177 : as_type<float>(_787);
    float _807 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = fma(_759, _759, _799);
    float _811 = _801 * _705;
    float _813 = _805 + 0.5;
    float _815 = fma(_771, _771, _809);
    float _817 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = rsqrt(_815);
    float _821 = _813 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _825 = _645;
    if (_797)
    {
        _825 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _827 = _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _833 = _821 * _781;
    float _835 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _831 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _845 = as_type<int>(_827);
    if (_797)
    {
        float _847 = _827 * 5.0;
        _845 = as_type<int>(_847);
    }
    int _849 = _845;
    out.m_44.x = _833;
    out.m_44.y = _811;
    float _851 = _751 * _819;
    float _853 = _759 * _819;
    out.m_46.x = _837;
    out.m_46.y = _839;
    out.m_46.z = _841;
    out.m_48.x = _835;
    out.m_48.y = _817;
    out.m_48.z = _807;
    out.m_48.w = _843;
    if (_797)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2582 = as_type<float>(_849);
        out.gl_Position.z = _2582;
    }
    if (_797)
    {
        out.m_33.x = 0.0;
    }
    if (_797)
    {
        return out;
    }
    float _855 = -_851;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _859 = _771 * _819;
    float _861 = -_853;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[18].w, _745);
    float _865 = -_851;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _751);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _857 + _869;
    float _873 = -_859;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _755);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _879 = _863 + _877;
    float _881 = -_853;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _889 = _875 + _887;
    float _891 = -_859;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _895 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[28].x, _885);
    float _897 = _867 * _867;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[28].z, _895);
    float _901 = fma(_883, _883, _897);
    bool _903 = _899 >= 0.0;
    float _905 = fma(_893, _893, _901);
    float _907 = sqrt(_905);
    float _909 = _889;
    if (_903)
    {
        _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _911 = _909;
    int _913 = as_type<int>(_911);
    if (_903)
    {
        out.m_33.x = 0.0;
    }
    if (_903)
    {
        float _915 = _911 * 5.0;
        _913 = as_type<int>(_915);
    }
    int _917 = _913;
    if (_903)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2711 = as_type<float>(_917);
        out.gl_Position.z = _2711;
    }
    float _919 = _819 * _907;
    if (_903)
    {
        return out;
    }
    float _921 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _925 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _929 = _919 * _921;
    float _931 = _919 * _925;
    float _933 = _919 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = _933 * 0.5;
    float _937 = _923 * _929;
    bool _939 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _941 = isnan(0.5);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _947 = _943 || _945;
    float _949 = _927 * _931;
    float _951 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _953 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _955 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _951);
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _953);
    float _959 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _955);
    float _961 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _957);
    float _963 = _959 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _965 = _961 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _967 = _755 + _963;
    float _969 = _745 + _965;
    float _971 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _975 = _967 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _979 = _969 + _977;
    float _981 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].x, _971);
    float _983 = _975 * _975;
    float _985 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _981);
    float _987 = fma(_979, _979, _983);
    float _989 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _991 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _995 = sqrt(_987);
    float _997 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _989);
    float _999 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].x, _991);
    float _1001 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _997);
    float _1003 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _999);
    float _1005 = 1.0 / _993;
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = _739 + _1007;
    float _1013 = _1009 + _993;
    bool _1015 = _995 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1017 = _991;
    float _1019 = _1007;
    float _1021 = _935;
    if (!_1015)
    {
        _1017 = _969;
    }
    float _1023 = _1017;
    float _1025 = _1023;
    if (!_1015)
    {
        _1019 = _967;
    }
    float _1027 = _1019;
    float _1029 = _1027;
    if (!_1015)
    {
        _1021 = _1011;
    }
    float _1031 = _1021;
    bool _1033 = !_1015;
    float _1035 = _1031;
    if (!_1033)
    {
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1041 = _995 + _1039;
        float _1043 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = rsqrt(_987);
        float _1047 = _1041 * _1037;
        float _1049 = _1047 * 0.15915493667125701904296875;
        float _1051 = _1049 * 6.283185482025146484375;
        float _1053 = cos(_1051);
        float _1055 = _1049 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = _1053 + (-1.0);
        float _1061 = fma(_1057, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1063 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = _1045 * _1061;
        float _1067 = fma(_1011, _1053, _1063);
        float _1069 = fma(_979, _1065, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1071 = fma(_975, _1065, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1035 = _1067;
        _1025 = _1069;
        _1029 = _1071;
    }
    float _1073 = _1035;
    float _1075 = _1025;
    float _1077 = _1029;
    float _1079 = -_851;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1073);
    float _1083 = _1013 * _1005;
    float _1085 = _1083 * 0.5;
    float _1087 = -_853;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1075);
    float _1091 = -_859;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1077);
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1097 = _1073;
    if (_947)
    {
        _1097 = 1.0;
    }
    float _1099 = _1097;
    float _1101 = _1099;
    if (!_947)
    {
        float _1103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1107 = _1103 * 0.15915493667125701904296875;
        float _1109 = _1105 * 0.15915493667125701904296875;
        float _1111 = _1107 * 6.283185482025146484375;
        float _1113 = cos(_1111);
        float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1117 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1115);
        float _1119 = _1107 * 6.283185482025146484375;
        float _1121 = sin(_1119);
        float _1123 = 1.0 / _1113;
        float _1125 = _1109 * 6.283185482025146484375;
        float _1127 = cos(_1125);
        float _1129 = _1121 * _1123;
        float _1131 = _1109 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1137 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1135;
        float _1139 = _1127 * _1129;
        float _1141 = 1.0 / _1117;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1137;
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1149 = _1141 * _1147;
        float _1151 = _1133 * _1143;
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1155 = fma(_1151, _1149, _1153);
        float _1157 = _1155 * _1145;
        float _1159 = precise::clamp(_1157, 0.0, 1.0);
        _1101 = _1159;
    }
    float _1161 = _1101;
    float _1163 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1165 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1167 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1169 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1163);
    float _1173 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1175 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1167);
    float _1177 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1183 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1175);
    float _1185 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1195 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1197 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1189);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1193);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1195);
    float _1207 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1199);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1203);
    float _1215 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1205);
    bool _1217 = _1161 > 0.0;
    bool _1219 = isnan(_1161);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1231 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1211);
    float _1233 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1215);
    float _1235 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1213);
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1239 = _1229 + _1233;
    float _1241 = _1235 + _1233;
    float _1243 = _1233 * 0.5;
    float _1245 = _1239 * 0.5;
    float _1247 = _1241 * 0.5;
    float _1249 = fma(_1231, -0.5, _1243);
    out.m_33.x = _1237;
    out.gl_Position.x = _1229;
    out.gl_Position.y = _1231;
    out.gl_Position.z = _1235;
    out.gl_Position.w = _1233;
    out.m_50.x = _1245;
    out.m_50.y = _1249;
    out.m_50.z = _1247;
    out.m_50.w = _1233;
    if (_1225)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1251;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1308 = as_type<float>(_85);
        out.gl_Position.z = _1308;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1377 = as_type<float>(_121);
        out.gl_Position.z = _1377;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _617 = in.m_42.x;
    float _619 = in.m_42.y;
    float _621 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _635 = 1.0 / _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _627);
    float _643 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _645 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = 1.0 / _639;
    bool _651 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_615);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = _631 * _635;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _667 = _615 + _665;
    bool _669 = _619 > 0.5;
    float _671 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = fma(_663, _667, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _679 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = isnan(_615);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _671);
    bool _693 = _617 > 0.5;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _697 = _615 + _695;
    float _699 = -_689;
    float _701 = _699 + 1.0;
    float _703 = _675 * _649;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    float _711 = _661 * _701;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _715 = _713 != 0;
    float _717 = -_661;
    float _719 = _717 + 1.0;
    bool _721 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _723 = isnan(_615);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _677 * _711;
    float _735 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _691);
    float _737 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _739 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _741 = -_731;
    float _743 = _741 + 1.0;
    float _745 = _735 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _747 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _751 = _739 + _749;
    float _753 = _689 * _743;
    float _755 = _737 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _759 = _745 + _757;
    float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _763 = fma(_703, _697, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = -_181;
    int _767 = _669 ? as_type<int>(_765) : as_type<int>(_181);
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _771 = _755 + _769;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[28].x, _761);
    float _775 = fma(_763, _753, _747);
    bool _777 = !_715;
    float _779 = _777 ? _181 : as_type<float>(_767);
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[28].z, _773);
    float _785 = -_177;
    int _787 = _693 ? as_type<int>(_785) : as_type<int>(_177);
    float _789 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[117].x, _775);
    float _791 = -_779;
    float _793 = _791 + 0.5;
    float _795 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _797 = _783 >= 0.0;
    float _799 = _751 * _751;
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _803 = !_709;
    float _805 = _803 ? _177 : as_type<float>(_787);
    float _807 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = fma(_759, _759, _799);
    float _811 = _801 * _705;
    float _813 = _805 + 0.5;
    float _815 = fma(_771, _771, _809);
    float _817 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = rsqrt(_815);
    float _821 = _813 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _825 = _645;
    if (_797)
    {
        _825 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _827 = _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _833 = _821 * _781;
    float _835 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _831 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _845 = as_type<int>(_827);
    if (_797)
    {
        float _847 = _827 * 5.0;
        _845 = as_type<int>(_847);
    }
    int _849 = _845;
    out.m_44.x = _833;
    out.m_44.y = _811;
    float _851 = _751 * _819;
    float _853 = _759 * _819;
    out.m_46.x = _837;
    out.m_46.y = _839;
    out.m_46.z = _841;
    out.m_48.x = _835;
    out.m_48.y = _817;
    out.m_48.z = _807;
    out.m_48.w = _843;
    if (_797)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2582 = as_type<float>(_849);
        out.gl_Position.z = _2582;
    }
    if (_797)
    {
        out.m_33.x = 0.0;
    }
    if (_797)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _855 = -_851;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _859 = _771 * _819;
    float _861 = -_853;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[18].w, _745);
    float _865 = -_851;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _751);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _857 + _869;
    float _873 = -_859;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _755);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _879 = _863 + _877;
    float _881 = -_853;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _889 = _875 + _887;
    float _891 = -_859;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _895 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[28].x, _885);
    float _897 = _867 * _867;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[28].z, _895);
    float _901 = fma(_883, _883, _897);
    bool _903 = _899 >= 0.0;
    float _905 = fma(_893, _893, _901);
    float _907 = sqrt(_905);
    float _909 = _889;
    if (_903)
    {
        _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _911 = _909;
    int _913 = as_type<int>(_911);
    if (_903)
    {
        out.m_33.x = 0.0;
    }
    if (_903)
    {
        float _915 = _911 * 5.0;
        _913 = as_type<int>(_915);
    }
    int _917 = _913;
    if (_903)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2711 = as_type<float>(_917);
        out.gl_Position.z = _2711;
    }
    float _919 = _819 * _907;
    if (_903)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _921 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _925 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _929 = _919 * _921;
    float _931 = _919 * _925;
    float _933 = _919 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = _933 * 0.5;
    float _937 = _923 * _929;
    bool _939 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _941 = isnan(0.5);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _947 = _943 || _945;
    float _949 = _927 * _931;
    float _951 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _953 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _955 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _951);
    float _957 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _953);
    float _959 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _955);
    float _961 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _957);
    float _963 = _959 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _965 = _961 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _967 = _755 + _963;
    float _969 = _745 + _965;
    float _971 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _975 = _967 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _979 = _969 + _977;
    float _981 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].x, _971);
    float _983 = _975 * _975;
    float _985 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _981);
    float _987 = fma(_979, _979, _983);
    float _989 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _991 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _995 = sqrt(_987);
    float _997 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _989);
    float _999 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].x, _991);
    float _1001 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _997);
    float _1003 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _999);
    float _1005 = 1.0 / _993;
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = _739 + _1007;
    float _1013 = _1009 + _993;
    bool _1015 = _995 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1017 = _991;
    float _1019 = _1007;
    float _1021 = _935;
    if (!_1015)
    {
        _1017 = _969;
    }
    float _1023 = _1017;
    float _1025 = _1023;
    if (!_1015)
    {
        _1019 = _967;
    }
    float _1027 = _1019;
    float _1029 = _1027;
    if (!_1015)
    {
        _1021 = _1011;
    }
    float _1031 = _1021;
    bool _1033 = !_1015;
    float _1035 = _1031;
    if (!_1033)
    {
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1041 = _995 + _1039;
        float _1043 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = rsqrt(_987);
        float _1047 = _1041 * _1037;
        float _1049 = _1047 * 0.15915493667125701904296875;
        float _1051 = _1049 * 6.283185482025146484375;
        float _1053 = cos(_1051);
        float _1055 = _1049 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = _1053 + (-1.0);
        float _1061 = fma(_1057, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1063 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = _1045 * _1061;
        float _1067 = fma(_1011, _1053, _1063);
        float _1069 = fma(_979, _1065, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1071 = fma(_975, _1065, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1035 = _1067;
        _1025 = _1069;
        _1029 = _1071;
    }
    float _1073 = _1035;
    float _1075 = _1025;
    float _1077 = _1029;
    float _1079 = -_851;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1073);
    float _1083 = _1013 * _1005;
    float _1085 = _1083 * 0.5;
    float _1087 = -_853;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1075);
    float _1091 = -_859;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1077);
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1097 = _1073;
    if (_947)
    {
        _1097 = 1.0;
    }
    float _1099 = _1097;
    float _1101 = _1099;
    if (!_947)
    {
        float _1103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1107 = _1103 * 0.15915493667125701904296875;
        float _1109 = _1105 * 0.15915493667125701904296875;
        float _1111 = _1107 * 6.283185482025146484375;
        float _1113 = cos(_1111);
        float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1117 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1115);
        float _1119 = _1107 * 6.283185482025146484375;
        float _1121 = sin(_1119);
        float _1123 = 1.0 / _1113;
        float _1125 = _1109 * 6.283185482025146484375;
        float _1127 = cos(_1125);
        float _1129 = _1121 * _1123;
        float _1131 = _1109 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1137 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1135;
        float _1139 = _1127 * _1129;
        float _1141 = 1.0 / _1117;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1137;
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1149 = _1141 * _1147;
        float _1151 = _1133 * _1143;
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1155 = fma(_1151, _1149, _1153);
        float _1157 = _1155 * _1145;
        float _1159 = precise::clamp(_1157, 0.0, 1.0);
        _1101 = _1159;
    }
    float _1161 = _1101;
    float _1163 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1165 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1167 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1169 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1163);
    float _1173 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1165);
    float _1175 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1167);
    float _1177 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1183 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1175);
    float _1185 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1195 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1197 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1189);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1193);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1195);
    float _1207 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1199);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1203);
    float _1215 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1205);
    bool _1217 = _1161 > 0.0;
    bool _1219 = isnan(_1161);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1231 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1211);
    float _1233 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1215);
    float _1235 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1213);
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1239 = _1229 + _1233;
    float _1241 = _1235 + _1233;
    float _1243 = _1233 * 0.5;
    float _1245 = _1239 * 0.5;
    float _1247 = _1241 * 0.5;
    float _1249 = fma(_1231, -0.5, _1243);
    out.m_33.x = _1237;
    out.gl_Position.x = _1229;
    out.gl_Position.y = _1231;
    out.gl_Position.z = _1235;
    out.gl_Position.w = _1233;
    out.m_50.x = _1245;
    out.m_50.y = _1249;
    out.m_50.z = _1247;
    out.m_50.w = _1233;
    if (_1225)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1251;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

