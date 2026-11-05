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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_37 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _503 = false;
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
        float _1523 = as_type<float>(_85);
        out.gl_Position.z = _1523;
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
    float _105 = 0.0;
    if (_99)
    {
        float _107 = float(_69);
        _105 = _107;
    }
    float _109 = _105;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    if (_115)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _79;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1591 = as_type<float>(_121);
        out.gl_Position.z = _1591;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_42.w;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = _127 * _125;
    float _153 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = in.m_35.x;
    float _157 = in.m_35.y;
    float _159 = in.m_35.z;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = floor(_153);
    int _165 = as_type<int>(_129) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_129) & 2;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _173 * 6.283185482025146484375;
    float _181 = cos(_179);
    bool _183 = !_167;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = -_163;
    float _189 = _153 + _187;
    float _191 = _163;
    float _193 = _131;
    if (!_141)
    {
        float _195 = _131 * _131;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    bool _201 = !_171;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _199;
    if (!_141)
    {
        float _207 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_141;
    float _213 = _209;
    float _215 = _145;
    float _217 = _147;
    float _219 = _159;
    float _221 = _159;
    if (!_211)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _131 * _225;
        float _235 = exp2(_233);
        float _237 = _231 * 0.693147182464599609375;
        float _239 = 1.0 / _237;
        float _241 = 1.0 / _229;
        float _243 = _235 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _239, _131);
        float _249 = _247 * _241;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _251;
    }
    float _253 = _213;
    bool _255 = !_141;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _131 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _193 = _275;
    }
    float _277 = _193;
    float _279 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _285 = fma(_277, _155, _279);
    bool _287 = _189 < 0.5;
    float _289 = float(_287);
    float _291 = fma(_277, _157, _281);
    float _293 = fma(_181, 0.5, 0.5);
    float _295 = fma(_285, _143, _145);
    float _297 = fma(_277, _159, _283);
    float _299 = _295;
    if (!_141)
    {
        float _301 = _103 * _103;
        float _303 = _301 * 0.5;
        _215 = _303;
    }
    float _305 = _215;
    float _307 = -_189;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = -_289;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = fma(_291, _143, _147);
    float _321 = fma(_297, _143, _149);
    float _323 = _305;
    if (!_141)
    {
        float _325 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _323 = _325;
    }
    float _327 = _323;
    float _329 = _327;
    if (!_141)
    {
        _217 = _103;
    }
    float _331 = _217;
    bool _333 = !_177;
    int _335 = _333 ? 0 : 1;
    bool _337 = !_141;
    float _339 = _331;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = _103 * _343;
        float _353 = 1.0 / _347;
        float _355 = _349 * 0.693147182464599609375;
        float _357 = exp2(_351);
        float _359 = 1.0 / _355;
        float _361 = _357 + (-1.0);
        float _363 = -_361;
        float _365 = fma(_363, _359, _103);
        float _367 = _365 * _353;
        float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _369;
    }
    float _371 = _329;
    bool _373 = !_141;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _103 * _377;
        float _387 = exp2(_385);
        float _389 = -_387;
        float _391 = _389 + 1.0;
        float _393 = _391 * _383;
        _339 = _393;
    }
    float _395 = _339;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _403 = _401 != 0;
    float _405 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _407 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _409 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _411 = abs(_335);
    float _413 = fma(_395, _155, _405);
    bool _415 = !_399;
    int _417 = _415 ? 0 : 1;
    float _419 = fma(_395, _157, _407);
    float _421 = fma(_395, _159, _409);
    bool _423 = !_403;
    int _425 = _423 ? 0 : 1;
    float _427 = -_413;
    float _429 = _285 + _427;
    int _431 = abs(_417);
    float _433 = -_419;
    float _435 = _291 + _433;
    int _437 = abs(_425);
    float _439 = -_421;
    float _441 = _297 + _439;
    float _443 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = float(_431);
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _457 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _459 = float(_411);
    float _461 = abs(_309);
    float _463 = _451 * _461;
    float _465 = float(_437);
    float _467 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _469 = fma(_459, _317, _463);
    float _471 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _473 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    float _475 = abs(_313);
    float _477 = fma(_465, _475, _469);
    bool _479 = !_445;
    float _481 = _471;
    float _483 = _467;
    float _485 = _473;
    float _501;
    if (!_479)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _489 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_69);
        float _507 = 1.0 / _505;
        float _509 = _103 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _515 = _511 + _513;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _511 + _519;
    bool _523 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _525 = isnan(_511);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = _517 * _123;
    float _545 = 1.0 / _537;
    float _547 = -_533;
    float _549 = _547 + 1.0;
    bool _551 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_511);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = _123 > 0.5;
    float _565 = trunc(_543);
    int _567 = int(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _569;
    float _573 = _515 * _545;
    bool _575 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _577 = isnan(_511);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = _585 * _549;
    int _591 = _567 << 4;
    int _593 = _591 + 1968;
    float _595 = -_585;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _599;
    float _603 = _561 * _597;
    float _605 = fma(_571, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _607 = fma(_601, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = in.m_42.x;
    float _611 = in.m_42.y;
    float _613 = _521 * _587;
    float _615 = _605 * _603;
    float _617 = _607 * _603;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_561;
    float _625 = _623 + 1.0;
    uint _628 = uint(int(uint(_593) >> uint(2)));
    uint _630 = uint(int(uint(int(_628)) >> uint(2)));
    int _632 = int(_628) & 3;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[int(_630)][_632];
    int _636 = int(_628) + 1;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    int _640 = _636 & 3;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[int(_638)][_640];
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _648 = fma(_621, _613, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _615);
    float _652 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _617);
    float _654 = fma(_646, _613, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = in.m_37.y;
    float _658 = fma(_648, _589, _650);
    float _660 = fma(_654, _589, _652);
    float _662 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[145].x, _658);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _666 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[145].y, _660);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _674 = _672 != 0;
    float _676 = _662 * _609;
    float _678 = _666 * _611;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _684 = _477 * _676;
    float _686 = _477 * _678;
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _690 = -_185;
    int _692 = _563 ? as_type<int>(_690) : as_type<int>(_185);
    float _694 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _696 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _698 = !_670;
    float _700 = _698 ? _185 : as_type<float>(_692);
    float _702 = _680 * _694;
    float _704 = _688 * _696;
    bool _706 = _656 > 0.5;
    int _708 = _593 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    float _718 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _720 = _704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _724 = _704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _726 = -_203;
    int _728 = _706 ? as_type<int>(_726) : as_type<int>(_203);
    float _730 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _732 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[25].x, _722);
    float _734 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[26].x, _724);
    bool _736 = !_674;
    float _738 = _736 ? _203 : as_type<float>(_728);
    float _740 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[24].z, _730);
    float _742 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[25].z, _732);
    float _744 = _319 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _700 + 0.5;
    float _748 = -_738;
    float _750 = _748 + 0.5;
    float _752 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _754 = _319 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _756 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _762 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _754);
    float _764 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].z, _756);
    float _766 = _758 * _664;
    float _768 = _634 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _770 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].z, _762);
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _774 = _760 * _682;
    float _776 = _742 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _778 = _770 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _782 = _772 + _780;
    float _784 = _740 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _786 = _776 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _778 + _788;
    float _792 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[26].z, _734);
    float _794 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = fma(_784, _784, _786);
    float _798 = _790 * _790;
    out.m_44.x = _774;
    out.m_44.y = _766;
    float _800 = _319 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _802 = fma(_782, _782, _798);
    float _804 = _792 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _806 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _800);
    float _808 = sqrt(_802);
    float _810 = fma(_804, _804, _796);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _814 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _816 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _820 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _824 = sqrt(_810);
    float _826 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].z, _806);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _794;
    out.m_46.y = _816;
    out.m_46.z = _820;
    float _830 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _834 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_48.x = _830;
    out.m_48.y = _832;
    out.m_48.z = _836;
    out.m_48.w = _828;
    bool _840 = _824 > 0.0;
    float _842 = _826;
    float _844 = _832;
    float _846 = _794;
    float _848 = _816;
    float _850 = _766;
    if (!_834)
    {
        _299 = _772;
    }
    float _852 = _299;
    float _854 = _852;
    if (!_834)
    {
        _842 = _778;
    }
    float _856 = _842;
    float _858 = _856;
    if (!_834)
    {
        _844 = _838;
    }
    float _860 = _844;
    bool _862 = !_834;
    float _864 = _860;
    if (!_862)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _870 = _808 + _868;
        float _872 = _838 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = rsqrt(_802);
        float _876 = _870 * _866;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _878 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = sin(_884);
        float _888 = _882 + (-1.0);
        float _890 = _888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = fma(_886, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _894 = fma(_838, _882, _890);
        float _896 = _874 * _892;
        float _898 = fma(_782, _896, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _900 = fma(_790, _896, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _854 = _898;
        _864 = _894;
        _858 = _900;
        _846 = _874;
        _848 = _878;
    }
    float _902 = _854;
    float _904 = _864;
    float _906 = _858;
    float _908 = _846;
    float _910 = _848;
    float _912 = _784 + _902;
    float _914 = _776 + _904;
    float _916 = _804 + _906;
    bool _918 = !_840;
    float _920 = _910;
    float _922 = _912;
    float _924 = _914;
    float _926 = _916;
    float _928 = _908;
    if (!_918)
    {
        bool _930 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _932 = _908;
        if (_930)
        {
            float _934 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _932 = _934;
        }
        float _936 = _932;
        float _938 = _936;
        if (_930)
        {
            float _940 = _467 * _936;
            _850 = _940;
        }
        float _942 = _850;
        float _944 = _942;
        if (_930)
        {
            float _946 = _471 * _936;
            _920 = _946;
        }
        float _948 = _920;
        float _950 = _948;
        if (_930)
        {
            float _952 = _473 * _936;
            _938 = _952;
        }
        float _954 = _938;
        float _956 = _954;
        float _958 = _954;
        if (!_930)
        {
            float _960 = _103 + 1.0;
            float _962 = _960;
            if (!_141)
            {
                float _964 = _960 * _960;
                float _966 = _964 * 0.5;
                _956 = _966;
            }
            float _968 = _956;
            float _970 = _968;
            if (!_141)
            {
                float _972 = _968 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _970 = _972;
            }
            float _974 = _970;
            bool _976 = !_141;
            float _978 = _974;
            if (!_976)
            {
                float _980 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _982 = log2(_980);
                float _984 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _986 = _984 + 1.0;
                float _988 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _990 = _982 * _960;
                float _992 = 1.0 / _986;
                float _994 = _988 * 0.693147182464599609375;
                float _996 = exp2(_990);
                float _998 = 1.0 / _994;
                float _1000 = _996 + (-1.0);
                float _1002 = -_1000;
                float _1004 = fma(_1002, _998, _960);
                float _1006 = _1004 * _992;
                float _1008 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _978 = _1008;
            }
            float _1010 = _978;
            float _1012 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1016 = !_141;
            if (!_1016)
            {
                float _1018 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1020 = log2(_1018);
                float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1024 = _1022 + 1.0;
                float _1026 = 1.0 / _1024;
                float _1028 = _1020 * _960;
                float _1030 = exp2(_1028);
                float _1032 = -_1030;
                float _1034 = _1032 + 1.0;
                float _1036 = _1034 * _1026;
                _962 = _1036;
            }
            float _1038 = _962;
            float _1040 = fma(_1038, _157, _1014);
            float _1042 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1044 = fma(_1038, _155, _1012);
            float _1046 = -_419;
            float _1048 = _1046 + _1040;
            float _1050 = fma(_1038, _159, _1042);
            float _1052 = -_413;
            float _1054 = _1052 + _1044;
            float _1056 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1058 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1060 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1062 = -_421;
            float _1064 = _1062 + _1050;
            float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1056);
            float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1058);
            float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1060);
            float _1072 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1066);
            float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1068);
            float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1070);
            _481 = _1074;
            _483 = _1072;
            _485 = _1076;
            _944 = _1072;
            _950 = _1074;
            _958 = _1076;
            _219 = _1064;
        }
        float _1078 = _481;
        float _1080 = _483;
        float _1082 = _485;
        float _1084 = _944;
        float _1086 = _950;
        float _1088 = _958;
        float _1090 = _219;
        float _1092 = _1078 * _1078;
        float _1094 = rsqrt(_810);
        float _1096 = fma(_1080, _1080, _1092);
        float _1098 = fma(_1082, _1082, _1096);
        float _1100 = sqrt(_1098);
        float _1102 = _784 * _1094;
        float _1104 = _776 * _1094;
        float _1106 = _804 * _1094;
        bool _1108 = _1100 > 0.0;
        bool _1110 = !_1108;
        _928 = _1088;
        _221 = _1090;
        if (!_1110)
        {
            float _1112 = rsqrt(_1098);
            float _1114 = _1112 * _1078;
            float _1116 = _1112 * _1080;
            float _1118 = _1112 * _1082;
            float _1120 = _1104 * _1114;
            float _1122 = fma(_1102, _1116, _1120);
            float _1124 = fma(_1106, _1118, _1122);
            float _1126 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1128 = fma(_1084, _1126, _912);
            float _1130 = fma(_1086, _1126, _914);
            float _1132 = fma(_1088, _1126, _916);
            _922 = _1128;
            _924 = _1130;
            _926 = _1132;
            _221 = _1120;
        }
    }
    float _1134 = _922;
    float _1136 = _924;
    float _1138 = _926;
    float _1140 = _928;
    float _1142 = _221;
    float _1144 = _904 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1146 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1148 = isnan(0.5);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1144);
    float _1158 = _904 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1160 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1156);
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1158);
    float _1166 = _1142;
    float _1168 = _1158;
    float _1170 = _1140;
    if (_1154)
    {
        _1166 = _1134;
    }
    float _1172 = _1166;
    float _1174 = 1.0 / _1162;
    float _1176 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1164);
    float _1178 = _1176;
    float _1180 = _1172;
    if (_1154)
    {
        _1168 = _1136;
    }
    float _1182 = _1168;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1186 = _1182;
    if (_1154)
    {
        _1178 = _1138;
    }
    float _1188 = _1178;
    float _1190 = _1188;
    if (!_1154)
    {
        float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1194 = _904 + _1192;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1198 = _902 + _1196;
        float _1200 = -_904;
        float _1202 = _1200 + _1136;
        float _1204 = _1194 * _1194;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1208 = _906 + _1206;
        float _1210 = fma(_1198, _1198, _1204);
        float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1214 = fma(_1208, _1208, _1210);
        float _1216 = sqrt(_1214);
        float _1218 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1220 = _1216 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1222 = isnan(_1216);
        bool _1224 = _1220 || _1222;
        bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1228 = _1224 || _1226;
        float _1230 = precise::min(_1216, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1232 = _1230 * _1212;
        float _1234 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1236 = -_902;
        float _1238 = _1236 + _1134;
        float _1240 = -_906;
        float _1242 = _1240 + _1138;
        float _1244 = _1234 * _1232;
        float _1246 = _421;
        float _1248 = _1234;
        if (_1228)
        {
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1246 = _1250;
        }
        float _1252 = _1246;
        if (_1228)
        {
            float _1254 = precise::max(_1216, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1170 = _1254;
        }
        float _1256 = _1170;
        float _1258 = fma(_1202, _1244, _904);
        float _1260 = fma(_1242, _1244, _906);
        float _1262 = fma(_1238, _1244, _902);
        float _1264 = _1256;
        float _1266 = _1258;
        float _1268 = _1262;
        if (_1228)
        {
            float _1270 = _1256 * _1252;
            _1264 = _1270;
        }
        float _1272 = _1264;
        float _1274 = _1272;
        if (_1228)
        {
            float _1276 = _1234 * _1272;
            _1274 = _1276;
        }
        float _1278 = _1274;
        if (!_1228)
        {
            _1248 = _1258;
        }
        float _1280 = _1248;
        float _1282 = _1280;
        if (!_1228)
        {
            _1266 = _1260;
        }
        float _1284 = _1266;
        _1190 = _1284;
        if (_1228)
        {
            float _1286 = fma(_1238, _1278, _902);
            _1268 = _1286;
        }
        float _1288 = _1268;
        _1180 = _1288;
        if (_1228)
        {
            float _1290 = fma(_1202, _1278, _904);
            _1282 = _1290;
        }
        float _1292 = _1282;
        _1186 = _1292;
        if (_1228)
        {
            float _1294 = fma(_1242, _1278, _906);
            _1190 = _1294;
        }
    }
    float _1296 = _1186;
    float _1298 = _1180;
    float _1300 = _1190;
    bool _1302 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1304 = isnan(0.5);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1310 = _1306 || _1308;
    float _1312 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1314 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1316 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1318 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1312);
    float _1322 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1314);
    float _1324 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1326 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1328 = _1184 + _1162;
    float _1330 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1320);
    float _1332 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1322);
    float _1334 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1324);
    float _1336 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1326);
    float _1338 = _1328 * _1174;
    float _1340 = _1338 * 0.5;
    float _1342 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = _1300;
    if (_1310)
    {
        _1344 = 1.0;
    }
    float _1346 = _1344;
    float _1348 = _1346;
    if (!_1310)
    {
        float _1350 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1352 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1354 = _1350 * 0.15915493667125701904296875;
        float _1356 = _1352 * 0.15915493667125701904296875;
        float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1360 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1358);
        float _1362 = _1354 * 6.283185482025146484375;
        float _1364 = cos(_1362);
        float _1366 = _1354 * 6.283185482025146484375;
        float _1368 = sin(_1366);
        float _1370 = 1.0 / _1364;
        float _1372 = _1356 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        float _1376 = _1368 * _1370;
        float _1378 = _1356 * 6.283185482025146484375;
        float _1380 = sin(_1378);
        float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1384 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1382;
        float _1386 = _1374 * _1376;
        float _1388 = 1.0 / _1360;
        float _1390 = 1.0 / _1386;
        float _1392 = 1.0 / _1384;
        float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1396 = _1388 * _1394;
        float _1398 = _1380 * _1390;
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = fma(_1398, _1396, _1400);
        float _1404 = _1402 * _1392;
        float _1406 = precise::clamp(_1404, 0.0, 1.0);
        _1348 = _1406;
    }
    float _1408 = _1348;
    float _1410 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1412 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1414 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1418 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1420 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1412);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1426 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1416);
    float _1428 = _1336 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1420);
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1434 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1424);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1430);
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1432);
    bool _1442 = _1408 > 0.0;
    bool _1444 = isnan(_1408);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.0);
    bool _1450 = _1446 || _1448;
    float _1452 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1454 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1456 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1458 = _1438 + _1440;
    float _1460 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1464 = _1458 * 0.5;
    out.m_33.x = _1462;
    out.gl_Position.x = _1456;
    out.gl_Position.y = _1460;
    out.gl_Position.z = _1438;
    out.gl_Position.w = _1440;
    out.m_50.z = _1464;
    out.m_50.w = _1440;
    if (_1450)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1466 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1466;
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
    bool _503 = false;
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
        float _1523 = as_type<float>(_85);
        out.gl_Position.z = _1523;
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
    float _105 = 0.0;
    if (_99)
    {
        float _107 = float(_69);
        _105 = _107;
    }
    float _109 = _105;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    if (_115)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _79;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1591 = as_type<float>(_121);
        out.gl_Position.z = _1591;
    }
    if (_115)
    {
        return out;
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_42.w;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = _127 * _125;
    float _153 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = in.m_35.x;
    float _157 = in.m_35.y;
    float _159 = in.m_35.z;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = floor(_153);
    int _165 = as_type<int>(_129) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_129) & 2;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _173 * 6.283185482025146484375;
    float _181 = cos(_179);
    bool _183 = !_167;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = -_163;
    float _189 = _153 + _187;
    float _191 = _163;
    float _193 = _131;
    if (!_141)
    {
        float _195 = _131 * _131;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    bool _201 = !_171;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _199;
    if (!_141)
    {
        float _207 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_141;
    float _213 = _209;
    float _215 = _145;
    float _217 = _147;
    float _219 = _159;
    float _221 = _159;
    if (!_211)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _131 * _225;
        float _235 = exp2(_233);
        float _237 = _231 * 0.693147182464599609375;
        float _239 = 1.0 / _237;
        float _241 = 1.0 / _229;
        float _243 = _235 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _239, _131);
        float _249 = _247 * _241;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _251;
    }
    float _253 = _213;
    bool _255 = !_141;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _131 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _193 = _275;
    }
    float _277 = _193;
    float _279 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _285 = fma(_277, _155, _279);
    bool _287 = _189 < 0.5;
    float _289 = float(_287);
    float _291 = fma(_277, _157, _281);
    float _293 = fma(_181, 0.5, 0.5);
    float _295 = fma(_285, _143, _145);
    float _297 = fma(_277, _159, _283);
    float _299 = _295;
    if (!_141)
    {
        float _301 = _103 * _103;
        float _303 = _301 * 0.5;
        _215 = _303;
    }
    float _305 = _215;
    float _307 = -_189;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = -_289;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = fma(_291, _143, _147);
    float _321 = fma(_297, _143, _149);
    float _323 = _305;
    if (!_141)
    {
        float _325 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _323 = _325;
    }
    float _327 = _323;
    float _329 = _327;
    if (!_141)
    {
        _217 = _103;
    }
    float _331 = _217;
    bool _333 = !_177;
    int _335 = _333 ? 0 : 1;
    bool _337 = !_141;
    float _339 = _331;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = _103 * _343;
        float _353 = 1.0 / _347;
        float _355 = _349 * 0.693147182464599609375;
        float _357 = exp2(_351);
        float _359 = 1.0 / _355;
        float _361 = _357 + (-1.0);
        float _363 = -_361;
        float _365 = fma(_363, _359, _103);
        float _367 = _365 * _353;
        float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _369;
    }
    float _371 = _329;
    bool _373 = !_141;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _103 * _377;
        float _387 = exp2(_385);
        float _389 = -_387;
        float _391 = _389 + 1.0;
        float _393 = _391 * _383;
        _339 = _393;
    }
    float _395 = _339;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _403 = _401 != 0;
    float _405 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _407 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _409 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _411 = abs(_335);
    float _413 = fma(_395, _155, _405);
    bool _415 = !_399;
    int _417 = _415 ? 0 : 1;
    float _419 = fma(_395, _157, _407);
    float _421 = fma(_395, _159, _409);
    bool _423 = !_403;
    int _425 = _423 ? 0 : 1;
    float _427 = -_413;
    float _429 = _285 + _427;
    int _431 = abs(_417);
    float _433 = -_419;
    float _435 = _291 + _433;
    int _437 = abs(_425);
    float _439 = -_421;
    float _441 = _297 + _439;
    float _443 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = float(_431);
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _457 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _459 = float(_411);
    float _461 = abs(_309);
    float _463 = _451 * _461;
    float _465 = float(_437);
    float _467 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _469 = fma(_459, _317, _463);
    float _471 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _473 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    float _475 = abs(_313);
    float _477 = fma(_465, _475, _469);
    bool _479 = !_445;
    float _481 = _471;
    float _483 = _467;
    float _485 = _473;
    float _501;
    if (!_479)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _489 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_69);
        float _507 = 1.0 / _505;
        float _509 = _103 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _515 = _511 + _513;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _511 + _519;
    bool _523 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _525 = isnan(_511);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = _517 * _123;
    float _545 = 1.0 / _537;
    float _547 = -_533;
    float _549 = _547 + 1.0;
    bool _551 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_511);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = _123 > 0.5;
    float _565 = trunc(_543);
    int _567 = int(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _569;
    float _573 = _515 * _545;
    bool _575 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _577 = isnan(_511);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = _585 * _549;
    int _591 = _567 << 4;
    int _593 = _591 + 1968;
    float _595 = -_585;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _599;
    float _603 = _561 * _597;
    float _605 = fma(_571, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _607 = fma(_601, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = in.m_42.x;
    float _611 = in.m_42.y;
    float _613 = _521 * _587;
    float _615 = _605 * _603;
    float _617 = _607 * _603;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_561;
    float _625 = _623 + 1.0;
    uint _628 = uint(int(uint(_593) >> uint(2)));
    uint _630 = uint(int(uint(int(_628)) >> uint(2)));
    int _632 = int(_628) & 3;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[int(_630)][_632];
    int _636 = int(_628) + 1;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    int _640 = _636 & 3;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[int(_638)][_640];
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _648 = fma(_621, _613, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _615);
    float _652 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _617);
    float _654 = fma(_646, _613, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = in.m_37.y;
    float _658 = fma(_648, _589, _650);
    float _660 = fma(_654, _589, _652);
    float _662 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[145].x, _658);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _666 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[145].y, _660);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _674 = _672 != 0;
    float _676 = _662 * _609;
    float _678 = _666 * _611;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _684 = _477 * _676;
    float _686 = _477 * _678;
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _690 = -_185;
    int _692 = _563 ? as_type<int>(_690) : as_type<int>(_185);
    float _694 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _696 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _698 = !_670;
    float _700 = _698 ? _185 : as_type<float>(_692);
    float _702 = _680 * _694;
    float _704 = _688 * _696;
    bool _706 = _656 > 0.5;
    int _708 = _593 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    float _718 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _720 = _704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _724 = _704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _726 = -_203;
    int _728 = _706 ? as_type<int>(_726) : as_type<int>(_203);
    float _730 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _732 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[25].x, _722);
    float _734 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[26].x, _724);
    bool _736 = !_674;
    float _738 = _736 ? _203 : as_type<float>(_728);
    float _740 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[24].z, _730);
    float _742 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[25].z, _732);
    float _744 = _319 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _700 + 0.5;
    float _748 = -_738;
    float _750 = _748 + 0.5;
    float _752 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _754 = _319 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _756 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _762 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _754);
    float _764 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].z, _756);
    float _766 = _758 * _664;
    float _768 = _634 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _770 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].z, _762);
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _774 = _760 * _682;
    float _776 = _742 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _778 = _770 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _782 = _772 + _780;
    float _784 = _740 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _786 = _776 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _778 + _788;
    float _792 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[26].z, _734);
    float _794 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = fma(_784, _784, _786);
    float _798 = _790 * _790;
    out.m_44.x = _774;
    out.m_44.y = _766;
    float _800 = _319 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _802 = fma(_782, _782, _798);
    float _804 = _792 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _806 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _800);
    float _808 = sqrt(_802);
    float _810 = fma(_804, _804, _796);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _814 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _816 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _820 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _824 = sqrt(_810);
    float _826 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].z, _806);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _794;
    out.m_46.y = _816;
    out.m_46.z = _820;
    float _830 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _834 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_48.x = _830;
    out.m_48.y = _832;
    out.m_48.z = _836;
    out.m_48.w = _828;
    bool _840 = _824 > 0.0;
    float _842 = _826;
    float _844 = _832;
    float _846 = _794;
    float _848 = _816;
    float _850 = _766;
    if (!_834)
    {
        _299 = _772;
    }
    float _852 = _299;
    float _854 = _852;
    if (!_834)
    {
        _842 = _778;
    }
    float _856 = _842;
    float _858 = _856;
    if (!_834)
    {
        _844 = _838;
    }
    float _860 = _844;
    bool _862 = !_834;
    float _864 = _860;
    if (!_862)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _870 = _808 + _868;
        float _872 = _838 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = rsqrt(_802);
        float _876 = _870 * _866;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _878 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = sin(_884);
        float _888 = _882 + (-1.0);
        float _890 = _888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = fma(_886, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _894 = fma(_838, _882, _890);
        float _896 = _874 * _892;
        float _898 = fma(_782, _896, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _900 = fma(_790, _896, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _854 = _898;
        _864 = _894;
        _858 = _900;
        _846 = _874;
        _848 = _878;
    }
    float _902 = _854;
    float _904 = _864;
    float _906 = _858;
    float _908 = _846;
    float _910 = _848;
    float _912 = _784 + _902;
    float _914 = _776 + _904;
    float _916 = _804 + _906;
    bool _918 = !_840;
    float _920 = _910;
    float _922 = _912;
    float _924 = _914;
    float _926 = _916;
    float _928 = _908;
    if (!_918)
    {
        bool _930 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _932 = _908;
        if (_930)
        {
            float _934 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _932 = _934;
        }
        float _936 = _932;
        float _938 = _936;
        if (_930)
        {
            float _940 = _467 * _936;
            _850 = _940;
        }
        float _942 = _850;
        float _944 = _942;
        if (_930)
        {
            float _946 = _471 * _936;
            _920 = _946;
        }
        float _948 = _920;
        float _950 = _948;
        if (_930)
        {
            float _952 = _473 * _936;
            _938 = _952;
        }
        float _954 = _938;
        float _956 = _954;
        float _958 = _954;
        if (!_930)
        {
            float _960 = _103 + 1.0;
            float _962 = _960;
            if (!_141)
            {
                float _964 = _960 * _960;
                float _966 = _964 * 0.5;
                _956 = _966;
            }
            float _968 = _956;
            float _970 = _968;
            if (!_141)
            {
                float _972 = _968 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _970 = _972;
            }
            float _974 = _970;
            bool _976 = !_141;
            float _978 = _974;
            if (!_976)
            {
                float _980 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _982 = log2(_980);
                float _984 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _986 = _984 + 1.0;
                float _988 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _990 = _982 * _960;
                float _992 = 1.0 / _986;
                float _994 = _988 * 0.693147182464599609375;
                float _996 = exp2(_990);
                float _998 = 1.0 / _994;
                float _1000 = _996 + (-1.0);
                float _1002 = -_1000;
                float _1004 = fma(_1002, _998, _960);
                float _1006 = _1004 * _992;
                float _1008 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _978 = _1008;
            }
            float _1010 = _978;
            float _1012 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1016 = !_141;
            if (!_1016)
            {
                float _1018 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1020 = log2(_1018);
                float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1024 = _1022 + 1.0;
                float _1026 = 1.0 / _1024;
                float _1028 = _1020 * _960;
                float _1030 = exp2(_1028);
                float _1032 = -_1030;
                float _1034 = _1032 + 1.0;
                float _1036 = _1034 * _1026;
                _962 = _1036;
            }
            float _1038 = _962;
            float _1040 = fma(_1038, _157, _1014);
            float _1042 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1044 = fma(_1038, _155, _1012);
            float _1046 = -_419;
            float _1048 = _1046 + _1040;
            float _1050 = fma(_1038, _159, _1042);
            float _1052 = -_413;
            float _1054 = _1052 + _1044;
            float _1056 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1058 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1060 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1062 = -_421;
            float _1064 = _1062 + _1050;
            float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1056);
            float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1058);
            float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1060);
            float _1072 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1066);
            float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1068);
            float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1070);
            _481 = _1074;
            _483 = _1072;
            _485 = _1076;
            _944 = _1072;
            _950 = _1074;
            _958 = _1076;
            _219 = _1064;
        }
        float _1078 = _481;
        float _1080 = _483;
        float _1082 = _485;
        float _1084 = _944;
        float _1086 = _950;
        float _1088 = _958;
        float _1090 = _219;
        float _1092 = _1078 * _1078;
        float _1094 = rsqrt(_810);
        float _1096 = fma(_1080, _1080, _1092);
        float _1098 = fma(_1082, _1082, _1096);
        float _1100 = sqrt(_1098);
        float _1102 = _784 * _1094;
        float _1104 = _776 * _1094;
        float _1106 = _804 * _1094;
        bool _1108 = _1100 > 0.0;
        bool _1110 = !_1108;
        _928 = _1088;
        _221 = _1090;
        if (!_1110)
        {
            float _1112 = rsqrt(_1098);
            float _1114 = _1112 * _1078;
            float _1116 = _1112 * _1080;
            float _1118 = _1112 * _1082;
            float _1120 = _1104 * _1114;
            float _1122 = fma(_1102, _1116, _1120);
            float _1124 = fma(_1106, _1118, _1122);
            float _1126 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1128 = fma(_1084, _1126, _912);
            float _1130 = fma(_1086, _1126, _914);
            float _1132 = fma(_1088, _1126, _916);
            _922 = _1128;
            _924 = _1130;
            _926 = _1132;
            _221 = _1120;
        }
    }
    float _1134 = _922;
    float _1136 = _924;
    float _1138 = _926;
    float _1140 = _928;
    float _1142 = _221;
    float _1144 = _904 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1146 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1148 = isnan(0.5);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1144);
    float _1158 = _904 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1160 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1156);
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1158);
    float _1166 = _1142;
    float _1168 = _1158;
    float _1170 = _1140;
    if (_1154)
    {
        _1166 = _1134;
    }
    float _1172 = _1166;
    float _1174 = 1.0 / _1162;
    float _1176 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1164);
    float _1178 = _1176;
    float _1180 = _1172;
    if (_1154)
    {
        _1168 = _1136;
    }
    float _1182 = _1168;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1186 = _1182;
    if (_1154)
    {
        _1178 = _1138;
    }
    float _1188 = _1178;
    float _1190 = _1188;
    if (!_1154)
    {
        float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1194 = _904 + _1192;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1198 = _902 + _1196;
        float _1200 = -_904;
        float _1202 = _1200 + _1136;
        float _1204 = _1194 * _1194;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1208 = _906 + _1206;
        float _1210 = fma(_1198, _1198, _1204);
        float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1214 = fma(_1208, _1208, _1210);
        float _1216 = sqrt(_1214);
        float _1218 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1220 = _1216 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1222 = isnan(_1216);
        bool _1224 = _1220 || _1222;
        bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1228 = _1224 || _1226;
        float _1230 = precise::min(_1216, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1232 = _1230 * _1212;
        float _1234 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1236 = -_902;
        float _1238 = _1236 + _1134;
        float _1240 = -_906;
        float _1242 = _1240 + _1138;
        float _1244 = _1234 * _1232;
        float _1246 = _421;
        float _1248 = _1234;
        if (_1228)
        {
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1246 = _1250;
        }
        float _1252 = _1246;
        if (_1228)
        {
            float _1254 = precise::max(_1216, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1170 = _1254;
        }
        float _1256 = _1170;
        float _1258 = fma(_1202, _1244, _904);
        float _1260 = fma(_1242, _1244, _906);
        float _1262 = fma(_1238, _1244, _902);
        float _1264 = _1256;
        float _1266 = _1258;
        float _1268 = _1262;
        if (_1228)
        {
            float _1270 = _1256 * _1252;
            _1264 = _1270;
        }
        float _1272 = _1264;
        float _1274 = _1272;
        if (_1228)
        {
            float _1276 = _1234 * _1272;
            _1274 = _1276;
        }
        float _1278 = _1274;
        if (!_1228)
        {
            _1248 = _1258;
        }
        float _1280 = _1248;
        float _1282 = _1280;
        if (!_1228)
        {
            _1266 = _1260;
        }
        float _1284 = _1266;
        _1190 = _1284;
        if (_1228)
        {
            float _1286 = fma(_1238, _1278, _902);
            _1268 = _1286;
        }
        float _1288 = _1268;
        _1180 = _1288;
        if (_1228)
        {
            float _1290 = fma(_1202, _1278, _904);
            _1282 = _1290;
        }
        float _1292 = _1282;
        _1186 = _1292;
        if (_1228)
        {
            float _1294 = fma(_1242, _1278, _906);
            _1190 = _1294;
        }
    }
    float _1296 = _1186;
    float _1298 = _1180;
    float _1300 = _1190;
    bool _1302 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1304 = isnan(0.5);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1310 = _1306 || _1308;
    float _1312 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1314 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1316 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1318 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1312);
    float _1322 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1314);
    float _1324 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1326 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1328 = _1184 + _1162;
    float _1330 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1320);
    float _1332 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1322);
    float _1334 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1324);
    float _1336 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1326);
    float _1338 = _1328 * _1174;
    float _1340 = _1338 * 0.5;
    float _1342 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = _1300;
    if (_1310)
    {
        _1344 = 1.0;
    }
    float _1346 = _1344;
    float _1348 = _1346;
    if (!_1310)
    {
        float _1350 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1352 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1354 = _1350 * 0.15915493667125701904296875;
        float _1356 = _1352 * 0.15915493667125701904296875;
        float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1360 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1358);
        float _1362 = _1354 * 6.283185482025146484375;
        float _1364 = cos(_1362);
        float _1366 = _1354 * 6.283185482025146484375;
        float _1368 = sin(_1366);
        float _1370 = 1.0 / _1364;
        float _1372 = _1356 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        float _1376 = _1368 * _1370;
        float _1378 = _1356 * 6.283185482025146484375;
        float _1380 = sin(_1378);
        float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1384 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1382;
        float _1386 = _1374 * _1376;
        float _1388 = 1.0 / _1360;
        float _1390 = 1.0 / _1386;
        float _1392 = 1.0 / _1384;
        float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1396 = _1388 * _1394;
        float _1398 = _1380 * _1390;
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = fma(_1398, _1396, _1400);
        float _1404 = _1402 * _1392;
        float _1406 = precise::clamp(_1404, 0.0, 1.0);
        _1348 = _1406;
    }
    float _1408 = _1348;
    float _1410 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1412 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1414 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1418 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1420 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1412);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1426 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1416);
    float _1428 = _1336 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1420);
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1434 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1424);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1430);
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1432);
    bool _1442 = _1408 > 0.0;
    bool _1444 = isnan(_1408);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.0);
    bool _1450 = _1446 || _1448;
    float _1452 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1454 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1456 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1458 = _1438 + _1440;
    float _1460 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1464 = _1458 * 0.5;
    out.m_33.x = _1462;
    out.gl_Position.x = _1456;
    out.gl_Position.y = _1460;
    out.gl_Position.z = _1438;
    out.gl_Position.w = _1440;
    out.m_50.z = _1464;
    out.m_50.w = _1440;
    if (_1450)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1466 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1466;
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
    bool _503 = false;
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
        float _1523 = as_type<float>(_85);
        out.gl_Position.z = _1523;
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
    float _105 = 0.0;
    if (_99)
    {
        float _107 = float(_69);
        _105 = _107;
    }
    float _109 = _105;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    if (_115)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _79;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1591 = as_type<float>(_121);
        out.gl_Position.z = _1591;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_42.w;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = _127 * _125;
    float _153 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = in.m_35.x;
    float _157 = in.m_35.y;
    float _159 = in.m_35.z;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = floor(_153);
    int _165 = as_type<int>(_129) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_129) & 2;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = _173 * 6.283185482025146484375;
    float _181 = cos(_179);
    bool _183 = !_167;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = -_163;
    float _189 = _153 + _187;
    float _191 = _163;
    float _193 = _131;
    if (!_141)
    {
        float _195 = _131 * _131;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    bool _201 = !_171;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _199;
    if (!_141)
    {
        float _207 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    bool _211 = !_141;
    float _213 = _209;
    float _215 = _145;
    float _217 = _147;
    float _219 = _159;
    float _221 = _159;
    if (!_211)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _131 * _225;
        float _235 = exp2(_233);
        float _237 = _231 * 0.693147182464599609375;
        float _239 = 1.0 / _237;
        float _241 = 1.0 / _229;
        float _243 = _235 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _239, _131);
        float _249 = _247 * _241;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _251;
    }
    float _253 = _213;
    bool _255 = !_141;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _131 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _193 = _275;
    }
    float _277 = _193;
    float _279 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _285 = fma(_277, _155, _279);
    bool _287 = _189 < 0.5;
    float _289 = float(_287);
    float _291 = fma(_277, _157, _281);
    float _293 = fma(_181, 0.5, 0.5);
    float _295 = fma(_285, _143, _145);
    float _297 = fma(_277, _159, _283);
    float _299 = _295;
    if (!_141)
    {
        float _301 = _103 * _103;
        float _303 = _301 * 0.5;
        _215 = _303;
    }
    float _305 = _215;
    float _307 = -_189;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = -_289;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = fma(_291, _143, _147);
    float _321 = fma(_297, _143, _149);
    float _323 = _305;
    if (!_141)
    {
        float _325 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _323 = _325;
    }
    float _327 = _323;
    float _329 = _327;
    if (!_141)
    {
        _217 = _103;
    }
    float _331 = _217;
    bool _333 = !_177;
    int _335 = _333 ? 0 : 1;
    bool _337 = !_141;
    float _339 = _331;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = _103 * _343;
        float _353 = 1.0 / _347;
        float _355 = _349 * 0.693147182464599609375;
        float _357 = exp2(_351);
        float _359 = 1.0 / _355;
        float _361 = _357 + (-1.0);
        float _363 = -_361;
        float _365 = fma(_363, _359, _103);
        float _367 = _365 * _353;
        float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _369;
    }
    float _371 = _329;
    bool _373 = !_141;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _103 * _377;
        float _387 = exp2(_385);
        float _389 = -_387;
        float _391 = _389 + 1.0;
        float _393 = _391 * _383;
        _339 = _393;
    }
    float _395 = _339;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _403 = _401 != 0;
    float _405 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _407 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _409 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _411 = abs(_335);
    float _413 = fma(_395, _155, _405);
    bool _415 = !_399;
    int _417 = _415 ? 0 : 1;
    float _419 = fma(_395, _157, _407);
    float _421 = fma(_395, _159, _409);
    bool _423 = !_403;
    int _425 = _423 ? 0 : 1;
    float _427 = -_413;
    float _429 = _285 + _427;
    int _431 = abs(_417);
    float _433 = -_419;
    float _435 = _291 + _433;
    int _437 = abs(_425);
    float _439 = -_421;
    float _441 = _297 + _439;
    float _443 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = float(_431);
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _457 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _459 = float(_411);
    float _461 = abs(_309);
    float _463 = _451 * _461;
    float _465 = float(_437);
    float _467 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _469 = fma(_459, _317, _463);
    float _471 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _473 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    float _475 = abs(_313);
    float _477 = fma(_465, _475, _469);
    bool _479 = !_445;
    float _481 = _471;
    float _483 = _467;
    float _485 = _473;
    float _501;
    if (!_479)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _489 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_69);
        float _507 = 1.0 / _505;
        float _509 = _103 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _515 = _511 + _513;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _511 + _519;
    bool _523 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _525 = isnan(_511);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = _517 * _123;
    float _545 = 1.0 / _537;
    float _547 = -_533;
    float _549 = _547 + 1.0;
    bool _551 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_511);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = _123 > 0.5;
    float _565 = trunc(_543);
    int _567 = int(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _569;
    float _573 = _515 * _545;
    bool _575 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _577 = isnan(_511);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = _585 * _549;
    int _591 = _567 << 4;
    int _593 = _591 + 1968;
    float _595 = -_585;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _599;
    float _603 = _561 * _597;
    float _605 = fma(_571, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _607 = fma(_601, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = in.m_42.x;
    float _611 = in.m_42.y;
    float _613 = _521 * _587;
    float _615 = _605 * _603;
    float _617 = _607 * _603;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_561;
    float _625 = _623 + 1.0;
    uint _628 = uint(int(uint(_593) >> uint(2)));
    uint _630 = uint(int(uint(int(_628)) >> uint(2)));
    int _632 = int(_628) & 3;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[int(_630)][_632];
    int _636 = int(_628) + 1;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    int _640 = _636 & 3;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[int(_638)][_640];
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _648 = fma(_621, _613, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _615);
    float _652 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _617);
    float _654 = fma(_646, _613, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = in.m_37.y;
    float _658 = fma(_648, _589, _650);
    float _660 = fma(_654, _589, _652);
    float _662 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[145].x, _658);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _666 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[145].y, _660);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _674 = _672 != 0;
    float _676 = _662 * _609;
    float _678 = _666 * _611;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _684 = _477 * _676;
    float _686 = _477 * _678;
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _690 = -_185;
    int _692 = _563 ? as_type<int>(_690) : as_type<int>(_185);
    float _694 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _696 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _698 = !_670;
    float _700 = _698 ? _185 : as_type<float>(_692);
    float _702 = _680 * _694;
    float _704 = _688 * _696;
    bool _706 = _656 > 0.5;
    int _708 = _593 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    float _718 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _720 = _704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _724 = _704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _726 = -_203;
    int _728 = _706 ? as_type<int>(_726) : as_type<int>(_203);
    float _730 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _732 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[25].x, _722);
    float _734 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[26].x, _724);
    bool _736 = !_674;
    float _738 = _736 ? _203 : as_type<float>(_728);
    float _740 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[24].z, _730);
    float _742 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[25].z, _732);
    float _744 = _319 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _700 + 0.5;
    float _748 = -_738;
    float _750 = _748 + 0.5;
    float _752 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _754 = _319 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _756 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _762 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _754);
    float _764 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].z, _756);
    float _766 = _758 * _664;
    float _768 = _634 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _770 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].z, _762);
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _774 = _760 * _682;
    float _776 = _742 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _778 = _770 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _782 = _772 + _780;
    float _784 = _740 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _786 = _776 * _776;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _778 + _788;
    float _792 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[26].z, _734);
    float _794 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = fma(_784, _784, _786);
    float _798 = _790 * _790;
    out.m_44.x = _774;
    out.m_44.y = _766;
    float _800 = _319 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _802 = fma(_782, _782, _798);
    float _804 = _792 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _806 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _800);
    float _808 = sqrt(_802);
    float _810 = fma(_804, _804, _796);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _814 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _816 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _820 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _824 = sqrt(_810);
    float _826 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].z, _806);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _794;
    out.m_46.y = _816;
    out.m_46.z = _820;
    float _830 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _834 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_48.x = _830;
    out.m_48.y = _832;
    out.m_48.z = _836;
    out.m_48.w = _828;
    bool _840 = _824 > 0.0;
    float _842 = _826;
    float _844 = _832;
    float _846 = _794;
    float _848 = _816;
    float _850 = _766;
    if (!_834)
    {
        _299 = _772;
    }
    float _852 = _299;
    float _854 = _852;
    if (!_834)
    {
        _842 = _778;
    }
    float _856 = _842;
    float _858 = _856;
    if (!_834)
    {
        _844 = _838;
    }
    float _860 = _844;
    bool _862 = !_834;
    float _864 = _860;
    if (!_862)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _870 = _808 + _868;
        float _872 = _838 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = rsqrt(_802);
        float _876 = _870 * _866;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _878 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = sin(_884);
        float _888 = _882 + (-1.0);
        float _890 = _888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = fma(_886, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _894 = fma(_838, _882, _890);
        float _896 = _874 * _892;
        float _898 = fma(_782, _896, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _900 = fma(_790, _896, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _854 = _898;
        _864 = _894;
        _858 = _900;
        _846 = _874;
        _848 = _878;
    }
    float _902 = _854;
    float _904 = _864;
    float _906 = _858;
    float _908 = _846;
    float _910 = _848;
    float _912 = _784 + _902;
    float _914 = _776 + _904;
    float _916 = _804 + _906;
    bool _918 = !_840;
    float _920 = _910;
    float _922 = _912;
    float _924 = _914;
    float _926 = _916;
    float _928 = _908;
    if (!_918)
    {
        bool _930 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _932 = _908;
        if (_930)
        {
            float _934 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _932 = _934;
        }
        float _936 = _932;
        float _938 = _936;
        if (_930)
        {
            float _940 = _467 * _936;
            _850 = _940;
        }
        float _942 = _850;
        float _944 = _942;
        if (_930)
        {
            float _946 = _471 * _936;
            _920 = _946;
        }
        float _948 = _920;
        float _950 = _948;
        if (_930)
        {
            float _952 = _473 * _936;
            _938 = _952;
        }
        float _954 = _938;
        float _956 = _954;
        float _958 = _954;
        if (!_930)
        {
            float _960 = _103 + 1.0;
            float _962 = _960;
            if (!_141)
            {
                float _964 = _960 * _960;
                float _966 = _964 * 0.5;
                _956 = _966;
            }
            float _968 = _956;
            float _970 = _968;
            if (!_141)
            {
                float _972 = _968 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _970 = _972;
            }
            float _974 = _970;
            bool _976 = !_141;
            float _978 = _974;
            if (!_976)
            {
                float _980 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _982 = log2(_980);
                float _984 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _986 = _984 + 1.0;
                float _988 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _990 = _982 * _960;
                float _992 = 1.0 / _986;
                float _994 = _988 * 0.693147182464599609375;
                float _996 = exp2(_990);
                float _998 = 1.0 / _994;
                float _1000 = _996 + (-1.0);
                float _1002 = -_1000;
                float _1004 = fma(_1002, _998, _960);
                float _1006 = _1004 * _992;
                float _1008 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _978 = _1008;
            }
            float _1010 = _978;
            float _1012 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1016 = !_141;
            if (!_1016)
            {
                float _1018 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1020 = log2(_1018);
                float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1024 = _1022 + 1.0;
                float _1026 = 1.0 / _1024;
                float _1028 = _1020 * _960;
                float _1030 = exp2(_1028);
                float _1032 = -_1030;
                float _1034 = _1032 + 1.0;
                float _1036 = _1034 * _1026;
                _962 = _1036;
            }
            float _1038 = _962;
            float _1040 = fma(_1038, _157, _1014);
            float _1042 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1044 = fma(_1038, _155, _1012);
            float _1046 = -_419;
            float _1048 = _1046 + _1040;
            float _1050 = fma(_1038, _159, _1042);
            float _1052 = -_413;
            float _1054 = _1052 + _1044;
            float _1056 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1058 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1060 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1062 = -_421;
            float _1064 = _1062 + _1050;
            float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1056);
            float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1058);
            float _1070 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1060);
            float _1072 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1066);
            float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1068);
            float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1070);
            _481 = _1074;
            _483 = _1072;
            _485 = _1076;
            _944 = _1072;
            _950 = _1074;
            _958 = _1076;
            _219 = _1064;
        }
        float _1078 = _481;
        float _1080 = _483;
        float _1082 = _485;
        float _1084 = _944;
        float _1086 = _950;
        float _1088 = _958;
        float _1090 = _219;
        float _1092 = _1078 * _1078;
        float _1094 = rsqrt(_810);
        float _1096 = fma(_1080, _1080, _1092);
        float _1098 = fma(_1082, _1082, _1096);
        float _1100 = sqrt(_1098);
        float _1102 = _784 * _1094;
        float _1104 = _776 * _1094;
        float _1106 = _804 * _1094;
        bool _1108 = _1100 > 0.0;
        bool _1110 = !_1108;
        _928 = _1088;
        _221 = _1090;
        if (!_1110)
        {
            float _1112 = rsqrt(_1098);
            float _1114 = _1112 * _1078;
            float _1116 = _1112 * _1080;
            float _1118 = _1112 * _1082;
            float _1120 = _1104 * _1114;
            float _1122 = fma(_1102, _1116, _1120);
            float _1124 = fma(_1106, _1118, _1122);
            float _1126 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1128 = fma(_1084, _1126, _912);
            float _1130 = fma(_1086, _1126, _914);
            float _1132 = fma(_1088, _1126, _916);
            _922 = _1128;
            _924 = _1130;
            _926 = _1132;
            _221 = _1120;
        }
    }
    float _1134 = _922;
    float _1136 = _924;
    float _1138 = _926;
    float _1140 = _928;
    float _1142 = _221;
    float _1144 = _904 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1146 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1148 = isnan(0.5);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1144);
    float _1158 = _904 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1160 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1156);
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1158);
    float _1166 = _1142;
    float _1168 = _1158;
    float _1170 = _1140;
    if (_1154)
    {
        _1166 = _1134;
    }
    float _1172 = _1166;
    float _1174 = 1.0 / _1162;
    float _1176 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1164);
    float _1178 = _1176;
    float _1180 = _1172;
    if (_1154)
    {
        _1168 = _1136;
    }
    float _1182 = _1168;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1186 = _1182;
    if (_1154)
    {
        _1178 = _1138;
    }
    float _1188 = _1178;
    float _1190 = _1188;
    if (!_1154)
    {
        float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1194 = _904 + _1192;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1198 = _902 + _1196;
        float _1200 = -_904;
        float _1202 = _1200 + _1136;
        float _1204 = _1194 * _1194;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1208 = _906 + _1206;
        float _1210 = fma(_1198, _1198, _1204);
        float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1214 = fma(_1208, _1208, _1210);
        float _1216 = sqrt(_1214);
        float _1218 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1220 = _1216 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1222 = isnan(_1216);
        bool _1224 = _1220 || _1222;
        bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1228 = _1224 || _1226;
        float _1230 = precise::min(_1216, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1232 = _1230 * _1212;
        float _1234 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1236 = -_902;
        float _1238 = _1236 + _1134;
        float _1240 = -_906;
        float _1242 = _1240 + _1138;
        float _1244 = _1234 * _1232;
        float _1246 = _421;
        float _1248 = _1234;
        if (_1228)
        {
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1246 = _1250;
        }
        float _1252 = _1246;
        if (_1228)
        {
            float _1254 = precise::max(_1216, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1170 = _1254;
        }
        float _1256 = _1170;
        float _1258 = fma(_1202, _1244, _904);
        float _1260 = fma(_1242, _1244, _906);
        float _1262 = fma(_1238, _1244, _902);
        float _1264 = _1256;
        float _1266 = _1258;
        float _1268 = _1262;
        if (_1228)
        {
            float _1270 = _1256 * _1252;
            _1264 = _1270;
        }
        float _1272 = _1264;
        float _1274 = _1272;
        if (_1228)
        {
            float _1276 = _1234 * _1272;
            _1274 = _1276;
        }
        float _1278 = _1274;
        if (!_1228)
        {
            _1248 = _1258;
        }
        float _1280 = _1248;
        float _1282 = _1280;
        if (!_1228)
        {
            _1266 = _1260;
        }
        float _1284 = _1266;
        _1190 = _1284;
        if (_1228)
        {
            float _1286 = fma(_1238, _1278, _902);
            _1268 = _1286;
        }
        float _1288 = _1268;
        _1180 = _1288;
        if (_1228)
        {
            float _1290 = fma(_1202, _1278, _904);
            _1282 = _1290;
        }
        float _1292 = _1282;
        _1186 = _1292;
        if (_1228)
        {
            float _1294 = fma(_1242, _1278, _906);
            _1190 = _1294;
        }
    }
    float _1296 = _1186;
    float _1298 = _1180;
    float _1300 = _1190;
    bool _1302 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1304 = isnan(0.5);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1310 = _1306 || _1308;
    float _1312 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1314 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1316 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1318 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1312);
    float _1322 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1314);
    float _1324 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1326 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1328 = _1184 + _1162;
    float _1330 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1320);
    float _1332 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1322);
    float _1334 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1324);
    float _1336 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1326);
    float _1338 = _1328 * _1174;
    float _1340 = _1338 * 0.5;
    float _1342 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = _1300;
    if (_1310)
    {
        _1344 = 1.0;
    }
    float _1346 = _1344;
    float _1348 = _1346;
    if (!_1310)
    {
        float _1350 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1352 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1354 = _1350 * 0.15915493667125701904296875;
        float _1356 = _1352 * 0.15915493667125701904296875;
        float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1360 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1358);
        float _1362 = _1354 * 6.283185482025146484375;
        float _1364 = cos(_1362);
        float _1366 = _1354 * 6.283185482025146484375;
        float _1368 = sin(_1366);
        float _1370 = 1.0 / _1364;
        float _1372 = _1356 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        float _1376 = _1368 * _1370;
        float _1378 = _1356 * 6.283185482025146484375;
        float _1380 = sin(_1378);
        float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1384 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1382;
        float _1386 = _1374 * _1376;
        float _1388 = 1.0 / _1360;
        float _1390 = 1.0 / _1386;
        float _1392 = 1.0 / _1384;
        float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1396 = _1388 * _1394;
        float _1398 = _1380 * _1390;
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = fma(_1398, _1396, _1400);
        float _1404 = _1402 * _1392;
        float _1406 = precise::clamp(_1404, 0.0, 1.0);
        _1348 = _1406;
    }
    float _1408 = _1348;
    float _1410 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1412 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1414 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1418 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1420 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1412);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1426 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1416);
    float _1428 = _1336 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1420);
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1434 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1424);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1430);
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1432);
    bool _1442 = _1408 > 0.0;
    bool _1444 = isnan(_1408);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.0);
    bool _1450 = _1446 || _1448;
    float _1452 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1454 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1456 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1458 = _1438 + _1440;
    float _1460 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1452);
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1464 = _1458 * 0.5;
    out.m_33.x = _1462;
    out.gl_Position.x = _1456;
    out.gl_Position.y = _1460;
    out.gl_Position.z = _1438;
    out.gl_Position.w = _1440;
    out.m_50.z = _1464;
    out.m_50.w = _1440;
    if (_1450)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1466 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1466;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

