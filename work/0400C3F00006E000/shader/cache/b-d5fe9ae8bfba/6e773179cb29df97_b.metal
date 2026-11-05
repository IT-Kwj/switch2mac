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
    float4 m_50 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_40 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1076 = as_type<float>(_91);
        out.gl_Position.z = _1076;
    }
    if (!_79)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1144 = as_type<float>(_127);
        out.gl_Position.z = _1144;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_40.x;
    float _137 = _133 * _131;
    int _139 = as_type<int>(_129) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_129) & 2;
    bool _145 = _143 != 0;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    bool _149 = !_145;
    float _151 = _149 ? (-0.5) : 0.5;
    float _153 = _147 * 6.283185482025146484375;
    float _155 = floor(_147);
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    float _165 = _153 * 0.15915493667125701904296875;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = _165 * 6.283185482025146484375;
    float _173 = cos(_171);
    bool _175 = !_159;
    int _177 = _175 ? 0 : 1;
    bool _179 = !_169;
    int _181 = _179 ? 0 : 1;
    int _183 = abs(_177);
    int _185 = abs(_181);
    float _187 = -_155;
    float _189 = _147 + _187;
    float _191 = -_189;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_183);
    bool _197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _199 = fma(_173, 0.5, 0.5);
    bool _201 = !_163;
    int _203 = _201 ? 0 : 1;
    float _205 = abs(_193);
    float _207 = _195 * _205;
    bool _209 = _189 < 0.5;
    float _211 = float(_209);
    int _213 = abs(_203);
    float _215 = -_199;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_185);
    float _221 = -_211;
    float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _225 = float(_213);
    bool _227 = !_141;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = fma(_219, _217, _207);
    float _233 = abs(_223);
    float _235 = fma(_225, _233, _231);
    bool _237 = !_197;
    float _239 = 0.5;
    float _255;
    if (!_237)
    {
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_75);
        float _261 = 1.0 / _259;
        float _263 = _109 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = in.m_30.x;
    float _269 = in.m_30.y;
    float _271 = in.m_30.z;
    bool _273 = _135 > 0.5;
    float _275 = in.m_42.x;
    float _277 = in.m_42.y;
    float _279 = in.m_42.z;
    float _281 = in.m_42.w;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _289 = _287 != 0;
    float _291 = in.m_44.x;
    float _293 = in.m_44.y;
    float _295 = in.m_44.z;
    float _297 = in.m_44.w;
    float _299 = in.m_46.x;
    float _301 = in.m_46.y;
    float _303 = in.m_46.z;
    float _305 = in.m_46.w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = in.m_40.y;
    float _317 = 1.0 / _309;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _325 = 1.0 / _313;
    float _327 = -_229;
    int _329 = _273 ? as_type<int>(_327) : as_type<int>(_229);
    float _331 = _269 * _277;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _335 = _319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = _269 * _293;
    float _339 = fma(_267, _275, _331);
    float _341 = _321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _343 = _269 * _301;
    float _345 = fma(_267, _291, _337);
    float _347 = fma(_271, _279, _339);
    bool _349 = !_285;
    float _351 = _349 ? _229 : as_type<float>(_329);
    float _353 = fma(_267, _299, _343);
    float _355 = fma(_271, _295, _345);
    float _357 = _347 + _281;
    bool _359 = _315 > 0.5;
    float _361 = fma(_271, _303, _353);
    float _363 = _355 + _297;
    float _365 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _367 = _357 + _365;
    float _369 = -_151;
    int _371 = _359 ? as_type<int>(_369) : as_type<int>(_151);
    float _373 = _361 + _305;
    float _375 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _377 = _363 + _375;
    float _379 = _367 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _265 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _387 = _373 + _385;
    float _389 = _323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[28].x, _379);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[28].z, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _401;
    float _405 = _383 * _325;
    bool _407 = !_289;
    float _409 = _407 ? _151 : as_type<float>(_371);
    float _411 = _367 * _367;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _415 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _335;
    out.m_48.y = _341;
    out.m_48.z = _389;
    out.m_48.w = _333;
    bool _421 = _399 >= 0.0;
    float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = _265 + _425;
    float _429 = -_409;
    float _431 = _429 + 0.5;
    out.m_50.x = _415;
    out.m_50.y = _417;
    out.m_50.z = _419;
    out.m_50.w = _413;
    float _433 = _351 + 0.5;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _437 = _265 + _435;
    bool _439 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _441 = isnan(_265);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _453 = _433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _455 = _267;
    if (_421)
    {
        _455 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _457 = _455;
    if (_421)
    {
        out.m_33.x = 0.0;
    }
    float _459 = 1.0 / _403;
    float _461 = _427 * _317;
    float _463 = _431 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _465 = _453 * _423;
    bool _467 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _469 = isnan(_265);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _463 * _451;
    float _481 = fma(_377, _377, _411);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = fma(_387, _387, _481);
    float _493 = fma(_485, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _495 = as_type<int>(_485);
    if (_421)
    {
        float _497 = _457 * 5.0;
        _495 = as_type<int>(_497);
    }
    int _499 = _495;
    bool _501 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _503 = isnan(_265);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = fma(_489, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _515 = _437 * _459;
    float _517 = rsqrt(_491);
    bool _519 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _521 = isnan(_265);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_449;
    float _533 = _531 + 1.0;
    float _535 = -_511;
    float _537 = _535 + 1.0;
    out.m_52.x = _465;
    out.m_52.y = _479;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _543 = _511 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    if (_421)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1822 = as_type<float>(_499);
        out.gl_Position.z = _1822;
    }
    float _549 = _529 * _537;
    float _551 = _367 * _517;
    float _553 = _377 * _517;
    if (_421)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _555 = -_551;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _357);
    float _559 = -_529;
    float _561 = _559 + 1.0;
    float _563 = _387 * _517;
    float _565 = -_553;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _363);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _571 = _557 + _569;
    float _573 = fma(_541, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -_563;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _567 + _579;
    float _583 = _571 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _585 = _477 * _561;
    float _587 = fma(_547, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = _577 + _589;
    float _593 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _595 = -_477;
    float _597 = _595 + 1.0;
    float _599 = _493 * _585;
    float _601 = _513 * _585;
    float _603 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _605 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].x, _599);
    float _607 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _609 = -_551;
    float _611 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _367);
    float _613 = -_553;
    float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _377);
    bool _617 = _603 >= 0.0;
    float _619 = _611 * _611;
    float _621 = in.m_54.x;
    float _623 = in.m_54.y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _629;
    float _633 = fma(_615, _615, _619);
    float _635 = -_563;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _387);
    float _639 = fma(_627, _515, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _641 = fma(_573, _549, _605);
    float _643 = fma(_631, _515, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _645 = fma(_587, _549, _607);
    float _647 = fma(_637, _637, _633);
    float _649 = fma(_639, _543, _641);
    float _651 = _639;
    if (_617)
    {
        _651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _653 = _651;
    float _655 = fma(_643, _543, _645);
    float _657 = sqrt(_647);
    float _659 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[146].x, _649);
    int _661 = as_type<int>(_653);
    if (_617)
    {
        out.m_33.x = 0.0;
    }
    float _663 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[146].y, _655);
    if (_617)
    {
        float _665 = _653 * 5.0;
        _661 = as_type<int>(_665);
    }
    int _667 = _661;
    if (_617)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2047 = as_type<float>(_667);
        out.gl_Position.z = _2047;
    }
    float _669 = _659 * _621;
    float _671 = _663 * _623;
    if (_617)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _673 = _235 * _671;
    float _675 = _517 * _657;
    float _677 = _235 * _669;
    float _679 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _681 = _673 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _229);
    float _685 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _675 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _689 = _687 * 0.5;
    float _691 = _675 * _681;
    float _693 = _675 * _685;
    bool _695 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _697 = isnan(0.5);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _703 = _699 || _701;
    float _705 = _679 * _691;
    bool _707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _715 = _711 || _713;
    float _717 = _683 * _693;
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _721 = _705 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _723 = _705 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _719);
    float _727 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _721);
    float _729 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _731 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].z, _725);
    float _733 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].z, _727);
    float _735 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _737 = _731 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _739 = _733 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _741 = _557 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _743 = _735 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _745 = _373 + _737;
    float _747 = _363 + _739;
    float _749 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[11].x, _741);
    float _751 = _557 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _753 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _755 = _745 + _753;
    float _757 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _759 = _747 + _757;
    float _761 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[11].z, _749);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[10].x, _751);
    float _765 = _755 * _755;
    float _767 = _357 + _743;
    float _769 = _761 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _771 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[10].z, _763);
    float _773 = fma(_759, _759, _765);
    float _775 = 1.0 / _769;
    float _777 = _771 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _779 = _777 + _769;
    float _781 = sqrt(_773);
    bool _783 = _781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _751;
    float _787 = _747;
    if (!_783)
    {
        _239 = _745;
    }
    float _789 = _239;
    float _791 = _789;
    if (!_783)
    {
        _785 = _767;
    }
    float _793 = _785;
    bool _795 = !_783;
    float _797 = _793;
    if (!_795)
    {
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _801 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _803 = _781 + _801;
        float _805 = rsqrt(_773);
        float _807 = _803 * _799;
        float _809 = _767 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = _807 * 0.15915493667125701904296875;
        float _813 = _811 * 6.283185482025146484375;
        float _815 = sin(_813);
        float _817 = _811 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = fma(_815, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _823 = _805 * _821;
        float _825 = _819 + (-1.0);
        float _827 = fma(_759, _823, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _829 = fma(_755, _823, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _831 = _825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = fma(_767, _819, _831);
        _787 = _827;
        _797 = _833;
        _791 = _829;
    }
    float _835 = _787;
    float _837 = _797;
    float _839 = _791;
    float _841 = -_553;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _835);
    float _845 = -_551;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _837);
    float _849 = -_563;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _853 = _779 * _775;
    float _855 = _853 * 0.5;
    float _857 = _847;
    float _859 = _843;
    float _861 = _851;
    if (!_703)
    {
        float _863 = _571 * _571;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _867 = -_363;
        float _869 = _867 + _835;
        float _871 = -_373;
        float _873 = _871 + _839;
        float _875 = fma(_581, _581, _863);
        float _877 = fma(_591, _591, _875);
        float _879 = 1.0 / _675;
        float _881 = sqrt(_877);
        float _883 = precise::min(_881, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _885 = _883 * _865;
        float _887 = _885 * _879;
        float _889 = -_357;
        float _891 = _889 + _837;
        float _893 = fma(_869, _887, _567);
        float _895 = fma(_891, _887, _557);
        float _897 = fma(_873, _887, _577);
        _857 = _895;
        _859 = _893;
        _861 = _897;
    }
    float _899 = _857;
    float _901 = _859;
    float _903 = _861;
    float _905 = _899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _907 = _899 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _909 = _899 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _911 = _899 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[0].x, _905);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[1].x, _907);
    float _917 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[2].x, _909);
    float _919 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _921 = _899;
    if (_715)
    {
        _921 = 1.0;
    }
    float _923 = _921;
    float _925 = _923;
    if (!_715)
    {
        float _927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _929 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[30].w, _927);
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _935 = 1.0 / _929;
        float _937 = 1.0 / _933;
        float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _943 = fma(_935, _939, _941);
        float _945 = _943 * _937;
        float _947 = precise::clamp(_945, 0.0, 1.0);
        _925 = _947;
    }
    float _949 = _925;
    float _951 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[1].z, _915);
    float _953 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[0].z, _913);
    float _955 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _957 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[2].z, _917);
    float _959 = _951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _963 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[3].z, _919);
    float _965 = _235 * _955;
    float _967 = _959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _969 = _959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _971 = _959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _973 = _959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _975 = _957 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _977 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[6].x, _967);
    float _979 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[7].x, _969);
    float _981 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[4].x, _971);
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[5].x, _973);
    float _985 = _963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].z, _977);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].z, _979);
    float _991 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].z, _981);
    float _993 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].z, _983);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _987);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _989);
    bool _999 = _949 > 0.0;
    bool _1001 = isnan(_949);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(0.0);
    bool _1007 = _1003 || _1005;
    float _1009 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _991);
    float _1011 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _993);
    float _1013 = _995 + _997;
    float _1015 = _965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1017 = _1013 * 0.5;
    out.m_33.x = _1015;
    out.gl_Position.x = _1009;
    out.gl_Position.y = _1011;
    out.gl_Position.z = _995;
    out.gl_Position.w = _997;
    out.m_56.z = _1017;
    out.m_56.w = _997;
    if (_1007)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1019;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1076 = as_type<float>(_91);
        out.gl_Position.z = _1076;
    }
    if (!_79)
    {
        return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1144 = as_type<float>(_127);
        out.gl_Position.z = _1144;
    }
    if (_121)
    {
        return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_40.x;
    float _137 = _133 * _131;
    int _139 = as_type<int>(_129) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_129) & 2;
    bool _145 = _143 != 0;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    bool _149 = !_145;
    float _151 = _149 ? (-0.5) : 0.5;
    float _153 = _147 * 6.283185482025146484375;
    float _155 = floor(_147);
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    float _165 = _153 * 0.15915493667125701904296875;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = _165 * 6.283185482025146484375;
    float _173 = cos(_171);
    bool _175 = !_159;
    int _177 = _175 ? 0 : 1;
    bool _179 = !_169;
    int _181 = _179 ? 0 : 1;
    int _183 = abs(_177);
    int _185 = abs(_181);
    float _187 = -_155;
    float _189 = _147 + _187;
    float _191 = -_189;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_183);
    bool _197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _199 = fma(_173, 0.5, 0.5);
    bool _201 = !_163;
    int _203 = _201 ? 0 : 1;
    float _205 = abs(_193);
    float _207 = _195 * _205;
    bool _209 = _189 < 0.5;
    float _211 = float(_209);
    int _213 = abs(_203);
    float _215 = -_199;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_185);
    float _221 = -_211;
    float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _225 = float(_213);
    bool _227 = !_141;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = fma(_219, _217, _207);
    float _233 = abs(_223);
    float _235 = fma(_225, _233, _231);
    bool _237 = !_197;
    float _239 = 0.5;
    float _255;
    if (!_237)
    {
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_75);
        float _261 = 1.0 / _259;
        float _263 = _109 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = in.m_30.x;
    float _269 = in.m_30.y;
    float _271 = in.m_30.z;
    bool _273 = _135 > 0.5;
    float _275 = in.m_42.x;
    float _277 = in.m_42.y;
    float _279 = in.m_42.z;
    float _281 = in.m_42.w;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _289 = _287 != 0;
    float _291 = in.m_44.x;
    float _293 = in.m_44.y;
    float _295 = in.m_44.z;
    float _297 = in.m_44.w;
    float _299 = in.m_46.x;
    float _301 = in.m_46.y;
    float _303 = in.m_46.z;
    float _305 = in.m_46.w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = in.m_40.y;
    float _317 = 1.0 / _309;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _325 = 1.0 / _313;
    float _327 = -_229;
    int _329 = _273 ? as_type<int>(_327) : as_type<int>(_229);
    float _331 = _269 * _277;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _335 = _319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = _269 * _293;
    float _339 = fma(_267, _275, _331);
    float _341 = _321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _343 = _269 * _301;
    float _345 = fma(_267, _291, _337);
    float _347 = fma(_271, _279, _339);
    bool _349 = !_285;
    float _351 = _349 ? _229 : as_type<float>(_329);
    float _353 = fma(_267, _299, _343);
    float _355 = fma(_271, _295, _345);
    float _357 = _347 + _281;
    bool _359 = _315 > 0.5;
    float _361 = fma(_271, _303, _353);
    float _363 = _355 + _297;
    float _365 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _367 = _357 + _365;
    float _369 = -_151;
    int _371 = _359 ? as_type<int>(_369) : as_type<int>(_151);
    float _373 = _361 + _305;
    float _375 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _377 = _363 + _375;
    float _379 = _367 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _265 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _387 = _373 + _385;
    float _389 = _323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[28].x, _379);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[28].z, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _401;
    float _405 = _383 * _325;
    bool _407 = !_289;
    float _409 = _407 ? _151 : as_type<float>(_371);
    float _411 = _367 * _367;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _415 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _335;
    out.m_48.y = _341;
    out.m_48.z = _389;
    out.m_48.w = _333;
    bool _421 = _399 >= 0.0;
    float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = _265 + _425;
    float _429 = -_409;
    float _431 = _429 + 0.5;
    out.m_50.x = _415;
    out.m_50.y = _417;
    out.m_50.z = _419;
    out.m_50.w = _413;
    float _433 = _351 + 0.5;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _437 = _265 + _435;
    bool _439 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _441 = isnan(_265);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _453 = _433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _455 = _267;
    if (_421)
    {
        _455 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _457 = _455;
    if (_421)
    {
        out.m_33.x = 0.0;
    }
    float _459 = 1.0 / _403;
    float _461 = _427 * _317;
    float _463 = _431 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _465 = _453 * _423;
    bool _467 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _469 = isnan(_265);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _463 * _451;
    float _481 = fma(_377, _377, _411);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = fma(_387, _387, _481);
    float _493 = fma(_485, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _495 = as_type<int>(_485);
    if (_421)
    {
        float _497 = _457 * 5.0;
        _495 = as_type<int>(_497);
    }
    int _499 = _495;
    bool _501 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _503 = isnan(_265);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = fma(_489, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _515 = _437 * _459;
    float _517 = rsqrt(_491);
    bool _519 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _521 = isnan(_265);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_449;
    float _533 = _531 + 1.0;
    float _535 = -_511;
    float _537 = _535 + 1.0;
    out.m_52.x = _465;
    out.m_52.y = _479;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _543 = _511 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    if (_421)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1822 = as_type<float>(_499);
        out.gl_Position.z = _1822;
    }
    float _549 = _529 * _537;
    float _551 = _367 * _517;
    float _553 = _377 * _517;
    if (_421)
    {
        return out;
    }
    float _555 = -_551;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _357);
    float _559 = -_529;
    float _561 = _559 + 1.0;
    float _563 = _387 * _517;
    float _565 = -_553;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _363);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _571 = _557 + _569;
    float _573 = fma(_541, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -_563;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _567 + _579;
    float _583 = _571 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _585 = _477 * _561;
    float _587 = fma(_547, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = _577 + _589;
    float _593 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _595 = -_477;
    float _597 = _595 + 1.0;
    float _599 = _493 * _585;
    float _601 = _513 * _585;
    float _603 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _605 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].x, _599);
    float _607 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _609 = -_551;
    float _611 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _367);
    float _613 = -_553;
    float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _377);
    bool _617 = _603 >= 0.0;
    float _619 = _611 * _611;
    float _621 = in.m_54.x;
    float _623 = in.m_54.y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _629;
    float _633 = fma(_615, _615, _619);
    float _635 = -_563;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _387);
    float _639 = fma(_627, _515, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _641 = fma(_573, _549, _605);
    float _643 = fma(_631, _515, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _645 = fma(_587, _549, _607);
    float _647 = fma(_637, _637, _633);
    float _649 = fma(_639, _543, _641);
    float _651 = _639;
    if (_617)
    {
        _651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _653 = _651;
    float _655 = fma(_643, _543, _645);
    float _657 = sqrt(_647);
    float _659 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[146].x, _649);
    int _661 = as_type<int>(_653);
    if (_617)
    {
        out.m_33.x = 0.0;
    }
    float _663 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[146].y, _655);
    if (_617)
    {
        float _665 = _653 * 5.0;
        _661 = as_type<int>(_665);
    }
    int _667 = _661;
    if (_617)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2047 = as_type<float>(_667);
        out.gl_Position.z = _2047;
    }
    float _669 = _659 * _621;
    float _671 = _663 * _623;
    if (_617)
    {
        return out;
    }
    float _673 = _235 * _671;
    float _675 = _517 * _657;
    float _677 = _235 * _669;
    float _679 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _681 = _673 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _229);
    float _685 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _675 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _689 = _687 * 0.5;
    float _691 = _675 * _681;
    float _693 = _675 * _685;
    bool _695 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _697 = isnan(0.5);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _703 = _699 || _701;
    float _705 = _679 * _691;
    bool _707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _715 = _711 || _713;
    float _717 = _683 * _693;
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _721 = _705 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _723 = _705 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _719);
    float _727 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _721);
    float _729 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _731 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].z, _725);
    float _733 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].z, _727);
    float _735 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _737 = _731 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _739 = _733 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _741 = _557 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _743 = _735 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _745 = _373 + _737;
    float _747 = _363 + _739;
    float _749 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[11].x, _741);
    float _751 = _557 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _753 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _755 = _745 + _753;
    float _757 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _759 = _747 + _757;
    float _761 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[11].z, _749);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[10].x, _751);
    float _765 = _755 * _755;
    float _767 = _357 + _743;
    float _769 = _761 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _771 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[10].z, _763);
    float _773 = fma(_759, _759, _765);
    float _775 = 1.0 / _769;
    float _777 = _771 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _779 = _777 + _769;
    float _781 = sqrt(_773);
    bool _783 = _781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _751;
    float _787 = _747;
    if (!_783)
    {
        _239 = _745;
    }
    float _789 = _239;
    float _791 = _789;
    if (!_783)
    {
        _785 = _767;
    }
    float _793 = _785;
    bool _795 = !_783;
    float _797 = _793;
    if (!_795)
    {
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _801 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _803 = _781 + _801;
        float _805 = rsqrt(_773);
        float _807 = _803 * _799;
        float _809 = _767 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = _807 * 0.15915493667125701904296875;
        float _813 = _811 * 6.283185482025146484375;
        float _815 = sin(_813);
        float _817 = _811 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = fma(_815, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _823 = _805 * _821;
        float _825 = _819 + (-1.0);
        float _827 = fma(_759, _823, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _829 = fma(_755, _823, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _831 = _825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = fma(_767, _819, _831);
        _787 = _827;
        _797 = _833;
        _791 = _829;
    }
    float _835 = _787;
    float _837 = _797;
    float _839 = _791;
    float _841 = -_553;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _835);
    float _845 = -_551;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _837);
    float _849 = -_563;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _853 = _779 * _775;
    float _855 = _853 * 0.5;
    float _857 = _847;
    float _859 = _843;
    float _861 = _851;
    if (!_703)
    {
        float _863 = _571 * _571;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _867 = -_363;
        float _869 = _867 + _835;
        float _871 = -_373;
        float _873 = _871 + _839;
        float _875 = fma(_581, _581, _863);
        float _877 = fma(_591, _591, _875);
        float _879 = 1.0 / _675;
        float _881 = sqrt(_877);
        float _883 = precise::min(_881, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _885 = _883 * _865;
        float _887 = _885 * _879;
        float _889 = -_357;
        float _891 = _889 + _837;
        float _893 = fma(_869, _887, _567);
        float _895 = fma(_891, _887, _557);
        float _897 = fma(_873, _887, _577);
        _857 = _895;
        _859 = _893;
        _861 = _897;
    }
    float _899 = _857;
    float _901 = _859;
    float _903 = _861;
    float _905 = _899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _907 = _899 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _909 = _899 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _911 = _899 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[0].x, _905);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[1].x, _907);
    float _917 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[2].x, _909);
    float _919 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _921 = _899;
    if (_715)
    {
        _921 = 1.0;
    }
    float _923 = _921;
    float _925 = _923;
    if (!_715)
    {
        float _927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _929 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[30].w, _927);
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _935 = 1.0 / _929;
        float _937 = 1.0 / _933;
        float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _943 = fma(_935, _939, _941);
        float _945 = _943 * _937;
        float _947 = precise::clamp(_945, 0.0, 1.0);
        _925 = _947;
    }
    float _949 = _925;
    float _951 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[1].z, _915);
    float _953 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[0].z, _913);
    float _955 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _957 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[2].z, _917);
    float _959 = _951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _963 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[3].z, _919);
    float _965 = _235 * _955;
    float _967 = _959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _969 = _959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _971 = _959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _973 = _959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _975 = _957 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _977 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[6].x, _967);
    float _979 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[7].x, _969);
    float _981 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[4].x, _971);
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[5].x, _973);
    float _985 = _963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].z, _977);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].z, _979);
    float _991 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].z, _981);
    float _993 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].z, _983);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _987);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _989);
    bool _999 = _949 > 0.0;
    bool _1001 = isnan(_949);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(0.0);
    bool _1007 = _1003 || _1005;
    float _1009 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _991);
    float _1011 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _993);
    float _1013 = _995 + _997;
    float _1015 = _965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1017 = _1013 * 0.5;
    out.m_33.x = _1015;
    out.gl_Position.x = _1009;
    out.gl_Position.y = _1011;
    out.gl_Position.z = _995;
    out.gl_Position.w = _997;
    out.m_56.z = _1017;
    out.m_56.w = _997;
    if (_1007)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1019;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1076 = as_type<float>(_91);
        out.gl_Position.z = _1076;
    }
    if (!_79)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1144 = as_type<float>(_127);
        out.gl_Position.z = _1144;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_40.x;
    float _137 = _133 * _131;
    int _139 = as_type<int>(_129) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_129) & 2;
    bool _145 = _143 != 0;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    bool _149 = !_145;
    float _151 = _149 ? (-0.5) : 0.5;
    float _153 = _147 * 6.283185482025146484375;
    float _155 = floor(_147);
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    float _165 = _153 * 0.15915493667125701904296875;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = _165 * 6.283185482025146484375;
    float _173 = cos(_171);
    bool _175 = !_159;
    int _177 = _175 ? 0 : 1;
    bool _179 = !_169;
    int _181 = _179 ? 0 : 1;
    int _183 = abs(_177);
    int _185 = abs(_181);
    float _187 = -_155;
    float _189 = _147 + _187;
    float _191 = -_189;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_183);
    bool _197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _199 = fma(_173, 0.5, 0.5);
    bool _201 = !_163;
    int _203 = _201 ? 0 : 1;
    float _205 = abs(_193);
    float _207 = _195 * _205;
    bool _209 = _189 < 0.5;
    float _211 = float(_209);
    int _213 = abs(_203);
    float _215 = -_199;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_185);
    float _221 = -_211;
    float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _225 = float(_213);
    bool _227 = !_141;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = fma(_219, _217, _207);
    float _233 = abs(_223);
    float _235 = fma(_225, _233, _231);
    bool _237 = !_197;
    float _239 = 0.5;
    float _255;
    if (!_237)
    {
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_75);
        float _261 = 1.0 / _259;
        float _263 = _109 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = in.m_30.x;
    float _269 = in.m_30.y;
    float _271 = in.m_30.z;
    bool _273 = _135 > 0.5;
    float _275 = in.m_42.x;
    float _277 = in.m_42.y;
    float _279 = in.m_42.z;
    float _281 = in.m_42.w;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _289 = _287 != 0;
    float _291 = in.m_44.x;
    float _293 = in.m_44.y;
    float _295 = in.m_44.z;
    float _297 = in.m_44.w;
    float _299 = in.m_46.x;
    float _301 = in.m_46.y;
    float _303 = in.m_46.z;
    float _305 = in.m_46.w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = in.m_40.y;
    float _317 = 1.0 / _309;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _325 = 1.0 / _313;
    float _327 = -_229;
    int _329 = _273 ? as_type<int>(_327) : as_type<int>(_229);
    float _331 = _269 * _277;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _335 = _319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = _269 * _293;
    float _339 = fma(_267, _275, _331);
    float _341 = _321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _343 = _269 * _301;
    float _345 = fma(_267, _291, _337);
    float _347 = fma(_271, _279, _339);
    bool _349 = !_285;
    float _351 = _349 ? _229 : as_type<float>(_329);
    float _353 = fma(_267, _299, _343);
    float _355 = fma(_271, _295, _345);
    float _357 = _347 + _281;
    bool _359 = _315 > 0.5;
    float _361 = fma(_271, _303, _353);
    float _363 = _355 + _297;
    float _365 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _367 = _357 + _365;
    float _369 = -_151;
    int _371 = _359 ? as_type<int>(_369) : as_type<int>(_151);
    float _373 = _361 + _305;
    float _375 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _377 = _363 + _375;
    float _379 = _367 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _265 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _387 = _373 + _385;
    float _389 = _323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[28].x, _379);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[28].z, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _401;
    float _405 = _383 * _325;
    bool _407 = !_289;
    float _409 = _407 ? _151 : as_type<float>(_371);
    float _411 = _367 * _367;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _415 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _335;
    out.m_48.y = _341;
    out.m_48.z = _389;
    out.m_48.w = _333;
    bool _421 = _399 >= 0.0;
    float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = _265 + _425;
    float _429 = -_409;
    float _431 = _429 + 0.5;
    out.m_50.x = _415;
    out.m_50.y = _417;
    out.m_50.z = _419;
    out.m_50.w = _413;
    float _433 = _351 + 0.5;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _437 = _265 + _435;
    bool _439 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _441 = isnan(_265);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _453 = _433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _455 = _267;
    if (_421)
    {
        _455 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _457 = _455;
    if (_421)
    {
        out.m_33.x = 0.0;
    }
    float _459 = 1.0 / _403;
    float _461 = _427 * _317;
    float _463 = _431 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _465 = _453 * _423;
    bool _467 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _469 = isnan(_265);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _463 * _451;
    float _481 = fma(_377, _377, _411);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = fma(_387, _387, _481);
    float _493 = fma(_485, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _495 = as_type<int>(_485);
    if (_421)
    {
        float _497 = _457 * 5.0;
        _495 = as_type<int>(_497);
    }
    int _499 = _495;
    bool _501 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _503 = isnan(_265);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = fma(_489, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _515 = _437 * _459;
    float _517 = rsqrt(_491);
    bool _519 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _521 = isnan(_265);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_449;
    float _533 = _531 + 1.0;
    float _535 = -_511;
    float _537 = _535 + 1.0;
    out.m_52.x = _465;
    out.m_52.y = _479;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _543 = _511 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    if (_421)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1822 = as_type<float>(_499);
        out.gl_Position.z = _1822;
    }
    float _549 = _529 * _537;
    float _551 = _367 * _517;
    float _553 = _377 * _517;
    if (_421)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _555 = -_551;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _357);
    float _559 = -_529;
    float _561 = _559 + 1.0;
    float _563 = _387 * _517;
    float _565 = -_553;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _363);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _571 = _557 + _569;
    float _573 = fma(_541, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -_563;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _567 + _579;
    float _583 = _571 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _585 = _477 * _561;
    float _587 = fma(_547, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = _577 + _589;
    float _593 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _595 = -_477;
    float _597 = _595 + 1.0;
    float _599 = _493 * _585;
    float _601 = _513 * _585;
    float _603 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _605 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].x, _599);
    float _607 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _609 = -_551;
    float _611 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _367);
    float _613 = -_553;
    float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _377);
    bool _617 = _603 >= 0.0;
    float _619 = _611 * _611;
    float _621 = in.m_54.x;
    float _623 = in.m_54.y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _629;
    float _633 = fma(_615, _615, _619);
    float _635 = -_563;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _387);
    float _639 = fma(_627, _515, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _641 = fma(_573, _549, _605);
    float _643 = fma(_631, _515, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _645 = fma(_587, _549, _607);
    float _647 = fma(_637, _637, _633);
    float _649 = fma(_639, _543, _641);
    float _651 = _639;
    if (_617)
    {
        _651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _653 = _651;
    float _655 = fma(_643, _543, _645);
    float _657 = sqrt(_647);
    float _659 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[146].x, _649);
    int _661 = as_type<int>(_653);
    if (_617)
    {
        out.m_33.x = 0.0;
    }
    float _663 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[146].y, _655);
    if (_617)
    {
        float _665 = _653 * 5.0;
        _661 = as_type<int>(_665);
    }
    int _667 = _661;
    if (_617)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2047 = as_type<float>(_667);
        out.gl_Position.z = _2047;
    }
    float _669 = _659 * _621;
    float _671 = _663 * _623;
    if (_617)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _673 = _235 * _671;
    float _675 = _517 * _657;
    float _677 = _235 * _669;
    float _679 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _681 = _673 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _229);
    float _685 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _675 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _689 = _687 * 0.5;
    float _691 = _675 * _681;
    float _693 = _675 * _685;
    bool _695 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _697 = isnan(0.5);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _703 = _699 || _701;
    float _705 = _679 * _691;
    bool _707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _715 = _711 || _713;
    float _717 = _683 * _693;
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _721 = _705 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _723 = _705 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _719);
    float _727 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _721);
    float _729 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _731 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].z, _725);
    float _733 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].z, _727);
    float _735 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _737 = _731 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _739 = _733 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _741 = _557 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _743 = _735 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _745 = _373 + _737;
    float _747 = _363 + _739;
    float _749 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[11].x, _741);
    float _751 = _557 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _753 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _755 = _745 + _753;
    float _757 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _759 = _747 + _757;
    float _761 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[11].z, _749);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[10].x, _751);
    float _765 = _755 * _755;
    float _767 = _357 + _743;
    float _769 = _761 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _771 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[10].z, _763);
    float _773 = fma(_759, _759, _765);
    float _775 = 1.0 / _769;
    float _777 = _771 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _779 = _777 + _769;
    float _781 = sqrt(_773);
    bool _783 = _781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _751;
    float _787 = _747;
    if (!_783)
    {
        _239 = _745;
    }
    float _789 = _239;
    float _791 = _789;
    if (!_783)
    {
        _785 = _767;
    }
    float _793 = _785;
    bool _795 = !_783;
    float _797 = _793;
    if (!_795)
    {
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _801 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _803 = _781 + _801;
        float _805 = rsqrt(_773);
        float _807 = _803 * _799;
        float _809 = _767 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = _807 * 0.15915493667125701904296875;
        float _813 = _811 * 6.283185482025146484375;
        float _815 = sin(_813);
        float _817 = _811 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = fma(_815, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _823 = _805 * _821;
        float _825 = _819 + (-1.0);
        float _827 = fma(_759, _823, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _829 = fma(_755, _823, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _831 = _825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = fma(_767, _819, _831);
        _787 = _827;
        _797 = _833;
        _791 = _829;
    }
    float _835 = _787;
    float _837 = _797;
    float _839 = _791;
    float _841 = -_553;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _835);
    float _845 = -_551;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _837);
    float _849 = -_563;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _853 = _779 * _775;
    float _855 = _853 * 0.5;
    float _857 = _847;
    float _859 = _843;
    float _861 = _851;
    if (!_703)
    {
        float _863 = _571 * _571;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _867 = -_363;
        float _869 = _867 + _835;
        float _871 = -_373;
        float _873 = _871 + _839;
        float _875 = fma(_581, _581, _863);
        float _877 = fma(_591, _591, _875);
        float _879 = 1.0 / _675;
        float _881 = sqrt(_877);
        float _883 = precise::min(_881, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _885 = _883 * _865;
        float _887 = _885 * _879;
        float _889 = -_357;
        float _891 = _889 + _837;
        float _893 = fma(_869, _887, _567);
        float _895 = fma(_891, _887, _557);
        float _897 = fma(_873, _887, _577);
        _857 = _895;
        _859 = _893;
        _861 = _897;
    }
    float _899 = _857;
    float _901 = _859;
    float _903 = _861;
    float _905 = _899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _907 = _899 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _909 = _899 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _911 = _899 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[0].x, _905);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[1].x, _907);
    float _917 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[2].x, _909);
    float _919 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _921 = _899;
    if (_715)
    {
        _921 = 1.0;
    }
    float _923 = _921;
    float _925 = _923;
    if (!_715)
    {
        float _927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _929 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[30].w, _927);
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _935 = 1.0 / _929;
        float _937 = 1.0 / _933;
        float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _943 = fma(_935, _939, _941);
        float _945 = _943 * _937;
        float _947 = precise::clamp(_945, 0.0, 1.0);
        _925 = _947;
    }
    float _949 = _925;
    float _951 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[1].z, _915);
    float _953 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[0].z, _913);
    float _955 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _957 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[2].z, _917);
    float _959 = _951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _963 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[3].z, _919);
    float _965 = _235 * _955;
    float _967 = _959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _969 = _959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _971 = _959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _973 = _959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _975 = _957 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _977 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[6].x, _967);
    float _979 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[7].x, _969);
    float _981 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[4].x, _971);
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[5].x, _973);
    float _985 = _963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].z, _977);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].z, _979);
    float _991 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].z, _981);
    float _993 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].z, _983);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _987);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _989);
    bool _999 = _949 > 0.0;
    bool _1001 = isnan(_949);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(0.0);
    bool _1007 = _1003 || _1005;
    float _1009 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _991);
    float _1011 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _993);
    float _1013 = _995 + _997;
    float _1015 = _965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1017 = _1013 * 0.5;
    out.m_33.x = _1015;
    out.gl_Position.x = _1009;
    out.gl_Position.y = _1011;
    out.gl_Position.z = _995;
    out.gl_Position.w = _997;
    out.m_56.z = _1017;
    out.m_56.w = _997;
    if (_1007)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1019;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

