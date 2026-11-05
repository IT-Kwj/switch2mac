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
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_38 [[attribute(2)]];
    float4 m_26 [[attribute(3)]];
    float4 m_31 [[attribute(4)]];
    float4 m_33 [[attribute(5)]];
    float4 m_40 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _651 = false;
    bool _549 = false;
    bool _375 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _1644 = as_type<float>(_85);
        out.gl_Position.z = _1644;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_31.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = _103;
    if (_99)
    {
        float _107 = float(_69);
        _79 = _107;
    }
    float _109 = _79;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_123);
        out.gl_Position.z = _1714;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_33.x;
    float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _129 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_38.x;
    float _135 = in.m_38.y;
    float _137 = in.m_38.z;
    float _139 = _129 * _127;
    float _141 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    int _143 = as_type<int>(_131) & 1;
    bool _145 = _143 != 0;
    int _147 = as_type<int>(_131) & 2;
    bool _149 = _147 != 0;
    float _151 = _141 * 6.283185482025146484375;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = floor(_141);
    float _159 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _151 * 0.15915493667125701904296875;
    bool _163 = !_149;
    float _165 = _163 ? (-0.5) : 0.5;
    float _167 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_155;
    int _181 = _179 ? 0 : 1;
    float _183 = _161 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    bool _189 = !_171;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _195 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _199 = abs(_191);
    float _201 = -_157;
    float _203 = _141 + _201;
    int _205 = abs(_181);
    float _207 = -_203;
    float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _211 = float(_199);
    float _213 = fma(_185, 0.5, 0.5);
    bool _215 = !_175;
    int _217 = _215 ? 0 : 1;
    bool _219 = _203 < 0.5;
    float _221 = float(_219);
    float _223 = abs(_209);
    float _225 = _211 * _223;
    int _227 = abs(_217);
    float _229 = -_213;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_205);
    float _235 = -_221;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_227);
    float _241 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _243 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _245 = fma(_233, _231, _225);
    float _247 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    bool _249 = !_145;
    float _251 = _249 ? (-0.5) : 0.5;
    float _253 = abs(_237);
    float _255 = fma(_239, _253, _245);
    bool _257 = !_197;
    float _273;
    if (!_257)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_69);
        float _279 = 1.0 / _277;
        float _281 = _103 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -_299;
    float _307 = _305 + 1.0;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _303;
    float _329 = _319 * _307;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _287 * _327;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_323, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _341 * _329;
    float _347 = _343 * _329;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _351 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _353 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].x, _349);
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].y, _351);
    bool _357 = !_325;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _361 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_69);
        float _379 = 1.0 / _377;
        float _381 = _103 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = in.m_40.x;
    float _387 = in.m_40.y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _391 = _383 + _389;
    bool _393 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _395 = isnan(_383);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _413 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _415 = isnan(_383);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _407;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _411;
    float _431 = _355 * _387;
    float _433 = -_403;
    float _435 = _433 + 1.0;
    float _437 = _391 * _425;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _383 + _439;
    bool _443 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_383);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _455;
    float _459 = _453 * _435;
    float _461 = -_453;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _469;
    float _473 = fma(_457, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _475 = _423 * _463;
    float _477 = fma(_467, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = fma(_471, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _481 = _441 * _429;
    float _483 = _473 * _475;
    float _485 = _477 * _475;
    float _487 = _479 * _475;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _501 = -_423;
    float _503 = _501 + 1.0;
    float _505 = fma(_491, _481, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _507 = fma(_495, _481, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _509 = fma(_499, _481, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _485);
    float _513 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _515 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _483);
    float _517 = _353 * _385;
    float _519 = fma(_505, _459, _511);
    float _521 = fma(_507, _459, _513);
    float _523 = fma(_509, _459, _515);
    float _525 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].x, _519);
    float _527 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].y, _521);
    float _529 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].z, _523);
    bool _531 = !_427;
    float _547;
    if (!_531)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _535 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_69);
        float _553 = 1.0 / _551;
        float _555 = _103 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _561 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _563 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _565 = isnan(_557);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _581 = isnan(_557);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _557 + _595;
    float _599 = -_573;
    float _601 = _599 + 1.0;
    float _603 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = 1.0 / _577;
    float _607 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _589 * _601;
    float _611 = -_589;
    float _613 = _611 + 1.0;
    float _615 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _593 * _605;
    float _623 = fma(_621, _597, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _625 = _623 * _609;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _629 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[116].x, _627);
    float _631 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_42.x = _619;
    out.m_42.y = _603;
    out.m_42.z = _607;
    out.m_42.w = _631;
    bool _633 = !_617;
    float _649;
    if (!_633)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _637 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_69);
        float _655 = 1.0 / _653;
        float _657 = _103 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = in.m_33.y;
    float _663 = _125 * 2.0;
    float _665 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _667 = in.m_33.z;
    float _669 = in.m_33.w;
    float _671 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _673 = floor(_663);
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _677 = _675 != 0;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _681 = -_679;
    float _683 = fma(_665, 2.0, _681);
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _691 = _673 > 0.0;
    float _693 = _661 * 2.0;
    bool _695 = _673 >= 0.0;
    bool _697 = isnan(_673);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    float _705 = _661 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _707 = _661 > 0.5;
    float _709 = floor(_693);
    int _711 = _703 ? 0 : 1;
    float _713 = fma(_705, -2.0, _689);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _725 = _723 != 0;
    float _727 = _673;
    if (!_677)
    {
        float _729 = in.m_33.z;
        _727 = _729;
    }
    float _731 = _727;
    float _733 = -_251;
    int _735 = _707 ? as_type<int>(_733) : as_type<int>(_251);
    float _737 = _667 * 2.0;
    int _739 = ~_711;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _713);
    bool _747 = !_721;
    float _749 = _747 ? _251 : as_type<float>(_735);
    float _751 = floor(_737);
    float _753 = _125 + _661;
    int _755 = _743;
    if (!_691)
    {
        int _757 = ~_711;
        int _759 = _757 + 1;
        _755 = _759;
    }
    int _761 = _755;
    bool _763 = _667 > 0.5;
    float _765 = _753 + (-1.0);
    bool _767 = _709 > 0.0;
    bool _769 = _709 >= 0.0;
    bool _771 = isnan(_709);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = _687 * _103;
    float _781 = _661 + _667;
    float _783 = -_165;
    int _785 = _763 ? as_type<int>(_783) : as_type<int>(_165);
    float _787 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _789 = _777 ? 0 : 1;
    float _791 = _781 + (-1.0);
    float _793 = exp2(_779);
    bool _795 = !_725;
    float _797 = _795 ? _165 : as_type<float>(_785);
    int _799 = ~_789;
    int _801 = _799 + 1;
    int _803 = _801 + 1;
    float _805 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _807 = _803;
    float _809 = _791;
    float _811 = _765;
    if (!_767)
    {
        int _813 = ~_789;
        int _815 = _813 + 1;
        _807 = _815;
    }
    int _817 = _807;
    bool _819 = _751 >= 0.0;
    bool _821 = isnan(_751);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    bool _829 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _831 = isnan(0.0);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _837 = _833 || _835;
    bool _839 = _751 > 0.0;
    if (!_677)
    {
        _809 = _661;
    }
    float _841 = _809;
    float _843 = -_793;
    float _845 = _843 + 1.0;
    float _847 = _841;
    float _849 = _731;
    if (!_677)
    {
        _811 = _731;
    }
    float _851 = _811;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _855 = _851;
    if (_677)
    {
        _847 = _125;
    }
    float _857 = _847;
    if (_677)
    {
        _855 = _661;
    }
    float _859 = _855;
    if (_677)
    {
        _849 = _661;
    }
    float _861 = _849;
    float _863 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[83].z, _853);
    float _865 = _837 ? _845 : 0.0;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _869 = _827 ? 0 : 1;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _887 = _857 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _889 = ~_869;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_885, -2.0, _871);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _899 = -_867;
    float _901 = fma(_887, 2.0, _899);
    int _903 = _893;
    if (!_839)
    {
        int _905 = ~_869;
        int _907 = _905 + 1;
        _903 = _907;
    }
    int _909 = _903;
    float _911 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[83].w, _897);
    bool _913 = !_875;
    int _915 = _913 ? 0 : 1;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _919 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _921 = isnan(1.0);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _927 = _923 || _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _931 = 1.0 + _929;
    float _933 = in.m_44.x;
    float _935 = in.m_44.y;
    float _937 = in.m_44.z;
    int _939 = abs(_915);
    float _941 = 1.0 / _931;
    float _943 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _945 = -_103;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[76].x, _683);
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _951 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _943);
    float _953 = float(_909);
    float _955 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[78].w, _949);
    float _957 = float(_939);
    float _959 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _863);
    float _961 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _955);
    float _963 = -_103;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[81].x, _901);
    float _967 = _957 * _953;
    bool _969 = !_883;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _911);
    bool _975 = !_879;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _895);
    if (_927)
    {
        float _981 = _865 * _941;
        _105 = _981;
    }
    float _983 = _105;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _989 = abs(_971);
    float _991 = _967 * (-2.0);
    int _993 = abs(_977);
    float _995 = _125 + (-0.5);
    float _997 = float(_761);
    float _999 = fma(_991, _933, _933);
    float _1001 = 1.0 / _987;
    float _1003 = float(_993);
    float _1005 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].x, _999);
    float _1007 = float(_817);
    float _1009 = fma(_787, _991, _787);
    float _1011 = float(_989);
    float _1013 = _1003 * _997;
    float _1015 = fma(_1009, _983, _1005);
    float _1017 = _661 + (-0.5);
    float _1019 = _1011 * _1007;
    float _1021 = _125 + _667;
    float _1023 = _1013 * (-2.0);
    float _1025 = _1015 * 0.15915493667125701904296875;
    float _1027 = _1019 * (-2.0);
    float _1029 = _1021 + (-1.0);
    float _1031 = fma(_1023, _935, _935);
    float _1033 = fma(_805, _1023, _805);
    float _1035 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1031);
    float _1039 = fma(_1027, _937, _937);
    float _1041 = _667 + (-0.5);
    float _1043 = in.m_26.x;
    float _1045 = in.m_26.y;
    float _1047 = in.m_26.z;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1053 = fma(_1035, _1027, _1035);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1039);
    float _1057 = fma(_1033, _983, _1037);
    bool _1059 = _669 > 0.5;
    float _1061 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = fma(_1053, _983, _1055);
    float _1065 = 1.0 / _1051;
    float _1067 = _1057 * 0.15915493667125701904296875;
    bool _1069 = _125 > 0.5;
    float _1071 = _1063 * 0.15915493667125701904296875;
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1077 = _1071 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1083 = _1081 != 0;
    float _1085 = _1061 * _1073;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1089 = _1087 != 0;
    float _1091 = _671 * _1075;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1093;
    float _1097 = -_165;
    int _1099 = _1059 ? as_type<int>(_1097) : as_type<int>(_165);
    float _1101 = _1025 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1107 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1109 = _1095 * _1001;
    float _1111 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1105);
    float _1113 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1107);
    float _1115 = _1025 * 6.283185482025146484375;
    float _1117 = cos(_1115);
    float _1119 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1113);
    float _1121 = _1067 * 6.283185482025146484375;
    float _1123 = sin(_1121);
    float _1125 = -_251;
    int _1127 = _1069 ? as_type<int>(_1125) : as_type<int>(_251);
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1131 = _1129 != 0;
    float _1133 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1139 = -_251;
    int _1141 = _763 ? as_type<int>(_1139) : as_type<int>(_251);
    float _1143 = _1067 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = _1137 * _1065;
    float _1149 = -_165;
    int _1151 = _707 ? as_type<int>(_1149) : as_type<int>(_165);
    float _1153 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1133);
    bool _1155 = !_1083;
    float _1157 = _1155 ? _251 : as_type<float>(_1127);
    bool _1159 = !_1089;
    float _1161 = _1159 ? _165 : as_type<float>(_1151);
    float _1163 = _1071 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    bool _1167 = !_717;
    float _1169 = _1167 ? _165 : as_type<float>(_1099);
    float _1171 = _1079 * _1091;
    float _1173 = _1103 * _1123;
    bool _1175 = !_1131;
    float _1177 = _1175 ? _251 : as_type<float>(_1141);
    float _1179 = _1117 * _1123;
    float _1181 = _1123 * _1079;
    float _1183 = _1117 * _1171;
    float _1185 = _1103 * _1145;
    float _1187 = _1117 * _1145;
    float _1189 = _1145 * _1079;
    float _1191 = fma(_1165, _1187, _1173);
    float _1193 = -_1179;
    float _1195 = fma(_1165, _1185, _1193);
    float _1197 = -_1185;
    float _1199 = fma(_1165, _1179, _1197);
    float _1201 = _1165 * _1091;
    float _1203 = fma(_1191, _1085, _1183);
    float _1205 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1103 * _1171;
    float _1209 = -_1201;
    float _1211 = fma(_1189, _1085, _1209);
    float _1213 = fma(_1165, _1173, _1187);
    float _1215 = fma(_1199, _1205, _1203);
    float _1217 = fma(_1195, _1085, _1207);
    float _1219 = fma(_1181, _1205, _1211);
    bool _1221 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1223 = isnan(_659);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1235 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1237 = fma(_1213, _1205, _1217);
    float _1239 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1241 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1235);
    bool _1245 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1247 = isnan(_659);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1239);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1241);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1243);
    float _1263 = -_1231;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1257);
    float _1269 = _1259 * _1259;
    float _1271 = -_1255;
    float _1273 = _1271 + 1.0;
    float _1275 = _1255 * _1265;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1279 = fma(_1261, _1261, _1269);
    bool _1281 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1283 = isnan(_659);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1295 = _659 + _1293;
    float _1297 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1111);
    float _1299 = fma(_1267, _1267, _1279);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1303 = _659 + _1301;
    float _1305 = fma(_1109, _1295, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1309 = _1291 * _1273;
    float _1311 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1153);
    float _1313 = _1157 + 0.5;
    float _1315 = fma(_1147, _1303, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1317 = _1177 + 0.5;
    float _1319 = _1305 * _1309;
    float _1321 = -_1291;
    float _1323 = _1321 + 1.0;
    float _1325 = sqrt(_1299);
    float _1327 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1329 = _1161 + (-0.5);
    float _1331 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1319);
    float _1333 = _1297 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1335 = fma(_1327, _1313, _947);
    float _1337 = fma(_1315, _1275, _1331);
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1341 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1343 = _1333 + _1259;
    float _1345 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1337);
    float _1347 = fma(_1341, _1317, _965);
    float _1349 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1353 = _1325 > 0.0;
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1357 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1359 = -_1355;
    float _1361 = -_745;
    float _1363 = fma(_1359, _1329, _1361);
    float _1365 = _1169 + (-0.5);
    float _1367 = _1349 + _1261;
    float _1369 = _1357 + _1267;
    float _1371 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1373 = _1337;
    float _1375 = _1365;
    float _1377 = _1371;
    if (!_1353)
    {
        _1373 = _1367;
    }
    float _1379 = _1373;
    float _1381 = -_1371;
    float _1383 = -_979;
    float _1385 = fma(_1381, _1365, _1383);
    float _1387 = _1379;
    if (!_1353)
    {
        _1375 = _1343;
    }
    float _1389 = _1375;
    float _1391 = _1389;
    if (!_1353)
    {
        _1377 = _1369;
    }
    float _1393 = _1377;
    bool _1395 = !_1353;
    float _1397 = _1393;
    if (!_1395)
    {
        float _1399 = _247 * _247;
        float _1401 = rsqrt(_1299);
        float _1403 = fma(_241, _241, _1399);
        float _1405 = fma(_243, _243, _1403);
        float _1407 = sqrt(_1405);
        float _1409 = _1261 * _1401;
        float _1411 = _1259 * _1401;
        float _1413 = _1267 * _1401;
        bool _1415 = _1407 > 0.0;
        float _1417 = _1403;
        float _1419 = _1407;
        float _1421 = _1401;
        if (!_1415)
        {
            _1417 = _1367;
        }
        float _1423 = _1417;
        _1387 = _1423;
        if (!_1415)
        {
            _1419 = _1343;
        }
        float _1425 = _1419;
        _1391 = _1425;
        if (!_1415)
        {
            _1421 = _1369;
        }
        float _1427 = _1421;
        bool _1429 = !_1415;
        _1397 = _1427;
        if (!_1429)
        {
            float _1431 = rsqrt(_1405);
            float _1433 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1435 = _247 * _1431;
            float _1437 = _241 * _1431;
            float _1439 = _243 * _1431;
            float _1441 = _1411 * _1435;
            float _1443 = fma(_1409, _1437, _1441);
            float _1445 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1447 = fma(_1413, _1439, _1443);
            float _1449 = _1447 * _1445;
            float _1451 = fma(_241, _1449, _1367);
            float _1453 = fma(_247, _1449, _1343);
            float _1455 = fma(_243, _1449, _1369);
            _1391 = _1453;
            _1387 = _1451;
            _1397 = _1455;
        }
    }
    float _1457 = _1391;
    float _1459 = _1387;
    float _1461 = _1397;
    float _1463 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1473 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1467);
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1479 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1481 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1483 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1475);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = -_951;
    float _1495 = _1493 + 1.0;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1499 = -_961;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1497);
    float _1509 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1511 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1513 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1515 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1507);
    float _1517 = -_1495;
    float _1519 = fma(_1157, _1517, _1335);
    float _1521 = _749 + 0.5;
    float _1523 = fma(_1161, _1501, _1363);
    float _1525 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1509);
    float _1527 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1511);
    float _1529 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1513);
    float _1531 = -_797;
    float _1533 = _1531 + 0.5;
    float _1535 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1537 = -_973;
    float _1539 = _1537 + 1.0;
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1543 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1527);
    float _1545 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1547 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1549 = -_959;
    float _1551 = _1549 + 1.0;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1559 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1561 = _1535 * _1485;
    float _1563 = fma(_1169, _1539, _1385);
    float _1565 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1567 = _1547 * _1505;
    float _1569 = -_1551;
    float _1571 = fma(_1177, _1569, _1347);
    float _1573 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1541);
    float _1583 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1585 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1545);
    float _1587 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1515);
    out.m_29.x = _1565;
    out.m_46.x = _1561;
    out.m_46.y = _1567;
    out.m_48.x = _1573;
    out.m_48.y = _1575;
    out.m_48.z = _1577;
    out.m_48.w = _1579;
    out.m_50.x = _1519;
    out.m_50.y = _1523;
    out.m_50.z = _1571;
    out.m_50.w = _1563;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1583;
    out.gl_Position.z = _1585;
    out.gl_Position.w = _1587;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _651 = false;
    bool _549 = false;
    bool _375 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _1644 = as_type<float>(_85);
        out.gl_Position.z = _1644;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_31.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = _103;
    if (_99)
    {
        float _107 = float(_69);
        _79 = _107;
    }
    float _109 = _79;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_123);
        out.gl_Position.z = _1714;
    }
    if (_115)
    {
        return out;
    }
    float _125 = in.m_33.x;
    float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _129 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_38.x;
    float _135 = in.m_38.y;
    float _137 = in.m_38.z;
    float _139 = _129 * _127;
    float _141 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    int _143 = as_type<int>(_131) & 1;
    bool _145 = _143 != 0;
    int _147 = as_type<int>(_131) & 2;
    bool _149 = _147 != 0;
    float _151 = _141 * 6.283185482025146484375;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = floor(_141);
    float _159 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _151 * 0.15915493667125701904296875;
    bool _163 = !_149;
    float _165 = _163 ? (-0.5) : 0.5;
    float _167 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_155;
    int _181 = _179 ? 0 : 1;
    float _183 = _161 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    bool _189 = !_171;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _195 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _199 = abs(_191);
    float _201 = -_157;
    float _203 = _141 + _201;
    int _205 = abs(_181);
    float _207 = -_203;
    float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _211 = float(_199);
    float _213 = fma(_185, 0.5, 0.5);
    bool _215 = !_175;
    int _217 = _215 ? 0 : 1;
    bool _219 = _203 < 0.5;
    float _221 = float(_219);
    float _223 = abs(_209);
    float _225 = _211 * _223;
    int _227 = abs(_217);
    float _229 = -_213;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_205);
    float _235 = -_221;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_227);
    float _241 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _243 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _245 = fma(_233, _231, _225);
    float _247 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    bool _249 = !_145;
    float _251 = _249 ? (-0.5) : 0.5;
    float _253 = abs(_237);
    float _255 = fma(_239, _253, _245);
    bool _257 = !_197;
    float _273;
    if (!_257)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_69);
        float _279 = 1.0 / _277;
        float _281 = _103 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -_299;
    float _307 = _305 + 1.0;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _303;
    float _329 = _319 * _307;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _287 * _327;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_323, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _341 * _329;
    float _347 = _343 * _329;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _351 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _353 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].x, _349);
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].y, _351);
    bool _357 = !_325;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _361 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_69);
        float _379 = 1.0 / _377;
        float _381 = _103 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = in.m_40.x;
    float _387 = in.m_40.y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _391 = _383 + _389;
    bool _393 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _395 = isnan(_383);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _413 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _415 = isnan(_383);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _407;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _411;
    float _431 = _355 * _387;
    float _433 = -_403;
    float _435 = _433 + 1.0;
    float _437 = _391 * _425;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _383 + _439;
    bool _443 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_383);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _455;
    float _459 = _453 * _435;
    float _461 = -_453;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _469;
    float _473 = fma(_457, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _475 = _423 * _463;
    float _477 = fma(_467, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = fma(_471, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _481 = _441 * _429;
    float _483 = _473 * _475;
    float _485 = _477 * _475;
    float _487 = _479 * _475;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _501 = -_423;
    float _503 = _501 + 1.0;
    float _505 = fma(_491, _481, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _507 = fma(_495, _481, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _509 = fma(_499, _481, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _485);
    float _513 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _515 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _483);
    float _517 = _353 * _385;
    float _519 = fma(_505, _459, _511);
    float _521 = fma(_507, _459, _513);
    float _523 = fma(_509, _459, _515);
    float _525 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].x, _519);
    float _527 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].y, _521);
    float _529 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].z, _523);
    bool _531 = !_427;
    float _547;
    if (!_531)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _535 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_69);
        float _553 = 1.0 / _551;
        float _555 = _103 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _561 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _563 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _565 = isnan(_557);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _581 = isnan(_557);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _557 + _595;
    float _599 = -_573;
    float _601 = _599 + 1.0;
    float _603 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = 1.0 / _577;
    float _607 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _589 * _601;
    float _611 = -_589;
    float _613 = _611 + 1.0;
    float _615 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _593 * _605;
    float _623 = fma(_621, _597, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _625 = _623 * _609;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _629 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[116].x, _627);
    float _631 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_42.x = _619;
    out.m_42.y = _603;
    out.m_42.z = _607;
    out.m_42.w = _631;
    bool _633 = !_617;
    float _649;
    if (!_633)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _637 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_69);
        float _655 = 1.0 / _653;
        float _657 = _103 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = in.m_33.y;
    float _663 = _125 * 2.0;
    float _665 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _667 = in.m_33.z;
    float _669 = in.m_33.w;
    float _671 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _673 = floor(_663);
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _677 = _675 != 0;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _681 = -_679;
    float _683 = fma(_665, 2.0, _681);
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _691 = _673 > 0.0;
    float _693 = _661 * 2.0;
    bool _695 = _673 >= 0.0;
    bool _697 = isnan(_673);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    float _705 = _661 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _707 = _661 > 0.5;
    float _709 = floor(_693);
    int _711 = _703 ? 0 : 1;
    float _713 = fma(_705, -2.0, _689);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _725 = _723 != 0;
    float _727 = _673;
    if (!_677)
    {
        float _729 = in.m_33.z;
        _727 = _729;
    }
    float _731 = _727;
    float _733 = -_251;
    int _735 = _707 ? as_type<int>(_733) : as_type<int>(_251);
    float _737 = _667 * 2.0;
    int _739 = ~_711;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _713);
    bool _747 = !_721;
    float _749 = _747 ? _251 : as_type<float>(_735);
    float _751 = floor(_737);
    float _753 = _125 + _661;
    int _755 = _743;
    if (!_691)
    {
        int _757 = ~_711;
        int _759 = _757 + 1;
        _755 = _759;
    }
    int _761 = _755;
    bool _763 = _667 > 0.5;
    float _765 = _753 + (-1.0);
    bool _767 = _709 > 0.0;
    bool _769 = _709 >= 0.0;
    bool _771 = isnan(_709);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = _687 * _103;
    float _781 = _661 + _667;
    float _783 = -_165;
    int _785 = _763 ? as_type<int>(_783) : as_type<int>(_165);
    float _787 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _789 = _777 ? 0 : 1;
    float _791 = _781 + (-1.0);
    float _793 = exp2(_779);
    bool _795 = !_725;
    float _797 = _795 ? _165 : as_type<float>(_785);
    int _799 = ~_789;
    int _801 = _799 + 1;
    int _803 = _801 + 1;
    float _805 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _807 = _803;
    float _809 = _791;
    float _811 = _765;
    if (!_767)
    {
        int _813 = ~_789;
        int _815 = _813 + 1;
        _807 = _815;
    }
    int _817 = _807;
    bool _819 = _751 >= 0.0;
    bool _821 = isnan(_751);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    bool _829 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _831 = isnan(0.0);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _837 = _833 || _835;
    bool _839 = _751 > 0.0;
    if (!_677)
    {
        _809 = _661;
    }
    float _841 = _809;
    float _843 = -_793;
    float _845 = _843 + 1.0;
    float _847 = _841;
    float _849 = _731;
    if (!_677)
    {
        _811 = _731;
    }
    float _851 = _811;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _855 = _851;
    if (_677)
    {
        _847 = _125;
    }
    float _857 = _847;
    if (_677)
    {
        _855 = _661;
    }
    float _859 = _855;
    if (_677)
    {
        _849 = _661;
    }
    float _861 = _849;
    float _863 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[83].z, _853);
    float _865 = _837 ? _845 : 0.0;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _869 = _827 ? 0 : 1;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _887 = _857 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _889 = ~_869;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_885, -2.0, _871);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _899 = -_867;
    float _901 = fma(_887, 2.0, _899);
    int _903 = _893;
    if (!_839)
    {
        int _905 = ~_869;
        int _907 = _905 + 1;
        _903 = _907;
    }
    int _909 = _903;
    float _911 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[83].w, _897);
    bool _913 = !_875;
    int _915 = _913 ? 0 : 1;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _919 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _921 = isnan(1.0);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _927 = _923 || _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _931 = 1.0 + _929;
    float _933 = in.m_44.x;
    float _935 = in.m_44.y;
    float _937 = in.m_44.z;
    int _939 = abs(_915);
    float _941 = 1.0 / _931;
    float _943 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _945 = -_103;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[76].x, _683);
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _951 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _943);
    float _953 = float(_909);
    float _955 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[78].w, _949);
    float _957 = float(_939);
    float _959 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _863);
    float _961 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _955);
    float _963 = -_103;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[81].x, _901);
    float _967 = _957 * _953;
    bool _969 = !_883;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _911);
    bool _975 = !_879;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _895);
    if (_927)
    {
        float _981 = _865 * _941;
        _105 = _981;
    }
    float _983 = _105;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _989 = abs(_971);
    float _991 = _967 * (-2.0);
    int _993 = abs(_977);
    float _995 = _125 + (-0.5);
    float _997 = float(_761);
    float _999 = fma(_991, _933, _933);
    float _1001 = 1.0 / _987;
    float _1003 = float(_993);
    float _1005 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].x, _999);
    float _1007 = float(_817);
    float _1009 = fma(_787, _991, _787);
    float _1011 = float(_989);
    float _1013 = _1003 * _997;
    float _1015 = fma(_1009, _983, _1005);
    float _1017 = _661 + (-0.5);
    float _1019 = _1011 * _1007;
    float _1021 = _125 + _667;
    float _1023 = _1013 * (-2.0);
    float _1025 = _1015 * 0.15915493667125701904296875;
    float _1027 = _1019 * (-2.0);
    float _1029 = _1021 + (-1.0);
    float _1031 = fma(_1023, _935, _935);
    float _1033 = fma(_805, _1023, _805);
    float _1035 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1031);
    float _1039 = fma(_1027, _937, _937);
    float _1041 = _667 + (-0.5);
    float _1043 = in.m_26.x;
    float _1045 = in.m_26.y;
    float _1047 = in.m_26.z;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1053 = fma(_1035, _1027, _1035);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1039);
    float _1057 = fma(_1033, _983, _1037);
    bool _1059 = _669 > 0.5;
    float _1061 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = fma(_1053, _983, _1055);
    float _1065 = 1.0 / _1051;
    float _1067 = _1057 * 0.15915493667125701904296875;
    bool _1069 = _125 > 0.5;
    float _1071 = _1063 * 0.15915493667125701904296875;
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1077 = _1071 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1083 = _1081 != 0;
    float _1085 = _1061 * _1073;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1089 = _1087 != 0;
    float _1091 = _671 * _1075;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1093;
    float _1097 = -_165;
    int _1099 = _1059 ? as_type<int>(_1097) : as_type<int>(_165);
    float _1101 = _1025 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1107 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1109 = _1095 * _1001;
    float _1111 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1105);
    float _1113 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1107);
    float _1115 = _1025 * 6.283185482025146484375;
    float _1117 = cos(_1115);
    float _1119 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1113);
    float _1121 = _1067 * 6.283185482025146484375;
    float _1123 = sin(_1121);
    float _1125 = -_251;
    int _1127 = _1069 ? as_type<int>(_1125) : as_type<int>(_251);
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1131 = _1129 != 0;
    float _1133 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1139 = -_251;
    int _1141 = _763 ? as_type<int>(_1139) : as_type<int>(_251);
    float _1143 = _1067 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = _1137 * _1065;
    float _1149 = -_165;
    int _1151 = _707 ? as_type<int>(_1149) : as_type<int>(_165);
    float _1153 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1133);
    bool _1155 = !_1083;
    float _1157 = _1155 ? _251 : as_type<float>(_1127);
    bool _1159 = !_1089;
    float _1161 = _1159 ? _165 : as_type<float>(_1151);
    float _1163 = _1071 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    bool _1167 = !_717;
    float _1169 = _1167 ? _165 : as_type<float>(_1099);
    float _1171 = _1079 * _1091;
    float _1173 = _1103 * _1123;
    bool _1175 = !_1131;
    float _1177 = _1175 ? _251 : as_type<float>(_1141);
    float _1179 = _1117 * _1123;
    float _1181 = _1123 * _1079;
    float _1183 = _1117 * _1171;
    float _1185 = _1103 * _1145;
    float _1187 = _1117 * _1145;
    float _1189 = _1145 * _1079;
    float _1191 = fma(_1165, _1187, _1173);
    float _1193 = -_1179;
    float _1195 = fma(_1165, _1185, _1193);
    float _1197 = -_1185;
    float _1199 = fma(_1165, _1179, _1197);
    float _1201 = _1165 * _1091;
    float _1203 = fma(_1191, _1085, _1183);
    float _1205 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1103 * _1171;
    float _1209 = -_1201;
    float _1211 = fma(_1189, _1085, _1209);
    float _1213 = fma(_1165, _1173, _1187);
    float _1215 = fma(_1199, _1205, _1203);
    float _1217 = fma(_1195, _1085, _1207);
    float _1219 = fma(_1181, _1205, _1211);
    bool _1221 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1223 = isnan(_659);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1235 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1237 = fma(_1213, _1205, _1217);
    float _1239 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1241 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1235);
    bool _1245 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1247 = isnan(_659);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1239);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1241);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1243);
    float _1263 = -_1231;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1257);
    float _1269 = _1259 * _1259;
    float _1271 = -_1255;
    float _1273 = _1271 + 1.0;
    float _1275 = _1255 * _1265;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1279 = fma(_1261, _1261, _1269);
    bool _1281 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1283 = isnan(_659);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1295 = _659 + _1293;
    float _1297 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1111);
    float _1299 = fma(_1267, _1267, _1279);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1303 = _659 + _1301;
    float _1305 = fma(_1109, _1295, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1309 = _1291 * _1273;
    float _1311 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1153);
    float _1313 = _1157 + 0.5;
    float _1315 = fma(_1147, _1303, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1317 = _1177 + 0.5;
    float _1319 = _1305 * _1309;
    float _1321 = -_1291;
    float _1323 = _1321 + 1.0;
    float _1325 = sqrt(_1299);
    float _1327 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1329 = _1161 + (-0.5);
    float _1331 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1319);
    float _1333 = _1297 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1335 = fma(_1327, _1313, _947);
    float _1337 = fma(_1315, _1275, _1331);
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1341 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1343 = _1333 + _1259;
    float _1345 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1337);
    float _1347 = fma(_1341, _1317, _965);
    float _1349 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1353 = _1325 > 0.0;
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1357 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1359 = -_1355;
    float _1361 = -_745;
    float _1363 = fma(_1359, _1329, _1361);
    float _1365 = _1169 + (-0.5);
    float _1367 = _1349 + _1261;
    float _1369 = _1357 + _1267;
    float _1371 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1373 = _1337;
    float _1375 = _1365;
    float _1377 = _1371;
    if (!_1353)
    {
        _1373 = _1367;
    }
    float _1379 = _1373;
    float _1381 = -_1371;
    float _1383 = -_979;
    float _1385 = fma(_1381, _1365, _1383);
    float _1387 = _1379;
    if (!_1353)
    {
        _1375 = _1343;
    }
    float _1389 = _1375;
    float _1391 = _1389;
    if (!_1353)
    {
        _1377 = _1369;
    }
    float _1393 = _1377;
    bool _1395 = !_1353;
    float _1397 = _1393;
    if (!_1395)
    {
        float _1399 = _247 * _247;
        float _1401 = rsqrt(_1299);
        float _1403 = fma(_241, _241, _1399);
        float _1405 = fma(_243, _243, _1403);
        float _1407 = sqrt(_1405);
        float _1409 = _1261 * _1401;
        float _1411 = _1259 * _1401;
        float _1413 = _1267 * _1401;
        bool _1415 = _1407 > 0.0;
        float _1417 = _1403;
        float _1419 = _1407;
        float _1421 = _1401;
        if (!_1415)
        {
            _1417 = _1367;
        }
        float _1423 = _1417;
        _1387 = _1423;
        if (!_1415)
        {
            _1419 = _1343;
        }
        float _1425 = _1419;
        _1391 = _1425;
        if (!_1415)
        {
            _1421 = _1369;
        }
        float _1427 = _1421;
        bool _1429 = !_1415;
        _1397 = _1427;
        if (!_1429)
        {
            float _1431 = rsqrt(_1405);
            float _1433 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1435 = _247 * _1431;
            float _1437 = _241 * _1431;
            float _1439 = _243 * _1431;
            float _1441 = _1411 * _1435;
            float _1443 = fma(_1409, _1437, _1441);
            float _1445 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1447 = fma(_1413, _1439, _1443);
            float _1449 = _1447 * _1445;
            float _1451 = fma(_241, _1449, _1367);
            float _1453 = fma(_247, _1449, _1343);
            float _1455 = fma(_243, _1449, _1369);
            _1391 = _1453;
            _1387 = _1451;
            _1397 = _1455;
        }
    }
    float _1457 = _1391;
    float _1459 = _1387;
    float _1461 = _1397;
    float _1463 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1473 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1467);
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1479 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1481 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1483 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1475);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = -_951;
    float _1495 = _1493 + 1.0;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1499 = -_961;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1497);
    float _1509 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1511 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1513 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1515 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1507);
    float _1517 = -_1495;
    float _1519 = fma(_1157, _1517, _1335);
    float _1521 = _749 + 0.5;
    float _1523 = fma(_1161, _1501, _1363);
    float _1525 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1509);
    float _1527 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1511);
    float _1529 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1513);
    float _1531 = -_797;
    float _1533 = _1531 + 0.5;
    float _1535 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1537 = -_973;
    float _1539 = _1537 + 1.0;
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1543 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1527);
    float _1545 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1547 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1549 = -_959;
    float _1551 = _1549 + 1.0;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1559 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1561 = _1535 * _1485;
    float _1563 = fma(_1169, _1539, _1385);
    float _1565 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1567 = _1547 * _1505;
    float _1569 = -_1551;
    float _1571 = fma(_1177, _1569, _1347);
    float _1573 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1541);
    float _1583 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1585 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1545);
    float _1587 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1515);
    out.m_29.x = _1565;
    out.m_46.x = _1561;
    out.m_46.y = _1567;
    out.m_48.x = _1573;
    out.m_48.y = _1575;
    out.m_48.z = _1577;
    out.m_48.w = _1579;
    out.m_50.x = _1519;
    out.m_50.y = _1523;
    out.m_50.z = _1571;
    out.m_50.w = _1563;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1583;
    out.gl_Position.z = _1585;
    out.gl_Position.w = _1587;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _651 = false;
    bool _549 = false;
    bool _375 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _1644 = as_type<float>(_85);
        out.gl_Position.z = _1644;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_31.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = _103;
    if (_99)
    {
        float _107 = float(_69);
        _79 = _107;
    }
    float _109 = _79;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_123);
        out.gl_Position.z = _1714;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_33.x;
    float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _129 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_38.x;
    float _135 = in.m_38.y;
    float _137 = in.m_38.z;
    float _139 = _129 * _127;
    float _141 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    int _143 = as_type<int>(_131) & 1;
    bool _145 = _143 != 0;
    int _147 = as_type<int>(_131) & 2;
    bool _149 = _147 != 0;
    float _151 = _141 * 6.283185482025146484375;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = floor(_141);
    float _159 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _151 * 0.15915493667125701904296875;
    bool _163 = !_149;
    float _165 = _163 ? (-0.5) : 0.5;
    float _167 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_155;
    int _181 = _179 ? 0 : 1;
    float _183 = _161 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    bool _189 = !_171;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _195 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _199 = abs(_191);
    float _201 = -_157;
    float _203 = _141 + _201;
    int _205 = abs(_181);
    float _207 = -_203;
    float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _211 = float(_199);
    float _213 = fma(_185, 0.5, 0.5);
    bool _215 = !_175;
    int _217 = _215 ? 0 : 1;
    bool _219 = _203 < 0.5;
    float _221 = float(_219);
    float _223 = abs(_209);
    float _225 = _211 * _223;
    int _227 = abs(_217);
    float _229 = -_213;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_205);
    float _235 = -_221;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_227);
    float _241 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _243 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _245 = fma(_233, _231, _225);
    float _247 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    bool _249 = !_145;
    float _251 = _249 ? (-0.5) : 0.5;
    float _253 = abs(_237);
    float _255 = fma(_239, _253, _245);
    bool _257 = !_197;
    float _273;
    if (!_257)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_69);
        float _279 = 1.0 / _277;
        float _281 = _103 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -_299;
    float _307 = _305 + 1.0;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _303;
    float _329 = _319 * _307;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _287 * _327;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_323, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _341 * _329;
    float _347 = _343 * _329;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _351 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _353 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].x, _349);
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].y, _351);
    bool _357 = !_325;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _361 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_69);
        float _379 = 1.0 / _377;
        float _381 = _103 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = in.m_40.x;
    float _387 = in.m_40.y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _391 = _383 + _389;
    bool _393 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _395 = isnan(_383);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _413 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _415 = isnan(_383);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _407;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _411;
    float _431 = _355 * _387;
    float _433 = -_403;
    float _435 = _433 + 1.0;
    float _437 = _391 * _425;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _383 + _439;
    bool _443 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_383);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _455;
    float _459 = _453 * _435;
    float _461 = -_453;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _469;
    float _473 = fma(_457, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _475 = _423 * _463;
    float _477 = fma(_467, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = fma(_471, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _481 = _441 * _429;
    float _483 = _473 * _475;
    float _485 = _477 * _475;
    float _487 = _479 * _475;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _501 = -_423;
    float _503 = _501 + 1.0;
    float _505 = fma(_491, _481, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _507 = fma(_495, _481, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _509 = fma(_499, _481, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _485);
    float _513 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _515 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _483);
    float _517 = _353 * _385;
    float _519 = fma(_505, _459, _511);
    float _521 = fma(_507, _459, _513);
    float _523 = fma(_509, _459, _515);
    float _525 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].x, _519);
    float _527 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].y, _521);
    float _529 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].z, _523);
    bool _531 = !_427;
    float _547;
    if (!_531)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _535 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_69);
        float _553 = 1.0 / _551;
        float _555 = _103 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _561 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _563 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _565 = isnan(_557);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _581 = isnan(_557);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _557 + _595;
    float _599 = -_573;
    float _601 = _599 + 1.0;
    float _603 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = 1.0 / _577;
    float _607 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _589 * _601;
    float _611 = -_589;
    float _613 = _611 + 1.0;
    float _615 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _593 * _605;
    float _623 = fma(_621, _597, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _625 = _623 * _609;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _629 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[116].x, _627);
    float _631 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_42.x = _619;
    out.m_42.y = _603;
    out.m_42.z = _607;
    out.m_42.w = _631;
    bool _633 = !_617;
    float _649;
    if (!_633)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _637 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_69);
        float _655 = 1.0 / _653;
        float _657 = _103 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = in.m_33.y;
    float _663 = _125 * 2.0;
    float _665 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _667 = in.m_33.z;
    float _669 = in.m_33.w;
    float _671 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _673 = floor(_663);
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _677 = _675 != 0;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _681 = -_679;
    float _683 = fma(_665, 2.0, _681);
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _691 = _673 > 0.0;
    float _693 = _661 * 2.0;
    bool _695 = _673 >= 0.0;
    bool _697 = isnan(_673);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    float _705 = _661 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _707 = _661 > 0.5;
    float _709 = floor(_693);
    int _711 = _703 ? 0 : 1;
    float _713 = fma(_705, -2.0, _689);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _725 = _723 != 0;
    float _727 = _673;
    if (!_677)
    {
        float _729 = in.m_33.z;
        _727 = _729;
    }
    float _731 = _727;
    float _733 = -_251;
    int _735 = _707 ? as_type<int>(_733) : as_type<int>(_251);
    float _737 = _667 * 2.0;
    int _739 = ~_711;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _713);
    bool _747 = !_721;
    float _749 = _747 ? _251 : as_type<float>(_735);
    float _751 = floor(_737);
    float _753 = _125 + _661;
    int _755 = _743;
    if (!_691)
    {
        int _757 = ~_711;
        int _759 = _757 + 1;
        _755 = _759;
    }
    int _761 = _755;
    bool _763 = _667 > 0.5;
    float _765 = _753 + (-1.0);
    bool _767 = _709 > 0.0;
    bool _769 = _709 >= 0.0;
    bool _771 = isnan(_709);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = _687 * _103;
    float _781 = _661 + _667;
    float _783 = -_165;
    int _785 = _763 ? as_type<int>(_783) : as_type<int>(_165);
    float _787 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _789 = _777 ? 0 : 1;
    float _791 = _781 + (-1.0);
    float _793 = exp2(_779);
    bool _795 = !_725;
    float _797 = _795 ? _165 : as_type<float>(_785);
    int _799 = ~_789;
    int _801 = _799 + 1;
    int _803 = _801 + 1;
    float _805 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _807 = _803;
    float _809 = _791;
    float _811 = _765;
    if (!_767)
    {
        int _813 = ~_789;
        int _815 = _813 + 1;
        _807 = _815;
    }
    int _817 = _807;
    bool _819 = _751 >= 0.0;
    bool _821 = isnan(_751);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    bool _829 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _831 = isnan(0.0);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _837 = _833 || _835;
    bool _839 = _751 > 0.0;
    if (!_677)
    {
        _809 = _661;
    }
    float _841 = _809;
    float _843 = -_793;
    float _845 = _843 + 1.0;
    float _847 = _841;
    float _849 = _731;
    if (!_677)
    {
        _811 = _731;
    }
    float _851 = _811;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _855 = _851;
    if (_677)
    {
        _847 = _125;
    }
    float _857 = _847;
    if (_677)
    {
        _855 = _661;
    }
    float _859 = _855;
    if (_677)
    {
        _849 = _661;
    }
    float _861 = _849;
    float _863 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[83].z, _853);
    float _865 = _837 ? _845 : 0.0;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _869 = _827 ? 0 : 1;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _887 = _857 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _889 = ~_869;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_885, -2.0, _871);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _899 = -_867;
    float _901 = fma(_887, 2.0, _899);
    int _903 = _893;
    if (!_839)
    {
        int _905 = ~_869;
        int _907 = _905 + 1;
        _903 = _907;
    }
    int _909 = _903;
    float _911 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[83].w, _897);
    bool _913 = !_875;
    int _915 = _913 ? 0 : 1;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _919 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _921 = isnan(1.0);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _927 = _923 || _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _931 = 1.0 + _929;
    float _933 = in.m_44.x;
    float _935 = in.m_44.y;
    float _937 = in.m_44.z;
    int _939 = abs(_915);
    float _941 = 1.0 / _931;
    float _943 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _945 = -_103;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[76].x, _683);
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _951 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _943);
    float _953 = float(_909);
    float _955 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[78].w, _949);
    float _957 = float(_939);
    float _959 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _863);
    float _961 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _955);
    float _963 = -_103;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[81].x, _901);
    float _967 = _957 * _953;
    bool _969 = !_883;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _911);
    bool _975 = !_879;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _895);
    if (_927)
    {
        float _981 = _865 * _941;
        _105 = _981;
    }
    float _983 = _105;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _989 = abs(_971);
    float _991 = _967 * (-2.0);
    int _993 = abs(_977);
    float _995 = _125 + (-0.5);
    float _997 = float(_761);
    float _999 = fma(_991, _933, _933);
    float _1001 = 1.0 / _987;
    float _1003 = float(_993);
    float _1005 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].x, _999);
    float _1007 = float(_817);
    float _1009 = fma(_787, _991, _787);
    float _1011 = float(_989);
    float _1013 = _1003 * _997;
    float _1015 = fma(_1009, _983, _1005);
    float _1017 = _661 + (-0.5);
    float _1019 = _1011 * _1007;
    float _1021 = _125 + _667;
    float _1023 = _1013 * (-2.0);
    float _1025 = _1015 * 0.15915493667125701904296875;
    float _1027 = _1019 * (-2.0);
    float _1029 = _1021 + (-1.0);
    float _1031 = fma(_1023, _935, _935);
    float _1033 = fma(_805, _1023, _805);
    float _1035 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1031);
    float _1039 = fma(_1027, _937, _937);
    float _1041 = _667 + (-0.5);
    float _1043 = in.m_26.x;
    float _1045 = in.m_26.y;
    float _1047 = in.m_26.z;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1053 = fma(_1035, _1027, _1035);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1039);
    float _1057 = fma(_1033, _983, _1037);
    bool _1059 = _669 > 0.5;
    float _1061 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = fma(_1053, _983, _1055);
    float _1065 = 1.0 / _1051;
    float _1067 = _1057 * 0.15915493667125701904296875;
    bool _1069 = _125 > 0.5;
    float _1071 = _1063 * 0.15915493667125701904296875;
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1077 = _1071 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1083 = _1081 != 0;
    float _1085 = _1061 * _1073;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1089 = _1087 != 0;
    float _1091 = _671 * _1075;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1093;
    float _1097 = -_165;
    int _1099 = _1059 ? as_type<int>(_1097) : as_type<int>(_165);
    float _1101 = _1025 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1107 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1109 = _1095 * _1001;
    float _1111 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1105);
    float _1113 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1107);
    float _1115 = _1025 * 6.283185482025146484375;
    float _1117 = cos(_1115);
    float _1119 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1113);
    float _1121 = _1067 * 6.283185482025146484375;
    float _1123 = sin(_1121);
    float _1125 = -_251;
    int _1127 = _1069 ? as_type<int>(_1125) : as_type<int>(_251);
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1131 = _1129 != 0;
    float _1133 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1139 = -_251;
    int _1141 = _763 ? as_type<int>(_1139) : as_type<int>(_251);
    float _1143 = _1067 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = _1137 * _1065;
    float _1149 = -_165;
    int _1151 = _707 ? as_type<int>(_1149) : as_type<int>(_165);
    float _1153 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1133);
    bool _1155 = !_1083;
    float _1157 = _1155 ? _251 : as_type<float>(_1127);
    bool _1159 = !_1089;
    float _1161 = _1159 ? _165 : as_type<float>(_1151);
    float _1163 = _1071 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    bool _1167 = !_717;
    float _1169 = _1167 ? _165 : as_type<float>(_1099);
    float _1171 = _1079 * _1091;
    float _1173 = _1103 * _1123;
    bool _1175 = !_1131;
    float _1177 = _1175 ? _251 : as_type<float>(_1141);
    float _1179 = _1117 * _1123;
    float _1181 = _1123 * _1079;
    float _1183 = _1117 * _1171;
    float _1185 = _1103 * _1145;
    float _1187 = _1117 * _1145;
    float _1189 = _1145 * _1079;
    float _1191 = fma(_1165, _1187, _1173);
    float _1193 = -_1179;
    float _1195 = fma(_1165, _1185, _1193);
    float _1197 = -_1185;
    float _1199 = fma(_1165, _1179, _1197);
    float _1201 = _1165 * _1091;
    float _1203 = fma(_1191, _1085, _1183);
    float _1205 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1103 * _1171;
    float _1209 = -_1201;
    float _1211 = fma(_1189, _1085, _1209);
    float _1213 = fma(_1165, _1173, _1187);
    float _1215 = fma(_1199, _1205, _1203);
    float _1217 = fma(_1195, _1085, _1207);
    float _1219 = fma(_1181, _1205, _1211);
    bool _1221 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1223 = isnan(_659);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1235 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1237 = fma(_1213, _1205, _1217);
    float _1239 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1241 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    float _1243 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1235);
    bool _1245 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1247 = isnan(_659);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = fma(_1219, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1239);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1241);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1243);
    float _1263 = -_1231;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1257);
    float _1269 = _1259 * _1259;
    float _1271 = -_1255;
    float _1273 = _1271 + 1.0;
    float _1275 = _1255 * _1265;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1279 = fma(_1261, _1261, _1269);
    bool _1281 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1283 = isnan(_659);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1295 = _659 + _1293;
    float _1297 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1111);
    float _1299 = fma(_1267, _1267, _1279);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1303 = _659 + _1301;
    float _1305 = fma(_1109, _1295, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1309 = _1291 * _1273;
    float _1311 = fma(_1047, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1153);
    float _1313 = _1157 + 0.5;
    float _1315 = fma(_1147, _1303, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1317 = _1177 + 0.5;
    float _1319 = _1305 * _1309;
    float _1321 = -_1291;
    float _1323 = _1321 + 1.0;
    float _1325 = sqrt(_1299);
    float _1327 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1329 = _1161 + (-0.5);
    float _1331 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1319);
    float _1333 = _1297 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1335 = fma(_1327, _1313, _947);
    float _1337 = fma(_1315, _1275, _1331);
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1341 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1343 = _1333 + _1259;
    float _1345 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1337);
    float _1347 = fma(_1341, _1317, _965);
    float _1349 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1353 = _1325 > 0.0;
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1357 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1359 = -_1355;
    float _1361 = -_745;
    float _1363 = fma(_1359, _1329, _1361);
    float _1365 = _1169 + (-0.5);
    float _1367 = _1349 + _1261;
    float _1369 = _1357 + _1267;
    float _1371 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1373 = _1337;
    float _1375 = _1365;
    float _1377 = _1371;
    if (!_1353)
    {
        _1373 = _1367;
    }
    float _1379 = _1373;
    float _1381 = -_1371;
    float _1383 = -_979;
    float _1385 = fma(_1381, _1365, _1383);
    float _1387 = _1379;
    if (!_1353)
    {
        _1375 = _1343;
    }
    float _1389 = _1375;
    float _1391 = _1389;
    if (!_1353)
    {
        _1377 = _1369;
    }
    float _1393 = _1377;
    bool _1395 = !_1353;
    float _1397 = _1393;
    if (!_1395)
    {
        float _1399 = _247 * _247;
        float _1401 = rsqrt(_1299);
        float _1403 = fma(_241, _241, _1399);
        float _1405 = fma(_243, _243, _1403);
        float _1407 = sqrt(_1405);
        float _1409 = _1261 * _1401;
        float _1411 = _1259 * _1401;
        float _1413 = _1267 * _1401;
        bool _1415 = _1407 > 0.0;
        float _1417 = _1403;
        float _1419 = _1407;
        float _1421 = _1401;
        if (!_1415)
        {
            _1417 = _1367;
        }
        float _1423 = _1417;
        _1387 = _1423;
        if (!_1415)
        {
            _1419 = _1343;
        }
        float _1425 = _1419;
        _1391 = _1425;
        if (!_1415)
        {
            _1421 = _1369;
        }
        float _1427 = _1421;
        bool _1429 = !_1415;
        _1397 = _1427;
        if (!_1429)
        {
            float _1431 = rsqrt(_1405);
            float _1433 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1435 = _247 * _1431;
            float _1437 = _241 * _1431;
            float _1439 = _243 * _1431;
            float _1441 = _1411 * _1435;
            float _1443 = fma(_1409, _1437, _1441);
            float _1445 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1447 = fma(_1413, _1439, _1443);
            float _1449 = _1447 * _1445;
            float _1451 = fma(_241, _1449, _1367);
            float _1453 = fma(_247, _1449, _1343);
            float _1455 = fma(_243, _1449, _1369);
            _1391 = _1453;
            _1387 = _1451;
            _1397 = _1455;
        }
    }
    float _1457 = _1391;
    float _1459 = _1387;
    float _1461 = _1397;
    float _1463 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1473 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1467);
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1479 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1481 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1483 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1475);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = -_951;
    float _1495 = _1493 + 1.0;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1499 = -_961;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1497);
    float _1509 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1511 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1513 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1515 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1507);
    float _1517 = -_1495;
    float _1519 = fma(_1157, _1517, _1335);
    float _1521 = _749 + 0.5;
    float _1523 = fma(_1161, _1501, _1363);
    float _1525 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1509);
    float _1527 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1511);
    float _1529 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1513);
    float _1531 = -_797;
    float _1533 = _1531 + 0.5;
    float _1535 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1537 = -_973;
    float _1539 = _1537 + 1.0;
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1543 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1527);
    float _1545 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1547 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1549 = -_959;
    float _1551 = _1549 + 1.0;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1559 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1561 = _1535 * _1485;
    float _1563 = fma(_1169, _1539, _1385);
    float _1565 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1567 = _1547 * _1505;
    float _1569 = -_1551;
    float _1571 = fma(_1177, _1569, _1347);
    float _1573 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1541);
    float _1583 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1585 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1545);
    float _1587 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1515);
    out.m_29.x = _1565;
    out.m_46.x = _1561;
    out.m_46.y = _1567;
    out.m_48.x = _1573;
    out.m_48.y = _1575;
    out.m_48.z = _1577;
    out.m_48.w = _1579;
    out.m_50.x = _1519;
    out.m_50.y = _1523;
    out.m_50.z = _1571;
    out.m_50.w = _1563;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1583;
    out.gl_Position.z = _1585;
    out.gl_Position.w = _1587;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

