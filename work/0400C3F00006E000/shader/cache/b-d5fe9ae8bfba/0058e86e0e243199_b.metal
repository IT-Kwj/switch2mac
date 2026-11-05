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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(1)]];
    float4 m_41 [[attribute(2)]];
    float4 m_45 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_50 [[attribute(7)]];
    float4 m_39 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _844 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    float _85 = as_type<float>(_77);
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _83;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _87 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1226 = as_type<float>(_93);
        out.gl_Position.z = _1226;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _85 = _113;
    }
    float _115 = _85;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1295 = as_type<float>(_129);
        out.gl_Position.z = _1295;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_39.w;
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_41.x;
    float _147 = in.m_41.y;
    float _149 = in.m_41.z;
    float _151 = in.m_43.x;
    float _153 = in.m_43.y;
    float _155 = in.m_43.z;
    float _157 = in.m_45.x;
    float _159 = in.m_45.y;
    float _161 = in.m_45.z;
    float _163 = in.m_37.x;
    float _165 = in.m_37.y;
    float _167 = in.m_37.z;
    float _169 = 0.0;
    float _171 = _133;
    if (!_143)
    {
        float _173 = _133 * _133;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = in.m_32.x;
    float _181 = in.m_32.y;
    float _183 = in.m_32.z;
    float _185 = _177;
    if (!_143)
    {
        float _187 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_143;
    float _193 = _189;
    float _195 = _147;
    float _197 = _149;
    if (!_191)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _133 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _133);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _227;
    }
    float _229 = _193;
    bool _231 = !_143;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _133 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _171 = _251;
    }
    float _253 = _171;
    float _255 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = in.m_41.w;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_253, _165, _255);
    float _263 = in.m_43.w;
    float _265 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = fma(_253, _167, _259);
    float _269 = fma(_261, _131, _181);
    float _271 = in.m_45.w;
    float _273 = fma(_253, _163, _265);
    float _275 = fma(_267, _131, _183);
    float _277 = _269 * _147;
    float _279 = _269 * _153;
    float _281 = fma(_273, _131, _179);
    float _283 = _269 * _159;
    float _285 = in.m_39.x;
    float _287 = fma(_281, _145, _277);
    float _289 = fma(_281, _151, _279);
    float _291 = fma(_281, _157, _283);
    float _293 = _145 * _145;
    float _295 = fma(_275, _149, _287);
    float _297 = fma(_275, _155, _289);
    float _299 = fma(_275, _161, _291);
    float _301 = _149 * _149;
    float _303 = _295 + _257;
    float _305 = fma(_151, _151, _293);
    float _307 = as_type<float>(int(gl_VertexIndex));
    float _309 = _297 + _263;
    float _311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _313 = _303 + _311;
    float _315 = fma(_157, _157, _305);
    float _317 = fma(_155, _155, _301);
    float _319 = _299 + _271;
    float _321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _323 = _309 + _321;
    float _325 = _313 * _313;
    float _327 = sqrt(_315);
    float _329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _331 = _319 + _329;
    float _333 = fma(_161, _161, _317);
    float _335 = fma(_323, _323, _325);
    float _337 = _147 * _147;
    float _339 = _285 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = in.m_39.y;
    float _343 = fma(_331, _331, _335);
    float _345 = fma(_153, _153, _337);
    float _347 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _349 = rsqrt(_343);
    float _351 = fma(_159, _159, _345);
    float _353 = _347 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _355 = _327 > 0.0;
    float _357 = sqrt(_351);
    float _359 = _353 * _349;
    float _361 = sqrt(_333);
    float _363 = _313 * _359;
    float _365 = _323 * _359;
    float _367 = _331 * _359;
    float _369 = -_363;
    float _371 = _313 + _369;
    bool _373 = _357 > 0.0;
    float _375 = -_365;
    float _377 = _323 + _375;
    float _379 = -_367;
    float _381 = _331 + _379;
    float _383 = _371 * _371;
    float _385 = _315;
    float _387 = _371;
    float _389 = _381;
    float _391 = _269;
    float _393 = _377;
    if (_355)
    {
        float _395 = rsqrt(_315);
        _385 = _395;
    }
    float _397 = _385;
    float _399 = fma(_377, _377, _383);
    bool _401 = _361 > 0.0;
    float _403 = fma(_381, _381, _399);
    int _405 = as_type<int>(_307) & 1;
    bool _407 = _405 != 0;
    int _409 = as_type<int>(_307) & 2;
    bool _411 = _409 != 0;
    float _413 = in.m_50.x;
    float _415 = _351;
    float _417 = _403;
    if (_373)
    {
        float _419 = rsqrt(_351);
        _415 = _419;
    }
    float _421 = _415;
    if (!_373)
    {
        _387 = 0.0;
    }
    float _423 = _387;
    float _425 = _423;
    if (!_355)
    {
        _389 = 0.0;
        _391 = 0.0;
    }
    float _427 = _389;
    float _429 = _391;
    float _431 = _427;
    float _433 = _429;
    if (!_373)
    {
        _393 = 0.0;
    }
    float _435 = _393;
    float _437 = _435;
    if (_355)
    {
        float _439 = _397 * _151;
        _431 = _439;
    }
    float _441 = _431;
    if (_355)
    {
        float _443 = _397 * _157;
        _433 = _443;
    }
    float _445 = _433;
    float _447 = sqrt(_403);
    bool _449 = !_407;
    float _451 = _449 ? (-0.5) : 0.5;
    float _453 = _341 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _457 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _451);
    float _459 = _333;
    float _461 = _455;
    if (_401)
    {
        float _463 = rsqrt(_333);
        _459 = _463;
    }
    float _465 = _459;
    float _467 = _421;
    if (_373)
    {
        float _469 = _421 * _153;
        _425 = _469;
    }
    float _471 = _425;
    float _473 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    if (_373)
    {
        float _475 = _421 * _159;
        _437 = _475;
    }
    float _477 = _437;
    if (!_401)
    {
        _417 = 0.0;
    }
    float _479 = _417;
    float _481 = _473 * _413;
    float _483 = _349 * _447;
    bool _485 = !_411;
    float _487 = _485 ? (-0.5) : 0.5;
    bool _489 = _413 > 0.5;
    float _491 = _347 * _483;
    float _493 = trunc(_481);
    int _495 = int(_493);
    float _497 = _483 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _499 = _497 * 0.5;
    float _501 = _479;
    if (_401)
    {
        float _503 = _465 * _155;
        _501 = _503;
    }
    float _505 = _501;
    float _507 = _455 * _483;
    float _509 = _491 * _457;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _487);
    float _513 = _499 * _471;
    float _515 = _499 * _477;
    float _517 = _507;
    float _519 = _505;
    if (!_401)
    {
        _461 = 0.0;
    }
    float _521 = _461;
    float _523 = _521;
    if (_401)
    {
        float _525 = _465 * _161;
        _523 = _525;
    }
    float _527 = _523;
    float _529 = _507 * _511;
    float _531 = fma(_509, _441, _513);
    float _533 = fma(_509, _445, _515);
    if (!_373)
    {
        _517 = 0.0;
    }
    float _535 = _517;
    float _537 = in.m_50.y;
    float _539 = -_529;
    float _541 = fma(_539, _505, _531);
    float _543 = -_529;
    float _545 = fma(_543, _527, _533);
    int _547 = _495 << 4;
    int _549 = _547 + 1968;
    float _551 = _535;
    if (_373)
    {
        float _553 = _421 * _147;
        _551 = _553;
    }
    float _555 = _551;
    float _557 = _309 + _541;
    float _559 = _319 + _545;
    int _561 = _549 + 8;
    uint _564 = uint(int(uint(_561) >> uint(2)));
    uint _566 = uint(int(uint(int(_564)) >> uint(2)));
    int _568 = int(_564) & 3;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[int(_566)][_568];
    float _572 = _555;
    if (!_355)
    {
        _519 = 0.0;
    }
    float _574 = _519;
    float _576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _578 = _557 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _582 = _559 + _580;
    float _584 = _574;
    if (_355)
    {
        float _586 = _397 * _145;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _499 * _555;
    float _592 = _578 * _578;
    float _594 = _582 * _582;
    uint _596 = uint(int(uint(_549) >> uint(2)));
    uint _598 = uint(int(uint(int(_596)) >> uint(2)));
    int _600 = int(_596) & 3;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[int(_598)][_600];
    int _604 = int(_596) + 1;
    uint _606 = uint(int(uint(_604) >> uint(2)));
    int _608 = _604 & 3;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[int(_606)][_608];
    if (!_401)
    {
        _195 = 0.0;
    }
    float _612 = _195;
    float _614 = _612;
    if (_401)
    {
        float _616 = _465 * _149;
        _614 = _616;
    }
    float _618 = _614;
    float _620 = _592 + _594;
    float _622 = fma(_509, _588, _590);
    float _624 = sqrt(_620);
    float _626 = -_529;
    float _628 = fma(_626, _618, _622);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _636 = _634 != 0;
    float _638 = _303 + _628;
    bool _640 = _537 > 0.5;
    bool _642 = _624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _618;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_642)
    {
        _467 = _594;
    }
    float _648 = _467;
    float _650 = _648;
    if (!_642)
    {
        _572 = _592;
    }
    float _652 = _572;
    float _654 = _652;
    if (!_642)
    {
        _644 = _557;
    }
    float _656 = _644;
    float _658 = _656;
    if (!_642)
    {
        _646 = _559;
    }
    float _660 = _646;
    float _662 = _660;
    if (!_642)
    {
        _197 = _638;
    }
    float _664 = _197;
    bool _666 = !_642;
    float _668 = _664;
    if (!_666)
    {
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _674 = _624 + _672;
        float _676 = _638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = rsqrt(_620);
        float _680 = _674 * _670;
        float _682 = _680 * 0.15915493667125701904296875;
        float _684 = _682 * 6.283185482025146484375;
        float _686 = sin(_684);
        float _688 = _682 * 6.283185482025146484375;
        float _690 = cos(_688);
        float _692 = fma(_686, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _694 = _678 * _692;
        float _696 = _690 + (-1.0);
        float _698 = fma(_578, _694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _700 = fma(_582, _694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _702 = _696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _706 = _698 + _704;
        float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _710 = _700 + _708;
        float _712 = fma(_638, _690, _702);
        float _714 = _706 * _706;
        float _716 = _710 * _710;
        _668 = _712;
        _654 = _714;
        _650 = _716;
        _658 = _698;
        _662 = _700;
    }
    float _718 = _668;
    float _720 = _654;
    float _722 = _650;
    float _724 = _658;
    float _726 = _662;
    float _728 = -_451;
    int _730 = _489 ? as_type<int>(_728) : as_type<int>(_451);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _736 = _718 + _734;
    float _738 = -_487;
    int _740 = _640 ? as_type<int>(_738) : as_type<int>(_487);
    float _742 = _602 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _744 = !_632;
    float _746 = _744 ? _451 : as_type<float>(_730);
    float _748 = fma(_736, _736, _720);
    bool _750 = !_636;
    float _752 = _750 ? _487 : as_type<float>(_740);
    float _754 = _610 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _758 = _746 + 0.5;
    float _760 = _748 + _722;
    float _762 = -_752;
    float _764 = _762 + 0.5;
    float _766 = _758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _768 = _570 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _770 = _766 * _732;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _780 = sqrt(_760);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _784 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _778 * _756;
    out.m_52.x = _790;
    out.m_52.y = _784;
    out.m_52.z = _786;
    out.m_52.w = _776;
    out.m_54.x = _788;
    out.m_54.y = _792;
    out.m_54.z = _794;
    bool _798 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _800 = isnan(_780);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _806 = _802 || _804;
    out.m_56.x = _770;
    out.m_56.y = _796;
    float _808 = _760;
    if (!_806)
    {
        _808 = 1.0;
    }
    float _810 = _808;
    bool _812 = !_806;
    float _814 = _810;
    if (!_812)
    {
        bool _816 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _818 = isnan(_780);
        bool _820 = _816 || _818;
        bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _824 = _820 || _822;
        if (!_824)
        {
            float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _828 = _780 + _826;
            float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _832 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _830;
            float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _838 = 1.0 / _832;
            float _840 = _828 * _838;
            float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _814 = _842;
            _844 = true;
        }
        else
        {
            bool _846 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _848 = isnan(_780);
            bool _850 = _846 || _848;
            bool _852 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _854 = _850 || _852;
            if (!_854)
            {
                float _856 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _858 = _780 + _856;
                float _860 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _862 = _860 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _864 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _866 = _864 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _868 = 1.0 / _862;
                float _870 = _858 * _868;
                float _872 = fma(_870, _866, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _814 = _872;
                _844 = true;
            }
            else
            {
                _814 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _844 = false;
    float _874 = _814;
    float _876 = -_363;
    float _878 = _303 + _876;
    float _880 = -_365;
    float _882 = _309 + _880;
    float _884 = -_367;
    float _886 = _319 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _890 = _724 + _888;
    float _892 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _894 = fma(_890, _874, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _896 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _892);
    float _898 = -_365;
    float _900 = _898 + _894;
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[11].z, _896);
    float _904 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _906 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _908 = _718 + _906;
    float _910 = _902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _912 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _904);
    float _914 = fma(_908, _874, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _918 = _726 + _916;
    float _920 = 1.0 / _910;
    float _922 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[10].z, _912);
    float _924 = -_363;
    float _926 = _924 + _914;
    float _928 = fma(_918, _874, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _930 = _922 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _932 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = -_367;
    float _936 = _934 + _928;
    bool _938 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _940 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.5);
    bool _946 = _942 || _944;
    float _948 = _930 + _910;
    float _950 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _952 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _954 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].x, _950);
    float _958 = _948 * _920;
    float _960 = _958 * 0.5;
    float _962 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _966 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _956);
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _970 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[30].w, _968);
    float _972 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _976 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _964);
    float _978 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _980 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _982 = 1.0 / _970;
    float _984 = _974 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _988 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _980);
    float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _992 = _974 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _994 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _984);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _986);
    float _998 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _990);
    float _1000 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _992);
    float _1002 = _984;
    float _1004 = _978;
    if (_946)
    {
        _1002 = 1.0;
    }
    float _1006 = _1002;
    float _1008 = _988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1010 = _1006;
    if (_946)
    {
        _1004 = 1.0;
    }
    float _1012 = _1004;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1016 = _982 * _1014;
    float _1018 = _1012;
    if (!_946)
    {
        float _1020 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1022 = _1020 * 0.15915493667125701904296875;
        float _1024 = _1022 * 6.283185482025146484375;
        float _1026 = cos(_1024);
        float _1028 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1022 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = 1.0 / _1026;
        float _1038 = _1030 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = _1034 * _1036;
        float _1044 = _1030 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1050 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1048;
        float _1052 = _1040 * _1042;
        float _1054 = 1.0 / _1050;
        float _1056 = 1.0 / _1052;
        float _1058 = _1046 * _1056;
        float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1062 = fma(_1016, _1058, _1060);
        float _1064 = _1062 * _1054;
        float _1066 = precise::clamp(_1064, 0.0, 1.0);
        _1010 = _1066;
    }
    float _1068 = _1010;
    if (!_946)
    {
        float _1070 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1080 = _1078 * 0.15915493667125701904296875;
        float _1082 = _1072 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = 1.0 / _1076;
        float _1088 = _1080 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1084 * _1086;
        float _1094 = _1080 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * _1092;
        float _1100 = 1.0 / _1098;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1104 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1102;
        float _1106 = 1.0 / _1104;
        float _1108 = _1096 * _1100;
        float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1112 = fma(_1016, _1108, _1110);
        float _1114 = _1112 * _1106;
        float _1116 = precise::clamp(_1114, 0.0, 1.0);
        float _1118 = -_1116;
        float _1120 = _1118 + 1.0;
        _1018 = _1120;
    }
    float _1122 = _1018;
    float _1124 = _976 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1126 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].z, _996);
    float _1128 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    bool _1130 = _1068 > 0.0;
    bool _1132 = isnan(_1068);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].z, _994);
    float _1142 = _1068 * _1122;
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1126);
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1128);
    bool _1148 = _1122 <= 0.0;
    bool _1150 = !_1138;
    bool _1152 = _1148 || _1150;
    float _1154 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1140);
    float _1156 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].z, _998);
    float _1158 = _1144 + _1146;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1162 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1156);
    float _1164 = _1158 * 0.5;
    float _1166 = _1160 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1154;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1144;
    out.gl_Position.w = _1146;
    out.m_58.z = _1164;
    out.m_58.w = _1146;
    out.m_35.x = _1166;
    if (!_1152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1168 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1168;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _844 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    float _85 = as_type<float>(_77);
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _83;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _87 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1226 = as_type<float>(_93);
        out.gl_Position.z = _1226;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _85 = _113;
    }
    float _115 = _85;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1295 = as_type<float>(_129);
        out.gl_Position.z = _1295;
    }
    if (_121)
    {
        return out;
    }
    float _131 = in.m_39.w;
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_41.x;
    float _147 = in.m_41.y;
    float _149 = in.m_41.z;
    float _151 = in.m_43.x;
    float _153 = in.m_43.y;
    float _155 = in.m_43.z;
    float _157 = in.m_45.x;
    float _159 = in.m_45.y;
    float _161 = in.m_45.z;
    float _163 = in.m_37.x;
    float _165 = in.m_37.y;
    float _167 = in.m_37.z;
    float _169 = 0.0;
    float _171 = _133;
    if (!_143)
    {
        float _173 = _133 * _133;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = in.m_32.x;
    float _181 = in.m_32.y;
    float _183 = in.m_32.z;
    float _185 = _177;
    if (!_143)
    {
        float _187 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_143;
    float _193 = _189;
    float _195 = _147;
    float _197 = _149;
    if (!_191)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _133 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _133);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _227;
    }
    float _229 = _193;
    bool _231 = !_143;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _133 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _171 = _251;
    }
    float _253 = _171;
    float _255 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = in.m_41.w;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_253, _165, _255);
    float _263 = in.m_43.w;
    float _265 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = fma(_253, _167, _259);
    float _269 = fma(_261, _131, _181);
    float _271 = in.m_45.w;
    float _273 = fma(_253, _163, _265);
    float _275 = fma(_267, _131, _183);
    float _277 = _269 * _147;
    float _279 = _269 * _153;
    float _281 = fma(_273, _131, _179);
    float _283 = _269 * _159;
    float _285 = in.m_39.x;
    float _287 = fma(_281, _145, _277);
    float _289 = fma(_281, _151, _279);
    float _291 = fma(_281, _157, _283);
    float _293 = _145 * _145;
    float _295 = fma(_275, _149, _287);
    float _297 = fma(_275, _155, _289);
    float _299 = fma(_275, _161, _291);
    float _301 = _149 * _149;
    float _303 = _295 + _257;
    float _305 = fma(_151, _151, _293);
    float _307 = as_type<float>(int(gl_VertexIndex));
    float _309 = _297 + _263;
    float _311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _313 = _303 + _311;
    float _315 = fma(_157, _157, _305);
    float _317 = fma(_155, _155, _301);
    float _319 = _299 + _271;
    float _321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _323 = _309 + _321;
    float _325 = _313 * _313;
    float _327 = sqrt(_315);
    float _329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _331 = _319 + _329;
    float _333 = fma(_161, _161, _317);
    float _335 = fma(_323, _323, _325);
    float _337 = _147 * _147;
    float _339 = _285 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = in.m_39.y;
    float _343 = fma(_331, _331, _335);
    float _345 = fma(_153, _153, _337);
    float _347 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _349 = rsqrt(_343);
    float _351 = fma(_159, _159, _345);
    float _353 = _347 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _355 = _327 > 0.0;
    float _357 = sqrt(_351);
    float _359 = _353 * _349;
    float _361 = sqrt(_333);
    float _363 = _313 * _359;
    float _365 = _323 * _359;
    float _367 = _331 * _359;
    float _369 = -_363;
    float _371 = _313 + _369;
    bool _373 = _357 > 0.0;
    float _375 = -_365;
    float _377 = _323 + _375;
    float _379 = -_367;
    float _381 = _331 + _379;
    float _383 = _371 * _371;
    float _385 = _315;
    float _387 = _371;
    float _389 = _381;
    float _391 = _269;
    float _393 = _377;
    if (_355)
    {
        float _395 = rsqrt(_315);
        _385 = _395;
    }
    float _397 = _385;
    float _399 = fma(_377, _377, _383);
    bool _401 = _361 > 0.0;
    float _403 = fma(_381, _381, _399);
    int _405 = as_type<int>(_307) & 1;
    bool _407 = _405 != 0;
    int _409 = as_type<int>(_307) & 2;
    bool _411 = _409 != 0;
    float _413 = in.m_50.x;
    float _415 = _351;
    float _417 = _403;
    if (_373)
    {
        float _419 = rsqrt(_351);
        _415 = _419;
    }
    float _421 = _415;
    if (!_373)
    {
        _387 = 0.0;
    }
    float _423 = _387;
    float _425 = _423;
    if (!_355)
    {
        _389 = 0.0;
        _391 = 0.0;
    }
    float _427 = _389;
    float _429 = _391;
    float _431 = _427;
    float _433 = _429;
    if (!_373)
    {
        _393 = 0.0;
    }
    float _435 = _393;
    float _437 = _435;
    if (_355)
    {
        float _439 = _397 * _151;
        _431 = _439;
    }
    float _441 = _431;
    if (_355)
    {
        float _443 = _397 * _157;
        _433 = _443;
    }
    float _445 = _433;
    float _447 = sqrt(_403);
    bool _449 = !_407;
    float _451 = _449 ? (-0.5) : 0.5;
    float _453 = _341 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _457 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _451);
    float _459 = _333;
    float _461 = _455;
    if (_401)
    {
        float _463 = rsqrt(_333);
        _459 = _463;
    }
    float _465 = _459;
    float _467 = _421;
    if (_373)
    {
        float _469 = _421 * _153;
        _425 = _469;
    }
    float _471 = _425;
    float _473 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    if (_373)
    {
        float _475 = _421 * _159;
        _437 = _475;
    }
    float _477 = _437;
    if (!_401)
    {
        _417 = 0.0;
    }
    float _479 = _417;
    float _481 = _473 * _413;
    float _483 = _349 * _447;
    bool _485 = !_411;
    float _487 = _485 ? (-0.5) : 0.5;
    bool _489 = _413 > 0.5;
    float _491 = _347 * _483;
    float _493 = trunc(_481);
    int _495 = int(_493);
    float _497 = _483 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _499 = _497 * 0.5;
    float _501 = _479;
    if (_401)
    {
        float _503 = _465 * _155;
        _501 = _503;
    }
    float _505 = _501;
    float _507 = _455 * _483;
    float _509 = _491 * _457;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _487);
    float _513 = _499 * _471;
    float _515 = _499 * _477;
    float _517 = _507;
    float _519 = _505;
    if (!_401)
    {
        _461 = 0.0;
    }
    float _521 = _461;
    float _523 = _521;
    if (_401)
    {
        float _525 = _465 * _161;
        _523 = _525;
    }
    float _527 = _523;
    float _529 = _507 * _511;
    float _531 = fma(_509, _441, _513);
    float _533 = fma(_509, _445, _515);
    if (!_373)
    {
        _517 = 0.0;
    }
    float _535 = _517;
    float _537 = in.m_50.y;
    float _539 = -_529;
    float _541 = fma(_539, _505, _531);
    float _543 = -_529;
    float _545 = fma(_543, _527, _533);
    int _547 = _495 << 4;
    int _549 = _547 + 1968;
    float _551 = _535;
    if (_373)
    {
        float _553 = _421 * _147;
        _551 = _553;
    }
    float _555 = _551;
    float _557 = _309 + _541;
    float _559 = _319 + _545;
    int _561 = _549 + 8;
    uint _564 = uint(int(uint(_561) >> uint(2)));
    uint _566 = uint(int(uint(int(_564)) >> uint(2)));
    int _568 = int(_564) & 3;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[int(_566)][_568];
    float _572 = _555;
    if (!_355)
    {
        _519 = 0.0;
    }
    float _574 = _519;
    float _576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _578 = _557 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _582 = _559 + _580;
    float _584 = _574;
    if (_355)
    {
        float _586 = _397 * _145;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _499 * _555;
    float _592 = _578 * _578;
    float _594 = _582 * _582;
    uint _596 = uint(int(uint(_549) >> uint(2)));
    uint _598 = uint(int(uint(int(_596)) >> uint(2)));
    int _600 = int(_596) & 3;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[int(_598)][_600];
    int _604 = int(_596) + 1;
    uint _606 = uint(int(uint(_604) >> uint(2)));
    int _608 = _604 & 3;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[int(_606)][_608];
    if (!_401)
    {
        _195 = 0.0;
    }
    float _612 = _195;
    float _614 = _612;
    if (_401)
    {
        float _616 = _465 * _149;
        _614 = _616;
    }
    float _618 = _614;
    float _620 = _592 + _594;
    float _622 = fma(_509, _588, _590);
    float _624 = sqrt(_620);
    float _626 = -_529;
    float _628 = fma(_626, _618, _622);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _636 = _634 != 0;
    float _638 = _303 + _628;
    bool _640 = _537 > 0.5;
    bool _642 = _624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _618;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_642)
    {
        _467 = _594;
    }
    float _648 = _467;
    float _650 = _648;
    if (!_642)
    {
        _572 = _592;
    }
    float _652 = _572;
    float _654 = _652;
    if (!_642)
    {
        _644 = _557;
    }
    float _656 = _644;
    float _658 = _656;
    if (!_642)
    {
        _646 = _559;
    }
    float _660 = _646;
    float _662 = _660;
    if (!_642)
    {
        _197 = _638;
    }
    float _664 = _197;
    bool _666 = !_642;
    float _668 = _664;
    if (!_666)
    {
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _674 = _624 + _672;
        float _676 = _638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = rsqrt(_620);
        float _680 = _674 * _670;
        float _682 = _680 * 0.15915493667125701904296875;
        float _684 = _682 * 6.283185482025146484375;
        float _686 = sin(_684);
        float _688 = _682 * 6.283185482025146484375;
        float _690 = cos(_688);
        float _692 = fma(_686, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _694 = _678 * _692;
        float _696 = _690 + (-1.0);
        float _698 = fma(_578, _694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _700 = fma(_582, _694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _702 = _696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _706 = _698 + _704;
        float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _710 = _700 + _708;
        float _712 = fma(_638, _690, _702);
        float _714 = _706 * _706;
        float _716 = _710 * _710;
        _668 = _712;
        _654 = _714;
        _650 = _716;
        _658 = _698;
        _662 = _700;
    }
    float _718 = _668;
    float _720 = _654;
    float _722 = _650;
    float _724 = _658;
    float _726 = _662;
    float _728 = -_451;
    int _730 = _489 ? as_type<int>(_728) : as_type<int>(_451);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _736 = _718 + _734;
    float _738 = -_487;
    int _740 = _640 ? as_type<int>(_738) : as_type<int>(_487);
    float _742 = _602 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _744 = !_632;
    float _746 = _744 ? _451 : as_type<float>(_730);
    float _748 = fma(_736, _736, _720);
    bool _750 = !_636;
    float _752 = _750 ? _487 : as_type<float>(_740);
    float _754 = _610 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _758 = _746 + 0.5;
    float _760 = _748 + _722;
    float _762 = -_752;
    float _764 = _762 + 0.5;
    float _766 = _758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _768 = _570 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _770 = _766 * _732;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _780 = sqrt(_760);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _784 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _778 * _756;
    out.m_52.x = _790;
    out.m_52.y = _784;
    out.m_52.z = _786;
    out.m_52.w = _776;
    out.m_54.x = _788;
    out.m_54.y = _792;
    out.m_54.z = _794;
    bool _798 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _800 = isnan(_780);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _806 = _802 || _804;
    out.m_56.x = _770;
    out.m_56.y = _796;
    float _808 = _760;
    if (!_806)
    {
        _808 = 1.0;
    }
    float _810 = _808;
    bool _812 = !_806;
    float _814 = _810;
    if (!_812)
    {
        bool _816 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _818 = isnan(_780);
        bool _820 = _816 || _818;
        bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _824 = _820 || _822;
        if (!_824)
        {
            float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _828 = _780 + _826;
            float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _832 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _830;
            float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _838 = 1.0 / _832;
            float _840 = _828 * _838;
            float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _814 = _842;
            _844 = true;
        }
        else
        {
            bool _846 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _848 = isnan(_780);
            bool _850 = _846 || _848;
            bool _852 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _854 = _850 || _852;
            if (!_854)
            {
                float _856 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _858 = _780 + _856;
                float _860 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _862 = _860 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _864 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _866 = _864 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _868 = 1.0 / _862;
                float _870 = _858 * _868;
                float _872 = fma(_870, _866, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _814 = _872;
                _844 = true;
            }
            else
            {
                _814 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _844 = false;
    float _874 = _814;
    float _876 = -_363;
    float _878 = _303 + _876;
    float _880 = -_365;
    float _882 = _309 + _880;
    float _884 = -_367;
    float _886 = _319 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _890 = _724 + _888;
    float _892 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _894 = fma(_890, _874, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _896 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _892);
    float _898 = -_365;
    float _900 = _898 + _894;
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[11].z, _896);
    float _904 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _906 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _908 = _718 + _906;
    float _910 = _902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _912 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _904);
    float _914 = fma(_908, _874, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _918 = _726 + _916;
    float _920 = 1.0 / _910;
    float _922 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[10].z, _912);
    float _924 = -_363;
    float _926 = _924 + _914;
    float _928 = fma(_918, _874, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _930 = _922 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _932 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = -_367;
    float _936 = _934 + _928;
    bool _938 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _940 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.5);
    bool _946 = _942 || _944;
    float _948 = _930 + _910;
    float _950 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _952 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _954 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].x, _950);
    float _958 = _948 * _920;
    float _960 = _958 * 0.5;
    float _962 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _966 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _956);
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _970 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[30].w, _968);
    float _972 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _976 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _964);
    float _978 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _980 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _982 = 1.0 / _970;
    float _984 = _974 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _988 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _980);
    float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _992 = _974 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _994 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _984);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _986);
    float _998 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _990);
    float _1000 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _992);
    float _1002 = _984;
    float _1004 = _978;
    if (_946)
    {
        _1002 = 1.0;
    }
    float _1006 = _1002;
    float _1008 = _988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1010 = _1006;
    if (_946)
    {
        _1004 = 1.0;
    }
    float _1012 = _1004;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1016 = _982 * _1014;
    float _1018 = _1012;
    if (!_946)
    {
        float _1020 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1022 = _1020 * 0.15915493667125701904296875;
        float _1024 = _1022 * 6.283185482025146484375;
        float _1026 = cos(_1024);
        float _1028 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1022 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = 1.0 / _1026;
        float _1038 = _1030 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = _1034 * _1036;
        float _1044 = _1030 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1050 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1048;
        float _1052 = _1040 * _1042;
        float _1054 = 1.0 / _1050;
        float _1056 = 1.0 / _1052;
        float _1058 = _1046 * _1056;
        float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1062 = fma(_1016, _1058, _1060);
        float _1064 = _1062 * _1054;
        float _1066 = precise::clamp(_1064, 0.0, 1.0);
        _1010 = _1066;
    }
    float _1068 = _1010;
    if (!_946)
    {
        float _1070 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1080 = _1078 * 0.15915493667125701904296875;
        float _1082 = _1072 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = 1.0 / _1076;
        float _1088 = _1080 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1084 * _1086;
        float _1094 = _1080 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * _1092;
        float _1100 = 1.0 / _1098;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1104 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1102;
        float _1106 = 1.0 / _1104;
        float _1108 = _1096 * _1100;
        float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1112 = fma(_1016, _1108, _1110);
        float _1114 = _1112 * _1106;
        float _1116 = precise::clamp(_1114, 0.0, 1.0);
        float _1118 = -_1116;
        float _1120 = _1118 + 1.0;
        _1018 = _1120;
    }
    float _1122 = _1018;
    float _1124 = _976 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1126 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].z, _996);
    float _1128 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    bool _1130 = _1068 > 0.0;
    bool _1132 = isnan(_1068);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].z, _994);
    float _1142 = _1068 * _1122;
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1126);
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1128);
    bool _1148 = _1122 <= 0.0;
    bool _1150 = !_1138;
    bool _1152 = _1148 || _1150;
    float _1154 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1140);
    float _1156 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].z, _998);
    float _1158 = _1144 + _1146;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1162 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1156);
    float _1164 = _1158 * 0.5;
    float _1166 = _1160 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1154;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1144;
    out.gl_Position.w = _1146;
    out.m_58.z = _1164;
    out.m_58.w = _1146;
    out.m_35.x = _1166;
    if (!_1152)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1168 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1168;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _844 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    float _85 = as_type<float>(_77);
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _83;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _87 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1226 = as_type<float>(_93);
        out.gl_Position.z = _1226;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _85 = _113;
    }
    float _115 = _85;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1295 = as_type<float>(_129);
        out.gl_Position.z = _1295;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_39.w;
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_41.x;
    float _147 = in.m_41.y;
    float _149 = in.m_41.z;
    float _151 = in.m_43.x;
    float _153 = in.m_43.y;
    float _155 = in.m_43.z;
    float _157 = in.m_45.x;
    float _159 = in.m_45.y;
    float _161 = in.m_45.z;
    float _163 = in.m_37.x;
    float _165 = in.m_37.y;
    float _167 = in.m_37.z;
    float _169 = 0.0;
    float _171 = _133;
    if (!_143)
    {
        float _173 = _133 * _133;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = in.m_32.x;
    float _181 = in.m_32.y;
    float _183 = in.m_32.z;
    float _185 = _177;
    if (!_143)
    {
        float _187 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_143;
    float _193 = _189;
    float _195 = _147;
    float _197 = _149;
    if (!_191)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _133 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _133);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _227;
    }
    float _229 = _193;
    bool _231 = !_143;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _133 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _171 = _251;
    }
    float _253 = _171;
    float _255 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = in.m_41.w;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_253, _165, _255);
    float _263 = in.m_43.w;
    float _265 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = fma(_253, _167, _259);
    float _269 = fma(_261, _131, _181);
    float _271 = in.m_45.w;
    float _273 = fma(_253, _163, _265);
    float _275 = fma(_267, _131, _183);
    float _277 = _269 * _147;
    float _279 = _269 * _153;
    float _281 = fma(_273, _131, _179);
    float _283 = _269 * _159;
    float _285 = in.m_39.x;
    float _287 = fma(_281, _145, _277);
    float _289 = fma(_281, _151, _279);
    float _291 = fma(_281, _157, _283);
    float _293 = _145 * _145;
    float _295 = fma(_275, _149, _287);
    float _297 = fma(_275, _155, _289);
    float _299 = fma(_275, _161, _291);
    float _301 = _149 * _149;
    float _303 = _295 + _257;
    float _305 = fma(_151, _151, _293);
    float _307 = as_type<float>(int(gl_VertexIndex));
    float _309 = _297 + _263;
    float _311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _313 = _303 + _311;
    float _315 = fma(_157, _157, _305);
    float _317 = fma(_155, _155, _301);
    float _319 = _299 + _271;
    float _321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _323 = _309 + _321;
    float _325 = _313 * _313;
    float _327 = sqrt(_315);
    float _329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _331 = _319 + _329;
    float _333 = fma(_161, _161, _317);
    float _335 = fma(_323, _323, _325);
    float _337 = _147 * _147;
    float _339 = _285 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = in.m_39.y;
    float _343 = fma(_331, _331, _335);
    float _345 = fma(_153, _153, _337);
    float _347 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _349 = rsqrt(_343);
    float _351 = fma(_159, _159, _345);
    float _353 = _347 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _355 = _327 > 0.0;
    float _357 = sqrt(_351);
    float _359 = _353 * _349;
    float _361 = sqrt(_333);
    float _363 = _313 * _359;
    float _365 = _323 * _359;
    float _367 = _331 * _359;
    float _369 = -_363;
    float _371 = _313 + _369;
    bool _373 = _357 > 0.0;
    float _375 = -_365;
    float _377 = _323 + _375;
    float _379 = -_367;
    float _381 = _331 + _379;
    float _383 = _371 * _371;
    float _385 = _315;
    float _387 = _371;
    float _389 = _381;
    float _391 = _269;
    float _393 = _377;
    if (_355)
    {
        float _395 = rsqrt(_315);
        _385 = _395;
    }
    float _397 = _385;
    float _399 = fma(_377, _377, _383);
    bool _401 = _361 > 0.0;
    float _403 = fma(_381, _381, _399);
    int _405 = as_type<int>(_307) & 1;
    bool _407 = _405 != 0;
    int _409 = as_type<int>(_307) & 2;
    bool _411 = _409 != 0;
    float _413 = in.m_50.x;
    float _415 = _351;
    float _417 = _403;
    if (_373)
    {
        float _419 = rsqrt(_351);
        _415 = _419;
    }
    float _421 = _415;
    if (!_373)
    {
        _387 = 0.0;
    }
    float _423 = _387;
    float _425 = _423;
    if (!_355)
    {
        _389 = 0.0;
        _391 = 0.0;
    }
    float _427 = _389;
    float _429 = _391;
    float _431 = _427;
    float _433 = _429;
    if (!_373)
    {
        _393 = 0.0;
    }
    float _435 = _393;
    float _437 = _435;
    if (_355)
    {
        float _439 = _397 * _151;
        _431 = _439;
    }
    float _441 = _431;
    if (_355)
    {
        float _443 = _397 * _157;
        _433 = _443;
    }
    float _445 = _433;
    float _447 = sqrt(_403);
    bool _449 = !_407;
    float _451 = _449 ? (-0.5) : 0.5;
    float _453 = _341 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _457 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _451);
    float _459 = _333;
    float _461 = _455;
    if (_401)
    {
        float _463 = rsqrt(_333);
        _459 = _463;
    }
    float _465 = _459;
    float _467 = _421;
    if (_373)
    {
        float _469 = _421 * _153;
        _425 = _469;
    }
    float _471 = _425;
    float _473 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    if (_373)
    {
        float _475 = _421 * _159;
        _437 = _475;
    }
    float _477 = _437;
    if (!_401)
    {
        _417 = 0.0;
    }
    float _479 = _417;
    float _481 = _473 * _413;
    float _483 = _349 * _447;
    bool _485 = !_411;
    float _487 = _485 ? (-0.5) : 0.5;
    bool _489 = _413 > 0.5;
    float _491 = _347 * _483;
    float _493 = trunc(_481);
    int _495 = int(_493);
    float _497 = _483 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _499 = _497 * 0.5;
    float _501 = _479;
    if (_401)
    {
        float _503 = _465 * _155;
        _501 = _503;
    }
    float _505 = _501;
    float _507 = _455 * _483;
    float _509 = _491 * _457;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _487);
    float _513 = _499 * _471;
    float _515 = _499 * _477;
    float _517 = _507;
    float _519 = _505;
    if (!_401)
    {
        _461 = 0.0;
    }
    float _521 = _461;
    float _523 = _521;
    if (_401)
    {
        float _525 = _465 * _161;
        _523 = _525;
    }
    float _527 = _523;
    float _529 = _507 * _511;
    float _531 = fma(_509, _441, _513);
    float _533 = fma(_509, _445, _515);
    if (!_373)
    {
        _517 = 0.0;
    }
    float _535 = _517;
    float _537 = in.m_50.y;
    float _539 = -_529;
    float _541 = fma(_539, _505, _531);
    float _543 = -_529;
    float _545 = fma(_543, _527, _533);
    int _547 = _495 << 4;
    int _549 = _547 + 1968;
    float _551 = _535;
    if (_373)
    {
        float _553 = _421 * _147;
        _551 = _553;
    }
    float _555 = _551;
    float _557 = _309 + _541;
    float _559 = _319 + _545;
    int _561 = _549 + 8;
    uint _564 = uint(int(uint(_561) >> uint(2)));
    uint _566 = uint(int(uint(int(_564)) >> uint(2)));
    int _568 = int(_564) & 3;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[int(_566)][_568];
    float _572 = _555;
    if (!_355)
    {
        _519 = 0.0;
    }
    float _574 = _519;
    float _576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _578 = _557 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _582 = _559 + _580;
    float _584 = _574;
    if (_355)
    {
        float _586 = _397 * _145;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _499 * _555;
    float _592 = _578 * _578;
    float _594 = _582 * _582;
    uint _596 = uint(int(uint(_549) >> uint(2)));
    uint _598 = uint(int(uint(int(_596)) >> uint(2)));
    int _600 = int(_596) & 3;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[int(_598)][_600];
    int _604 = int(_596) + 1;
    uint _606 = uint(int(uint(_604) >> uint(2)));
    int _608 = _604 & 3;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[int(_606)][_608];
    if (!_401)
    {
        _195 = 0.0;
    }
    float _612 = _195;
    float _614 = _612;
    if (_401)
    {
        float _616 = _465 * _149;
        _614 = _616;
    }
    float _618 = _614;
    float _620 = _592 + _594;
    float _622 = fma(_509, _588, _590);
    float _624 = sqrt(_620);
    float _626 = -_529;
    float _628 = fma(_626, _618, _622);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _636 = _634 != 0;
    float _638 = _303 + _628;
    bool _640 = _537 > 0.5;
    bool _642 = _624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _618;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_642)
    {
        _467 = _594;
    }
    float _648 = _467;
    float _650 = _648;
    if (!_642)
    {
        _572 = _592;
    }
    float _652 = _572;
    float _654 = _652;
    if (!_642)
    {
        _644 = _557;
    }
    float _656 = _644;
    float _658 = _656;
    if (!_642)
    {
        _646 = _559;
    }
    float _660 = _646;
    float _662 = _660;
    if (!_642)
    {
        _197 = _638;
    }
    float _664 = _197;
    bool _666 = !_642;
    float _668 = _664;
    if (!_666)
    {
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _674 = _624 + _672;
        float _676 = _638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = rsqrt(_620);
        float _680 = _674 * _670;
        float _682 = _680 * 0.15915493667125701904296875;
        float _684 = _682 * 6.283185482025146484375;
        float _686 = sin(_684);
        float _688 = _682 * 6.283185482025146484375;
        float _690 = cos(_688);
        float _692 = fma(_686, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _694 = _678 * _692;
        float _696 = _690 + (-1.0);
        float _698 = fma(_578, _694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _700 = fma(_582, _694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _702 = _696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _706 = _698 + _704;
        float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _710 = _700 + _708;
        float _712 = fma(_638, _690, _702);
        float _714 = _706 * _706;
        float _716 = _710 * _710;
        _668 = _712;
        _654 = _714;
        _650 = _716;
        _658 = _698;
        _662 = _700;
    }
    float _718 = _668;
    float _720 = _654;
    float _722 = _650;
    float _724 = _658;
    float _726 = _662;
    float _728 = -_451;
    int _730 = _489 ? as_type<int>(_728) : as_type<int>(_451);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _736 = _718 + _734;
    float _738 = -_487;
    int _740 = _640 ? as_type<int>(_738) : as_type<int>(_487);
    float _742 = _602 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _744 = !_632;
    float _746 = _744 ? _451 : as_type<float>(_730);
    float _748 = fma(_736, _736, _720);
    bool _750 = !_636;
    float _752 = _750 ? _487 : as_type<float>(_740);
    float _754 = _610 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _758 = _746 + 0.5;
    float _760 = _748 + _722;
    float _762 = -_752;
    float _764 = _762 + 0.5;
    float _766 = _758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _768 = _570 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _770 = _766 * _732;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _780 = sqrt(_760);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _784 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _778 * _756;
    out.m_52.x = _790;
    out.m_52.y = _784;
    out.m_52.z = _786;
    out.m_52.w = _776;
    out.m_54.x = _788;
    out.m_54.y = _792;
    out.m_54.z = _794;
    bool _798 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _800 = isnan(_780);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _806 = _802 || _804;
    out.m_56.x = _770;
    out.m_56.y = _796;
    float _808 = _760;
    if (!_806)
    {
        _808 = 1.0;
    }
    float _810 = _808;
    bool _812 = !_806;
    float _814 = _810;
    if (!_812)
    {
        bool _816 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _818 = isnan(_780);
        bool _820 = _816 || _818;
        bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _824 = _820 || _822;
        if (!_824)
        {
            float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _828 = _780 + _826;
            float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _832 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _830;
            float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _838 = 1.0 / _832;
            float _840 = _828 * _838;
            float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _814 = _842;
            _844 = true;
        }
        else
        {
            bool _846 = _780 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _848 = isnan(_780);
            bool _850 = _846 || _848;
            bool _852 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _854 = _850 || _852;
            if (!_854)
            {
                float _856 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _858 = _780 + _856;
                float _860 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _862 = _860 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _864 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _866 = _864 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _868 = 1.0 / _862;
                float _870 = _858 * _868;
                float _872 = fma(_870, _866, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _814 = _872;
                _844 = true;
            }
            else
            {
                _814 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _844 = false;
    float _874 = _814;
    float _876 = -_363;
    float _878 = _303 + _876;
    float _880 = -_365;
    float _882 = _309 + _880;
    float _884 = -_367;
    float _886 = _319 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _890 = _724 + _888;
    float _892 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _894 = fma(_890, _874, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _896 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _892);
    float _898 = -_365;
    float _900 = _898 + _894;
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[11].z, _896);
    float _904 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _906 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _908 = _718 + _906;
    float _910 = _902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _912 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _904);
    float _914 = fma(_908, _874, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _918 = _726 + _916;
    float _920 = 1.0 / _910;
    float _922 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[10].z, _912);
    float _924 = -_363;
    float _926 = _924 + _914;
    float _928 = fma(_918, _874, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _930 = _922 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _932 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = -_367;
    float _936 = _934 + _928;
    bool _938 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _940 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.5);
    bool _946 = _942 || _944;
    float _948 = _930 + _910;
    float _950 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _952 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _954 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].x, _950);
    float _958 = _948 * _920;
    float _960 = _958 * 0.5;
    float _962 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _966 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _956);
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _970 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[30].w, _968);
    float _972 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _976 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _964);
    float _978 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _980 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _982 = 1.0 / _970;
    float _984 = _974 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _988 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _980);
    float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _992 = _974 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _994 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _984);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _986);
    float _998 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _990);
    float _1000 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _992);
    float _1002 = _984;
    float _1004 = _978;
    if (_946)
    {
        _1002 = 1.0;
    }
    float _1006 = _1002;
    float _1008 = _988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1010 = _1006;
    if (_946)
    {
        _1004 = 1.0;
    }
    float _1012 = _1004;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1016 = _982 * _1014;
    float _1018 = _1012;
    if (!_946)
    {
        float _1020 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1022 = _1020 * 0.15915493667125701904296875;
        float _1024 = _1022 * 6.283185482025146484375;
        float _1026 = cos(_1024);
        float _1028 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1022 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = 1.0 / _1026;
        float _1038 = _1030 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = _1034 * _1036;
        float _1044 = _1030 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1050 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1048;
        float _1052 = _1040 * _1042;
        float _1054 = 1.0 / _1050;
        float _1056 = 1.0 / _1052;
        float _1058 = _1046 * _1056;
        float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1062 = fma(_1016, _1058, _1060);
        float _1064 = _1062 * _1054;
        float _1066 = precise::clamp(_1064, 0.0, 1.0);
        _1010 = _1066;
    }
    float _1068 = _1010;
    if (!_946)
    {
        float _1070 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1080 = _1078 * 0.15915493667125701904296875;
        float _1082 = _1072 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = 1.0 / _1076;
        float _1088 = _1080 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1084 * _1086;
        float _1094 = _1080 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * _1092;
        float _1100 = 1.0 / _1098;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1104 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1102;
        float _1106 = 1.0 / _1104;
        float _1108 = _1096 * _1100;
        float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1112 = fma(_1016, _1108, _1110);
        float _1114 = _1112 * _1106;
        float _1116 = precise::clamp(_1114, 0.0, 1.0);
        float _1118 = -_1116;
        float _1120 = _1118 + 1.0;
        _1018 = _1120;
    }
    float _1122 = _1018;
    float _1124 = _976 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1126 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].z, _996);
    float _1128 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    bool _1130 = _1068 > 0.0;
    bool _1132 = isnan(_1068);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].z, _994);
    float _1142 = _1068 * _1122;
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1126);
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1128);
    bool _1148 = _1122 <= 0.0;
    bool _1150 = !_1138;
    bool _1152 = _1148 || _1150;
    float _1154 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1140);
    float _1156 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].z, _998);
    float _1158 = _1144 + _1146;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1162 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1156);
    float _1164 = _1158 * 0.5;
    float _1166 = _1160 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1154;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1144;
    out.gl_Position.w = _1146;
    out.m_58.z = _1164;
    out.m_58.w = _1146;
    out.m_35.x = _1166;
    if (!_1152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1168 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1168;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

