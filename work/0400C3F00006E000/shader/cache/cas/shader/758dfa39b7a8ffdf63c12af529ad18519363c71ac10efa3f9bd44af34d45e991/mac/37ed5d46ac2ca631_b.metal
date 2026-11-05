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
    bool _485 = false;
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
        float _1478 = as_type<float>(_85);
        out.gl_Position.z = _1478;
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
        float _1548 = as_type<float>(_123);
        out.gl_Position.z = _1548;
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
    float _241 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _243 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _245 = fma(_233, _231, _225);
    float _247 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
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
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
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
    bool _385 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _387 = isnan(_383);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_383);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _383 + _417;
    float _421 = -_395;
    float _423 = _421 + 1.0;
    float _425 = 1.0 / _399;
    float _427 = _411 * _423;
    float _429 = -_411;
    float _431 = _429 + 1.0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _441 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _445 = _439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _447 = _415 * _425;
    float _449 = fma(_447, _419, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = _449 * _427;
    float _453 = in.m_40.x;
    float _455 = in.m_40.y;
    float _457 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[115].x, _451);
    float _459 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[116].x, _457);
    float _461 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_42.x = _441;
    out.m_42.y = _443;
    out.m_42.z = _445;
    out.m_42.w = _461;
    float _463 = _355 * _455;
    float _465 = _353 * _453;
    bool _467 = !_437;
    float _483;
    if (!_467)
    {
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _471 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        float _487 = float(_69);
        float _489 = 1.0 / _487;
        float _491 = _103 * _489;
        _483 = _491;
    }
    _485 = false;
    float _493 = _483;
    float _495 = in.m_33.y;
    float _497 = _125 * 2.0;
    float _499 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _501 = in.m_33.z;
    float _503 = in.m_33.w;
    float _505 = floor(_497);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _509 = _507 != 0;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _515 = log2(_513);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _519 = -_517;
    float _521 = fma(_499, 2.0, _519);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _525 = _505 > 0.0;
    float _527 = _495 * 2.0;
    float _529 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _531 = _505 >= 0.0;
    bool _533 = isnan(_505);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    float _541 = floor(_527);
    float _543 = fma(_529, -2.0, _511);
    bool _545 = _495 > 0.5;
    float _547 = _505;
    if (!_509)
    {
        float _549 = in.m_33.z;
        _547 = _549;
    }
    float _551 = _547;
    float _553 = _515 * _103;
    int _555 = _539 ? 0 : 1;
    float _557 = _495 + _501;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _561 = _559 != 0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _569 = _567 != 0;
    float _571 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _543);
    float _573 = _501 * 2.0;
    float _575 = -_251;
    int _577 = _545 ? as_type<int>(_575) : as_type<int>(_251);
    float _579 = exp2(_553);
    int _581 = ~_555;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _557 + (-1.0);
    int _589 = _585;
    float _591 = _587;
    if (!_525)
    {
        int _593 = ~_555;
        int _595 = _593 + 1;
        _589 = _595;
    }
    int _597 = _589;
    float _599 = _125 + _495;
    bool _601 = !_565;
    float _603 = _601 ? _251 : as_type<float>(_577);
    float _605 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _607 = _541 > 0.0;
    float _609 = floor(_573);
    bool _611 = _541 >= 0.0;
    bool _613 = isnan(_541);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _599 + (-1.0);
    bool _623 = _501 > 0.5;
    if (!_509)
    {
        _591 = _495;
    }
    float _625 = _591;
    float _627 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _629 = -_165;
    float _631 = _623 ? _629 : _165;
    float _633 = -_579;
    float _635 = _633 + 1.0;
    int _637 = _619 ? 0 : 1;
    float _639 = _625;
    float _641 = _631;
    if (_509)
    {
        _639 = _125;
    }
    float _643 = _639;
    bool _645 = !_569;
    float _647 = _645 ? _165 : _631;
    int _649 = ~_637;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].z, _523);
    bool _657 = _609 > 0.0;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _661 = _609 >= 0.0;
    bool _663 = isnan(_609);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _643 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _673 = _653;
    if (!_607)
    {
        int _675 = ~_637;
        int _677 = _675 + 1;
        _673 = _677;
    }
    int _679 = _673;
    float _681 = -_103;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[76].x, _521);
    bool _685 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _693 = _689 || _691;
    float _695 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _655);
    float _697 = _551;
    if (!_509)
    {
        _641 = _551;
    }
    float _699 = _641;
    float _701 = _699;
    if (_509)
    {
        _697 = _495;
    }
    float _703 = _697;
    float _705 = _693 ? _635 : 0.0;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_509)
    {
        _701 = _495;
    }
    float _709 = _701;
    float _711 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[83].w, _659);
    float _713 = -_707;
    float _715 = fma(_671, 2.0, _713);
    int _717 = _669 ? 0 : 1;
    float _719 = _709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _721 = in.m_44.x;
    float _723 = in.m_44.y;
    float _725 = in.m_44.z;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _737 = _735 != 0;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _741 = ~_717;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    float _747 = fma(_719, -2.0, _739);
    int _749 = _745;
    if (!_657)
    {
        int _751 = ~_717;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    bool _757 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(1.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _773 = !_729;
    int _775 = _773 ? 0 : 1;
    float _777 = 1.0 / _769;
    float _779 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    int _781 = abs(_775);
    float _783 = float(_755);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _787 = float(_781);
    float _789 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _779);
    float _791 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _785);
    float _793 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _747);
    float _795 = _787 * _783;
    bool _797 = !_737;
    int _799 = _797 ? 0 : 1;
    float _801 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _791);
    bool _803 = !_733;
    int _805 = _803 ? 0 : 1;
    float _807 = -_103;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _715);
    float _811 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _711);
    float _813 = _793;
    if (_765)
    {
        float _815 = _705 * _777;
        _105 = _815;
    }
    float _817 = _105;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _823 = abs(_799);
    float _825 = _795 * (-2.0);
    int _827 = abs(_805);
    float _829 = _125 + (-0.5);
    float _831 = float(_597);
    float _833 = fma(_825, _721, _721);
    float _835 = 1.0 / _821;
    float _837 = float(_827);
    float _839 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].x, _833);
    float _841 = float(_679);
    float _843 = fma(_627, _825, _627);
    float _845 = float(_823);
    float _847 = _837 * _831;
    float _849 = fma(_843, _817, _839);
    float _851 = _495 + (-0.5);
    float _853 = _845 * _841;
    float _855 = _125 + _501;
    float _857 = _847 * (-2.0);
    float _859 = _849 * 0.15915493667125701904296875;
    float _861 = _853 * (-2.0);
    float _863 = _855 + (-1.0);
    float _865 = fma(_857, _723, _723);
    float _867 = fma(_605, _857, _605);
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _865);
    float _873 = fma(_861, _725, _725);
    float _875 = _501 + (-0.5);
    float _877 = in.m_26.x;
    float _879 = in.m_26.y;
    float _881 = in.m_26.z;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _887 = fma(_869, _861, _869);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[196].z, _873);
    float _891 = fma(_867, _817, _871);
    bool _893 = _503 > 0.5;
    float _895 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = fma(_887, _817, _889);
    float _899 = 1.0 / _885;
    float _901 = _891 * 0.15915493667125701904296875;
    bool _903 = _125 > 0.5;
    float _905 = _897 * 0.15915493667125701904296875;
    float _907 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _909 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _913 = _905 * 6.283185482025146484375;
    float _915 = cos(_913);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _919 = _917 != 0;
    float _921 = _895 * _909;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _925 = _923 != 0;
    float _927 = _907 * _911;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _929;
    float _933 = -_165;
    int _935 = _893 ? as_type<int>(_933) : as_type<int>(_165);
    float _937 = _859 * 6.283185482025146484375;
    float _939 = sin(_937);
    float _941 = _879 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _879 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _945 = _931 * _835;
    float _947 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _949 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[6].x, _943);
    float _951 = _859 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[6].z, _949);
    float _957 = _901 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = -_251;
    int _963 = _903 ? as_type<int>(_961) : as_type<int>(_251);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _967 = _965 != 0;
    float _969 = _879 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _975 = -_251;
    int _977 = _623 ? as_type<int>(_975) : as_type<int>(_251);
    float _979 = _901 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _973 * _899;
    float _985 = -_165;
    int _987 = _545 ? as_type<int>(_985) : as_type<int>(_165);
    float _989 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[4].x, _969);
    bool _991 = !_919;
    float _993 = _991 ? _251 : as_type<float>(_963);
    bool _995 = !_925;
    float _997 = _995 ? _165 : as_type<float>(_987);
    float _999 = _905 * 6.283185482025146484375;
    float _1001 = sin(_999);
    bool _1003 = !_561;
    float _1005 = _1003 ? _165 : as_type<float>(_935);
    float _1007 = _915 * _927;
    float _1009 = _939 * _959;
    bool _1011 = !_967;
    float _1013 = _1011 ? _251 : as_type<float>(_977);
    float _1015 = _953 * _959;
    float _1017 = _959 * _915;
    float _1019 = _953 * _1007;
    float _1021 = _939 * _981;
    float _1023 = _953 * _981;
    float _1025 = _981 * _915;
    float _1027 = fma(_1001, _1023, _1009);
    float _1029 = -_1015;
    float _1031 = fma(_1001, _1021, _1029);
    float _1033 = -_1021;
    float _1035 = fma(_1001, _1015, _1033);
    float _1037 = _1001 * _927;
    float _1039 = fma(_1027, _921, _1019);
    float _1041 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1043 = _939 * _1007;
    float _1045 = -_1037;
    float _1047 = fma(_1025, _921, _1045);
    float _1049 = fma(_1001, _1009, _1023);
    float _1051 = fma(_1035, _1041, _1039);
    float _1053 = fma(_1031, _921, _1043);
    float _1055 = fma(_1017, _1041, _1047);
    bool _1057 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1059 = isnan(_493);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1071 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1073 = fma(_1049, _1041, _1053);
    float _1075 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1071);
    bool _1081 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1083 = isnan(_493);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1075);
    float _1095 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1077);
    float _1097 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1079);
    float _1099 = -_1067;
    float _1101 = _1099 + 1.0;
    float _1103 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1093);
    float _1105 = _1095 * _1095;
    float _1107 = -_1091;
    float _1109 = _1107 + 1.0;
    float _1111 = _1091 * _1101;
    float _1113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1115 = fma(_1097, _1097, _1105);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _493 + _1117;
    bool _1121 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1123 = isnan(_493);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _493 + _1133;
    float _1137 = fma(_1103, _1103, _1115);
    float _1139 = fma(_945, _1119, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1141 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[4].z, _989);
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1145 = _993 + 0.5;
    float _1147 = _1131 * _1109;
    float _1149 = fma(_983, _1135, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1151 = -_1131;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[5].z, _947);
    float _1157 = _1139 * _1147;
    float _1159 = _997 + (-0.5);
    float _1161 = sqrt(_1137);
    float _1163 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1165 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1157);
    float _1167 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1169 = fma(_1163, _1145, _683);
    float _1171 = _1013 + 0.5;
    float _1173 = _1167 + _1095;
    float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1177 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1179 = fma(_1177, _1171, _809);
    float _1181 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1185 = _1161 > 0.0;
    float _1187 = _1181 + _1097;
    float _1189 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1191 = _955 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1193 = -_1189;
    float _1195 = -_571;
    float _1197 = fma(_1193, _1159, _1195);
    float _1199 = fma(_1149, _1111, _1165);
    float _1201 = _1005 + (-0.5);
    float _1203 = _1191 + _1103;
    float _1205 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1207 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1199);
    float _1209 = _1199;
    float _1211 = _1201;
    if (!_1185)
    {
        _1209 = _1187;
    }
    float _1213 = _1209;
    float _1215 = -_1205;
    float _1217 = -_793;
    float _1219 = fma(_1215, _1201, _1217);
    float _1221 = _1213;
    if (!_1185)
    {
        _1211 = _1173;
    }
    float _1223 = _1211;
    float _1225 = _1223;
    if (!_1185)
    {
        _813 = _1203;
    }
    float _1227 = _813;
    bool _1229 = !_1185;
    float _1231 = _1227;
    if (!_1229)
    {
        float _1233 = _241 * _241;
        float _1235 = fma(_247, _247, _1233);
        float _1237 = rsqrt(_1137);
        float _1239 = fma(_243, _243, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1097 * _1237;
        float _1245 = _1095 * _1237;
        float _1247 = _1103 * _1237;
        bool _1249 = _1241 > 0.0;
        float _1251 = _1235;
        float _1253 = _1241;
        float _1255 = _1237;
        if (!_1249)
        {
            _1251 = _1187;
        }
        float _1257 = _1251;
        _1221 = _1257;
        if (!_1249)
        {
            _1253 = _1173;
        }
        float _1259 = _1253;
        _1225 = _1259;
        if (!_1249)
        {
            _1255 = _1203;
        }
        float _1261 = _1255;
        bool _1263 = !_1249;
        _1231 = _1261;
        if (!_1263)
        {
            float _1265 = rsqrt(_1239);
            float _1267 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1269 = _241 * _1265;
            float _1271 = _247 * _1265;
            float _1273 = _243 * _1265;
            float _1275 = _1245 * _1269;
            float _1277 = fma(_1243, _1271, _1275);
            float _1279 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1281 = fma(_1247, _1273, _1277);
            float _1283 = _1281 * _1279;
            float _1285 = fma(_247, _1283, _1187);
            float _1287 = fma(_241, _1283, _1173);
            float _1289 = fma(_243, _1283, _1203);
            _1225 = _1287;
            _1221 = _1285;
            _1231 = _1289;
        }
    }
    float _1291 = _1225;
    float _1293 = _1221;
    float _1295 = _1231;
    float _1297 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1303 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1297);
    float _1307 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1299);
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1301);
    float _1311 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1303);
    float _1313 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1315 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1307);
    float _1317 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1309);
    float _1319 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1311);
    float _1321 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1323 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1327 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1331 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1333 = -_801;
    float _1335 = _1333 + 1.0;
    float _1337 = -_789;
    float _1339 = _1337 + 1.0;
    float _1341 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1329);
    float _1343 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1331);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1347 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1349 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1341);
    float _1353 = -_1335;
    float _1355 = fma(_993, _1353, _1169);
    float _1357 = _603 + 0.5;
    float _1359 = fma(_997, _1339, _1197);
    float _1361 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1347);
    float _1363 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1365 = -_647;
    float _1367 = _1365 + 0.5;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1371 = -_811;
    float _1373 = _1371 + 1.0;
    float _1375 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1361);
    float _1377 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1363);
    float _1379 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1343);
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1383 = -_695;
    float _1385 = _1383 + 1.0;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1393 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = _1369 * _1325;
    float _1397 = fma(_1005, _1373, _1219);
    float _1399 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1401 = _1381 * _1345;
    float _1403 = -_1385;
    float _1405 = fma(_1013, _1403, _1179);
    float _1407 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1415 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1375);
    float _1417 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1351);
    float _1421 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    out.m_29.x = _1399;
    out.m_46.x = _1395;
    out.m_46.y = _1401;
    out.m_48.x = _1407;
    out.m_48.y = _1409;
    out.m_48.z = _1411;
    out.m_48.w = _1413;
    out.m_50.x = _1355;
    out.m_50.y = _1359;
    out.m_50.z = _1405;
    out.m_50.w = _1397;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1417;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _1421;
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
    bool _485 = false;
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
        float _1478 = as_type<float>(_85);
        out.gl_Position.z = _1478;
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
        float _1548 = as_type<float>(_123);
        out.gl_Position.z = _1548;
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
    float _241 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _243 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _245 = fma(_233, _231, _225);
    float _247 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
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
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
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
    bool _385 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _387 = isnan(_383);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_383);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _383 + _417;
    float _421 = -_395;
    float _423 = _421 + 1.0;
    float _425 = 1.0 / _399;
    float _427 = _411 * _423;
    float _429 = -_411;
    float _431 = _429 + 1.0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _441 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _445 = _439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _447 = _415 * _425;
    float _449 = fma(_447, _419, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = _449 * _427;
    float _453 = in.m_40.x;
    float _455 = in.m_40.y;
    float _457 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[115].x, _451);
    float _459 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[116].x, _457);
    float _461 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_42.x = _441;
    out.m_42.y = _443;
    out.m_42.z = _445;
    out.m_42.w = _461;
    float _463 = _355 * _455;
    float _465 = _353 * _453;
    bool _467 = !_437;
    float _483;
    if (!_467)
    {
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _471 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        float _487 = float(_69);
        float _489 = 1.0 / _487;
        float _491 = _103 * _489;
        _483 = _491;
    }
    _485 = false;
    float _493 = _483;
    float _495 = in.m_33.y;
    float _497 = _125 * 2.0;
    float _499 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _501 = in.m_33.z;
    float _503 = in.m_33.w;
    float _505 = floor(_497);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _509 = _507 != 0;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _515 = log2(_513);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _519 = -_517;
    float _521 = fma(_499, 2.0, _519);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _525 = _505 > 0.0;
    float _527 = _495 * 2.0;
    float _529 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _531 = _505 >= 0.0;
    bool _533 = isnan(_505);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    float _541 = floor(_527);
    float _543 = fma(_529, -2.0, _511);
    bool _545 = _495 > 0.5;
    float _547 = _505;
    if (!_509)
    {
        float _549 = in.m_33.z;
        _547 = _549;
    }
    float _551 = _547;
    float _553 = _515 * _103;
    int _555 = _539 ? 0 : 1;
    float _557 = _495 + _501;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _561 = _559 != 0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _569 = _567 != 0;
    float _571 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _543);
    float _573 = _501 * 2.0;
    float _575 = -_251;
    int _577 = _545 ? as_type<int>(_575) : as_type<int>(_251);
    float _579 = exp2(_553);
    int _581 = ~_555;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _557 + (-1.0);
    int _589 = _585;
    float _591 = _587;
    if (!_525)
    {
        int _593 = ~_555;
        int _595 = _593 + 1;
        _589 = _595;
    }
    int _597 = _589;
    float _599 = _125 + _495;
    bool _601 = !_565;
    float _603 = _601 ? _251 : as_type<float>(_577);
    float _605 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _607 = _541 > 0.0;
    float _609 = floor(_573);
    bool _611 = _541 >= 0.0;
    bool _613 = isnan(_541);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _599 + (-1.0);
    bool _623 = _501 > 0.5;
    if (!_509)
    {
        _591 = _495;
    }
    float _625 = _591;
    float _627 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _629 = -_165;
    float _631 = _623 ? _629 : _165;
    float _633 = -_579;
    float _635 = _633 + 1.0;
    int _637 = _619 ? 0 : 1;
    float _639 = _625;
    float _641 = _631;
    if (_509)
    {
        _639 = _125;
    }
    float _643 = _639;
    bool _645 = !_569;
    float _647 = _645 ? _165 : _631;
    int _649 = ~_637;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].z, _523);
    bool _657 = _609 > 0.0;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _661 = _609 >= 0.0;
    bool _663 = isnan(_609);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _643 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _673 = _653;
    if (!_607)
    {
        int _675 = ~_637;
        int _677 = _675 + 1;
        _673 = _677;
    }
    int _679 = _673;
    float _681 = -_103;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[76].x, _521);
    bool _685 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _693 = _689 || _691;
    float _695 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _655);
    float _697 = _551;
    if (!_509)
    {
        _641 = _551;
    }
    float _699 = _641;
    float _701 = _699;
    if (_509)
    {
        _697 = _495;
    }
    float _703 = _697;
    float _705 = _693 ? _635 : 0.0;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_509)
    {
        _701 = _495;
    }
    float _709 = _701;
    float _711 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[83].w, _659);
    float _713 = -_707;
    float _715 = fma(_671, 2.0, _713);
    int _717 = _669 ? 0 : 1;
    float _719 = _709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _721 = in.m_44.x;
    float _723 = in.m_44.y;
    float _725 = in.m_44.z;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _737 = _735 != 0;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _741 = ~_717;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    float _747 = fma(_719, -2.0, _739);
    int _749 = _745;
    if (!_657)
    {
        int _751 = ~_717;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    bool _757 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(1.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _773 = !_729;
    int _775 = _773 ? 0 : 1;
    float _777 = 1.0 / _769;
    float _779 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    int _781 = abs(_775);
    float _783 = float(_755);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _787 = float(_781);
    float _789 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _779);
    float _791 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _785);
    float _793 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _747);
    float _795 = _787 * _783;
    bool _797 = !_737;
    int _799 = _797 ? 0 : 1;
    float _801 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _791);
    bool _803 = !_733;
    int _805 = _803 ? 0 : 1;
    float _807 = -_103;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _715);
    float _811 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _711);
    float _813 = _793;
    if (_765)
    {
        float _815 = _705 * _777;
        _105 = _815;
    }
    float _817 = _105;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _823 = abs(_799);
    float _825 = _795 * (-2.0);
    int _827 = abs(_805);
    float _829 = _125 + (-0.5);
    float _831 = float(_597);
    float _833 = fma(_825, _721, _721);
    float _835 = 1.0 / _821;
    float _837 = float(_827);
    float _839 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].x, _833);
    float _841 = float(_679);
    float _843 = fma(_627, _825, _627);
    float _845 = float(_823);
    float _847 = _837 * _831;
    float _849 = fma(_843, _817, _839);
    float _851 = _495 + (-0.5);
    float _853 = _845 * _841;
    float _855 = _125 + _501;
    float _857 = _847 * (-2.0);
    float _859 = _849 * 0.15915493667125701904296875;
    float _861 = _853 * (-2.0);
    float _863 = _855 + (-1.0);
    float _865 = fma(_857, _723, _723);
    float _867 = fma(_605, _857, _605);
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _865);
    float _873 = fma(_861, _725, _725);
    float _875 = _501 + (-0.5);
    float _877 = in.m_26.x;
    float _879 = in.m_26.y;
    float _881 = in.m_26.z;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _887 = fma(_869, _861, _869);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[196].z, _873);
    float _891 = fma(_867, _817, _871);
    bool _893 = _503 > 0.5;
    float _895 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = fma(_887, _817, _889);
    float _899 = 1.0 / _885;
    float _901 = _891 * 0.15915493667125701904296875;
    bool _903 = _125 > 0.5;
    float _905 = _897 * 0.15915493667125701904296875;
    float _907 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _909 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _913 = _905 * 6.283185482025146484375;
    float _915 = cos(_913);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _919 = _917 != 0;
    float _921 = _895 * _909;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _925 = _923 != 0;
    float _927 = _907 * _911;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _929;
    float _933 = -_165;
    int _935 = _893 ? as_type<int>(_933) : as_type<int>(_165);
    float _937 = _859 * 6.283185482025146484375;
    float _939 = sin(_937);
    float _941 = _879 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _879 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _945 = _931 * _835;
    float _947 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _949 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[6].x, _943);
    float _951 = _859 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[6].z, _949);
    float _957 = _901 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = -_251;
    int _963 = _903 ? as_type<int>(_961) : as_type<int>(_251);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _967 = _965 != 0;
    float _969 = _879 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _975 = -_251;
    int _977 = _623 ? as_type<int>(_975) : as_type<int>(_251);
    float _979 = _901 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _973 * _899;
    float _985 = -_165;
    int _987 = _545 ? as_type<int>(_985) : as_type<int>(_165);
    float _989 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[4].x, _969);
    bool _991 = !_919;
    float _993 = _991 ? _251 : as_type<float>(_963);
    bool _995 = !_925;
    float _997 = _995 ? _165 : as_type<float>(_987);
    float _999 = _905 * 6.283185482025146484375;
    float _1001 = sin(_999);
    bool _1003 = !_561;
    float _1005 = _1003 ? _165 : as_type<float>(_935);
    float _1007 = _915 * _927;
    float _1009 = _939 * _959;
    bool _1011 = !_967;
    float _1013 = _1011 ? _251 : as_type<float>(_977);
    float _1015 = _953 * _959;
    float _1017 = _959 * _915;
    float _1019 = _953 * _1007;
    float _1021 = _939 * _981;
    float _1023 = _953 * _981;
    float _1025 = _981 * _915;
    float _1027 = fma(_1001, _1023, _1009);
    float _1029 = -_1015;
    float _1031 = fma(_1001, _1021, _1029);
    float _1033 = -_1021;
    float _1035 = fma(_1001, _1015, _1033);
    float _1037 = _1001 * _927;
    float _1039 = fma(_1027, _921, _1019);
    float _1041 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1043 = _939 * _1007;
    float _1045 = -_1037;
    float _1047 = fma(_1025, _921, _1045);
    float _1049 = fma(_1001, _1009, _1023);
    float _1051 = fma(_1035, _1041, _1039);
    float _1053 = fma(_1031, _921, _1043);
    float _1055 = fma(_1017, _1041, _1047);
    bool _1057 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1059 = isnan(_493);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1071 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1073 = fma(_1049, _1041, _1053);
    float _1075 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1071);
    bool _1081 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1083 = isnan(_493);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1075);
    float _1095 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1077);
    float _1097 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1079);
    float _1099 = -_1067;
    float _1101 = _1099 + 1.0;
    float _1103 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1093);
    float _1105 = _1095 * _1095;
    float _1107 = -_1091;
    float _1109 = _1107 + 1.0;
    float _1111 = _1091 * _1101;
    float _1113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1115 = fma(_1097, _1097, _1105);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _493 + _1117;
    bool _1121 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1123 = isnan(_493);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _493 + _1133;
    float _1137 = fma(_1103, _1103, _1115);
    float _1139 = fma(_945, _1119, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1141 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[4].z, _989);
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1145 = _993 + 0.5;
    float _1147 = _1131 * _1109;
    float _1149 = fma(_983, _1135, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1151 = -_1131;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[5].z, _947);
    float _1157 = _1139 * _1147;
    float _1159 = _997 + (-0.5);
    float _1161 = sqrt(_1137);
    float _1163 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1165 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1157);
    float _1167 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1169 = fma(_1163, _1145, _683);
    float _1171 = _1013 + 0.5;
    float _1173 = _1167 + _1095;
    float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1177 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1179 = fma(_1177, _1171, _809);
    float _1181 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1185 = _1161 > 0.0;
    float _1187 = _1181 + _1097;
    float _1189 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1191 = _955 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1193 = -_1189;
    float _1195 = -_571;
    float _1197 = fma(_1193, _1159, _1195);
    float _1199 = fma(_1149, _1111, _1165);
    float _1201 = _1005 + (-0.5);
    float _1203 = _1191 + _1103;
    float _1205 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1207 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1199);
    float _1209 = _1199;
    float _1211 = _1201;
    if (!_1185)
    {
        _1209 = _1187;
    }
    float _1213 = _1209;
    float _1215 = -_1205;
    float _1217 = -_793;
    float _1219 = fma(_1215, _1201, _1217);
    float _1221 = _1213;
    if (!_1185)
    {
        _1211 = _1173;
    }
    float _1223 = _1211;
    float _1225 = _1223;
    if (!_1185)
    {
        _813 = _1203;
    }
    float _1227 = _813;
    bool _1229 = !_1185;
    float _1231 = _1227;
    if (!_1229)
    {
        float _1233 = _241 * _241;
        float _1235 = fma(_247, _247, _1233);
        float _1237 = rsqrt(_1137);
        float _1239 = fma(_243, _243, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1097 * _1237;
        float _1245 = _1095 * _1237;
        float _1247 = _1103 * _1237;
        bool _1249 = _1241 > 0.0;
        float _1251 = _1235;
        float _1253 = _1241;
        float _1255 = _1237;
        if (!_1249)
        {
            _1251 = _1187;
        }
        float _1257 = _1251;
        _1221 = _1257;
        if (!_1249)
        {
            _1253 = _1173;
        }
        float _1259 = _1253;
        _1225 = _1259;
        if (!_1249)
        {
            _1255 = _1203;
        }
        float _1261 = _1255;
        bool _1263 = !_1249;
        _1231 = _1261;
        if (!_1263)
        {
            float _1265 = rsqrt(_1239);
            float _1267 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1269 = _241 * _1265;
            float _1271 = _247 * _1265;
            float _1273 = _243 * _1265;
            float _1275 = _1245 * _1269;
            float _1277 = fma(_1243, _1271, _1275);
            float _1279 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1281 = fma(_1247, _1273, _1277);
            float _1283 = _1281 * _1279;
            float _1285 = fma(_247, _1283, _1187);
            float _1287 = fma(_241, _1283, _1173);
            float _1289 = fma(_243, _1283, _1203);
            _1225 = _1287;
            _1221 = _1285;
            _1231 = _1289;
        }
    }
    float _1291 = _1225;
    float _1293 = _1221;
    float _1295 = _1231;
    float _1297 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1303 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1297);
    float _1307 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1299);
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1301);
    float _1311 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1303);
    float _1313 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1315 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1307);
    float _1317 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1309);
    float _1319 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1311);
    float _1321 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1323 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1327 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1331 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1333 = -_801;
    float _1335 = _1333 + 1.0;
    float _1337 = -_789;
    float _1339 = _1337 + 1.0;
    float _1341 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1329);
    float _1343 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1331);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1347 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1349 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1341);
    float _1353 = -_1335;
    float _1355 = fma(_993, _1353, _1169);
    float _1357 = _603 + 0.5;
    float _1359 = fma(_997, _1339, _1197);
    float _1361 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1347);
    float _1363 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1365 = -_647;
    float _1367 = _1365 + 0.5;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1371 = -_811;
    float _1373 = _1371 + 1.0;
    float _1375 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1361);
    float _1377 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1363);
    float _1379 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1343);
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1383 = -_695;
    float _1385 = _1383 + 1.0;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1393 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = _1369 * _1325;
    float _1397 = fma(_1005, _1373, _1219);
    float _1399 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1401 = _1381 * _1345;
    float _1403 = -_1385;
    float _1405 = fma(_1013, _1403, _1179);
    float _1407 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1415 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1375);
    float _1417 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1351);
    float _1421 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    out.m_29.x = _1399;
    out.m_46.x = _1395;
    out.m_46.y = _1401;
    out.m_48.x = _1407;
    out.m_48.y = _1409;
    out.m_48.z = _1411;
    out.m_48.w = _1413;
    out.m_50.x = _1355;
    out.m_50.y = _1359;
    out.m_50.z = _1405;
    out.m_50.w = _1397;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1417;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _1421;
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
    bool _485 = false;
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
        float _1478 = as_type<float>(_85);
        out.gl_Position.z = _1478;
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
        float _1548 = as_type<float>(_123);
        out.gl_Position.z = _1548;
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
    float _241 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _243 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _245 = fma(_233, _231, _225);
    float _247 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
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
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
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
    bool _385 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _387 = isnan(_383);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_383);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _383 + _417;
    float _421 = -_395;
    float _423 = _421 + 1.0;
    float _425 = 1.0 / _399;
    float _427 = _411 * _423;
    float _429 = -_411;
    float _431 = _429 + 1.0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _441 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _445 = _439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _447 = _415 * _425;
    float _449 = fma(_447, _419, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = _449 * _427;
    float _453 = in.m_40.x;
    float _455 = in.m_40.y;
    float _457 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[115].x, _451);
    float _459 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[116].x, _457);
    float _461 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_42.x = _441;
    out.m_42.y = _443;
    out.m_42.z = _445;
    out.m_42.w = _461;
    float _463 = _355 * _455;
    float _465 = _353 * _453;
    bool _467 = !_437;
    float _483;
    if (!_467)
    {
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _471 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        float _487 = float(_69);
        float _489 = 1.0 / _487;
        float _491 = _103 * _489;
        _483 = _491;
    }
    _485 = false;
    float _493 = _483;
    float _495 = in.m_33.y;
    float _497 = _125 * 2.0;
    float _499 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _501 = in.m_33.z;
    float _503 = in.m_33.w;
    float _505 = floor(_497);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _509 = _507 != 0;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _515 = log2(_513);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _519 = -_517;
    float _521 = fma(_499, 2.0, _519);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _525 = _505 > 0.0;
    float _527 = _495 * 2.0;
    float _529 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _531 = _505 >= 0.0;
    bool _533 = isnan(_505);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    float _541 = floor(_527);
    float _543 = fma(_529, -2.0, _511);
    bool _545 = _495 > 0.5;
    float _547 = _505;
    if (!_509)
    {
        float _549 = in.m_33.z;
        _547 = _549;
    }
    float _551 = _547;
    float _553 = _515 * _103;
    int _555 = _539 ? 0 : 1;
    float _557 = _495 + _501;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _561 = _559 != 0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _569 = _567 != 0;
    float _571 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _543);
    float _573 = _501 * 2.0;
    float _575 = -_251;
    int _577 = _545 ? as_type<int>(_575) : as_type<int>(_251);
    float _579 = exp2(_553);
    int _581 = ~_555;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _557 + (-1.0);
    int _589 = _585;
    float _591 = _587;
    if (!_525)
    {
        int _593 = ~_555;
        int _595 = _593 + 1;
        _589 = _595;
    }
    int _597 = _589;
    float _599 = _125 + _495;
    bool _601 = !_565;
    float _603 = _601 ? _251 : as_type<float>(_577);
    float _605 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _607 = _541 > 0.0;
    float _609 = floor(_573);
    bool _611 = _541 >= 0.0;
    bool _613 = isnan(_541);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _599 + (-1.0);
    bool _623 = _501 > 0.5;
    if (!_509)
    {
        _591 = _495;
    }
    float _625 = _591;
    float _627 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _629 = -_165;
    float _631 = _623 ? _629 : _165;
    float _633 = -_579;
    float _635 = _633 + 1.0;
    int _637 = _619 ? 0 : 1;
    float _639 = _625;
    float _641 = _631;
    if (_509)
    {
        _639 = _125;
    }
    float _643 = _639;
    bool _645 = !_569;
    float _647 = _645 ? _165 : _631;
    int _649 = ~_637;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].z, _523);
    bool _657 = _609 > 0.0;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _661 = _609 >= 0.0;
    bool _663 = isnan(_609);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _643 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _673 = _653;
    if (!_607)
    {
        int _675 = ~_637;
        int _677 = _675 + 1;
        _673 = _677;
    }
    int _679 = _673;
    float _681 = -_103;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[76].x, _521);
    bool _685 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _693 = _689 || _691;
    float _695 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _655);
    float _697 = _551;
    if (!_509)
    {
        _641 = _551;
    }
    float _699 = _641;
    float _701 = _699;
    if (_509)
    {
        _697 = _495;
    }
    float _703 = _697;
    float _705 = _693 ? _635 : 0.0;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_509)
    {
        _701 = _495;
    }
    float _709 = _701;
    float _711 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[83].w, _659);
    float _713 = -_707;
    float _715 = fma(_671, 2.0, _713);
    int _717 = _669 ? 0 : 1;
    float _719 = _709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _721 = in.m_44.x;
    float _723 = in.m_44.y;
    float _725 = in.m_44.z;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _737 = _735 != 0;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _741 = ~_717;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    float _747 = fma(_719, -2.0, _739);
    int _749 = _745;
    if (!_657)
    {
        int _751 = ~_717;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    bool _757 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(1.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _773 = !_729;
    int _775 = _773 ? 0 : 1;
    float _777 = 1.0 / _769;
    float _779 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    int _781 = abs(_775);
    float _783 = float(_755);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _787 = float(_781);
    float _789 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _779);
    float _791 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _785);
    float _793 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _747);
    float _795 = _787 * _783;
    bool _797 = !_737;
    int _799 = _797 ? 0 : 1;
    float _801 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _791);
    bool _803 = !_733;
    int _805 = _803 ? 0 : 1;
    float _807 = -_103;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _715);
    float _811 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _711);
    float _813 = _793;
    if (_765)
    {
        float _815 = _705 * _777;
        _105 = _815;
    }
    float _817 = _105;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _823 = abs(_799);
    float _825 = _795 * (-2.0);
    int _827 = abs(_805);
    float _829 = _125 + (-0.5);
    float _831 = float(_597);
    float _833 = fma(_825, _721, _721);
    float _835 = 1.0 / _821;
    float _837 = float(_827);
    float _839 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].x, _833);
    float _841 = float(_679);
    float _843 = fma(_627, _825, _627);
    float _845 = float(_823);
    float _847 = _837 * _831;
    float _849 = fma(_843, _817, _839);
    float _851 = _495 + (-0.5);
    float _853 = _845 * _841;
    float _855 = _125 + _501;
    float _857 = _847 * (-2.0);
    float _859 = _849 * 0.15915493667125701904296875;
    float _861 = _853 * (-2.0);
    float _863 = _855 + (-1.0);
    float _865 = fma(_857, _723, _723);
    float _867 = fma(_605, _857, _605);
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _865);
    float _873 = fma(_861, _725, _725);
    float _875 = _501 + (-0.5);
    float _877 = in.m_26.x;
    float _879 = in.m_26.y;
    float _881 = in.m_26.z;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _887 = fma(_869, _861, _869);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[196].z, _873);
    float _891 = fma(_867, _817, _871);
    bool _893 = _503 > 0.5;
    float _895 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = fma(_887, _817, _889);
    float _899 = 1.0 / _885;
    float _901 = _891 * 0.15915493667125701904296875;
    bool _903 = _125 > 0.5;
    float _905 = _897 * 0.15915493667125701904296875;
    float _907 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _909 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _913 = _905 * 6.283185482025146484375;
    float _915 = cos(_913);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _919 = _917 != 0;
    float _921 = _895 * _909;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _925 = _923 != 0;
    float _927 = _907 * _911;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _929;
    float _933 = -_165;
    int _935 = _893 ? as_type<int>(_933) : as_type<int>(_165);
    float _937 = _859 * 6.283185482025146484375;
    float _939 = sin(_937);
    float _941 = _879 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _879 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _945 = _931 * _835;
    float _947 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _949 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[6].x, _943);
    float _951 = _859 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[6].z, _949);
    float _957 = _901 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = -_251;
    int _963 = _903 ? as_type<int>(_961) : as_type<int>(_251);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _967 = _965 != 0;
    float _969 = _879 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _975 = -_251;
    int _977 = _623 ? as_type<int>(_975) : as_type<int>(_251);
    float _979 = _901 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _973 * _899;
    float _985 = -_165;
    int _987 = _545 ? as_type<int>(_985) : as_type<int>(_165);
    float _989 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[4].x, _969);
    bool _991 = !_919;
    float _993 = _991 ? _251 : as_type<float>(_963);
    bool _995 = !_925;
    float _997 = _995 ? _165 : as_type<float>(_987);
    float _999 = _905 * 6.283185482025146484375;
    float _1001 = sin(_999);
    bool _1003 = !_561;
    float _1005 = _1003 ? _165 : as_type<float>(_935);
    float _1007 = _915 * _927;
    float _1009 = _939 * _959;
    bool _1011 = !_967;
    float _1013 = _1011 ? _251 : as_type<float>(_977);
    float _1015 = _953 * _959;
    float _1017 = _959 * _915;
    float _1019 = _953 * _1007;
    float _1021 = _939 * _981;
    float _1023 = _953 * _981;
    float _1025 = _981 * _915;
    float _1027 = fma(_1001, _1023, _1009);
    float _1029 = -_1015;
    float _1031 = fma(_1001, _1021, _1029);
    float _1033 = -_1021;
    float _1035 = fma(_1001, _1015, _1033);
    float _1037 = _1001 * _927;
    float _1039 = fma(_1027, _921, _1019);
    float _1041 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1043 = _939 * _1007;
    float _1045 = -_1037;
    float _1047 = fma(_1025, _921, _1045);
    float _1049 = fma(_1001, _1009, _1023);
    float _1051 = fma(_1035, _1041, _1039);
    float _1053 = fma(_1031, _921, _1043);
    float _1055 = fma(_1017, _1041, _1047);
    bool _1057 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1059 = isnan(_493);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1071 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1073 = fma(_1049, _1041, _1053);
    float _1075 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1071);
    bool _1081 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1083 = isnan(_493);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1075);
    float _1095 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1077);
    float _1097 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1079);
    float _1099 = -_1067;
    float _1101 = _1099 + 1.0;
    float _1103 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1093);
    float _1105 = _1095 * _1095;
    float _1107 = -_1091;
    float _1109 = _1107 + 1.0;
    float _1111 = _1091 * _1101;
    float _1113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1115 = fma(_1097, _1097, _1105);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _493 + _1117;
    bool _1121 = _493 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1123 = isnan(_493);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _493 + _1133;
    float _1137 = fma(_1103, _1103, _1115);
    float _1139 = fma(_945, _1119, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1141 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[4].z, _989);
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1145 = _993 + 0.5;
    float _1147 = _1131 * _1109;
    float _1149 = fma(_983, _1135, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1151 = -_1131;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_881, (*spvDescriptorSet0.vp_c10)._m0[5].z, _947);
    float _1157 = _1139 * _1147;
    float _1159 = _997 + (-0.5);
    float _1161 = sqrt(_1137);
    float _1163 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1165 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1157);
    float _1167 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1169 = fma(_1163, _1145, _683);
    float _1171 = _1013 + 0.5;
    float _1173 = _1167 + _1095;
    float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1177 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1179 = fma(_1177, _1171, _809);
    float _1181 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1185 = _1161 > 0.0;
    float _1187 = _1181 + _1097;
    float _1189 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1191 = _955 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1193 = -_1189;
    float _1195 = -_571;
    float _1197 = fma(_1193, _1159, _1195);
    float _1199 = fma(_1149, _1111, _1165);
    float _1201 = _1005 + (-0.5);
    float _1203 = _1191 + _1103;
    float _1205 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1207 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1199);
    float _1209 = _1199;
    float _1211 = _1201;
    if (!_1185)
    {
        _1209 = _1187;
    }
    float _1213 = _1209;
    float _1215 = -_1205;
    float _1217 = -_793;
    float _1219 = fma(_1215, _1201, _1217);
    float _1221 = _1213;
    if (!_1185)
    {
        _1211 = _1173;
    }
    float _1223 = _1211;
    float _1225 = _1223;
    if (!_1185)
    {
        _813 = _1203;
    }
    float _1227 = _813;
    bool _1229 = !_1185;
    float _1231 = _1227;
    if (!_1229)
    {
        float _1233 = _241 * _241;
        float _1235 = fma(_247, _247, _1233);
        float _1237 = rsqrt(_1137);
        float _1239 = fma(_243, _243, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1097 * _1237;
        float _1245 = _1095 * _1237;
        float _1247 = _1103 * _1237;
        bool _1249 = _1241 > 0.0;
        float _1251 = _1235;
        float _1253 = _1241;
        float _1255 = _1237;
        if (!_1249)
        {
            _1251 = _1187;
        }
        float _1257 = _1251;
        _1221 = _1257;
        if (!_1249)
        {
            _1253 = _1173;
        }
        float _1259 = _1253;
        _1225 = _1259;
        if (!_1249)
        {
            _1255 = _1203;
        }
        float _1261 = _1255;
        bool _1263 = !_1249;
        _1231 = _1261;
        if (!_1263)
        {
            float _1265 = rsqrt(_1239);
            float _1267 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1269 = _241 * _1265;
            float _1271 = _247 * _1265;
            float _1273 = _243 * _1265;
            float _1275 = _1245 * _1269;
            float _1277 = fma(_1243, _1271, _1275);
            float _1279 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1281 = fma(_1247, _1273, _1277);
            float _1283 = _1281 * _1279;
            float _1285 = fma(_247, _1283, _1187);
            float _1287 = fma(_241, _1283, _1173);
            float _1289 = fma(_243, _1283, _1203);
            _1225 = _1287;
            _1221 = _1285;
            _1231 = _1289;
        }
    }
    float _1291 = _1225;
    float _1293 = _1221;
    float _1295 = _1231;
    float _1297 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1303 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1297);
    float _1307 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1299);
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1301);
    float _1311 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1303);
    float _1313 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1315 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1307);
    float _1317 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1309);
    float _1319 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1311);
    float _1321 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1323 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1327 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1331 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1333 = -_801;
    float _1335 = _1333 + 1.0;
    float _1337 = -_789;
    float _1339 = _1337 + 1.0;
    float _1341 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1329);
    float _1343 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1331);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1347 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1349 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1341);
    float _1353 = -_1335;
    float _1355 = fma(_993, _1353, _1169);
    float _1357 = _603 + 0.5;
    float _1359 = fma(_997, _1339, _1197);
    float _1361 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1347);
    float _1363 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1365 = -_647;
    float _1367 = _1365 + 0.5;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1371 = -_811;
    float _1373 = _1371 + 1.0;
    float _1375 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1361);
    float _1377 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1363);
    float _1379 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1343);
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1383 = -_695;
    float _1385 = _1383 + 1.0;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1393 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = _1369 * _1325;
    float _1397 = fma(_1005, _1373, _1219);
    float _1399 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1401 = _1381 * _1345;
    float _1403 = -_1385;
    float _1405 = fma(_1013, _1403, _1179);
    float _1407 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1415 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1375);
    float _1417 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1351);
    float _1421 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    out.m_29.x = _1399;
    out.m_46.x = _1395;
    out.m_46.y = _1401;
    out.m_48.x = _1407;
    out.m_48.y = _1409;
    out.m_48.z = _1411;
    out.m_48.w = _1413;
    out.m_50.x = _1355;
    out.m_50.y = _1359;
    out.m_50.z = _1405;
    out.m_50.w = _1397;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1417;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _1421;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

